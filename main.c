#include "gba.h"
#include "mode0.h"
#include "world_tileset.h"
#include "level1.h"
#include "finnSpriteSheet.h"
#include "sprites.h"
#include "level1CollisionMap.h"
#include "lose.h"
#include "level2.h"
#include "level2CollisionMap.h"
#include "win.h"
#include "start.h"
#include "pause.h"
#include "mode4.h"
#include "level1new.h"
#include "worldTileset.h"
#include "foreground.h"
#include "background.h"
#include "foreground2.h"
#include "background2.h"
#include "analogSound.h"
#include "finn_scream.h"
#include "digitalSound.h"
#include "fireballSoundEffect.h"
#include "backgroundMusic.h"
#include "start1.h"
#include "start2.h"
#include "swordSoundEffect.h"
#include "instructions.h"

#define MAPWIDTH 512
#define MAPHEIGHT 512

#define COLLISION_BUFFER 0 // Small buffer for more reliable collision detection

#define ENEMYCOUNT 4
#define FIREBALLCOUNT 5

#define DESTROYED_TILE_INDEX 0  // Change this to your empty tile index
#define MAX_UPDATES_PER_FRAME 16



int currentLevel = 1;
int loopingSoundPlayed = 0;
int frameCounter = 0;

FIREBALL fireballs[FIREBALLCOUNT];
SPRITE enemies[ENEMYCOUNT];
OBJ_ATTR shadowOAM[128];
SPRITE player;

typedef enum {RIGHT = 0, LEFT = 1} DIRECTION;
typedef enum {START, START2, INSTRUCTIONS, GAME, PAUSE, LOSE, WIN} GAMESTATE;

TileUpdate tileUpdates[MAX_UPDATES_PER_FRAME];
int updateCount = 0;

unsigned short melody[] = {0xA6E, 0x9A0, 0x8F4, 0x836, 0x836, 0x8F4, 0x9A0, 0xA6E};
int melodyLength = 8;
int melodyIndex = 0;

unsigned char destroyedTiles[64][64] = {0};

GAMESTATE state;
#define POWERUPCOUNT 3
POWERUP powerups[POWERUPCOUNT];

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;

inline unsigned char colorAt(int x, int y) {
    // Immediately return passable if coordinates are out of bounds
    if (x < 0 || x >= MAPWIDTH || y < 0 || y >= MAPHEIGHT) return 1;

    int tx = x / 8;
    int ty = y / 8;
    
    if (destroyedTiles[tx][ty]) {
        return 1; // Destroyed tiles are passable
    }
    
    return ((unsigned char*)(currentLevel == 1 ? level1CollisionMapBitmap : level2CollisionMapBitmap))[OFFSET(x, y, MAPWIDTH)];
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
        buttons = REG_BUTTONS;

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
    // Initialize destroyedTiles array to all zeros
    memset(destroyedTiles, 0, sizeof(destroyedTiles));
    
    setupSounds();
    setupSoundInterrupts();
      
    // Adding 3 Marcelines in distinct locations
    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].width = 32;
        enemies[i].height = 32;
        enemies[i].currentFrame = 0;
        enemies[i].numFrames = 3;
        enemies[i].timeUntilNextFrame = 8;
        enemies[i].xVel = 1;
        enemies[i].direction = (i % 2 == 0) ? LEFT : RIGHT;
        enemies[i].type = MARCELINE;
        enemies[i].active = 1;
        enemies[i].health = 1; // Set initial health for each enemy
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
    DMANow(3, shadowOAM, OAM, 512);

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

    for (int i = 0; i < FIREBALLCOUNT; i++) {
        fireballs[i].active = 0;
        fireballs[i].width = 32;  // Assuming 32x32 sprite (4 16x16 tiles)
        fireballs[i].height = 32;
        fireballs[i].currentFrame = 0;
        fireballs[i].numFrames = 3;  // Changed from 3 to 4
        fireballs[i].timeUntilNextFrame = 8;
    }

    powerups[0].x = 112;  // Spread them out horizontally
    powerups[0].y = 48;   // Vary vertical position
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

    // Movement checks - left and right
    handleMovement(leftX, rightX, topY, bottomY);

    // Check if player is grounded
    int onGround = isOnGround(leftX, rightX, bottomY);

    // Jump initiation
    handleJump(onGround);

    // Apply gravity and jumping physics
    handleGravity(leftX, rightX, topY, bottomY);

    // Handle animations
    handleAnimations();

    // Update scrolling offsets based on player's position
    updateScrollingOffsets();

    // Enemy movement and collision checks
    handleEnemies();

    // Handle powerups
    handlePowerups();

    // Handle fireballs
    handleFireballs();

    // Handle collision resolution inside walls
    resolveWallCollisions(leftX, topY, bottomY, rightX);

    // Handle invincibility countdown and flickering
    handleInvincibility();

    // Check if all enemies are defeated
    checkLevelCompletion();
}

