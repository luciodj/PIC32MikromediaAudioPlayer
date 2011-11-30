/*
**  AVIPlayer.c    Audio Video Interleaved playback from SD card 
**
**  9/21/11 v4.2 LDJ    Replaced Joystick with Touch Screen for uMMB compatibility
**
** NOTE: This version assumes an input AVI file @15fps QQVGA RGB565
**      with 8-bit audio @22050Hz (mono)
**
**  HW Req: PIC32MX4 MMB MikroE
**  SW Req: MMB.c(v1.2) LCDTerminal(v2.2) LCDTerminalFont CodecAudio(v.4.1) 
**  Ref:    www.exploringpic32.com
** 
*/

// configuration bit settings
#pragma config POSCMOD=XT, FNOSC=PRIPLL
#pragma config FPLLIDIV=DIV_2, FPLLMUL=MUL_20, FPLLODIV=DIV_1
#pragma config FPBDIV=DIV_1
#pragma config FWDTEN=OFF, CP=OFF, BWP=OFF

#include <plib.h>
#include "Graphics/Graphics.h"
#include "graphics/gfxpmp.h"
#include "MDD File System/FSIO.h"

#include "MMB.h"
#include "LCDTerminal.h"
#include "CODECaudio.h"

#define  RIFF_DWORD  0x46464952UL
#define  WAVE_DWORD  0x45564157UL
#define  DATA_DWORD  0x61746164UL
#define  AVI_DWORD   0x20495641UL
#define  LIST_DWORD  0x5453494CUL
#define  MOVI_DWORD  0x69766f6dUL
#define  JUNK_DWORD  0x4b4e554aUL
#define  DC_DWORD    0x63643030UL
#define  WB_DWORD    0x62773130UL
#define  FMT_DWORD   0x20746d66UL     
#define  WAV_DWORD   0x00564157UL

#define N_FILES     8       // maximum 8 files in the menu

// definitions of video dimensions
#define V_MAX       120
#define H_MAX       160
#define DOUBLE_H
#define DOUBLE_V


short vbuffer[ H_MAX];

typedef struct {
    int ckID;
    int ckSize;
    int ckType;
} CHUNK;

const char JOYTable[] = { 0,     JOY_UP,    JOY_UP,     0,
                          0,     JOY_UP,    JOY_UP,   JOY_SELECT,
                          0,     JOY_DOWN,  JOY_DOWN, JOY_SELECT,
                          0,     JOY_DOWN,  JOY_DOWN,   0
};


  
//------------------------------------------------------------------- 
int Menu ( char list[][16], int items)
{
    int i, j, c, n;
    
    n = 0; 
    while ( 1)
    {
        // 1. paint menu
        for(i=0; i< items; i++)
        {
            LCDSetXY( (_MAX_X-14)/2, ( _MAX_Y - items)/2 + i);     // center the menu
            if (i != n)        
            {
                LCDSetBackground( BLUE);
                LCDSetColor( YELLOW);
            }    
            else 
            {
                LCDSetBackground( YELLOW);
                LCDSetColor( BLUE);
            }    
            LCDPut(' ');
            LCDPutString( list[ i]);
            for(j=0;j<(14-strlen( list[i])); j++)
                LCDPut(' ');
        }
        //restore default colors
        LCDSetBackground( LCD_BACK);
        LCDSetColor( LCD_FORE);
        
        // 2. read the input
        //c = MMBGetKey(); 
        c = JOYTable[ MMBGetTouch() & 0xF];           
        switch( c)
        {
          case JOY_SELECT:
          case JOY_RIGHT:
            return n+1;
            break;
            
          case JOY_UP:
            if (n > 0)
                n--;
            break;
            
          case JOY_DOWN:
            if ( n< items-1)
                n++;
            break;
            
          case JOY_LEFT:
            return 0;      // none selected
            break;
            
          default:
            break;
        } // switch    
    } // while
    
} // Menu
    
   
   
