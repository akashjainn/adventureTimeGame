# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
# 1 "world_tileset.h" 1
# 21 "world_tileset.h"
extern const unsigned short world_tilesetTiles[16384];


extern const unsigned short world_tilesetPal[256];
# 4 "main.c" 2
# 1 "level1.h" 1







extern const unsigned short level1Map[4096];
# 5 "main.c" 2
# 1 "finnSpriteSheet.h" 1
# 21 "finnSpriteSheet.h"
extern const unsigned short finnSpriteSheetTiles[16384];


extern const unsigned short finnSpriteSheetPal[256];
# 6 "main.c" 2
# 1 "sprites.h" 1



typedef enum {KNIGHT, MARCELINE} ENEMYTYPE;







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

typedef struct {
  int tx;
  int ty;
  unsigned short tileIndex;
} TileUpdate;
# 7 "main.c" 2
# 1 "level1CollisionMap.h" 1
# 21 "level1CollisionMap.h"
extern const unsigned short level1CollisionMapBitmap[131072];


extern const unsigned short level1CollisionMapPal[256];
# 8 "main.c" 2
# 1 "lose.h" 1
# 21 "lose.h"
extern const unsigned short loseBitmap[19200];


extern const unsigned short losePal[256];
# 9 "main.c" 2
# 1 "level2.h" 1







extern const unsigned short level2Map[4096];
# 10 "main.c" 2
# 1 "level2CollisionMap.h" 1
# 21 "level2CollisionMap.h"
extern const unsigned short level2CollisionMapBitmap[131072];


extern const unsigned short level2CollisionMapPal[256];
# 11 "main.c" 2
# 1 "win.h" 1
# 21 "win.h"
extern const unsigned short winBitmap[19200];


extern const unsigned short winPal[256];
# 12 "main.c" 2
# 1 "start.h" 1
# 21 "start.h"
extern const unsigned short startBitmap[19200];


extern const unsigned short startPal[256];
# 13 "main.c" 2
# 1 "pause.h" 1
# 21 "pause.h"
extern const unsigned short pauseBitmap[19200];


extern const unsigned short pausePal[256];
# 14 "main.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 15 "main.c" 2
# 1 "level1new.h" 1







extern const unsigned short level1newMap[4096];
# 16 "main.c" 2
# 1 "worldTileset.h" 1
# 21 "worldTileset.h"
extern const unsigned short worldTilesetTiles[16384];


extern const unsigned short worldTilesetPal[256];
# 17 "main.c" 2
# 1 "foreground.h" 1







extern const unsigned short foregroundMap[4096];
# 18 "main.c" 2
# 1 "background.h" 1







extern const unsigned short backgroundMap[4096];
# 19 "main.c" 2
# 1 "foreground2.h" 1







extern const unsigned short foreground2Map[4096];
# 20 "main.c" 2
# 1 "background2.h" 1