void handleMovement(int leftX, int rightX, int topY, int bottomY) {
    // Left movement
    if (BUTTON_HELD(BUTTON_LEFT)) {
        int newX = player.x - player.xVel;
        if (!isCollision(newX, topY, bottomY)) {
            player.x = newX;
            player.direction = LEFT;
            player.isAnimating = 1;
        }
    }

    // Right movement
    if (BUTTON_HELD(BUTTON_RIGHT)) {
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
    // Check multiple points along the vertical edge
    int checkPointsY[] = {
        topY + COLLISION_BUFFER,
        topY + (bottomY - topY) / 4,
        topY + (bottomY - topY) / 2,
        topY + 3 * (bottomY - topY) / 4,
        bottomY - COLLISION_BUFFER
    };

    for (int i = 0; i < 5; i++) {
        int y = checkPointsY[i];
        if (newX < 0 || newX >= MAPWIDTH || colorAt(newX, y) != 1) {
            collision = 1;
            break;
        }
    }
    return collision;
}

int isOnGround(int leftX, int rightX, int bottomY) {
    if (bottomY >= MAPHEIGHT - 1) {
        return 1;
    }

    // Check multiple points along the bottom edge
    int numPoints = 5;
    int spacing = (rightX - leftX) / (numPoints - 1);
    
    for (int i = 0; i < numPoints; i++) {
        int checkX = leftX + (spacing * i);
        int groundCheckY = bottomY + 1;
        
        // Check both the exact point and one pixel below
        if (colorAt(checkX, groundCheckY) == 0 || 
            (groundCheckY + 1 < MAPHEIGHT && colorAt(checkX, groundCheckY + 1) == 0)) {
            return 1;
        }
    }
    
    return 0;
}

void handleJump(int onGround) {
    if (BUTTON_PRESSED(BUTTON_A) && onGround) {
        player.isJumping = 1;
        player.jumpVelocity = player.jumpStrength;
        player.y = (player.y / 8) * 8;
        player.y -= 1;  // Small upward nudge for collision
    }
}

void handleGravity(int leftX, int rightX, int topY, int bottomY) {
    if (player.isJumping || !isOnGround(leftX, rightX, bottomY)) {
        // Apply gravity to jump velocity
        player.jumpVelocity += player.gravity;
        
        // Cap maximum fall speed
        if (player.jumpVelocity > 12) {
            player.jumpVelocity = 12;
        }

        int newY = player.y + player.jumpVelocity;
        
        if (player.jumpVelocity < 0) { // Moving UP
            // Check multiple points along the top edge
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
        } else { // Moving DOWN
            int newBottom = newY + player.height;
            int collision = 0;
            int numPoints = 5;
            int spacing = (rightX - leftX) / (numPoints - 1);
            
            // Start with a higher position and move down pixel by pixel
            for (int testY = player.y; testY <= newY; testY++) {
                int testBottom = testY + player.height;
                collision = 0;
                
                for (int i = 0; i < numPoints; i++) {
                    int checkX = leftX + (spacing * i);
                    if (testBottom >= MAPHEIGHT || colorAt(checkX, testBottom) != 1) {
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
    // Handle player animation
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

    // Handle enemy animations
    for (int i = 0; i < ENEMYCOUNT; i++) {
        SPRITE* e = &enemies[i];

        if (e->health <= 0) {
            // Death animation handling
            if (e->currentFrame < 2) {  // 3 frames (0, 1, 2)
                e->timeUntilNextFrame--;  // Decrease the timer each frame
                if (e->timeUntilNextFrame <= 0) {
                    e->timeUntilNextFrame = 16; // Set a higher value to slow down the animation
                    e->currentFrame++; // Move to next death animation frame
                }
            } else {
                // Start the death timer after the final death frame
                if (e->deathTimer == 0) {
                    e->deathTimer = 60;  // Set how long the enemy stays on screen after death (60 frames, or 1 second at 60fps)
                } else {
                    e->deathTimer--;  // Countdown the timer
                    if (e->deathTimer <= 0) {
                        e->active = 0;  // Deactivate the enemy after the timer expires
                    }
                }
            }
        } else {
            // Normal movement animations
            e->timeUntilNextFrame--;
            if (e->timeUntilNextFrame <= 0) {
                e->timeUntilNextFrame = 8; // Or 4 for faster animation
                e->currentFrame = (e->currentFrame + 1) % e->numFrames;
            }
        }
    }
}



void handleEnemies() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        SPRITE* e = &enemies[i];
        if (!e->active) continue;

        // Check if the enemy is stunned
        if (e->stunned) {
            continue;  // Skip movement if enemy is stunned
        }

        // Calculate enemy's collision points
        int eLeftX = e->x;
        int eRightX = e->x + e->width - 1;
        int eTopY = e->y;
        int eBottomY = e->y + e->height - 1;

        // Move enemy
        int newX = e->x + (e->direction == RIGHT ? e->xVel : -e->xVel);

        // Check collision with walls using ENEMY'S Y positions
        int collision = 0;
        for (int y = eTopY + COLLISION_BUFFER; y <= eBottomY - COLLISION_BUFFER; y += (e->height - 2 * COLLISION_BUFFER) / 2) {
            int checkX = (e->direction == RIGHT) ? newX + e->width - 1 : newX;
            if (checkX < 0 || checkX >= MAPWIDTH || colorAt(checkX, y) != 1) {
                collision = 1;
                break;
            }
        }


        if (e->active && e->health > 0) { // Only active and alive enemies can damage
            if (player.x < e->x + e->width &&
                player.x + player.width > e->x &&
                player.y < e->y + e->height &&
                player.y + player.height > e->y) {

                if (!player.invincible) {
                    player.health--;
                    player.invincible = 1;
                    player.invincibilityTimer = 60; // 1 second invincibility

                    // Check if player's health is depleted
                    if (player.health <= 0) {
                        goToLose();
                    }

                    // Play hit sound effect
                    playSoundB(finn_scream_data, finn_scream_length, 0);
                }
            }
        }


        if (collision) {
            e->direction = (e->direction == LEFT) ? RIGHT : LEFT;
        } else {
            e->x = newX;
        }

        // Handle animation based on the type
        if (e->type == KNIGHT) {
            // Handle Knight specific animations
            e->timeUntilNextFrame--;
            if (e->timeUntilNextFrame <= 0) {
                e->timeUntilNextFrame = 8; // Adjust this value to change speed of animation
                e->currentFrame = (e->currentFrame + 1) % e->numFrames;
            }
        }
    }
}




void updateScrollingOffsets() {
    hOff = player.x - (SCREENWIDTH / 2 - player.width / 2);
    vOff = player.y - (SCREENHEIGHT / 2 - player.height / 2);

    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;
}

void handlePowerups() {
    for (int i = 0; i < POWERUPCOUNT; i++) {
        if (powerups[i].active && player.x < powerups[i].x + powerups[i].width && player.x + player.width > powerups[i].x && player.y < powerups[i].y + powerups[i].height && player.y + player.height > powerups[i].y) {
            powerups[i].active = 0;
            player.invincible = 1;
            player.invincibilityTimer = 180;  // Grant invincibility
        }
    }
}

void handleFireballs() {
    updateCount = 0;
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        if (fireballs[i].active) {
            int nextX = fireballs[i].x + fireballs[i].xVel;

            // Check boundaries first
            if (nextX < 0 || nextX + fireballs[i].width > MAPWIDTH) {
                fireballs[i].active = 0;
                continue;
            }

            // Calculate the leading edge of the fireball based on direction
            int checkX = (fireballs[i].direction == RIGHT) 
                ? nextX + fireballs[i].width - 1
                : nextX;
            
            // Check for collision with solid tiles at several points along the fireball's height
            int collision = 0;
            int collisionTileX = -1;
            int collisionTileY = -1;
            
            // Check top, middle, and bottom points of fireball for collision
            int checkPoints[] = {
                fireballs[i].y + 8,             // Top area
                fireballs[i].y + fireballs[i].height/2,  // Middle
                fireballs[i].y + fireballs[i].height - 8 // Bottom area
            };
            
            for (int j = 0; j < 3; j++) {
                int checkY = checkPoints[j];
                
                // Get tile coordinates
                int tileX = checkX / 8;
                int tileY = checkY / 8;
                
                // Bounds check
                if (tileX < 0 || tileX >= 64 || tileY < 0 || tileY >= 64) {
                    continue;
                }
                
                // Skip already destroyed tiles
                if (destroyedTiles[tileX][tileY]) {
                    continue;
                }
                
                // Check collision using the collision map at pixel level
                unsigned char* colMap = (currentLevel == 1) 
                    ? level1CollisionMapBitmap 
                    : level2CollisionMapBitmap;
                
                // Check if this exact pixel is solid (0 = solid, 1 = passable)
                if (colMap[OFFSET(checkX, checkY, MAPWIDTH)] == 0) {
                    collision = 1;
                    collisionTileX = tileX;
                    collisionTileY = tileY;
                    break;
                }
            }
            
            if (collision) {
                // Mark this tile as destroyed in our tracking array
                destroyedTiles[collisionTileX][collisionTileY] = 1;
                
                // Add to update queue if we have room
                if (updateCount < MAX_UPDATES_PER_FRAME) {
                    tileUpdates[updateCount].tx = collisionTileX;
                    tileUpdates[updateCount].ty = collisionTileY;
                    tileUpdates[updateCount].tileIndex = DESTROYED_TILE_INDEX;
                    updateCount++;
                }
                
                // Deactivate the fireball
                fireballs[i].active = 0;
                playSoundB(fireballSoundEffect_data, fireballSoundEffect_length, 0);
            } else {
                // Move the fireball forward
                fireballs[i].x = nextX;
            }

            // Check if the fireball collides with any enemies
            for (int j = 0; j < ENEMYCOUNT; j++) {
                if (enemies[j].active && 
                    fireballs[i].x + fireballs[i].width > enemies[j].x &&
                    fireballs[i].x < enemies[j].x + enemies[j].width &&
                    fireballs[i].y + fireballs[i].height > enemies[j].y &&
                    fireballs[i].y < enemies[j].y + enemies[j].height) {

                    // Stop enemy movement by setting "stunned" to 1
                    enemies[j].stunned = 1;

                    // Reduce health of enemy
                    enemies[j].health--;

                    // Deactivate fireball
                    fireballs[i].active = 0;
                    break;
                }
            }

            // Handle fireball animation frame update
            fireballs[i].timeUntilNextFrame--;
            if (fireballs[i].timeUntilNextFrame <= 0) {
                fireballs[i].timeUntilNextFrame = 8;
                fireballs[i].currentFrame = (fireballs[i].currentFrame + 1) % fireballs[i].numFrames;
            }

            // Update sprite OAM for this fireball
            int screenX = fireballs[i].x - hOff;
            int screenY = fireballs[i].y - vOff;

            if (screenX > -32 && screenX < 240 && screenY > -32 && screenY < 160) {
                // In visible screen bounds, so show sprite
                int tileX = (fireballs[i].currentFrame * 4);  // Animation frames
                int tileY = (fireballs[i].direction == LEFT) ? 24 : 20;  // Left/right frames
                
                int oamIndex = ENEMYCOUNT + 1 + POWERUPCOUNT + i;
                shadowOAM[oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
                shadowOAM[oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // 32x32 sprite
                shadowOAM[oamIndex].attr2 = ATTR2_TILEID(tileX, tileY);
            } else {
                // Hide sprite if off screen
                int oamIndex = ENEMYCOUNT + 1 + POWERUPCOUNT + i;
                shadowOAM[oamIndex].attr0 = ATTR0_HIDE;
            }
        } else {
            // Hide inactive fireball sprites
            int oamIndex = ENEMYCOUNT + 1 + POWERUPCOUNT + i;
            shadowOAM[oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}

void resolveWallCollisions(int leftX, int topY, int bottomY, int rightX) {
    int collisionPoints[] = {
        leftX, topY,                    // Top-left
        rightX, topY,                   // Top-right
        leftX, bottomY,                 // Bottom-left
        rightX, bottomY                 // Bottom-right
    };

    // Only resolve collisions with NON-DESTROYED tiles
    int needsResolution = 0;
    for (int i = 0; i < 4; i += 2) {
        if (colorAt(collisionPoints[i], collisionPoints[i + 1]) == 0) { // Check for SOLID tiles
            needsResolution = 1;
            break;
        }
    }

    if (needsResolution) {
        // Try moving right
        for (int offset = 1; offset <= 16; offset++) { // Increase range to handle deeper embedding
            int valid = 1;
            for (int i = 0; i < 4; i += 2) {
                int x = collisionPoints[i] + offset;
                int y = collisionPoints[i + 1];
                if (x >= MAPWIDTH || colorAt(x, y) != 1) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                player.x += offset;
                return; // Exit once resolved
            }
        }

        // Try moving left
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

        // Try moving up
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
                player.jumpVelocity = 0; // Stop vertical movement
                return;
            }
        }

        // Try moving down
        for (int offset = 1; offset <= 16; offset++) {
            int valid = 1;
            for (int i = 0; i < 4; i += 2) {
                int x = collisionPoints[i];
                int y = collisionPoints[i + 1] + offset;
                if (y >= MAPHEIGHT || colorAt(x, y) != 1) {
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
    for (int i = 0; i < ENEMYCOUNT; i++) {
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
            shadowOAM[0].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_SQUARE;
            shadowOAM[0].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID(player.currentFrame * 4, player.direction * 4);
        } else {
            shadowOAM[0].attr0 = ATTR0_HIDE;
        }

        // Draw Enemies
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (!enemies[i].active) {
                shadowOAM[i + 1].attr0 = ATTR0_HIDE;
                continue;
            }

            int screenX = enemies[i].x - hOff;
            int screenY = enemies[i].y - vOff;

            if (screenX + enemies[i].width < 0 || 
                screenX > SCREENWIDTH ||
                screenY + enemies[i].height < 0 || 
                screenY > SCREENHEIGHT) {
                shadowOAM[i + 1].attr0 = ATTR0_HIDE;
                continue;
            }

            int tileX, tileRow;
            if (enemies[i].type == KNIGHT) {
                if (enemies[i].health <= 0) {
                    tileX = 12 + enemies[i].currentFrame * 4;
                    tileRow = 8;  // Corrected death animation row (previously 12)
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
                // Normal enemy behavior for other types
                if (enemies[i].health <= 0) {
                    tileX = enemies[i].currentFrame * 4;
                    tileRow = 16;  // Death animation row
                } else {
                    if (enemies[i].direction == RIGHT) {
                        tileX = enemies[i].currentFrame * 4;
                        tileRow = 8;
                    } else {
                        tileX = enemies[i].currentFrame * 4;
                        tileRow = 12;  // Left-facing enemy frames start here
                    }
                }
            }

            shadowOAM[i + 1].attr2 = ATTR2_TILEID(tileX, tileRow);
            shadowOAM[i + 1].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
        }

        // Draw Powerups
        oamIndex = ENEMYCOUNT + 1; // Powerups start drawing after enemies
        for (int i = 0; i < POWERUPCOUNT; i++) {
            int oamSlot = ENEMYCOUNT + 1 + i; // Fixed slots after enemies
            if (powerups[i].active) {
                int screenX = powerups[i].x - hOff;
                int screenY = powerups[i].y - vOff;
    
                if (screenX + powerups[i].width < 0 || screenX > SCREENWIDTH ||
                    screenY + powerups[i].height < 0 || screenY > SCREENHEIGHT) {
                    shadowOAM[oamSlot].attr0 = ATTR0_HIDE;
                } else {
                    shadowOAM[oamSlot].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
                    shadowOAM[oamSlot].attr1 = ATTR1_X(screenX) | ATTR1_SMALL;
                    shadowOAM[oamSlot].attr2 = ATTR2_TILEID(12, 14); // Adjust tile as needed
                }
            } else {
                shadowOAM[oamSlot].attr0 = ATTR0_HIDE;
            }
        }
    
        // Draw Fireballs (fixed OAM slots after powerups)
        int fireballStartIndex = 1 + ENEMYCOUNT + POWERUPCOUNT; // 1 (player) + 4 (enemies) + 3 (powerups) = 8
        for (int i = 0; i < FIREBALLCOUNT; i++) {
            int oamIndex = fireballStartIndex + i;
            if (fireballs[i].active) {
                int screenX = fireballs[i].x - hOff;
                int screenY = fireballs[i].y - vOff;
                
                // Calculate tile position based on direction and frame
                int tileX = (fireballs[i].currentFrame * 4);
                int tileY = (fireballs[i].direction == LEFT) ? 24 : 20;
                
                shadowOAM[oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
                shadowOAM[oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
                shadowOAM[oamIndex].attr2 = ATTR2_TILEID(tileX, tileY) | ATTR2_PALROW(0);
            } else {
                shadowOAM[oamIndex].attr0 = ATTR0_HIDE;
            }
        }

        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;

        waitForVBlank();
        updateDestroyedTiles();
        DMANow(3, shadowOAM, OAM, 128 * 4);
    }
}


void goToStart() {
    // Reset to level 1 and game state
    currentLevel = 1;
    resetGame();

    // Force Mode 4 setup
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
    // Critical: Reset both palettes
    DMANow(3, start1Pal, BG_PALETTE, 256);          // Background palette
    DMANow(3, finnSpriteSheetPal, SPRITE_PAL, 256); // Reset sprite palette

    // Draw to both buffers to prevent corruption
    videoBuffer = (u16*)0x6000000; // Front buffer
    drawFullscreenImage4(start1Bitmap);
    videoBuffer = (u16*)0x600A000; // Back buffer
    drawFullscreenImage4(start1Bitmap);

    // Final flip to consistent state
    waitForVBlank();
    flipPages();

    // Brutal OAM reset
    for(int i = 0; i < 128; i++) 
        shadowOAM[i].attr0 = ATTR0_HIDE;
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = START;
}

void goToStart2() {
    // Reset to start2 screen and game state
    currentLevel = 1;
    resetGame();

    // Force Mode 4 setup
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    // Reset palettes and background
    DMANow(3, start2Pal, BG_PALETTE, 256);
    DMANow(3, finnSpriteSheetPal, SPRITE_PAL, 256);

    // Draw the start2 bitmap to the front and back buffer
    videoBuffer = (u16*)0x6000000; // Front buffer
    drawFullscreenImage4(start2Bitmap);
    videoBuffer = (u16*)0x600A000; // Back buffer
    drawFullscreenImage4(start2Bitmap);

    // Flip to consistent state
    waitForVBlank();
    flipPages();

    // Hide all sprites during start screen
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Transition to the start2 state
    state = START2;

    // Play the sword sound effect
    playSoundB(swordSoundEffect_data, swordSoundEffect_length, 0);
}



void goToGame() {
    // Switch to Mode 0 with 2 backgrounds and enable sprites
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    flipPages();  
    videoBuffer = FRONTBUFFER;

    // Set background control registers
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE | BG_4BPP;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE | BG_4BPP;

    // Load the shared tileset and palette into CHARBLOCK[0]
    DMANow(3, worldTilesetTiles, &CHARBLOCK[0], worldTilesetTilesLen / 2);
    DMANow(3, worldTilesetPal, BG_PALETTE, 256); // Load full palette

    // Load appropriate tilemaps based on current level
    if (currentLevel == 1) {
        DMANow(3, foregroundMap, &SCREENBLOCK[24], foregroundLen / 2);
        DMANow(3, backgroundMap, &SCREENBLOCK[28], backgroundLen / 2);
    } else if (currentLevel == 2) {
        DMANow(3, foreground2Map, &SCREENBLOCK[24], foreground2Len / 2);
        DMANow(3, background2Map, &SCREENBLOCK[28], background2Len / 2);
    }

    // Calculate scrolling offsets based on player position
    hOff = player.x - (SCREENWIDTH / 2 - player.width / 2);
    vOff = player.y - (SCREENHEIGHT / 2 - player.height / 2);

    // Clamp scroll
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    // Apply parallax effect
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // Load sprites
    DMANow(3, finnSpriteSheetTiles, &CHARBLOCK[4], finnSpriteSheetTilesLen / 2);
    DMANow(3, finnSpriteSheetPal, SPRITE_PAL, 256);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;
}

void goToPause() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    DMANow(3, pausePal, BG_PALETTE, 256);

    drawFullscreenImage4(pauseBitmap);

    // Pause sound (background music stops)
    pauseSounds();

    waitForVBlank();
    flipPages();

    // Hide sprites
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}

void goToLose() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    DMANow(3, losePal, BG_PALETTE, 256);

    drawFullscreenImage4(loseBitmap);

    // Stop sound (background music stops)
    stopSounds();

    waitForVBlank();
    flipPages();

    // Hide sprites
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = LOSE;
}

void startState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart2();
    }
}

void startState2() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();  // Now go to the instructions screen
    }
}



void gameState() {
    update();

    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        player.invincible = 1;
        player.invincibilityTimer = 0x7FFFFFFF; // Effectively permanent
    }


    draw();


    frameCounter++;
    if (frameCounter % 15 == 0) { // Every ~0.25s at 60FPS
        playMelodyTick();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToLose();
    }

    if (BUTTON_PRESSED(BUTTON_B)) {
        shootFireball();
    }


    // Play background music if it's not already playing
    if (!soundA.isPlaying) {
        playSoundA(backgroundMusic_data, backgroundMusic_length, 1);  // Looping background music
    }
}


void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart2();
    }
}

void shootFireball() {
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        if (!fireballs[i].active) {
            fireballs[i].x = player.x + player.width / 2;
            fireballs[i].y = player.y + player.height / 2 - 16;
            fireballs[i].direction = player.direction;
            fireballs[i].xVel = (player.direction == LEFT) ? -2 : 2;
            fireballs[i].active = 1;
            fireballs[i].currentFrame = 0;
            fireballs[i].timeUntilNextFrame = 8;
            
            // Play the fireball sound effect when it's shot
            playSoundB(fireballSoundEffect_data, fireballSoundEffect_length, 0);
            
            break;
        }
    }
}



void resetGame() {
    frameCounter = 0;
    melodyIndex = 0;

    // Reset destroyed tiles array
    memset(destroyedTiles, 0, sizeof(destroyedTiles));

    // Reset player
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

    // Reset fireballs
    for (int i = 0; i < FIREBALLCOUNT; i++) {
        fireballs[i].active = 0;
    }

    // Reset enemies and powerups depending on currentLevel
    if (currentLevel == 1) {
        for (int i = 0; i < ENEMYCOUNT; i++) {
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].currentFrame = 0;
            enemies[i].numFrames = 3;
            enemies[i].timeUntilNextFrame = 4;
            enemies[i].xVel = 1;
            enemies[i].direction = (i % 2 == 0) ? LEFT : RIGHT;
            enemies[i].type = MARCELINE;
            enemies[i].active = 1;
            enemies[i].health = 1; // Set initial health for each enemy
            enemies[i].stunned = 0; // Reset stunned state
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
        // Set player spawn position for level 2
        player.x = 0;
        player.y = 24;

        for (int i = 0; i < ENEMYCOUNT; i++) {
            enemies[i].width = 32;
            enemies[i].height = 32;
            enemies[i].currentFrame = 0;
            enemies[i].numFrames = 3;
            enemies[i].timeUntilNextFrame = 8;
            enemies[i].xVel = 1;
            enemies[i].direction = (i % 2 == 0) ? LEFT : RIGHT;
            enemies[i].type = KNIGHT;
            enemies[i].active = 1;
            enemies[i].health = 1; // Set initial health for each enemy
            enemies[i].stunned = 0; // Reset stunned state
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
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    DMANow(3, winPal, BG_PALETTE, 256);

    drawFullscreenImage4(winBitmap);

    waitForVBlank();
    flipPages();

    // Hide sprites
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = WIN;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    DMANow(3, instructionsPal, BG_PALETTE, 256);

    videoBuffer = (u16*)0x6000000; // Front buffer
    drawFullscreenImage4(instructionsBitmap);
    videoBuffer = (u16*)0x600A000; // Back buffer
    drawFullscreenImage4(instructionsBitmap);

    waitForVBlank();
    flipPages();

    // Hide all sprites
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = INSTRUCTIONS;
}


void instructionsState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();  // Start the game when START is pressed
    }
}




void playMelodyTick() {
    unsigned short note = melody[melodyIndex];

    playChannel1(
        note,       // Note frequency
        20,         // Sound length
        0, 0, 0,    // No sweep
        2, 0,       // Envelope fade out gently
        2           // 50% duty
    );

    melodyIndex = (melodyIndex + 1) % melodyLength;
}

void updateDestroyedTiles() {
    for (int i = 0; i < updateCount; i++) {
        int tx = tileUpdates[i].tx;
        int ty = tileUpdates[i].ty;
        
        // A GBA large map uses 4 screenblocks, arranged in a 2x2 grid
        // Calculate which 32x32 screenblock we're in
        int sbX = tx / 32;  // Horizontal screenblock (0 or 1 for a 64x64 map)
        int sbY = ty / 32;  // Vertical screenblock (0 or 1 for a 64x64 map)
        
        // Each screenblock is 32x32 tiles stored in VRAM
        // Calculate local position within the screenblock
        int localX = tx % 32;
        int localY = ty % 32;
        
        // Calculate the screenblock index (base is 24 for foreground layer BG0)
        int screenblockIndex = 24 + sbX + (sbY * 2); // 2 screenblocks wide
        
        // Calculate the offset to the tile entry in VRAM (each entry is 2 bytes)
        volatile u16* tileMapPtr = (volatile u16*)(0x6000000 + (screenblockIndex * 2048) + (localY * 64) + (localX * 2));
        
        // Set this tile to use the empty tile index (0), with no flags
        *tileMapPtr = tileUpdates[i].tileIndex;
    }
}