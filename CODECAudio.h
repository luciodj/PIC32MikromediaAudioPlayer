/*
** Module audio.h
**
** Provides Stereo output capabilities for the PIC32MX MMB 
**
** Date     Rev Author Comments
** 08/27/10 4.0  LDJ   Buffer Queue
*/

#define QUEUE_SIZE      8
#define OUTBUF_SIZE     ( 2000) // should be >  N. sample in one frame @22050
#define SAMPLES_FRAME   (22050 / 15)
// SAMPLES_FRAME  = 1455  < 2000



// profiling  
extern volatile unsigned freeTime;

// audio buffer queue definitions
typedef struct {
    short           count;
    unsigned char   buf[ OUTBUF_SIZE];
} a_buffer;
    
extern a_buffer audioBuf[ QUEUE_SIZE];


// audio configuration 
typedef struct {
    char cb;                // current buffer (0/1)
    char vol;               // audio volume setting
    char ef;                // empty flag
    char channels;          // stereo/mono
    char skip;              // oversampling 
    long period;            // sampling timer period 
    long rate;              // sample rate (20kHz< x <48kHz)
} AudioCfg;

extern volatile AudioCfg ACfg;

#define VOL_MAX     -1      // maximum amplitude
#define VOL_MUTE    0       // mute output (continue playback)
#define VOL_DEFAULT 1       // medium initial value
#define VOL_INC     2       // increase volume (<MAX)
#define VOL_DEC     3       // decrease volume (>MUTE)


// functions prototypes
void initAudio( void);
void startAudio( void);
void haltAudio( void);
void setVolume( int);
void swapBuffers( int i);