extern const unsigned short background2Map[4096];
# 21 "main.c" 2
# 1 "analogSound.h" 1
# 257 "analogSound.h"
enum note {

  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

typedef struct noteWithDuration {
  enum note note;
  unsigned char duration;
} NoteWithDuration;

void initSound();
void playDrumSound(unsigned char r, unsigned char s, unsigned char b, unsigned char length, unsigned char steptime);
void playNoteWithDuration(NoteWithDuration *n, unsigned char duty);
void playChannel1(unsigned short note, unsigned char length, unsigned char sweepShift, unsigned char sweepTime, unsigned char sweepDir, unsigned char envStepTime, unsigned char envDir, unsigned char duty);
void playAnalogSound(unsigned short sound);
# 22 "main.c" 2
# 1 "finn_scream.h" 1


extern const unsigned int finn_scream_sampleRate;
extern const unsigned int finn_scream_length;
extern const signed char finn_scream_data[];
# 23 "main.c" 2
# 1 "digitalSound.h" 1



void setupSounds();
void setupSoundInterrupts();
void interruptHandler();

void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 52 "digitalSound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 24 "main.c" 2
# 1 "fireballSoundEffect.h" 1


extern const unsigned int fireballSoundEffect_sampleRate;
extern const unsigned int fireballSoundEffect_length;
extern const signed char fireballSoundEffect_data[];
# 25 "main.c" 2
# 1 "backgroundMusic.h" 1


extern const unsigned int backgroundMusic_sampleRate;
extern const unsigned int backgroundMusic_length;
extern const signed char backgroundMusic_data[];
# 26 "main.c" 2
# 1 "start1.h" 1
# 21 "start1.h"
extern const unsigned short start1Bitmap[19200];


extern const unsigned short start1Pal[256];
# 27 "main.c" 2
# 1 "start2.h" 1
# 21 "start2.h"
extern const unsigned short start2Bitmap[19200];


extern const unsigned short start2Pal[256];
# 28 "main.c" 2
# 1 "swordSoundEffect.h" 1


extern const unsigned int swordSoundEffect_sampleRate;
extern const unsigned int swordSoundEffect_length;
extern const signed char swordSoundEffect_data[];
# 29 "main.c" 2
# 1 "instructions.h" 1
# 21 "instructions.h"
extern const unsigned short instructionsBitmap[19200];


extern const unsigned short instructionsPal[256];
# 30 "main.c" 2
# 44 "main.c"
int currentLevel = 1;
int loopingSoundPlayed = 0;
int frameCounter = 0;

FIREBALL fireballs[5];
SPRITE enemies[4];
OBJ_ATTR shadowOAM[128];
SPRITE player;

typedef enum {RIGHT = 0, LEFT = 1} DIRECTION;
typedef enum {START, START2, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN} GAMESTATE;

TileUpdate tileUpdates[16];
int updateCount = 0;

unsigned short melody[] = {0xA6E, 0x9A0, 0x8F4, 0x836, 0x836, 0x8F4, 0x9A0, 0xA6E};
int melodyLength = 8;
int melodyIndex = 0;

unsigned char destroyedTiles[64][64] = {0};

GAMESTATE state;

POWERUP powerups[3];

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;

inline unsigned char colorAt(int x, int y) {

    if (x < 0 || x >= 512 || y < 0 || y >= 512) return 1;

    int tx = x / 8;
    int ty = y / 8;

    if (destroyedTiles[tx][ty]) {
        return 1;
    }

    return ((unsigned char*)(currentLevel == 1 ? level1CollisionMapBitmap : level2CollisionMapBitmap))[((y) * (512) + (x))];
}

void initialize();
void update();
void draw();
void goToStart();
void goToGame();
void goToPause();
void goToLose();
void startState();
void gameState();
void pauseState();
void loseState();
void goToInstructions();
void instructionsState();
unsigned char colorAt(int x, int y);

int main() {
    initSound();
    initialize();
    goToStart();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state) {
            case START:
                startState();
                break;
            case START2:
                startState2();
                break;
            case INSTRUCTIONS:
                instructionsState();
                break;
            case GAME:
                gameState();
                break;
            case PAUSE:
                pauseState();
                break;
            case LOSE:
                loseState();
                break;
            case WIN:
                winState();
                break;
        }

    }
}

void initialize() {

    memset(destroyedTiles, 0, sizeof(destroyedTiles));

    setupSounds();
    setupSoundInterrupts();


    for (int i = 0; i < 4; i++) {
        enemies[i].width = 32;
        enemies[i].height = 32;
        enemies[i].currentFrame = 0;
        enemies[i].numFrames = 3;
        enemies[i].timeUntilNextFrame = 8;
        enemies[i].xVel = 1;
        enemies[i].direction = (i % 2 == 0) ? LEFT : RIGHT;
        enemies[i].type = MARCELINE;
        enemies[i].active = 1;
        enemies[i].health = 1;
    }
    enemies[0].x = 160;
    enemies[0].y = 220;
    enemies[1].x = 242;
    enemies[1].y = 300;
    enemies[2].x = 320;
    enemies[2].y = 382;
    enemies[3].x = 186;
    enemies[3].y = 506;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    hOff = 0;
    vOff = 0;

    player.width = 32;
    player.height = 32;
    player.x = 0;
    player.y = 174;
    player.currentFrame = 0;
    player.numFrames = 3;
    player.direction = RIGHT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.jumpVelocity = 0;
    player.isJumping = 0;
    player.jumpStrength = -12;
    player.gravity = 1;
    player.invincible = 0;
    player.invincibilityTimer = 0;
    player.health = 1;

    for (int i = 0; i < 5; i++) {
        fireballs[i].active = 0;
        fireballs[i].width = 32;
        fireballs[i].height = 32;
        fireballs[i].currentFrame = 0;
        fireballs[i].numFrames = 3;
        fireballs[i].timeUntilNextFrame = 8;
    }

    powerups[0].x = 112;
    powerups[0].y = 48;
    powerups[0].width = 16;
    powerups[0].height = 16;
    powerups[0].active = 1;
}

