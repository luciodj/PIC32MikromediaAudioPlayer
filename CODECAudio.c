/*
** Module CODEC audio.c
**
** Provides Stereo output capabilities for the PIC32MX4 MMB 
** Use: SPI#1, I2C1
**
** Date     Rev Author Comments
** 08/27/10 4.0  LDJ   Buffer queue 
** 08/28/10 4.1  LDJ   automatic restart after starvation, flag frame dropping req.
*/

#include <plib.h>
#include "CODECaudio.h"
#include "HardwareProfile.h"


// local definitions
typedef union {
      int   sample;
      struct{
        short left;
        short right; 
      };     
    } T_SAMPLE;

int SkipCount;                      // oversampling counter
volatile short BPtr;                // pointer inside input buffer
volatile short BCount;              // count input samples available (count down)

// audio queue definition
a_buffer audioBuf[ QUEUE_SIZE];     // circular buffer of audio buffers
volatile char aHead, aTail;         // head and tail pointers

volatile AudioCfg ACfg;             // audio configuration structure

// local prototypes
static int      Wm8731Init( int sampleRate);
static void		Wm8731DisableOutAmp(void);
static void		Wm8731EnableOutAmp(void);
static void     Wm8731Volume( int);
static int      WmMasterWrite(unsigned char regAdd, unsigned short cmd);


// init buffer
void initBuffers( void)
{
    aHead = aTail = 0;
} // init Buffers

    
// Get a new output buffer (insert head)
char getOutput( void)
{
    int i = (aHead+1)% QUEUE_SIZE;
    
    if ( i == aTail)    // if queue full
        return -1;      

    // return index
    return i;           // do not commit yet (must be filled)
    
} // getOutput


void commitOutput( char i)  
{       
    // commit buffer just filled with new data
    aHead = i;
} // getOutput (head)


// Get a new input buffer (extract tail)
char getInput( void)
{
     if ( aTail == aHead)
        return -1;      // not available
        
    // can advance to first filled buffer     
    aTail = (aTail+1) % QUEUE_SIZE;
     
    return aTail;     
} // getInput (tail)    

    

void setVolume( int v)
// input    v               volume setting    
{
    switch( v)
    {
      case VOL_MAX:     // find minimum divider
        ACfg.vol = 100;
        break;
        
      case VOL_MUTE:
        ACfg.vol = 0;
        break;
    
      case VOL_INC:
        if ( ACfg.vol < 100)
            ACfg.vol++;
        break;
        
      case VOL_DEC:
        if ( ACfg.vol > 0) 
            ACfg.vol--;
        break;
        
      case VOL_DEFAULT:
      default:      // medium setting
        ACfg.vol = 30;
        break;
    }    
    Wm8731Volume( ACfg.vol);
}// set volume
    
    
void initAudio( void)
// configures peripherals for CODEC Audio playback
// input    ACfg.period
{   
    int fail;
    
    // 1. init the WM8731 CODEC 
    fail = Wm8731Init( ACfg.rate);
    if (fail) 
        return;
        
    // 1. activate the SPI1 module for communication 
	SpiChnOpen( 1, SPI_CON_SLVEN|SPI_CON_CKP|SPI_CON_MODE32|
	                SPI_CON_ON|SPI_CON_FRMPOL|SPI_CON_FRMSYNC|
	                SPI_CON_FRMEN, 4);
	
	INTSetVectorPriority( INT_SPI_1_VECTOR, INT_PRIORITY_LEVEL_7);
	mSpiChnTxIntEnable( 1);
	
	// force the 1st txfer
	SPI1BUF = 0;
    
    // init pointers/counters
    ACfg.cb = 0;
    BPtr = 0;
    BCount = 0;     
    SkipCount = ACfg.skip;
    initBuffers();
        
    Wm8731EnableOutAmp();

    // set default output volume
    //setVolume( VOL_DEFAULT);
		
    // 2. enable interrupts / run state machine
	SpiChnClrTxIntFlag( 1);
	SpiChnTxIntEnable( 1);
    
} // initAudio

    
void startAudio( void)
{
    ACfg.cb = getInput();
    BCount = audioBuf[ ACfg.cb].count;
} // startAudio    


void swapBuffers(  int i)
// starts playback of a new buffer
// modifies ACfg.cb
{     
    // set new buffer
    ACfg.cb = i;
    
    // restart counting input samples
    BPtr = 0;
    BCount = audioBuf[ ACfg.cb].count;
} // swap buffers 


void haltAudio( void)
{ // stops playback state machine
    BCount = 0;
    DelayMs( 10);
 //   Wm8731DisableOutAmp();
//	SpiChnClose( 1);	
} // halt audio


