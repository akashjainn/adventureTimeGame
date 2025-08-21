# 1 "mode4.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode4.c"
# 1 "mode4.h" 1



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
# 5 "mode4.h" 2




void flipPages();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 2 "mode4.c" 2


void setPixel4(int x, int y, unsigned char colorIndex) {
    volatile unsigned short pixelData = videoBuffer[((y) * (240) + (x)) / 2];
    if (x & 1) {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((y) * (240) + (x)) / 2] = pixelData;
}


void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++) {

        if (width == 1) {
            setPixel4(x, y + r, colorIndex);
        } else if (width == 2) {
            setPixel4(x, y + r, colorIndex);
            setPixel4(x + 1, y + r, colorIndex);
        } else if ((x & 1) && (width & 1)) {
            setPixel4(x, y + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x + 1)) / 2], (2 << 23) | (width - 1) / 2);
        } else if (width & 1) {
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x)) / 2], (2 << 23) | (width - 1) / 2);
            setPixel4(x + width - 1, y + r, colorIndex);
        } else if (x & 1) {
            setPixel4(x, y + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x + 1)) / 2], (2 << 23) | (width - 2) / 2);
            setPixel4(x + width - 1, y + r, colorIndex);
        } else {
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x)) / 2], (2 << 23) | width / 2);
        }
    }
}


void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage4(int x, int y, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[((i) * (width / 2) + (0))], &videoBuffer[((y + i) * (240) + (x)) / 2], width / 2);
    }
}


void drawFullscreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}


void flipPages() {
    if ((*(volatile unsigned short *)0x4000000) & (1 << 4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1 << 4);
}