void update() {


    player.isAnimating = 0;
    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;


    handleMovement(leftX, rightX, topY, bottomY);


    int onGround = isOnGround(leftX, rightX, bottomY);


    handleJump(onGround);


    handleGravity(leftX, rightX, topY, bottomY);


    handleAnimations();


    updateScrollingOffsets();


    handleEnemies();


    handlePowerups();


    handleFireballs();


    resolveWallCollisions(leftX, topY, bottomY, rightX);


    handleInvincibility();


    checkLevelCompletion();
}

void handleMovement(int leftX, int rightX, int topY, int bottomY) {

    if ((~(buttons) & ((1<<5)))) {
        int newX = player.x - player.xVel;
        if (!isCollision(newX, topY, bottomY)) {
            player.x = newX;
            player.direction = LEFT;
            player.isAnimating = 1;
        }
    }


    if ((~(buttons) & ((1<<4)))) {
        int newX = player.x + player.xVel;
        if (!isCollision(newX + player.width, topY, bottomY)) {
            player.x = newX;
            player.direction = RIGHT;
            player.isAnimating = 1;
        }
    }
}

int isCollision(int newX, int topY, int bottomY) {
    int collision = 0;

    int checkPointsY[] = {
        topY + 0,
        topY + (bottomY - topY) / 4,
        topY + (bottomY - topY) / 2,
        topY + 3 * (bottomY - topY) / 4,
        bottomY - 0
    };

    for (int i = 0; i < 5; i++) {
        int y = checkPointsY[i];
        if (newX < 0 || newX >= 512 || colorAt(newX, y) != 1) {
            collision = 1;
            break;
        }
    }
    return collision;
}

int isOnGround(int leftX, int rightX, int bottomY) {
    if (bottomY >= 512 - 1) {
        return 1;
    }


    int numPoints = 5;
    int spacing = (rightX - leftX) / (numPoints - 1);

    for (int i = 0; i < numPoints; i++) {
        int checkX = leftX + (spacing * i);
        int groundCheckY = bottomY + 1;


        if (colorAt(checkX, groundCheckY) == 0 ||
            (groundCheckY + 1 < 512 && colorAt(checkX, groundCheckY + 1) == 0)) {
            return 1;
        }
    }

    return 0;
}

void handleJump(int onGround) {
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && onGround) {
        player.isJumping = 1;
        player.jumpVelocity = player.jumpStrength;
        player.y = (player.y / 8) * 8;
        player.y -= 1;
    }
}

void handleGravity(int leftX, int rightX, int topY, int bottomY) {
    if (player.isJumping || !isOnGround(leftX, rightX, bottomY)) {

        player.jumpVelocity += player.gravity;


        if (player.jumpVelocity > 12) {
            player.jumpVelocity = 12;
        }

        int newY = player.y + player.jumpVelocity;

        if (player.jumpVelocity < 0) {

            int collision = 0;
            int collisionY = newY;
            int numPoints = 3;
            int spacing = (rightX - leftX) / (numPoints - 1);

            for (int i = 0; i < numPoints; i++) {
                int checkX = leftX + (spacing * i);
                if (newY < 0 || colorAt(checkX, newY) != 1) {
                    collision = 1;
                    collisionY = ((newY / 8) + 1) * 8;
                    break;
                }
            }

            if (collision) {
                player.y = collisionY;
                player.jumpVelocity = 0;
            } else {
                player.y = newY;
            }
        } else {
            int newBottom = newY + player.height;
            int collision = 0;
            int numPoints = 5;
            int spacing = (rightX - leftX) / (numPoints - 1);


            for (int testY = player.y; testY <= newY; testY++) {
                int testBottom = testY + player.height;
                collision = 0;

                for (int i = 0; i < numPoints; i++) {
                    int checkX = leftX + (spacing * i);
                    if (testBottom >= 512 || colorAt(checkX, testBottom) != 1) {
                        collision = 1;
                        newY = testY - 1;
                        break;
                    }
                }

                if (collision) break;
            }

            if (collision) {
                player.y = newY;
                player.isJumping = 0;
                player.jumpVelocity = 0;
            } else {
                player.y = newY;
            }
        }
    }
}

