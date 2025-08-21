# 1 "sprites.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sprites.c"
# 1 "sprites.h" 1



typedef enum {KNIGHT, MARCELINE} ENEMYTYPE;

# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 7 "sprites.h" 2





typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 66 "sprites.h"
void hideSprites();


typedef struct {
  int x;
  int y;
  int xVel;
  int yVel;
  int width;
  int height;
  int timeUntilNextFrame;
  int direction;
  int isAnimating;
  int currentFrame;
  int numFrames;
  int isJumping;
  int jumpStrength;
  int jumpVelocity;
  int gravity;
  ENEMYTYPE type;
  u8 oamIndex;
  int invincible;
  int invincibilityTimer;
  int active;
  int flickerTimer;
  int health;
  int deathTimer;
  int stunned;
} SPRITE;

typedef struct {
  int x;
  int y;
  int width;
  int height;
  int active;
} POWERUP;


typedef struct {
  int x, y;
  int width, height;
  int xVel;
  int active;
  int currentFrame;
  int numFrames;
  int timeUntilNextFrame;
  int direction;
} FIREBALL;
# 2 "sprites.c" 2


void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
}