void __ISR( _SPI_1_VECTOR, ipl7) CODECInterrupt( void)
{
    int i;
    static T_SAMPLE s;   // preserve last value (during skips)
    short d, m;
    
//    _RA2 = 1;
    // 1. clear interrupt flag 
	SpiChnClrTxIntFlag( 1);
    i = SPI1BUF;                // empty receive buffer


    // 2. wait if current buffer is empty
    if (BCount != 0) 
    {
        // 3. check if skipping   
        if ( --SkipCount<0)
        {   // re-init skip counter
            SkipCount = ACfg.skip; 
            
          // 4. load the new samples from the current buffer
            //  convert 8 bit unsigned to 16-bit signed
            d = ((unsigned short)audioBuf[ ACfg.cb].buf[ BPtr++]) << 2;
            BCount--;
            
            
          // 6. check if current buffer emptied
            if ( BCount == 0) 
            {               
                if ( ( i = getInput()) >= 0)     
                    swapBuffers( i);
                else 
                {
                    LD0 = LED_ON;       // signal codec is starved
                    ACfg.ef = 1;        // turn on flag to drop frames
//                    while(1);
                }    
            } // if BCount==0
            
            m = (d+s.left)>>1;

          // 5. copy to right channel            
            s.right = s.left = m;
            SPI1BUF = s.sample;         // send new/old sample
            s.right = s.left = d;
        } // skip         
        
        // skipping or not we need to service the SPI in slave mode
        else
            SPI1BUF = s.sample;         // send new/old sample
    } // BCount           

    else 
    { // BCount == 0 
    // 7. even if we are idling we need to service the SPI in slave mode
        SPI1BUF = s.sample;            // send dummy value
        
        // check if a new buffer got filled since last INT
        if ( ( i = getInput()) >= 0)
        {     
            swapBuffers( i);        // take the new buffer
            LD0 = LED_OFF;          // turn off the flag
        }    
    }    
    
//    _RA2 = 0;
} // Interrupt Service Routine 


//------------------------------------------------------------------------
// Low level WM8731 CODEC interface
//
#define	WM8731_ADDRESS	            0x1a

#define	WM8731_REG_LLINE_IN		    0x0
#define	WM8731_REG_RLINE_IN		    0x1
#define	WM8731_REG_LHPHONE_OUT		0x2
#define	WM8731_REG_RHPHONE_OUT		0x3
#define	WM8731_REG_ANALOG_PATH		0x4
#define	WM8731_REG_DIGITAL_PATH		0x5
#define	WM8731_REG_PDOWN_CTRL		0x6
#define	WM8731_REG_DIGITAL_IF		0x7
#define	WM8731_REG_SAMPLING_CTRL	0x8
#define	WM8731_REG_ACTIVE_CTRL		0x9
#define	WM8731_REG_RESET		    0xf

#define Fsck		100000	    // standard I2C bus frequency


#define	I2C_PLIB

#ifndef I2C_PLIB
#define	BITBANG_I2C

#define	I2C_DATA	BIT_15
#define	I2C_CLK		BIT_14

#define	I2C_PORT	PORTA
#define	I2C_TRISCLR	TRISACLR
#define	I2C_TRISSET	TRISASET
#define	I2C_LATSET	LATASET
#define	I2C_LATCLR	LATACLR

void i2c_wait()
{
	int i;
	for(i=0; i<50; i++)
	;
}


void i2c_init()
{
#ifdef BITBANG_I2C
	I2C_LATCLR = I2C_DATA | I2C_CLK;		// clear I2C Data bits
	I2C_TRISSET = I2C_DATA | I2C_CLK;		// float I2C bits
#else
	
	I2C1CON = (1<<15)	// on
			| (1<<12);	// Release Clock line
//			| (1<<9);	// Disable slew rate control
			
	I2C1BRG = 80000000 / (2*50000) - 2;
	I2C1ADD = 0x3ff;
#endif
}


void i2c_start()
{
#ifdef BITBANG_I2C
	i2c_wait();				// assume clk and data high
	I2C_TRISCLR = I2C_DATA;
	i2c_wait();
	I2C_TRISCLR = I2C_CLK;
	i2c_wait();
#else
	I2C1CONSET = (1<<0);	// Start Condition Enable
	while (I2C1CON & (1<<0))
		;
#endif
}
	
void i2c_restart()
{
#ifdef BITBANG_I2C
	i2c_wait();
	I2C_TRISCLR = I2C_DATA;
	i2c_wait();
#else
	I2C1CONSET = (1<<1);	// Re-Start Condition Enable
	while (I2C1CON & (1<<1))
		;
#endif
}
	
void i2c_stop()				// assume clk is already low
{
#ifdef BITBANG_I2C
	I2C_TRISCLR = I2C_DATA;	// make sure data is low
	i2c_wait();
	I2C_TRISSET = I2C_CLK;		// bring clk up
	i2c_wait();
	I2C_TRISSET = I2C_DATA;	// now data
	i2c_wait();
#else
	I2C1CONSET = (1<<2);	// Stop Condition Enable
	while (I2C1CON & (1<<2))
	;
#endif
}