void handleAnimations() {

    if (player.isAnimating) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.timeUntilNextFrame = 10;
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
    }


    for (int i = 0; i < 4; i++) {
        SPRITE* e = &enemies[i];

        if (e->health <= 0) {

            if (e->currentFrame < 2) {
                e->timeUntilNextFrame--;
                if (e->timeUntilNextFrame <= 0) {
                    e->timeUntilNextFrame = 16;
                    e->currentFrame++;
                }
            } else {

                if (e->deathTimer == 0) {
                    e->deathTimer = 60;
                } else {
                    e->deathTimer--;
                    if (e->deathTimer <= 0) {
                        e->active = 0;
                    }
                }
            }
        } else {

            e->timeUntilNextFrame--;
            if (e->timeUntilNextFrame <= 0) {
                e->timeUntilNextFrame = 8;
                e->currentFrame = (e->currentFrame + 1) % e->numFrames;
            }
        }
    }
}



void handleEnemies() {
    for (int i = 0; i < 4; i++) {
        SPRITE* e = &enemies[i];
        if (!e->active) continue;


        if (e->stunned) {
            continue;
        }


        int eLeftX = e->x;
        int eRightX = e->x + e->width - 1;
        int eTopY = e->y;
        int eBottomY = e->y + e->height - 1;


        int newX = e->x + (e->direction == RIGHT ? e->xVel : -e->xVel);


        int collision = 0;
        for (int y = eTopY + 0; y <= eBottomY - 0; y += (e->height - 2 * 0) / 2) {
            int checkX = (e->direction == RIGHT) ? newX + e->width - 1 : newX;
            if (checkX < 0 || checkX >= 512 || colorAt(checkX, y) != 1) {
                collision = 1;
                break;
            }
        }


        if (e->active && e->health > 0) {
            if (player.x < e->x + e->width &&
                player.x + player.width > e->x &&
                player.y < e->y + e->height &&
                player.y + player.height > e->y) {

                if (!player.invincible) {
                    player.health--;
                    player.invincible = 1;
                    player.invincibilityTimer = 60;


                    if (player.health <= 0) {
                        goToLose();
                    }


                    playSoundB(finn_scream_data, finn_scream_length, 0);
                }
            }
        }


        if (collision) {
            e->direction = (e->direction == LEFT) ? RIGHT : LEFT;
        } else {
            e->x = newX;
        }


        if (e->type == KNIGHT) {

            e->timeUntilNextFrame--;
            if (e->timeUntilNextFrame <= 0) {
                e->timeUntilNextFrame = 8;
                e->currentFrame = (e->currentFrame + 1) % e->numFrames;
            }
        }
    }
}




void updateScrollingOffsets() {
    hOff = player.x - (240 / 2 - player.width / 2);
    vOff = player.y - (160 / 2 - player.height / 2);

    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff > 512 - 160) vOff = 512 - 160;

    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;
    (*(volatile unsigned short*) 0x04000014) = hOff / 2;
    (*(volatile unsigned short*) 0x04000016) = vOff / 2;
}

void handlePowerups() {
    for (int i = 0; i < 3; i++) {
        if (powerups[i].active && player.x < powerups[i].x + powerups[i].width && player.x + player.width > powerups[i].x && player.y < powerups[i].y + powerups[i].height && player.y + player.height > powerups[i].y) {
            powerups[i].active = 0;
            player.invincible = 1;
            player.invincibilityTimer = 180;
        }
    }
}