//-------------------------------------------------------------------
void SelectFile( char *fn, char *ext)
{ // fn    pointer to selected filename
  // ext   "*.AVI" selection criteria
   
    char list[ N_FILES][16];
    int n = 0;
    SearchRec sr;
    
    while( 1)
    {
        LCDCenterString( 0, "Insert Card");
        while( !FSInit())
            DelayMs( 100);
        LCDCenterString( 0, "                  ");

        // search for ".ext" files and put them in list
        if ( !FindFirst( ext, ATTR_READ_ONLY | ATTR_ARCHIVE, &sr))
        {
            do{ // while there are files matching
                // copy the file name 
                strncpy( list[ n++], sr.filename, 16);
                // check if list full
                if ( n==N_FILES)
                    break;   
            } while ( !FindNext( &sr));
        }        
        //n = listTYPE( list, N_FILES, ext);
        if ( n>0)
        {
            // found at least one file
            //n = 1;	// for now pick only the first one
		    n = Menu( list, n); 
        }
        
        if ( n == 0)
        {
            //report error and allow to swap card
            LCDCenterString( 0, "File not found!");
            MMBGetTouch();
            //MMBGetKey();
            LCDCenterString( 0, "                  ");
        }        
        else 
        {
             //form the chosen filename
             strncpy( fn, list[(n-1)], 16);
             return;
        }    
    }// while         
    
} // select file    
   


int main( void)
{
    char    filename[16],  s[32];
    int     frames;
         
    // 1. system initializations 
    MMBInit();
    LCDInit();
    TouchInit();    

        
    // 2. main loop
    while( 1)
    {
        // 1. SplashScreen 
        LCDClear();          
        MMBCenterString( -6, "PIC32 AVI Player");
        MMBCenterString(  6, "v4.2 LDJ");
        MMBFadeIn( 200);
        
        // 2. Connect to the SD card and select a filename
        SelectFile( filename, "*.AVI"); 

		// 3. Play back 
        LCDClear();
        MMBCenterString( -6, "PIC32 AVI Player");
        frames = PlayAVI( filename);     
		
		if (frames <0) // error message
            strcpy( s, "File Error");

        else // display the frame count
            sprintf( s, "%d frames", frames);

        // 4. display summary/error message and wait for input
        LCDClear(); MMBCenterString(0, s);
        MMBGetTouch();
		            
    } // main loop
} // main



/*****************************************************************
** set a subwindow of the display (display controller specific)
** this is the HX8347-D version
*/
void vWindow( int x0, int y0, int h, int v)
{   // define the active display window 
    SetReg(0x03, x0);
    SetReg(0x04,(h + x0 -1)>>8);  
    SetReg(0x05,(h + x0 -1));
    
    SetReg(0x07, y0);
    SetReg(0x08,0x00);
    SetReg(0x09,(v + y0 -1));
} // vWindow
    