unsigned long i2c_send(unsigned char c)
{
#ifdef BITBANG_I2C
	unsigned char bit;
	unsigned short ack;
	
	for (bit=0x80; bit; bit>>=1)
	{
		if (c & bit)
			I2C_TRISSET = I2C_DATA;	// bit high
		else
			I2C_TRISCLR = I2C_DATA;	// bit low
			
		i2c_wait();
		I2C_LATSET =  I2C_CLK;
		I2C_LATSET =  I2C_CLK;
		I2C_TRISSET = I2C_CLK;			// clock high
		i2c_wait();
		I2C_LATCLR  = I2C_CLK;
		I2C_TRISCLR = I2C_CLK;			// clock low
		i2c_wait();
	}
	I2C_TRISSET = I2C_DATA;			// ack cycle
	i2c_wait();
	I2C_LATSET =  I2C_CLK;
	I2C_LATSET =  I2C_CLK;
	I2C_TRISSET = I2C_CLK;				// clock high
	i2c_wait();
	ack = I2C_PORT & I2C_DATA;			// get ack bit
	I2C_LATCLR  = I2C_CLK;
	I2C_TRISCLR = I2C_CLK;				// clock low
	i2c_wait();
	return ack?1:0;
        /*if(ack)
		return 0x8000;*/
#else
	I2C1TRN = c;
	while (I2C1STAT & (1<<14))
		;						// wait until transmitted
	return I2C1STAT;
#endif
}


#endif	// I2C_PLIB



static int Wm8731Init( int sampleRate)
{
	int fail=0;
    int delay;
    
    CloseI2C1();
	OpenI2C1(I2C_EN | I2C_IDLE_CON | I2C_7BIT_ADD | I2C_STR_EN,
	     (GetPeripheralClock() / (2 * Fsck)-2));
    IdleI2C1();		// Wait to complete
    // approx 1ms delay
    for( delay = 0; delay < (GetSystemClock()/5/80000ul); delay++);

	fail|=WmMasterWrite(WM8731_REG_RESET, 0x00);	// reset device

	fail|=WmMasterWrite(WM8731_REG_LLINE_IN, 0x180);	// LRINBOTH|LINMUTE|(-34.5dB); use just the left input channel
	fail|=WmMasterWrite(WM8731_REG_LHPHONE_OUT, 0x17F);	// LRHPBOTH|!LZCEN|+6dB; use the left headphone commands
	fail|=WmMasterWrite(WM8731_REG_ANALOG_PATH, 0xd0);	// (SIDEATT=-15dB)|!SIDETONE|DACSEL|!BYPASS;

	fail|=WmMasterWrite(WM8731_REG_DIGITAL_PATH, 0x06);	// DACMU|(DEEMP=44.1KHz);

	fail|=WmMasterWrite(WM8731_REG_PDOWN_CTRL, 0x07);	// ADCPD|MICPD|LINEINPD
	fail|=WmMasterWrite(WM8731_REG_DIGITAL_IF, 0x53);	// MS|LRP|DSP_MODE

	fail|=WmMasterWrite(WM8731_REG_SAMPLING_CTRL, 0x23);	// SR(1000)|BOSR|USB; 44.1KHz
		
	return fail;	
}

static void Wm8731DisableOutAmp(void)
{
	WmMasterWrite(WM8731_REG_ACTIVE_CTRL, 0x00);	// ACTIVE; turn off
}

static void Wm8731EnableOutAmp(void)
{
	WmMasterWrite(WM8731_REG_ACTIVE_CTRL, 0x01);	// ACTIVE; turn on
}

static void Wm8731Volume( int level)
{ // input level 0-100
    WmMasterWrite(WM8731_REG_LHPHONE_OUT, 0x12F + (level*80/100));	// LRHPBOTH|LZCEN| 00-2F = Mute, 7F max
}


// returns 0 for success!
int WmMasterWrite(unsigned char regAdd, unsigned short cmd)
{
	unsigned char	buff[4];	// store the words here
	unsigned short	wmWord;
	int		fail=0;


	wmWord=((unsigned short)regAdd<<9)|(cmd&0x1ff);	// reg address is 7 bits, command is 9 bits
	buff[0]=(WM8731_ADDRESS<<1)|0;	// issue a write command with WM8731 address
	buff[1]=(unsigned char)(wmWord>>8);
	buff[2]=(unsigned char)(wmWord);

	// now transmit
	{
		int		ix;
	    	
		StartI2C1();		// Send the Start Bit
		IdleI2C1();		// Wait to complete
	
		for(ix=0; ix<3; ix++)
		{
			if(MasterWriteI2C1(buff[ix])!=0)
			{
				fail=1;	// failed
				break;
			}
		    IdleI2C1();		// Wait to complete

	    if ( I2C1STATbits.BCL)
	        I2C1STATbits.BCL = 0;
	        //while(1);
		}


		StopI2C1();	// Send the Stop condition
		IdleI2C1();	// Wait to complete
	}

	return fail;
}


