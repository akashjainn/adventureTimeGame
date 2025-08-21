	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	ldr	ip, .L6
	add	r3, r0, r1, lsl #4
	ldr	ip, [ip]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r1, [ip, r3]
	sub	sp, sp, #8
	strh	r1, [sp, #6]	@ movhi
	ldrh	r1, [sp, #6]
	tst	r0, #1
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	strhne	r1, [sp, #6]	@ movhi
	strheq	r1, [sp, #6]	@ movhi
	ldrhne	r1, [sp, #6]
	ldrheq	r1, [sp, #6]
	orrne	r2, r1, r2, lsl #8
	orreq	r2, r1, r2
	strh	r2, [sp, #6]	@ movhi
	ldrh	r2, [sp, #6]
	strh	r2, [ip, r3]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L7:
	.align	2
.L6:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	ip, [sp, #64]	@ zero_extendqisi2
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	subs	r8, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #22]	@ movhi
	ble	.L8
	mov	r5, r2
	mov	r4, r1
	sub	r1, r2, #1
	sub	r2, r2, #2
	add	r1, r1, r1, lsr #31
	add	r2, r2, r2, lsr #31
	add	r3, r5, r5, lsr #31
	asr	r1, r1, #1
	asr	r2, r2, #1
	asr	r3, r3, #1
	orr	r1, r1, #16777216
	orr	r2, r2, #16777216
	orr	r3, r3, #16777216
	mov	r7, r0
	ldr	fp, .L27
	ldr	r10, .L27+4
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	add	r8, r8, r4
	and	r9, r5, #1
	b	.L15
.L26:
	rsb	r6, r4, r4, lsl #4
	add	r3, r7, #1
	add	r6, r3, r6, lsl #4
	add	r6, r6, r6, lsr #31
	cmp	r9, #0
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bic	r6, r6, #1
	bne	.L23
	bl	setPixel4
	ldr	r2, [fp]
	ldr	r3, [sp, #8]
	add	r2, r2, r6
.L22:
	mov	r0, #3
	add	r1, sp, #22
	mov	lr, pc
	bx	r10
	add	r0, r5, r7
	mov	r1, r4
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	sub	r0, r0, #1
	bl	setPixel4
.L11:
	add	r4, r4, #1
	cmp	r4, r8
	beq	.L8
.L15:
	cmp	r5, #1
	beq	.L24
	cmp	r5, #2
	beq	.L25
	tst	r7, #1
	bne	.L26
	rsb	r2, r4, r4, lsl #4
	add	r2, r7, r2, lsl #4
	ldr	r3, [fp]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	cmp	r9, #0
	add	r2, r3, r2
	beq	.L20
	ldr	r3, [sp, #4]
	b	.L22
.L24:
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r4, r8
	bne	.L15
.L8:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L20:
	mov	r0, #3
	ldr	r3, [sp, #12]
	add	r1, sp, #22
	mov	lr, pc
	bx	r10
	b	.L11
.L25:
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	mov	r1, r4
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	add	r0, r7, #1
	bl	setPixel4
	b	.L11
.L23:
	bl	setPixel4
	ldr	r2, [fp]
	mov	r0, #3
	ldr	r3, [sp, #4]
	add	r2, r2, r6
	add	r1, sp, #22
	mov	lr, pc
	bx	r10
	b	.L11
.L28:
	.align	2
.L27:
	.word	videoBuffer
	.word	DMANow
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldr	r2, .L31
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r0, #3
	orr	ip, ip, r3, lsl #8
	ldr	r2, [r2]
	ldr	r3, .L31+4
	ldr	r4, .L31+8
	add	r1, sp, #14
	strh	ip, [sp, #14]	@ movhi
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	videoBuffer
	.word	16796416
	.word	DMANow
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r6, r1, r3
	add	r2, r2, r2, lsr #31
	rsb	r6, r6, r6, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [sp, #32]
	ldr	r9, .L41
	ldr	r8, .L41+4
	add	r6, r0, r6, lsl #4
	add	r4, r0, r1, lsl #4
	asr	r10, r2, #1
	bic	r7, r2, #1
.L35:
	ldr	r3, [r9]
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	mov	r1, r5
	add	r2, r3, r2
	mov	r0, #3
	mov	r3, r10
	add	r4, r4, #240
	mov	lr, pc
	bx	r8
	cmp	r6, r4
	add	r5, r5, r7
	bne	.L35
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L45
	mov	r1, r0
	ldr	r2, [r3]
	ldr	r4, .L45+4
	mov	r3, #19200
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	videoBuffer
	.word	DMANow
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	flipPages
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPages, %function
flipPages:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L50
	moveq	r2, #100663296
	ldr	r1, .L50+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L51:
	.align	2
.L50:
	.word	100704256
	.word	videoBuffer
	.size	flipPages, .-flipPages
	.ident	"GCC: (devkitARM release 53) 9.1.0"