/*******************************************************************************
** PlayAVI  playback a QQVGA AVI file  
** inputs:  fname   file name
**          doubleH double the horizontal pixel size (1 or 2)
**          doubleV double the vertical pixel size (1 or 2)
** output:  number of frames played
**          or error code (<0)
*/         
int PlayAVI( char *fname)
{
    short   *pV;
    int     i, j, r, eof;
    int     frames=0;
    FSFILE  *fp;
    CHUNK   ck;

    // 1. define the video window
#ifndef DOUBLE_H
    vWindow( 80, 60, H_MAX, V_MAX);    
#else
    #ifndef DOUBLE_V
    vWindow( 0, 60, H_MAX*2, V_MAX);     
    #else
    vWindow( 0, 0, H_MAX*2, V_MAX*2);   
    #endif
#endif
            
/**************************************************************/
// Open file and find first movi chunk

    // 2. open AVI file
    if ( ( fp = FSfopen( fname, "r")) == NULL)
        return -3;  // cannot find the input file 

       
    // 3. decode RIFF format chunks
    r = FSfread( (void*)&ck, sizeof(CHUNK), 1, fp);
    if ( r == 0)    return -100;    // unexpected eof
    
    // 4. check that type is correct
    if (( ck.ckID != RIFF_DWORD) || ( ck.ckType != AVI_DWORD))
        return -4;  // not an RIFF-AVI file
        
    // 5. look for a list chunk
    r = FSfread( (void*)&ck, sizeof(CHUNK), 1, fp);
    if ( r == 0)    return -100;    // unexpected eof
    
    if ( ck.ckID != LIST_DWORD)
        return -5;  // incorrect format, list chunk not found
    
    // 6. skip until you reach the "movi" chunk
    while ((( ck.ckID == LIST_DWORD) && (ck.ckType != MOVI_DWORD)) || 
            ( ck.ckID == JUNK_DWORD))
    {
        // skip this chunk
        eof = FSfseek( fp, ck.ckSize-4, SEEK_CUR);
        if ( eof)   return -100;    // unexpected eof
        
        // fetch next chunk header
        r = FSfread( (void *)&ck, sizeof(CHUNK), 1, fp);
        if ( r == 0)    return -100;    //unexpected eof
    }

    // 7. init audio codec for 22050 - 8-bit - mono
    ACfg.skip = 1;      // for standard decimating a 44kHz CODEC rate
    ACfg.channels = 1;
    ACfg.rate = 22050;
    
    initAudio();
            
/******************************************************************************/
// playback loop

    // 8.loop playing the movi chunk contents until eof
    while( !MMBReadTouch()) // escape if screen touched or key pressed
    {
        // get next sub-chunk
        r = FSfread( (void*)&ck, 8, 1, fp);
        if ( r == 0) break;
        
        // 8.1 check if audio or video sub-chunk    
        if ( ck.ckID == WB_DWORD)
        { // audio 01wb subchunk
                    
            // wait until a new buffer is available
            // here is where video and audio are synchonized (audio rules)
            while(( i = getOutput()) < 0);
            
            // load audio buffer (with padding)
            r = FSfread( (void*)&audioBuf[ i].buf[0], (ck.ckSize+1) & 0xFFFFFFFE, 1, fp); 
            if (r == 0) break;      // unexpected eof
            
            audioBuf[ i].count = ck.ckSize;                
            commitOutput( i);
        } //audio
        
        // 8.2 video sub-chunk 
        else if (ck.ckID == DC_DWORD) 
        { // video 00dc subchunk
            frames++;
            
            // 8.2.1 skip frame if late
            if ( ACfg.ef)       // if codec is starved, drop frame
            {
                eof = FSfseek( fp, (ck.ckSize+1) & 0xFFFFFFFE, SEEK_CUR);   // skip first frame
                if ( eof)  break;
                ACfg.ef = 0;    // turn the starving flag off
                // start audio, will be restarted automatically by next INT
                //startAudio();    
            }
         
            // 8.2.2 there is time
            else 
            {   // 1. reposition cursor to top left
                DisplayEnable(); //CS_LAT_BIT = 0;
#ifndef DOUBLE_H
                SetAddress( 80, 60 );   
#else
    #ifndef DOUBLE_V
                SetAddress( 0, 60 );   
    #else
                SetAddress( 0, 0 );   
    #endif
#endif

                DisplaySetData(); //RS_LAT_BIT = 1;             // data from here on...
                   
                // 2. for each line
                for( j=0; j<V_MAX; j++)
                {        
                    eof = (FSfread( vbuffer, 2, H_MAX, fp) != 160);
                    if ( eof) break;
                       
                    // A. paint each line                      
                    pV = &vbuffer[0]; i = H_MAX;
                    while( i--) {
#ifdef DOUBLE_H
                        DeviceWrite( *pV);  //PMDIN1 = *pV;;
                                            //PMPWaitBusy();
#endif
                        DeviceWrite( *pV++);//PMDIN1 = *pV;;
                                            //PMPWaitBusy();
                    }

#ifdef DOUBLE_V
                    //  B. re-paint the line if doubling V 
                    // line doubling to expand to QVGA
                    pV = &vbuffer[0]; i = H_MAX;
                    while( i--) {
#ifdef DOUBLE_H
                        DeviceWrite( *pV);  //PMDIN1 = *pV;;
                                            //PMPWaitBusy();
#endif
                        DeviceWrite( *pV++);//PMDIN1 = *pV;;
                                            //PMPWaitBusy();
                    }
#endif
                }  // for each line
                
                // deselect display      
                DisplayDisable();  //CS_LAT_BIT = 1;
                
            } // paint a frame
            
        } // video subchunk    
        
    } // while 
    
    // close file 
    FSfclose( fp);

    // 11. return to full window
    vWindow( 0, 0, 320, 240);
    // disable audio
    haltAudio();
    
    return frames;   // success
} // PlayAVI