void handleFireballs() {
    updateCount = 0;
    for (int i = 0; i < 5; i++) {
        if (fireballs[i].active) {
            int nextX = fireballs[i].x + fireballs[i].xVel;


            if (nextX < 0 || nextX + fireballs[i].width > 512) {
                fireballs[i].active = 0;
                continue;
            }


            int checkX = (fireballs[i].direction == RIGHT)
                ? nextX + fireballs[i].width - 1
                : nextX;


            int collision = 0;
            int collisionTileX = -1;
            int collisionTileY = -1;


            int checkPoints[] = {
                fireballs[i].y + 8,
                fireballs[i].y + fireballs[i].height/2,
                fireballs[i].y + fireballs[i].height - 8
            };

            for (int j = 0; j < 3; j++) {
                int checkY = checkPoints[j];


                int tileX = checkX / 8;
                int tileY = checkY / 8;


                if (tileX < 0 || tileX >= 64 || tileY < 0 || tileY >= 64) {
                    continue;
                }


                if (destroyedTiles[tileX][tileY]) {
                    continue;
                }


                unsigned char* colMap = (currentLevel == 1)
                    ? level1CollisionMapBitmap
                    : level2CollisionMapBitmap;


                if (colMap[((checkY) * (512) + (checkX))] == 0) {
                    collision = 1;
                    collisionTileX = tileX;
                    collisionTileY = tileY;
                    break;
                }
            }

            if (collision) {

                destroyedTiles[collisionTileX][collisionTileY] = 1;


                if (updateCount < 16) {
                    tileUpdates[updateCount].tx = collisionTileX;
                    tileUpdates[updateCount].ty = collisionTileY;
                    tileUpdates[updateCount].tileIndex = 0;
                    updateCount++;
                }


                fireballs[i].active = 0;
                playSoundB(fireballSoundEffect_data, fireballSoundEffect_length, 0);
            } else {

                fireballs[i].x = nextX;
            }


            for (int j = 0; j < 4; j++) {
                if (enemies[j].active &&
                    fireballs[i].x + fireballs[i].width > enemies[j].x &&
                    fireballs[i].x < enemies[j].x + enemies[j].width &&
                    fireballs[i].y + fireballs[i].height > enemies[j].y &&
                    fireballs[i].y < enemies[j].y + enemies[j].height) {


                    enemies[j].stunned = 1;


                    enemies[j].health--;


                    fireballs[i].active = 0;
                    break;
                }
            }


            fireballs[i].timeUntilNextFrame--;
            if (fireballs[i].timeUntilNextFrame <= 0) {
                fireballs[i].timeUntilNextFrame = 8;
                fireballs[i].currentFrame = (fireballs[i].currentFrame + 1) % fireballs[i].numFrames;
            }


            int screenX = fireballs[i].x - hOff;
            int screenY = fireballs[i].y - vOff;

            if (screenX > -32 && screenX < 240 && screenY > -32 && screenY < 160) {

                int tileX = (fireballs[i].currentFrame * 4);
                int tileY = (fireballs[i].direction == LEFT) ? 24 : 20;

                int oamIndex = 4 + 1 + 3 + i;
                shadowOAM[oamIndex].attr0 = ((screenY) & 0xFF) | (0<<14);
                shadowOAM[oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14);
                shadowOAM[oamIndex].attr2 = ((((tileY) * (32) + (tileX))) & 0x3FF);
            } else {

                int oamIndex = 4 + 1 + 3 + i;
                shadowOAM[oamIndex].attr0 = (2<<8);
            }
        } else {

            int oamIndex = 4 + 1 + 3 + i;
            shadowOAM[oamIndex].attr0 = (2<<8);
        }
    }
}

void resolveWallCollisions(int leftX, int topY, int bottomY, int rightX) {
    int collisionPoints[] = {
        leftX, topY,
        rightX, topY,
        leftX, bottomY,
        rightX, bottomY
    };


    int needsResolution = 0;
    for (int i = 0; i < 4; i += 2) {
        if (colorAt(collisionPoints[i], collisionPoints[i + 1]) == 0) {
            needsResolution = 1;
            break;
        }
    }

    if (needsResolution) {

        for (int offset = 1; offset <= 16; offset++) {
            int valid = 1;
            for (int i = 0; i < 4; i += 2) {
                int x = collisionPoints[i] + offset;
                int y = collisionPoints[i + 1];
                if (x >= 512 || colorAt(x, y) != 1) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                player.x += offset;
                return;
            }
        }


        for (int offset = 1; offset <= 16; offset++) {
            int valid = 1;
            for (int i = 0; i < 4; i += 2) {
                int x = collisionPoints[i] - offset;
                int y = collisionPoints[i + 1];
                if (x < 0 || colorAt(x, y) != 1) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                player.x -= offset;
                return;
            }
        }


        for (int offset = 1; offset <= 16; offset++) {
            int valid = 1;
            for (int i = 0; i < 4; i += 2) {
                int x = collisionPoints[i];
                int y = collisionPoints[i + 1] - offset;
                if (y < 0 || colorAt(x, y) != 1) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                player.y -= offset;
                player.jumpVelocity = 0;
                return;
            }
        }


        for (int offset = 1; offset <= 16; offset++) {
            int valid = 1;
            for (int i = 0; i < 4; i += 2) {
                int x = collisionPoints[i];
                int y = collisionPoints[i + 1] + offset;
                if (y >= 512 || colorAt(x, y) != 1) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                player.y += offset;
                player.jumpVelocity = 0;
                return;
            }
        }
    }
}

void handleInvincibility() {
    if (player.invincible) {
        player.invincibilityTimer--;
        player.flickerTimer = (player.invincibilityTimer / 8) % 2;
        if (player.invincibilityTimer <= 0) {
            player.invincible = 0;
        }
    } else {
        player.flickerTimer = 0;
    }
}

void checkLevelCompletion() {
    int activeEnemies = 0;
    for (int i = 0; i < 4; i++) {
        if (enemies[i].active) activeEnemies++;
    }

    if (activeEnemies == 0) {
        if (currentLevel == 1) {
            currentLevel = 2;
            resetGame();
            goToGame();
        } else if (currentLevel == 2) {
            goToWin();
        }
    }
}


void draw() {
    int oamIndex = 0;
    if (state == GAME) {
        int screenY = player.y - vOff;
        if (screenY < 0) screenY = 0;
        if (screenY > 160 - player.height) screenY = 160 - player.height;

        if (!player.invincible || player.flickerTimer == 0) {
            shadowOAM[0].attr0 = ((player.y - vOff) & 0xFF) | (0<<14);
            shadowOAM[0].attr1 = ((player.x - hOff) & 0x1FF) | (2<<14);
            shadowOAM[0].attr2 = ((((player.direction * 4) * (32) + (player.currentFrame * 4))) & 0x3FF);
        } else {
            shadowOAM[0].attr0 = (2<<8);
        }


        for (int i = 0; i < 4; i++) {
            if (!enemies[i].active) {
                shadowOAM[i + 1].attr0 = (2<<8);
                continue;
            }

            int screenX = enemies[i].x - hOff;
            int screenY = enemies[i].y - vOff;

            if (screenX + enemies[i].width < 0 ||
                screenX > 240 ||
                screenY + enemies[i].height < 0 ||
                screenY > 160) {
                shadowOAM[i + 1].attr0 = (2<<8);
                continue;
            }

            int tileX, tileRow;
            if (enemies[i].type == KNIGHT) {
                if (enemies[i].health <= 0) {
                    tileX = 12 + enemies[i].currentFrame * 4;
                    tileRow = 8;
                } else {
                    if (enemies[i].direction == RIGHT) {
                        tileX = 12 + enemies[i].currentFrame * 4;
                        tileRow = 0;
                    } else {
                        tileX = 12 + enemies[i].currentFrame * 4;
                        tileRow = 4;
                    }
                }
            } else {

                if (enemies[i].health <= 0) {
                    tileX = enemies[i].currentFrame * 4;
                    tileRow = 16;
                } else {
                    if (enemies[i].direction == RIGHT) {
                        tileX = enemies[i].currentFrame * 4;
                        tileRow = 8;
                    } else {
                        tileX = enemies[i].currentFrame * 4;
                        tileRow = 12;
                    }
                }
            }

            shadowOAM[i + 1].attr2 = ((((tileRow) * (32) + (tileX))) & 0x3FF);
            shadowOAM[i + 1].attr0 = ((screenY) & 0xFF) | (0<<14);
            shadowOAM[i + 1].attr1 = ((screenX) & 0x1FF) | (2<<14);
        }


        oamIndex = 4 + 1;
        for (int i = 0; i < 3; i++) {
            int oamSlot = 4 + 1 + i;
            if (powerups[i].active) {
                int screenX = powerups[i].x - hOff;
                int screenY = powerups[i].y - vOff;

                if (screenX + powerups[i].width < 0 || screenX > 240 ||
                    screenY + powerups[i].height < 0 || screenY > 160) {
                    shadowOAM[oamSlot].attr0 = (2<<8);
                } else {
                    shadowOAM[oamSlot].attr0 = ((screenY) & 0xFF) | (0<<14);
                    shadowOAM[oamSlot].attr1 = ((screenX) & 0x1FF) | (1<<14);
                    shadowOAM[oamSlot].attr2 = ((((14) * (32) + (12))) & 0x3FF);
                }
            } else {
                shadowOAM[oamSlot].attr0 = (2<<8);
            }
        }


        int fireballStartIndex = 1 + 4 + 3;
        for (int i = 0; i < 5; i++) {
            int oamIndex = fireballStartIndex + i;
            if (fireballs[i].active) {
                int screenX = fireballs[i].x - hOff;
                int screenY = fireballs[i].y - vOff;


                int tileX = (fireballs[i].currentFrame * 4);
                int tileY = (fireballs[i].direction == LEFT) ? 24 : 20;

                shadowOAM[oamIndex].attr0 = ((screenY) & 0xFF) | (0<<14);
                shadowOAM[oamIndex].attr1 = ((screenX) & 0x1FF) | (2<<14);
                shadowOAM[oamIndex].attr2 = ((((tileY) * (32) + (tileX))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[oamIndex].attr0 = (2<<8);
            }
        }

        (*(volatile unsigned short*) 0x04000010) = hOff;
        (*(volatile unsigned short*) 0x04000012) = vOff;

        waitForVBlank();
        updateDestroyedTiles();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    }
}


void goToStart() {

    currentLevel = 1;
    resetGame();


    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);


    DMANow(3, start1Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, finnSpriteSheetPal, ((u16 *)0x5000200), 256);


    videoBuffer = (u16*)0x6000000;
    drawFullscreenImage4(start1Bitmap);
    videoBuffer = (u16*)0x600A000;
    drawFullscreenImage4(start1Bitmap);


    waitForVBlank();
    flipPages();


    for(int i = 0; i < 128; i++)
        shadowOAM[i].attr0 = (2<<8);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = START;
}

void goToStart2() {

    currentLevel = 1;
    resetGame();


    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);


    DMANow(3, start2Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, finnSpriteSheetPal, ((u16 *)0x5000200), 256);


    videoBuffer = (u16*)0x6000000;
    drawFullscreenImage4(start2Bitmap);
    videoBuffer = (u16*)0x600A000;
    drawFullscreenImage4(start2Bitmap);


    waitForVBlank();
    flipPages();


    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);


    state = START2;


    playSoundB(swordSoundEffect_data, swordSoundEffect_length, 0);
}



void goToGame() {

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);
    flipPages();
    videoBuffer = ((unsigned short *)0x6000000);


    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((24) << 8) | (3 << 14) | (0 << 7);
    (*(volatile unsigned short*) 0x400000A) = ((0) << 2) | ((28) << 8) | (3 << 14) | (0 << 7);


    DMANow(3, worldTilesetTiles, &((CB*) 0x6000000)[0], 32768 / 2);
    DMANow(3, worldTilesetPal, ((unsigned short *)0x5000000), 256);


    if (currentLevel == 1) {
        DMANow(3, foregroundMap, &((SB*) 0x6000000)[24], (8192) / 2);
        DMANow(3, backgroundMap, &((SB*) 0x6000000)[28], (8192) / 2);
    } else if (currentLevel == 2) {
        DMANow(3, foreground2Map, &((SB*) 0x6000000)[24], (8192) / 2);
        DMANow(3, background2Map, &((SB*) 0x6000000)[28], (8192) / 2);
    }


    hOff = player.x - (240 / 2 - player.width / 2);
    vOff = player.y - (160 / 2 - player.height / 2);


    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff > 512 - 160) vOff = 512 - 160;


    (*(volatile unsigned short*) 0x04000014) = hOff / 2;
    (*(volatile unsigned short*) 0x04000016) = vOff / 2;

    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;


    DMANow(3, finnSpriteSheetTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, finnSpriteSheetPal, ((u16 *)0x5000200), 256);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = GAME;
}

void goToPause() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
    DMANow(3, pausePal, ((unsigned short *)0x5000000), 256);

    drawFullscreenImage4(pauseBitmap);


    pauseSounds();

    waitForVBlank();
    flipPages();


    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = PAUSE;
}

void goToLose() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);

    drawFullscreenImage4(loseBitmap);


    stopSounds();

    waitForVBlank();
    flipPages();


    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = LOSE;
}

void startState() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart2();
    }
}

void startState2() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToInstructions();
    }
}



void gameState() {
    update();

    if ((!(~(oldButtons) & ((1<<8))) && (~(buttons) & ((1<<8))))) {
        player.invincible = 1;
        player.invincibilityTimer = 0x7FFFFFFF;
    }


    draw();


    frameCounter++;
    if (frameCounter % 15 == 0) {
        playMelodyTick();
    }

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToLose();
    }

    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        shootFireball();
    }



    if (!soundA.isPlaying) {
        playSoundA(backgroundMusic_data, backgroundMusic_length, 1);
    }
}


void pauseState() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}

void loseState() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart2();
    }
}

void shootFireball() {
    for (int i = 0; i < 5; i++) {
        if (!fireballs[i].active) {
            fireballs[i].x = player.x + player.width / 2;
            fireballs[i].y = player.y + player.height / 2 - 16;
            fireballs[i].direction = player.direction;
            fireballs[i].xVel = (player.direction == LEFT) ? -2 : 2;
            fireballs[i].active = 1;
            fireballs[i].currentFrame = 0;
            fireballs[i].timeUntilNextFrame = 8;


            playSoundB(fireballSoundEffect_data, fireballSoundEffect_length, 0);

            break;
        }
    }
}



void resetGame() {
    frameCounter = 0;
    melodyIndex = 0;


    memset(destroyedTiles, 0, sizeof(destroyedTiles));


    player.width = 32;
    player.height = 32;
    player.x = 0;
    player.y = 142;
    player.currentFrame = 0;
    player.numFrames = 3;
    player.direction = RIGHT;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.jumpVelocity = 0;
    player.isJumping = 0;
    player.jumpStrength = -12;
    player.gravity = 1;
    player.invincible = 0;
    player.invincibilityTimer = 0;


    for (int i = 0; i < 5; i++) {
        fireballs[i].active = 0;
    }


    if (currentLevel == 1) {
        for (int i = 0; i < 4; i++) {
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].currentFrame = 0;
            enemies[i].numFrames = 3;
            enemies[i].timeUntilNextFrame = 4;
            enemies[i].xVel = 1;
            enemies[i].direction = (i % 2 == 0) ? LEFT : RIGHT;
            enemies[i].type = MARCELINE;
            enemies[i].active = 1;
            enemies[i].health = 1;
            enemies[i].stunned = 0;
        }

        enemies[0].x = 160;
        enemies[0].y = 190;

        enemies[1].x = 242;
        enemies[1].y = 270;

        enemies[2].x = 320;
        enemies[2].y = 352;

        enemies[3].x = 186;
        enemies[3].y = 476;

        powerups[0].x = 112;
        powerups[0].y = 48;
        powerups[0].width = 16;
        powerups[0].height = 16;
        powerups[0].active = 1;

    } else if (currentLevel == 2) {

        player.x = 0;
        player.y = 24;

        for (int i = 0; i < 4; i++) {
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].currentFrame = 0;
            enemies[i].numFrames = 3;
            enemies[i].timeUntilNextFrame = 8;
            enemies[i].xVel = 1;
            enemies[i].direction = (i % 2 == 0) ? LEFT : RIGHT;
            enemies[i].type = KNIGHT;
            enemies[i].active = 1;
            enemies[i].health = 1;
            enemies[i].stunned = 0;
        }

        enemies[0].x = 176;
        enemies[0].y = 172;

        enemies[1].x = 205;
        enemies[1].y = 172;

        enemies[2].x = 136;
        enemies[2].y = 366;

        enemies[3].x = 256;
        enemies[3].y = 460;

        powerups[0].x = 112;
        powerups[0].y = 135;
        powerups[0].width = 16;
        powerups[0].height = 16;
        powerups[0].active = 1;
    }
}

void goToLevel2() {
    currentLevel = 2;
    resetGame();
    goToGame();
}

void goToWin() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
    DMANow(3, winPal, ((unsigned short *)0x5000000), 256);

    drawFullscreenImage4(winBitmap);

    waitForVBlank();
    flipPages();


    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = WIN;
}

void winState() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void goToInstructions() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
    DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 256);

    videoBuffer = (u16*)0x6000000;
    drawFullscreenImage4(instructionsBitmap);
    videoBuffer = (u16*)0x600A000;
    drawFullscreenImage4(instructionsBitmap);

    waitForVBlank();
    flipPages();


    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    state = INSTRUCTIONS;
}


void instructionsState() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}




void playMelodyTick() {
    unsigned short note = melody[melodyIndex];

    playChannel1(
        note,
        20,
        0, 0, 0,
        2, 0,
        2
    );

    melodyIndex = (melodyIndex + 1) % melodyLength;
}

void updateDestroyedTiles() {
    for (int i = 0; i < updateCount; i++) {
        int tx = tileUpdates[i].tx;
        int ty = tileUpdates[i].ty;



        int sbX = tx / 32;
        int sbY = ty / 32;



        int localX = tx % 32;
        int localY = ty % 32;


        int screenblockIndex = 24 + sbX + (sbY * 2);


        volatile u16* tileMapPtr = (volatile u16*)(0x6000000 + (screenblockIndex * 2048) + (localY * 64) + (localX * 2));


        *tileMapPtr = tileUpdates[i].tileIndex;
    }
}
