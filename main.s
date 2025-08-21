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
	.file	"main.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleInvincibility.part.0, %function
handleInvincibility.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L4
	ldr	r3, [r1, #68]
	sub	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #6
	movge	r3, r2
	asrs	r3, r3, #3
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	cmp	r2, #0
	str	r3, [r1, #76]
	movle	r3, #0
	str	r2, [r1, #68]
	strle	r3, [r1, #64]
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	handleInvincibility.part.0, .-handleInvincibility.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	isOnGround.part.0, %function
isOnGround.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	ldr	r0, .L17
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	r1, r1, r3
	ldr	lr, [r0]
	add	ip, r1, #3
	ldr	r0, .L17+4
	cmp	r1, #0
	movlt	r1, ip
	cmp	lr, #1
	ldr	r6, .L17+8
	movne	r6, r0
	add	r4, r2, #1
	cmp	r4, #512
	movcc	r7, #0
	movcs	r7, #1
	mov	r0, #5
	lsl	r10, r4, #9
	add	r9, r10, #512
	add	lr, r2, #2
	sub	sp, sp, #12
	add	r2, r6, r9
	ldr	r5, .L17+12
	ldr	r8, .L17+16
	str	r2, [sp, #4]
	add	r6, r6, r10
	asr	ip, r1, #2
	asr	r10, r4, #3
	asr	fp, lr, #3
.L10:
	cmp	r3, #512
	movcc	r2, #0
	movcs	r2, #1
	asr	r1, r3, #3
	orrs	r9, r2, r7
	add	r1, r5, r1, lsl #6
	beq	.L15
.L7:
	cmp	r4, r8
	beq	.L9
	cmp	lr, #512
	orrcs	r2, r2, #1
	asr	r1, r3, #3
	cmp	r2, #0
	add	r1, r5, r1, lsl #6
	beq	.L16
.L9:
	subs	r0, r0, #1
	add	r3, r3, ip
	bne	.L10
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	ldrb	r1, [r1, r10]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L7
	ldrb	r1, [r6, r3]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L7
.L12:
	mov	r0, #1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L16:
	ldrb	r2, [r1, fp]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L9
	ldr	r2, [sp, #4]
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L9
	b	.L12
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	level1CollisionMapBitmap
	.word	destroyedTiles
	.word	511
	.size	isOnGround.part.0, .-isOnGround.part.0
	.align	2
	.global	colorAt
	.syntax unified
	.arm
	.fpu softvfp
	.type	colorAt, %function
colorAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #512
	cmpcc	r0, #512
	bcc	.L25
.L23:
	mov	r0, #1
	bx	lr
.L25:
	ldr	r3, .L26
	asr	r2, r0, #3
	add	r3, r3, r2, lsl #6
	ldrb	r3, [r3, r1, asr #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L23
	ldr	r2, .L26+4
	ldr	ip, [r2]
	ldr	r2, .L26+8
	cmp	ip, #1
	ldr	r3, .L26+12
	movne	r3, r2
	add	r1, r3, r1, lsl #9
	ldrb	r0, [r1, r0]	@ zero_extendqisi2
	bx	lr
.L27:
	.align	2
.L26:
	.word	destroyedTiles
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	level1CollisionMapBitmap
	.size	colorAt, .-colorAt
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #4096
	mov	r1, #0
	ldr	r3, .L34
	ldr	r0, .L34+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	ldr	r1, .L34+16
	mvn	r2, #0
	mov	r3, r1
	mov	r6, #32
	mov	r5, #0
	mov	r7, #3
	mov	ip, #8
	mov	r4, #1
.L29:
	and	r0, r2, #1
	sub	r2, r2, #1
	cmn	r2, #5
	str	r6, [r3, #16]
	str	r6, [r3, #20]
	str	r5, [r3, #36]
	str	r7, [r3, #40]
	str	ip, [r3, #24]
	str	r4, [r3, #8]
	strb	r4, [r3, #60]
	str	r4, [r3, #72]
	str	r4, [r3, #80]
	str	r0, [r3, #28]
	add	r3, r3, #92
	bne	.L29
	mov	r0, #220
	mov	r2, #242
	mov	lr, #320
	mov	ip, #186
	mov	r8, #160
	mov	r3, #300
	str	r0, [r1, #4]
	str	r2, [r1, #92]
	add	r0, r0, #162
	add	r2, r2, #264
	str	lr, [r1, #184]
	str	ip, [r1, #276]
	str	r8, [r1]
	str	r3, [r1, #96]
	str	r0, [r1, #188]
	str	r2, [r1, #280]
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	ldr	r8, .L34+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L34+28
	mov	lr, pc
	bx	r8
	mov	r3, #10
	mov	r9, #174
	mvn	r8, #11
	mov	r0, #0
	mov	r1, #32
	mov	lr, #3
	mov	ip, #8
	ldr	r2, .L34+32
	str	r6, [r2, #16]
	str	r6, [r2, #20]
	str	r4, [r2, #8]
	str	r4, [r2, #12]
	str	r4, [r2, #56]
	str	r4, [r2, #80]
	ldr	r6, .L34+36
	ldr	r4, .L34+40
	str	r3, [r2, #24]
	ldr	r3, .L34+44
	str	r5, [r6]
	str	r5, [r4]
	str	r9, [r2, #4]
	str	r5, [r2]
	str	r5, [r2, #36]
	str	r7, [r2, #40]
	str	r5, [r2, #28]
	str	r5, [r2, #52]
	str	r5, [r2, #44]
	str	r5, [r2, #64]
	str	r5, [r2, #68]
	str	r8, [r2, #48]
	add	r2, r3, #200
.L30:
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	add	r3, r3, #40
	cmp	r3, r2
	bne	.L30
	mov	r2, #16
	mov	ip, #112
	mov	r0, #48
	mov	r1, #1
	ldr	r3, .L34+48
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L35:
	.align	2
.L34:
	.word	memset
	.word	destroyedTiles
	.word	setupSounds
	.word	setupSoundInterrupts
	.word	enemies
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	player
	.word	hOff
	.word	vOff
	.word	fireballs
	.word	powerups
	.size	initialize, .-initialize
	.align	2
	.global	isCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	isCollision, %function
isCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r2, r1
	push	{r4, r5, r6, lr}
	add	lr, r3, r3, lsl #1
	add	r4, lr, #3
	cmp	lr, #0
	movlt	lr, r4
	cmp	r3, #0
	add	ip, r3, #3
	movge	ip, r3
	ldr	r4, .L48
	ldr	r6, [r4]
	sub	sp, sp, #24
	ldr	r5, .L48+4
	add	r3, r3, r3, lsr #31
	cmp	r6, #1
	add	r3, r1, r3, asr #1
	str	r2, [sp, #20]
	ldr	r2, .L48+8
	ldr	r4, .L48+12
	str	r3, [sp, #12]
	movne	r4, r5
	asr	r3, r0, #3
	add	lr, r1, lr, asr #2
	add	ip, r1, ip, asr #2
	cmp	r0, #512
	add	r2, r2, r3, lsl #6
	str	lr, [sp, #16]
	str	ip, [sp, #8]
	add	r5, sp, #24
	add	r3, sp, #8
	bcs	.L41
.L46:
	cmp	r1, #512
	bcc	.L45
.L38:
	cmp	r3, r5
	beq	.L42
.L47:
	cmp	r0, #512
	ldr	r1, [r3], #4
	bcc	.L46
.L41:
	mov	r0, #1
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	add	ip, r4, r1, lsl #9
	ldrb	r1, [r2, r1, asr #3]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L38
	ldrb	r1, [ip, r0]	@ zero_extendqisi2
	cmp	r1, #1
	bne	.L41
	cmp	r3, r5
	bne	.L47
.L42:
	mov	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	destroyedTiles
	.word	level1CollisionMapBitmap
	.size	isCollision, .-isCollision
	.align	2
	.global	handleMovement
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleMovement, %function
handleMovement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L54
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r6, [r1]
	tst	r6, #32
	mov	r4, r2
	mov	r5, r3
	bne	.L51
	ldr	r7, .L54+4
	ldr	r3, [r7, #8]
	ldr	r8, [r7]
	sub	r8, r8, r3
	mov	r0, r8
	mov	r2, r5
	mov	r1, r4
	bl	isCollision
	cmp	r0, #0
	moveq	r3, #1
	streq	r8, [r7]
	streq	r3, [r7, #28]
	streq	r3, [r7, #32]
.L51:
	tst	r6, #16
	bne	.L50
	ldr	r6, .L54+4
	ldr	r3, [r6, #8]
	ldr	r7, [r6]
	ldr	r0, [r6, #16]
	add	r7, r7, r3
	mov	r2, r5
	mov	r1, r4
	add	r0, r7, r0
	bl	isCollision
	cmp	r0, #0
	moveq	r3, #1
	streq	r7, [r6]
	streq	r0, [r6, #28]
	streq	r3, [r6, #32]
.L50:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	buttons
	.word	player
	.size	handleMovement, .-handleMovement
	.align	2
	.global	isOnGround
	.syntax unified
	.arm
	.fpu softvfp
	.type	isOnGround, %function
isOnGround:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	cmp	r2, r3
	ble	isOnGround.part.0
.L57:
	mov	r0, #1
	bx	lr
.L59:
	.align	2
.L58:
	.word	510
	.size	isOnGround, .-isOnGround
	.align	2
	.global	handleJump
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleJump, %function
handleJump:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L68
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	subs	r0, r0, #0
	movne	r0, #1
	ldr	r3, .L68+4
	ldrh	r3, [r3]
	bics	r3, r0, r3
	bxeq	lr
	ldr	r2, .L68+8
	ldr	r3, [r2, #4]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	mov	r0, #1
	ldr	r1, [r2, #48]
	bic	r3, r3, #7
	sub	r3, r3, #1
	str	r0, [r2, #44]
	str	r1, [r2, #52]
	str	r3, [r2, #4]
	bx	lr
.L69:
	.align	2
.L68:
	.word	oldButtons
	.word	buttons
	.word	player
	.size	handleJump, .-handleJump
	.align	2
	.global	handleGravity
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleGravity, %function
handleGravity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L94
	ldr	r2, [r6, #44]
	cmp	r2, #0
	mov	r4, r0
	mov	r7, r1
	bne	.L71
	ldr	r2, .L94+4
	cmp	r3, r2
	bgt	.L70
	mov	r2, r3
	bl	isOnGround.part.0
	cmp	r0, #0
	bne	.L70
.L71:
	add	r3, r6, #52
	ldmia	r3, {r3, r5}
	add	r5, r3, r5
	cmp	r5, #12
	sub	ip, r7, r4
	str	r5, [r6, #52]
	ldr	r7, [r6, #4]
	ble	.L73
	mov	r3, #12
	str	r3, [r6, #52]
	add	r5, r7, r3
.L74:
	cmp	ip, #0
	add	r3, ip, #3
	movlt	ip, r3
	cmp	r7, r5
	ldr	lr, [r6, #20]
	asr	ip, ip, #2
	bgt	.L78
	ldr	r3, .L94+8
	ldr	r2, [r3]
	ldr	r3, .L94+12
	cmp	r2, #1
	ldr	r0, .L94+16
	movne	r0, r3
	add	lr, lr, r7
	ldr	r9, .L94+20
	add	r0, r0, lr, lsl #9
.L82:
	mov	r3, r4
	mov	r1, #5
	asr	r10, lr, #3
	lsr	r8, lr, #31
.L81:
	asr	r2, r3, #3
	cmp	lr, #512
	add	r2, r9, r2, lsl #6
	bge	.L79
	cmp	r3, #512
	movcc	fp, r8
	orrcs	fp, r8, #1
	cmp	fp, #0
	bne	.L80
	ldrb	r2, [r2, r10]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L80
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L79
.L80:
	subs	r1, r1, #1
	add	r3, r3, ip
	bne	.L81
	add	r7, r7, #1
	cmp	r7, r5
	add	lr, lr, #1
	add	r0, r0, #512
	ble	.L82
.L78:
	str	r5, [r6, #4]
.L70:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L73:
	cmp	r5, #0
	add	r5, r5, r7
	bge	.L74
	ldr	r2, .L94+8
	ldr	r1, [r2]
	ldr	r2, .L94+12
	cmp	r1, #1
	ldr	r3, .L94+16
	mov	r0, #3
	movne	r3, r2
	add	ip, ip, ip, lsr #31
	ldr	lr, .L94+20
	asr	ip, ip, #1
	add	r1, r3, r5, lsl #9
	asr	r7, r5, r0
.L77:
	asr	r3, r4, #3
	cmp	r5, #0
	add	r2, lr, r3, lsl #6
	blt	.L75
	cmp	r4, #512
	movcc	r3, #0
	movcs	r3, #1
	cmp	r5, #512
	orrge	r3, r3, #1
	cmp	r3, #0
	beq	.L93
.L76:
	subs	r0, r0, #1
	add	r4, r4, ip
	bne	.L77
	str	r5, [r6, #4]
	b	.L70
.L79:
	mov	r3, #0
	sub	r7, r7, #1
	str	r7, [r6, #4]
	str	r3, [r6, #44]
	str	r3, [r6, #52]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L93:
	ldrb	r3, [r2, r7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L76
	ldrb	r3, [r1, r4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L76
.L75:
	cmp	r5, #0
	add	r3, r5, #7
	movge	r3, r5
	mov	r2, #0
	bic	r3, r3, #7
	add	r3, r3, #8
	str	r3, [r6, #4]
	str	r2, [r6, #52]
	b	.L70
.L95:
	.align	2
.L94:
	.word	player
	.word	510
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	level1CollisionMapBitmap
	.word	destroyedTiles
	.size	handleGravity, .-handleGravity
	.global	__aeabi_idivmod
	.align	2
	.global	handleAnimations
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleAnimations, %function
handleAnimations:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L113
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L97
	ldr	r3, [r4, #24]
	subs	r3, r3, #1
	strne	r3, [r4, #24]
	beq	.L110
.L99:
	mov	r10, #8
	mov	r8, #0
	mov	r6, #60
	mov	r7, #16
	ldr	r4, .L113+4
	ldr	r9, .L113+8
	add	r5, r4, #368
.L107:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ble	.L111
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	strgt	r3, [r4, #24]
	bgt	.L103
	ldr	r0, [r4, #36]
	str	r10, [r4, #24]
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r9
	str	r1, [r4, #36]
.L103:
	add	r4, r4, #92
	cmp	r4, r5
	bne	.L107
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L111:
	ldr	r3, [r4, #36]
	cmp	r3, #1
	ble	.L112
	ldr	r3, [r4, #84]
	cmp	r3, #0
	streq	r6, [r4, #84]
	beq	.L103
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #84]
	strle	r8, [r4, #72]
	b	.L103
.L112:
	ldr	r2, [r4, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	addle	r3, r3, #1
	strgt	r2, [r4, #24]
	strle	r3, [r4, #36]
	strle	r7, [r4, #24]
	b	.L103
.L97:
	mov	r2, #10
	str	r3, [r4, #36]
	str	r2, [r4, #24]
	b	.L99
.L110:
	mov	r2, #10
	ldr	r0, [r4, #36]
	ldr	r3, .L113+8
	ldr	r1, [r4, #40]
	str	r2, [r4, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
	b	.L99
.L114:
	.align	2
.L113:
	.word	player
	.word	enemies
	.word	__aeabi_idivmod
	.size	handleAnimations, .-handleAnimations
	.align	2
	.global	updateScrollingOffsets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScrollingOffsets, %function
updateScrollingOffsets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L130
	ldr	r3, [ip, #16]
	ldr	r1, [ip, #20]
	add	r3, r3, r3, lsr #31
	asr	r0, r3, #1
	add	r1, r1, r1, lsr #31
	ldr	r3, [ip]
	rsb	r0, r0, #120
	asr	r2, r1, #1
	ldr	r1, [ip, #4]
	str	lr, [sp, #-4]!
	sub	r3, r3, r0
	ldr	lr, .L130+4
	ldr	r0, .L130+8
	rsb	r2, r2, #80
	sub	r1, r1, r2
	cmp	r3, #0
	str	r3, [lr]
	str	r1, [r0]
	blt	.L127
	cmp	r1, #0
	blt	.L128
	cmp	r3, #272
	ble	.L129
	mov	r3, #272
	mov	ip, #136
	mov	r2, r3
	str	r3, [lr]
.L117:
	cmp	r1, #352
	movgt	r3, #352
	movgt	lr, #176
	movgt	r1, r3
	strgt	r3, [r0]
	ble	.L123
.L121:
	mov	r0, #67108864
	strh	r2, [r0, #16]	@ movhi
	strh	r1, [r0, #18]	@ movhi
	strh	ip, [r0, #20]	@ movhi
	strh	lr, [r0, #22]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L128:
	mov	r1, #0
	cmp	r3, #272
	str	r1, [r0]
	ble	.L118
	mov	r3, #272
	mov	ip, #136
	mov	r2, r3
	str	r3, [lr]
.L123:
	add	lr, r1, r1, lsr #31
	asr	lr, lr, #1
	lsl	lr, lr, #16
	lsl	r1, r1, #16
	lsr	lr, lr, #16
	lsr	r1, r1, #16
	b	.L121
.L118:
	mov	lr, #0
	asr	ip, r3, #1
	lsl	ip, ip, #16
	lsl	r2, r3, #16
	mov	r1, lr
	lsr	ip, ip, #16
	lsr	r2, r2, #16
	b	.L121
.L127:
	mov	ip, #0
	cmp	r1, ip
	movlt	r3, ip
	str	ip, [lr]
	strlt	ip, [r0]
	blt	.L118
	mov	r2, ip
	b	.L117
.L129:
	asr	ip, r3, #1
	lsl	ip, ip, #16
	lsl	r2, r3, #16
	lsr	ip, ip, #16
	lsr	r2, r2, #16
	b	.L117
.L131:
	.align	2
.L130:
	.word	player
	.word	hOff
	.word	vOff
	.size	updateScrollingOffsets, .-updateScrollingOffsets
	.align	2
	.global	handlePowerups
	.syntax unified
	.arm
	.fpu softvfp
	.type	handlePowerups, %function
handlePowerups:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	mov	r9, r4
	ldr	r2, .L144
	ldr	r3, .L144+4
	ldr	lr, [r2]
	ldr	ip, [r2, #16]
	ldr	r6, [r2, #4]
	ldr	r5, [r2, #20]
	ldr	r8, [r2, #64]
	ldr	r7, [r2, #68]
	add	ip, lr, ip
	add	r5, r6, r5
	add	r0, r3, #60
.L134:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L133
	ldr	r10, [r3]
	ldr	r1, [r3, #8]
	add	r1, r10, r1
	cmp	lr, r1
	bge	.L133
	cmp	r10, ip
	bge	.L133
	ldr	r10, [r3, #4]
	ldr	r1, [r3, #12]
	add	r1, r10, r1
	cmp	r6, r1
	bge	.L133
	cmp	r10, r5
	movlt	r4, #1
	movlt	r7, #180
	movlt	r8, r4
	strlt	r9, [r3, #16]
.L133:
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L134
	cmp	r4, #0
	strne	r8, [r2, #64]
	strne	r7, [r2, #68]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	player
	.word	powerups
	.size	handlePowerups, .-handlePowerups
	.align	2
	.global	handleFireballs
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleFireballs, %function
handleFireballs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L180
	ldr	r4, .L180+4
	str	r3, [r2]
	ldr	r5, .L180+8
	sub	sp, sp, #28
	add	r10, r4, #200
.L164:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L147
	ldr	r2, [r4]
	ldr	r3, [r4, #16]
	adds	r3, r2, r3
	bmi	.L148
	ldr	r1, [r4, #8]
	add	r1, r3, r1
	cmp	r1, #512
	ble	.L149
.L148:
	mov	r3, #0
	str	r3, [r4, #20]
.L150:
	add	r4, r4, #40
	cmp	r10, r4
	add	r5, r5, #8
	bne	.L164
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L179:
	cmp	r2, #0
	movge	r0, r2
	ldr	fp, [sp, #4]
	add	r2, fp, r2, lsl #9
	ldrb	fp, [r9, r0, asr #3]	@ zero_extendqisi2
	cmp	fp, #0
	asr	fp, r0, #3
	add	r0, r9, r0, asr #3
	bne	.L152
	ldrb	r2, [r2, r1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L152
	mov	r1, #1
	ldr	r3, .L180
	ldr	r3, [r3]
	cmp	r3, #15
	strb	r1, [r0]
	bgt	.L167
	ldr	r0, .L180+12
	add	ip, r3, r3, lsl #1
	add	r1, r0, ip, lsl #2
	strh	r2, [r1, #8]	@ movhi
	ldr	r2, .L180
	add	r3, r3, #1
	str	lr, [r0, ip, lsl #2]
	str	fp, [r1, #4]
	str	r3, [r2]
.L167:
	mov	r2, #0
	ldr	r3, .L180+16
	ldr	r0, .L180+20
	ldr	r1, [r3]
	str	r2, [r4, #20]
	ldr	r3, .L180+24
	mov	lr, pc
	bx	r3
.L165:
	mov	r2, #0
	ldr	r3, .L180+28
	ldr	r6, [r4]
.L158:
	ldr	r1, [r3, #72]
	cmp	r1, #0
	beq	.L156
	ldr	r1, [r4, #8]
	ldr	r0, [r3]
	add	r1, r6, r1
	cmp	r1, r0
	ble	.L156
	ldr	r1, [r3, #16]
	add	r0, r0, r1
	cmp	r6, r0
	bge	.L156
	ldr	ip, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r0, [r3, #4]
	add	r1, ip, r1
	cmp	r1, r0
	ble	.L156
	ldr	r1, [r3, #20]
	add	r0, r0, r1
	cmp	ip, r0
	blt	.L177
.L156:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #92
	bne	.L158
.L157:
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	strgt	r3, [r4, #32]
	bgt	.L160
	mov	r3, #8
	ldr	r0, [r4, #24]
	str	r3, [r4, #32]
	ldr	r1, [r4, #28]
	ldr	r3, .L180+32
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #24]
.L160:
	ldr	r3, .L180+36
	ldr	r2, [r3]
	ldr	r3, .L180+40
	sub	r6, r6, r2
	add	r2, r6, #31
	cmp	r2, r3
	bhi	.L147
	ldr	r2, .L180+44
	ldr	r3, [r4, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
	add	r2, r3, #31
	cmp	r2, #190
	bls	.L178
.L147:
	mov	r3, #512
	strh	r3, [r5, #64]	@ movhi
	b	.L150
.L149:
	ldr	r2, [r4, #36]
	cmp	r2, #0
	movne	r1, r3
	subeq	r1, r1, #1
	cmp	r1, #0
	add	lr, r1, #7
	movge	lr, r1
	ldr	r2, .L180+48
	ldr	r2, [r2]
	cmp	lr, #512
	ldr	ip, .L180+52
	movcc	r7, #0
	movcs	r7, #1
	cmp	r2, #1
	ldr	r0, .L180+56
	movne	r0, ip
	ldr	r2, [r4, #4]
	str	r0, [sp, #4]
	ldr	r0, [r4, #12]
	add	ip, r2, r0
	add	r0, r0, r0, lsr #31
	add	r0, r2, r0, asr #1
	str	r0, [sp, #16]
	ldr	r0, .L180+60
	sub	ip, ip, #8
	asr	lr, lr, #3
	ldr	r6, .L180+64
	str	ip, [sp, #20]
	add	r8, sp, #24
	add	r9, r0, lr, lsl #6
	add	r2, r2, #8
	add	ip, sp, #16
.L155:
	add	r0, r2, #7
	cmp	r0, r6
	movls	fp, r7
	orrhi	fp, r7, #1
	cmp	fp, #0
	beq	.L179
.L152:
	cmp	r8, ip
	ldrne	r2, [ip], #4
	bne	.L155
.L154:
	str	r3, [r4]
	b	.L165
.L178:
	lsl	r6, r6, #23
	lsr	r6, r6, #23
	mvn	r6, r6, lsl #17
	ldr	r2, [r4, #36]
	cmp	r2, #1
	moveq	r2, #768
	movne	r2, #640
	mvn	r6, r6, lsr #17
	ldr	r1, [r4, #24]
	add	r2, r2, r1, lsl #2
	and	r3, r3, #255
	and	r2, r2, #1020
	strh	r6, [r5, #66]	@ movhi
	strh	r3, [r5, #64]	@ movhi
	strh	r2, [r5, #68]	@ movhi
	b	.L150
.L177:
	mov	r0, #1
	mov	r1, #0
	add	r3, r2, r2, lsl r0
	rsb	r3, r2, r3, lsl #3
	ldr	r2, .L180+28
	add	r3, r2, r3, lsl #2
	ldr	r2, [r3, #80]
	sub	r2, r2, #1
	str	r0, [r3, #88]
	str	r2, [r3, #80]
	str	r1, [r4, #20]
	b	.L157
.L181:
	.align	2
.L180:
	.word	.LANCHOR1
	.word	fireballs
	.word	shadowOAM
	.word	tileUpdates
	.word	fireballSoundEffect_length
	.word	fireballSoundEffect_data
	.word	playSoundB
	.word	enemies
	.word	__aeabi_idivmod
	.word	hOff
	.word	270
	.word	vOff
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	level1CollisionMapBitmap
	.word	destroyedTiles
	.word	518
	.size	handleFireballs, .-handleFireballs
	.align	2
	.global	resolveWallCollisions
	.syntax unified
	.arm
	.fpu softvfp
	.type	resolveWallCollisions, %function
resolveWallCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #512
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movcc	r6, #0
	movcs	r6, #1
	cmp	r1, #512
	mov	r4, r1
	movcc	r1, #0
	movcs	r1, #1
	mov	r5, r0
	ldr	r0, .L235
	ldr	ip, [r0]
	ldr	r0, .L235+4
	cmp	ip, #1
	ldr	r2, .L235+8
	movne	r2, r0
	orrs	r0, r6, r1
	sub	sp, sp, #12
	beq	.L227
.L183:
	cmp	r3, #512
	movcc	r0, r1
	orrcs	r0, r1, #1
	cmp	r0, #0
	beq	.L228
.L182:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L227:
	ldr	r0, .L235+12
	asr	ip, r5, #3
	add	ip, r0, ip, lsl #6
	ldrb	ip, [ip, r4, asr #3]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L183
	add	ip, r2, r4, lsl #9
	ldrb	ip, [ip, r5]	@ zero_extendqisi2
	cmp	ip, #0
	lsl	r10, r4, #9
	bne	.L183
.L184:
	mov	ip, #1
	add	r9, r10, r5
	add	lr, r2, r9
	str	lr, [sp]
	add	r7, r5, ip
	asr	r9, r4, #3
.L189:
	asr	lr, r7, #3
	cmp	r7, #512
	add	r8, r0, lr, lsl #6
	add	lr, r3, ip
	bge	.L186
	movcc	fp, r1
	orrcs	fp, r1, #1
	cmp	fp, #0
	beq	.L229
.L187:
	asr	r8, lr, #3
	cmp	lr, #512
	add	r8, r0, r8, lsl #6
	bge	.L186
	movcc	fp, r1
	orrcs	fp, r1, #1
	cmp	fp, #0
	beq	.L230
.L188:
	ldr	r2, .L235+16
	ldr	r3, [r2]
	add	ip, r3, ip
	str	ip, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L228:
	ldr	r0, .L235+12
	asr	ip, r3, #3
	add	ip, r0, ip, lsl #6
	ldrb	ip, [ip, r4, asr #3]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L182
	add	ip, r2, r4, lsl #9
	ldrb	ip, [ip, r3]	@ zero_extendqisi2
	cmp	ip, #0
	lsl	r10, r4, #9
	beq	.L184
	b	.L182
.L229:
	ldrb	r8, [r8, r9]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L187
	ldr	r8, [sp]
	ldrb	r8, [r8, ip]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L187
.L186:
	add	ip, ip, #1
	cmp	ip, #17
	add	r7, r7, #1
	bne	.L189
	sub	lr, r5, #17
	str	lr, [sp, #4]
	add	lr, r2, r10
	str	lr, [sp]
	sub	ip, r5, #1
.L192:
	asr	lr, ip, #3
	cmp	ip, #0
	add	r7, r0, lr, lsl #6
	sub	lr, r5, ip
	blt	.L194
	cmp	ip, #512
	movcc	r8, r1
	orrcs	r8, r1, #1
	cmp	r8, #0
	beq	.L231
.L195:
	subs	r7, r3, lr
	asr	r8, r7, #3
	add	r8, r0, r8, lsl #6
	bmi	.L194
	cmp	r7, #512
	movcc	fp, r1
	orrcs	fp, r1, #1
	cmp	fp, #0
	beq	.L232
.L191:
	ldr	r2, .L235+16
	ldr	r3, [r2]
	sub	lr, r3, lr
	str	lr, [r2]
	b	.L182
.L230:
	ldrb	r8, [r8, r9]	@ zero_extendqisi2
	cmp	r8, #0
	add	lr, r2, lr
	bne	.L188
	ldrb	lr, [lr, r10]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L188
	b	.L186
.L231:
	ldrb	r7, [r7, r9]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L195
	ldr	r7, [sp]
	ldrb	r7, [r7, ip]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L195
.L194:
	ldr	lr, [sp, #4]
	sub	ip, ip, #1
	cmp	ip, lr
	bne	.L192
	cmp	r3, #512
	movcc	lr, #0
	movcs	lr, #1
	asr	r1, r3, #3
	asr	ip, r5, #3
	add	ip, r0, ip, lsl #6
	sub	r10, r4, #17
	add	r0, r0, r1, lsl #6
	add	r9, r2, r5
	sub	r1, r4, #1
.L198:
	cmp	r1, #0
	sub	r7, r4, r1
	blt	.L200
	cmp	r1, #512
	movlt	r8, r6
	orrge	r8, r6, #1
	cmp	r8, #0
	beq	.L233
.L201:
	subs	r8, r4, r7
	bmi	.L200
	cmp	r8, #512
	movlt	fp, lr
	orrge	fp, lr, #1
	cmp	fp, #0
	beq	.L234
.L197:
	mov	r1, #0
	ldr	r3, .L235+16
	ldr	r2, [r3, #4]
	sub	r2, r2, r7
	str	r2, [r3, #4]
	str	r1, [r3, #52]
	b	.L182
.L232:
	ldrb	r8, [r8, r9]	@ zero_extendqisi2
	cmp	r8, #0
	add	r7, r2, r7
	bne	.L191
	ldrb	r7, [r7, r10]	@ zero_extendqisi2
	cmp	r7, #1
	beq	.L191
	b	.L194
.L233:
	ldrb	r8, [ip, r1, asr #3]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L201
	ldrb	r8, [r9, r1, lsl #9]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L201
.L200:
	sub	r1, r1, #1
	cmp	r10, r1
	bne	.L198
	mov	r6, #1
	mov	r8, r3
.L199:
	add	r7, r6, r4
	cmp	r7, #512
	bge	.L203
	mov	r1, r7
	mov	r0, r5
	bl	colorAt
	cmp	r0, #1
	bne	.L203
	mov	r1, r7
	mov	r0, r8
	bl	colorAt
	cmp	r0, #1
	bne	.L203
	mov	r1, #0
	ldr	r3, .L235+16
	ldr	r2, [r3, #4]
	add	r6, r2, r6
	str	r6, [r3, #4]
	str	r1, [r3, #52]
	b	.L182
.L234:
	add	fp, r2, r8, lsl #9
	ldrb	r8, [r0, r8, asr #3]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L197
	ldrb	r8, [fp, r3]	@ zero_extendqisi2
	cmp	r8, #1
	beq	.L197
	b	.L200
.L203:
	add	r6, r6, #1
	cmp	r6, #17
	bne	.L199
	b	.L182
.L236:
	.align	2
.L235:
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	level1CollisionMapBitmap
	.word	destroyedTiles
	.word	player
	.size	resolveWallCollisions, .-resolveWallCollisions
	.align	2
	.global	handleInvincibility
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleInvincibility, %function
handleInvincibility:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L239
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	handleInvincibility.part.0
.L238:
	str	r2, [r3, #76]
	bx	lr
.L240:
	.align	2
.L239:
	.word	player
	.size	handleInvincibility, .-handleInvincibility
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r4, #67108864
	ldr	r3, .L260
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #55296
	mov	r1, #56320
	ldr	r0, .L260+4
	str	r2, [r0]
	strh	r3, [r4, #8]	@ movhi
	mov	r0, #3
	strh	r1, [r4, #10]	@ movhi
	mov	r3, #16384
	ldr	r1, .L260+8
	ldr	r4, .L260+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L260+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L260+20
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L255
	cmp	r3, #2
	beq	.L256
.L243:
	ldr	ip, .L260+24
	ldr	r3, [ip, #16]
	ldr	r2, [ip, #20]
	add	r3, r3, r3, lsr #31
	asr	r0, r3, #1
	add	r2, r2, r2, lsr #31
	ldr	r3, [ip]
	rsb	r0, r0, #120
	asr	r1, r2, #1
	ldr	r2, [ip, #4]
	sub	r3, r3, r0
	ldr	ip, .L260+28
	ldr	r0, .L260+32
	rsb	r1, r1, #80
	sub	r2, r2, r1
	cmp	r3, #0
	str	r3, [r0]
	str	r2, [ip]
	blt	.L257
	cmp	r2, #0
	blt	.L258
	cmp	r3, #272
	ble	.L259
	mov	r3, #272
	mov	r5, #136
	mov	r1, r3
	str	r3, [r0]
.L245:
	cmp	r2, #352
	movgt	r3, #352
	movgt	lr, #176
	movgt	r0, r3
	strgt	r3, [ip]
	ble	.L251
.L249:
	mov	ip, #67108864
	mov	r3, #16384
	strh	r5, [ip, #20]	@ movhi
	ldr	r2, .L260+36
	strh	lr, [ip, #22]	@ movhi
	strh	r1, [ip, #16]	@ movhi
	strh	r0, [ip, #18]	@ movhi
	ldr	r1, .L260+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L260+44
	ldr	r1, .L260+48
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L260+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L260+56
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L260+60
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L258:
	mov	r2, #0
	cmp	r3, #272
	str	r2, [ip]
	ble	.L246
	mov	r3, #272
	mov	r5, #136
	mov	r1, r3
	str	r3, [r0]
.L251:
	add	lr, r2, r2, lsr #31
	asr	lr, lr, #1
	lsl	lr, lr, #16
	lsl	r0, r2, #16
	lsr	lr, lr, #16
	lsr	r0, r0, #16
	b	.L249
.L246:
	mov	r0, #0
	asr	r5, r3, #1
	lsl	r5, r5, #16
	lsl	r1, r3, #16
	mov	lr, r0
	lsr	r5, r5, #16
	lsr	r1, r1, #16
	b	.L249
.L257:
	mov	r3, #0
	cmp	r2, r3
	str	r3, [r0]
	strlt	r3, [ip]
	blt	.L246
	mov	r1, r3
	mov	r5, r3
	b	.L245
.L255:
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L260+64
	ldr	r1, .L260+68
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L260+72
	ldr	r1, .L260+76
	mov	lr, pc
	bx	r4
	b	.L243
.L256:
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L260+64
	ldr	r1, .L260+80
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L260+72
	ldr	r1, .L260+84
	mov	lr, pc
	bx	r4
	b	.L243
.L259:
	asr	r5, r3, #1
	lsl	r5, r5, #16
	lsl	r1, r3, #16
	lsr	r5, r5, #16
	lsr	r1, r1, #16
	b	.L245
.L261:
	.align	2
.L260:
	.word	flipPages
	.word	videoBuffer
	.word	worldTilesetTiles
	.word	DMANow
	.word	worldTilesetPal
	.word	.LANCHOR0
	.word	player
	.word	vOff
	.word	hOff
	.word	100728832
	.word	finnSpriteSheetTiles
	.word	83886592
	.word	finnSpriteSheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.word	100712448
	.word	foregroundMap
	.word	100720640
	.word	backgroundMap
	.word	foreground2Map
	.word	background2Map
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState.part.0, %function
pauseState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L264
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L265:
	.align	2
.L264:
	.word	buttons
	.size	pauseState.part.0, .-pauseState.part.0
	.set	instructionsState.part.0,pauseState.part.0
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L270
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L270+4
	ldr	r4, .L270+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L270+12
	ldr	r3, .L270+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L270+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L270+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L270+28
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L270+32
	add	r2, r3, #1024
.L267:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L267
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L270+32
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L270+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L271:
	.align	2
.L270:
	.word	1044
	.word	pausePal
	.word	DMANow
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	pauseSounds
	.word	waitForVBlank
	.word	flipPages
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L276
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L276+4
	ldr	r4, .L276+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L276+12
	ldr	r3, .L276+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L276+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L276+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L276+28
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L276+32
	add	r2, r3, #1024
.L273:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L273
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L276+32
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L276+36
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L277:
	.align	2
.L276:
	.word	1044
	.word	losePal
	.word	DMANow
	.word	loseBitmap
	.word	drawFullscreenImage4
	.word	stopSounds
	.word	waitForVBlank
	.word	flipPages
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	handleEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleEnemies, %function
handleEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L314
	sub	sp, sp, #12
	add	fp, r4, #368
.L292:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	beq	.L280
	ldr	r6, [r4, #88]
	cmp	r6, #0
	beq	.L311
.L280:
	add	r4, r4, #92
	cmp	r4, fp
	bne	.L292
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L311:
	ldr	r9, [r4, #4]
	ldr	r8, [r4, #28]
	ldr	r1, [r4, #20]
	ldr	r10, [r4]
	ldr	r5, [r4, #8]
	ldr	r2, [r4, #16]
	cmp	r8, #0
	add	r0, r1, r9
	rsbne	r5, r5, #0
	add	r3, r2, r10
	cmp	r0, r9
	str	r3, [sp, #4]
	add	r5, r5, r10
	ble	.L283
	ldr	r3, .L314+4
	ldr	ip, [r3]
	cmp	r8, #0
	ldr	r3, .L314+8
	sub	r2, r2, #1
	add	r2, r2, r5
	movne	r2, r5
	cmp	ip, #1
	ldr	lr, .L314+12
	movne	lr, r3
	ldr	ip, .L314+16
	add	r1, r1, r1, lsr #31
	asr	r7, r2, #3
	mov	r3, r9
	asr	r1, r1, #1
	add	r7, ip, r7, lsl #6
	add	lr, lr, r2
	b	.L286
.L285:
	add	r3, r3, r1
	cmp	r0, r3
	ble	.L283
.L286:
	cmp	r2, #512
	bcs	.L284
	cmp	r3, #512
	bcs	.L285
	ldrb	ip, [r7, r3, asr #3]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L285
	ldrb	ip, [lr, r3, lsl #9]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L285
.L284:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ble	.L294
	ldr	r2, .L314+20
	ldr	r1, [sp, #4]
	ldr	r3, [r2]
	cmp	r1, r3
	ble	.L294
	ldr	r2, [r2, #16]
	add	r3, r3, r2
	cmp	r10, r3
	bge	.L294
	ldr	r3, .L314+20
	ldr	r3, [r3, #4]
	cmp	r0, r3
	movgt	r6, #1
	ble	.L294
.L299:
	ldr	r0, .L314+20
	ldr	r2, [r0, #20]
	add	r3, r3, r2
	cmp	r3, r9
	ble	.L287
	ldr	r3, [r0, #64]
	cmp	r3, #0
	bne	.L287
	mov	r1, #1
	mov	r2, #60
	ldr	r3, [r0, #80]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #80]
	str	r1, [r0, #64]
	str	r2, [r0, #68]
	ble	.L312
.L288:
	ldr	r3, .L314+24
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L314+28
	ldr	r3, .L314+32
	mov	lr, pc
	bx	r3
.L287:
	cmp	r6, #0
	bne	.L313
.L289:
	str	r5, [r4]
	b	.L290
.L313:
	ldr	r8, [r4, #28]
.L294:
	subs	r8, r8, #1
	movne	r8, #1
	str	r8, [r4, #28]
.L290:
	ldrb	r3, [r4, #60]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L280
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	strgt	r3, [r4, #24]
	bgt	.L280
	mov	r3, #8
	ldr	r0, [r4, #36]
	str	r3, [r4, #24]
	ldr	r1, [r4, #40]
	ldr	r3, .L314+36
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
	b	.L280
.L283:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ble	.L289
	ldr	r3, .L314+20
	ldr	r2, [sp, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L289
	ldr	r2, .L314+20
	ldr	r2, [r2, #16]
	add	r3, r3, r2
	cmp	r10, r3
	bge	.L289
	ldr	r3, .L314+20
	ldr	r3, [r3, #4]
	cmp	r0, r3
	bgt	.L299
	b	.L289
.L312:
	bl	goToLose
	b	.L288
.L315:
	.align	2
.L314:
	.word	enemies
	.word	.LANCHOR0
	.word	level2CollisionMapBitmap
	.word	level1CollisionMapBitmap
	.word	destroyedTiles
	.word	player
	.word	finn_scream_length
	.word	finn_scream_data
	.word	playSoundB
	.word	__aeabi_idivmod
	.size	handleEnemies, .-handleEnemies
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L318
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	pauseState.part.0
.L319:
	.align	2
.L318:
	.word	oldButtons
	.size	pauseState, .-pauseState
	.align	2
	.global	shootFireball
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootFireball, %function
shootFireball:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L333
	mov	r1, r0
	ldr	r2, [r1, #20]
	cmp	r2, #0
	mov	r3, #0
	beq	.L332
.L321:
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #40
	bxeq	lr
	ldr	r2, [r1, #20]
	cmp	r2, #0
	bne	.L321
.L332:
	ldr	r1, .L333+4
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	ldr	r6, [r1, #28]
	cmp	r6, #1
	mvneq	r5, #1
	movne	r5, #2
	mov	lr, #8
	ldr	ip, [r1, #16]
	ldr	r8, [r1]
	ldr	r7, [r1, #20]
	add	ip, ip, ip, lsr #31
	add	r8, r8, ip, asr r4
	ldr	ip, [r1, #4]
	add	r7, r7, r7, lsr #31
	add	r3, r3, r3, lsl #2
	add	ip, ip, r7, asr r4
	ldr	r1, .L333+8
	str	r8, [r0, r3, lsl #3]
	sub	ip, ip, #16
	add	r3, r0, r3, lsl #3
	str	r6, [r3, #36]
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	ldr	r5, .L333+12
	str	lr, [r3, #32]
	ldr	r1, [r1]
	str	r2, [r3, #24]
	str	ip, [r3, #4]
	ldr	r0, .L333+16
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L334:
	.align	2
.L333:
	.word	fireballs
	.word	player
	.word	fireballSoundEffect_length
	.word	playSoundB
	.word	fireballSoundEffect_data
	.size	shootFireball, .-shootFireball
	.align	2
	.global	resetGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGame, %function
resetGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	ldr	r3, .L345
	mov	r1, r4
	mov	r2, #4096
	ldr	r5, .L345+4
	ldr	r0, .L345+8
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	mov	lr, pc
	bx	r5
	mov	ip, #10
	mov	r0, #1
	mov	r1, #32
	mov	r6, #142
	mvn	lr, #11
	mov	r5, #3
	ldr	r3, .L345+12
	ldr	r2, [r3]
	ldr	r3, .L345+16
	str	ip, [r3, #24]
	ldr	ip, .L345+20
	cmp	r2, r0
	str	r4, [r3]
	str	r4, [r3, #36]
	str	r4, [r3, #28]
	str	r4, [r3, #52]
	str	r4, [r3, #44]
	str	r4, [r3, #64]
	str	r4, [r3, #68]
	str	r6, [r3, #4]
	str	lr, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #40]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #56]
	str	r4, [ip, #20]
	str	r4, [ip, #60]
	str	r4, [ip, #100]
	str	r4, [ip, #140]
	str	r4, [ip, #180]
	beq	.L343
	cmp	r2, #2
	beq	.L344
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L344:
	mov	r7, #24
	ldr	ip, .L345+24
	mvn	lr, #0
	mov	r2, ip
	mov	r6, #8
	str	r7, [r3, #4]
.L339:
	and	r3, lr, #1
	sub	lr, lr, #1
	cmn	lr, #5
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	r4, [r2, #36]
	str	r5, [r2, #40]
	str	r6, [r2, #24]
	str	r0, [r2, #8]
	strb	r4, [r2, #60]
	str	r0, [r2, #72]
	str	r0, [r2, #80]
	str	r4, [r2, #88]
	str	r3, [r2, #28]
	add	r2, r2, #92
	bne	.L339
	mov	r3, #172
	mov	r1, #112
	mov	r8, #176
	mov	r7, #205
	mov	r6, #136
	mov	r5, #256
	mov	r4, #460
	mov	lr, #135
	mov	r2, #16
	str	r3, [ip, #4]
	str	r3, [ip, #96]
	ldr	r3, .L345+28
	str	r1, [r3]
	add	r1, r1, #254
	str	r8, [ip]
	str	r7, [ip, #92]
	str	r6, [ip, #184]
	str	r5, [ip, #276]
	str	r4, [ip, #280]
	str	lr, [r3, #4]
	str	r0, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [ip, #188]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L343:
	ldr	ip, .L345+24
	mvn	r0, #0
	mov	r3, ip
	mov	r6, #4
.L337:
	and	lr, r0, #1
	sub	r0, r0, #1
	cmn	r0, #5
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3, #36]
	str	r5, [r3, #40]
	str	r6, [r3, #24]
	str	r2, [r3, #8]
	strb	r2, [r3, #60]
	str	r2, [r3, #72]
	str	r2, [r3, #80]
	str	r4, [r3, #88]
	str	lr, [r3, #28]
	add	r3, r3, #92
	bne	.L337
	mov	r3, #476
	mov	r0, #112
	mov	r9, #160
	mov	r8, #190
	mov	r7, #242
	mov	r6, #320
	mov	r5, #352
	mov	r4, #186
	mov	lr, #48
	mov	r1, #16
	str	r3, [ip, #280]
	ldr	r3, .L345+28
	str	r0, [r3]
	add	r0, r0, #158
	str	r9, [ip]
	str	r8, [ip, #4]
	str	r7, [ip, #92]
	str	r6, [ip, #184]
	str	r5, [ip, #188]
	str	r4, [ip, #276]
	str	lr, [r3, #4]
	str	r2, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [ip, #96]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L346:
	.align	2
.L345:
	.word	.LANCHOR1
	.word	memset
	.word	destroyedTiles
	.word	.LANCHOR0
	.word	player
	.word	fireballs
	.word	enemies
	.word	powerups
	.size	resetGame, .-resetGame
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r3, .L351
	push	{r4, r5, r6, lr}
	str	r2, [r3]
	bl	resetGame
	mov	r2, #67108864
	ldr	r1, .L351+4
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L351+8
	ldr	r4, .L351+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L351+16
	ldr	r1, .L351+20
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #100663296
	ldr	r6, .L351+24
	ldr	r0, .L351+28
	ldr	r5, .L351+32
	str	r3, [r6]
	mov	lr, pc
	bx	r5
	ldr	r3, .L351+36
	ldr	r0, .L351+28
	str	r3, [r6]
	mov	lr, pc
	bx	r5
	ldr	r3, .L351+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L351+44
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L351+48
	add	r2, r3, #1024
.L348:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L348
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L351+48
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L351+52
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L352:
	.align	2
.L351:
	.word	.LANCHOR0
	.word	1044
	.word	start1Pal
	.word	DMANow
	.word	83886592
	.word	finnSpriteSheetPal
	.word	videoBuffer
	.word	start1Bitmap
	.word	drawFullscreenImage4
	.word	100704256
	.word	waitForVBlank
	.word	flipPages
	.word	shadowOAM
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToStart2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart2, %function
goToStart2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r3, .L357
	push	{r4, r5, r6, lr}
	str	r2, [r3]
	bl	resetGame
	mov	r2, #67108864
	ldr	r1, .L357+4
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L357+8
	ldr	r4, .L357+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L357+16
	ldr	r1, .L357+20
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #100663296
	ldr	r6, .L357+24
	ldr	r0, .L357+28
	ldr	r5, .L357+32
	str	r3, [r6]
	mov	lr, pc
	bx	r5
	ldr	r3, .L357+36
	ldr	r0, .L357+28
	str	r3, [r6]
	mov	lr, pc
	bx	r5
	ldr	r3, .L357+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L357+44
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L357+48
	add	r2, r3, #1024
.L354:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L354
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L357+48
	mov	lr, pc
	bx	r4
	mov	lr, #1
	ldr	r3, .L357+52
	ldr	ip, .L357+56
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L357+60
	ldr	r3, .L357+64
	strb	lr, [ip]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L358:
	.align	2
.L357:
	.word	.LANCHOR0
	.word	1044
	.word	start2Pal
	.word	DMANow
	.word	83886592
	.word	finnSpriteSheetPal
	.word	videoBuffer
	.word	start2Bitmap
	.word	drawFullscreenImage4
	.word	100704256
	.word	waitForVBlank
	.word	flipPages
	.word	shadowOAM
	.word	swordSoundEffect_length
	.word	state
	.word	swordSoundEffect_data
	.word	playSoundB
	.size	goToStart2, .-goToStart2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState.part.0, %function
startState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L361
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart2
.L362:
	.align	2
.L361:
	.word	buttons
	.size	startState.part.0, .-startState.part.0
	.set	loseState.part.0,startState.part.0
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L365
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	startState.part.0
.L366:
	.align	2
.L365:
	.word	oldButtons
	.size	startState, .-startState
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	startState
	.size	loseState, .-loseState
	.align	2
	.global	goToLevel2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #2
	push	{r4, lr}
	ldr	r3, .L370
	str	r2, [r3]
	bl	resetGame
	pop	{r4, lr}
	b	goToGame
.L371:
	.align	2
.L370:
	.word	.LANCHOR0
	.size	goToLevel2, .-goToLevel2
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L376
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L376+4
	ldr	r4, .L376+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L376+12
	ldr	r3, .L376+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L376+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L376+24
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L376+28
	add	r2, r3, #1024
.L373:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L373
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L376+28
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L376+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L377:
	.align	2
.L376:
	.word	1044
	.word	winPal
	.word	DMANow
	.word	winBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPages
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	checkLevelCompletion
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkLevelCompletion, %function
checkLevelCompletion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r3, .L391
	add	r0, r3, #368
.L380:
	ldr	r2, [r3, #72]
	add	r3, r3, #92
	cmp	r2, #0
	addne	r1, r1, #1
	cmp	r3, r0
	bne	.L380
	cmp	r1, #0
	bxne	lr
	ldr	r2, .L391+4
	ldr	r3, [r2]
	cmp	r3, #1
	beq	.L390
	cmp	r3, #2
	bxne	lr
	b	goToWin
.L390:
	mov	r3, #2
	push	{r4, lr}
	str	r3, [r2]
	bl	resetGame
	pop	{r4, lr}
	b	goToGame
.L392:
	.align	2
.L391:
	.word	enemies
	.word	.LANCHOR0
	.size	checkLevelCompletion, .-checkLevelCompletion
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L399
	ldr	r7, [r6]
	ldr	r8, [r6, #4]
	ldr	r5, [r6, #16]
	ldr	r4, [r6, #20]
	add	r5, r7, r5
	add	r4, r8, r4
	sub	r4, r4, #1
	sub	r5, r5, #1
	mov	r3, r4
	mov	r1, r5
	mov	r2, r8
	mov	r0, r7
	str	ip, [r6, #32]
	bl	handleMovement
	ldr	r3, .L399+4
	cmp	r4, r3
	movgt	r0, #1
	movle	r2, r4
	movle	r1, r5
	movle	r0, r7
	blle	isOnGround.part.0
.L394:
	bl	handleJump
	mov	r3, r4
	mov	r2, r8
	mov	r1, r5
	mov	r0, r7
	bl	handleGravity
	bl	handleAnimations
	bl	updateScrollingOffsets
	bl	handleEnemies
	bl	handlePowerups
	bl	handleFireballs
	mov	r3, r5
	mov	r2, r4
	mov	r1, r8
	mov	r0, r7
	bl	resolveWallCollisions
	ldr	r3, [r6, #64]
	cmp	r3, #0
	streq	r3, [r6, #76]
	blne	handleInvincibility.part.0
.L396:
	pop	{r4, r5, r6, r7, r8, lr}
	b	checkLevelCompletion
.L400:
	.align	2
.L399:
	.word	player
	.word	510
	.size	update, .-update
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L406
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L406+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L407:
	.align	2
.L406:
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L412
	push	{r4, r5, r6, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L412+4
	ldr	r4, .L412+8
	mov	lr, pc
	bx	r4
	mov	r3, #100663296
	ldr	r6, .L412+12
	ldr	r0, .L412+16
	ldr	r5, .L412+20
	str	r3, [r6]
	mov	lr, pc
	bx	r5
	ldr	r3, .L412+24
	ldr	r0, .L412+16
	str	r3, [r6]
	mov	lr, pc
	bx	r5
	ldr	r3, .L412+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L412+32
	mov	lr, pc
	bx	r3
	mov	r1, #512
	ldr	r3, .L412+36
	add	r2, r3, #1024
.L409:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L409
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L412+36
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L412+40
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L413:
	.align	2
.L412:
	.word	1044
	.word	instructionsPal
	.word	DMANow
	.word	videoBuffer
	.word	instructionsBitmap
	.word	drawFullscreenImage4
	.word	100704256
	.word	waitForVBlank
	.word	flipPages
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	startState2
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState2, %function
startState2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L419
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L419+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L420:
	.align	2
.L419:
	.word	oldButtons
	.word	buttons
	.size	startState2, .-startState2
	.align	2
	.global	instructionsState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionsState, %function
instructionsState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	pauseState
	.size	instructionsState, .-instructionsState
	.align	2
	.global	playMelodyTick
	.syntax unified
	.arm
	.fpu softvfp
	.type	playMelodyTick, %function
playMelodyTick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #2
	push	{r4, r5, r6, lr}
	ldr	r4, .L424
	ldr	r5, .L424+4
	ldr	r2, [r4, #8]
	sub	sp, sp, #16
	add	r2, r5, r2, lsl #1
	ldrh	r0, [r2, #4]
	ldr	r6, .L424+8
	mov	r2, r3
	stmib	sp, {r1, r3}
	str	r1, [sp, #12]
	str	r3, [sp]
	mov	r1, #20
	mov	lr, pc
	bx	r6
	ldr	r0, [r4, #8]
	ldr	r1, [r5, #20]
	ldr	r3, .L424+12
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L425:
	.align	2
.L424:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	playChannel1
	.word	__aeabi_idivmod
	.size	playMelodyTick, .-playMelodyTick
	.align	2
	.global	updateDestroyedTiles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDestroyedTiles, %function
updateDestroyedTiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L434
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	push	{r4, lr}
	ldr	r0, .L434+4
	add	ip, ip, ip, lsl #1
	add	ip, r0, ip, lsl #2
.L428:
	ldr	r3, [r0]
	ldr	r2, [r0, #4]
	cmp	r3, #0
	add	r1, r3, #31
	movge	r1, r3
	cmp	r2, #0
	add	lr, r2, #31
	movge	lr, r2
	asr	r1, r1, #5
	rsbs	r4, r2, #0
	asr	lr, lr, #5
	add	r1, r1, lr, lsl #1
	and	lr, r4, #31
	and	r2, r2, #31
	add	r1, r1, #49152
	rsbpl	r2, lr, #0
	rsbs	lr, r3, #0
	add	r1, r1, #24
	and	lr, lr, #31
	and	r3, r3, #31
	add	r2, r2, r1, lsl #5
	rsbpl	r3, lr, #0
	add	r3, r3, r2, lsl #5
	add	r0, r0, #12
	ldrh	r2, [r0, #-4]
	lsl	r3, r3, #1
	cmp	ip, r0
	strh	r2, [r3]	@ movhi
	bne	.L428
	pop	{r4, lr}
	bx	lr
.L435:
	.align	2
.L434:
	.word	.LANCHOR1
	.word	tileUpdates
	.size	updateDestroyedTiles, .-updateDestroyedTiles
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L473
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L469
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L469:
	ldr	r1, .L473+4
	ldr	r3, [r1, #64]
	ldr	r4, .L473+8
	ldr	r5, .L473+12
	cmp	r3, #0
	ldr	fp, [r4]
	ldr	ip, [r5]
	bne	.L470
.L438:
	ldr	r3, [r1]
	sub	r3, r3, ip
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #28]
	ldr	r2, [r1, #36]
	ldr	r1, [r1, #4]
	add	r2, r2, r0, lsl #5
	sub	r1, r1, fp
	ldr	r0, .L473+16
	lsl	r2, r2, #2
	and	r1, r1, #255
	and	r2, r2, #1020
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
.L456:
	ldr	r3, .L473+16
	mov	r8, #512
	mov	r0, r3
	ldr	r2, .L473+20
	ldr	r10, .L473+24
	add	r7, r2, #368
.L446:
	ldr	r1, [r2, #72]
	cmp	r1, #0
	beq	.L442
	ldr	r1, [r2]
	sub	r1, r1, ip
	cmp	r1, #240
	movle	r6, #0
	movgt	r6, #1
	ldr	lr, [r2, #16]
	add	lr, r1, lr
	orrs	lr, r6, lr, lsr #31
	bne	.L442
	ldr	lr, [r2, #4]
	sub	lr, lr, fp
	cmp	lr, #160
	movle	r9, #0
	movgt	r9, #1
	ldr	r6, [r2, #20]
	add	r6, lr, r6
	orrs	r6, r9, r6, lsr #31
	bne	.L442
	ldrb	r6, [r2, #60]	@ zero_extendqisi2
	cmp	r6, #0
	ldr	r9, [r2, #80]
	ldr	r6, [r2, #36]
	beq	.L471
	cmp	r9, #0
	movle	r9, #512
	lsl	r6, r6, #2
	ble	.L445
	ldr	r9, [r2, #28]
	cmp	r9, #0
	movne	r9, #384
	moveq	r9, #256
.L445:
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	add	r6, r9, r6
	and	r6, r6, r10
	and	lr, lr, #255
	strh	r6, [r0, #12]	@ movhi
	strh	r1, [r0, #10]	@ movhi
	strh	lr, [r0, #8]	@ movhi
	b	.L441
.L442:
	strh	r8, [r0, #8]	@ movhi
.L441:
	add	r2, r2, #92
	cmp	r2, r7
	add	r0, r0, #8
	bne	.L446
	mov	r6, #512
	mov	r10, #460
	ldr	r2, .L473+28
	ldr	r1, .L473+16
	add	lr, r2, #60
.L451:
	ldr	r0, [r2, #16]
	cmp	r0, #0
	beq	.L447
	ldr	r0, [r2]
	sub	r0, r0, ip
	cmp	r0, #240
	movle	r8, #0
	movgt	r8, #1
	ldr	r7, [r2, #8]
	add	r7, r0, r7
	orrs	r7, r8, r7, lsr #31
	beq	.L472
.L447:
	strh	r6, [r1, #40]	@ movhi
.L450:
	add	r2, r2, #20
	cmp	lr, r2
	add	r1, r1, #8
	bne	.L451
	mov	fp, #512
	ldr	r2, .L473+32
	ldr	r10, [r5]
	ldr	r9, [r4]
	ldr	r8, .L473+36
	ldr	r7, .L473+40
	ldr	r6, .L473+24
	add	lr, r2, #200
.L455:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	strheq	fp, [r3, #64]	@ movhi
	beq	.L454
	ldr	r1, [r2, #36]
	cmp	r1, #1
	moveq	ip, #768
	movne	ip, #640
	ldr	r0, [r2, #24]
	ldr	r1, [r2]
	add	ip, ip, r0, lsl #2
	ldr	r0, [r2, #4]
	sub	r1, r1, r10
	and	r1, r1, r8
	sub	r0, r0, r9
	and	ip, ip, r6
	orr	r1, r1, r7
	and	r0, r0, #255
	strh	ip, [r3, #68]	@ movhi
	strh	r1, [r3, #66]	@ movhi
	strh	r0, [r3, #64]	@ movhi
.L454:
	add	r2, r2, #40
	cmp	lr, r2
	add	r3, r3, #8
	bne	.L455
	mov	r3, #67108864
	ldrh	r2, [r5]
	ldrh	r1, [r4]
	strh	r2, [r3, #16]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	ldr	r2, .L473+44
	mov	lr, pc
	bx	r2
	ldr	r4, .L473+48
	bl	updateDestroyedTiles
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L473+16
	mov	lr, pc
	bx	r4
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L470:
	ldr	r3, [r1, #76]
	cmp	r3, #0
	beq	.L438
	mov	r3, #512
	ldr	r0, .L473+16
	strh	r3, [r0]	@ movhi
	b	.L456
.L471:
	add	r6, r6, #3
	cmp	r9, #0
	movle	r9, #256
	lsl	r6, r6, #2
	ble	.L445
	ldr	r9, [r2, #28]
	cmp	r9, #0
	movne	r9, #128
	moveq	r9, #0
	b	.L445
.L472:
	ldr	r7, [r2, #4]
	sub	r7, r7, fp
	cmp	r7, #160
	movle	r8, #0
	movgt	r8, #1
	mov	r9, r8
	ldr	r8, [r2, #12]
	add	r8, r7, r8
	orrs	r8, r9, r8, lsr #31
	bne	.L447
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	orr	r0, r0, #16384
	and	r7, r7, #255
	strh	r0, [r1, #42]	@ movhi
	strh	r7, [r1, #40]	@ movhi
	strh	r10, [r1, #44]	@ movhi
	b	.L450
.L474:
	.align	2
.L473:
	.word	state
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	enemies
	.word	1023
	.word	powerups
	.word	fireballs
	.word	511
	.word	-32768
	.word	waitForVBlank
	.word	DMANow
	.size	draw, .-draw
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L500
	bl	update
	ldrh	r3, [r4]
	tst	r3, #256
	beq	.L476
	ldr	r3, .L500+4
	ldrh	r3, [r3]
	tst	r3, #256
	moveq	r1, #1
	mvneq	r2, #-2147483648
	ldreq	r3, .L500+8
	streq	r1, [r3, #64]
	streq	r2, [r3, #68]
.L476:
	bl	draw
	ldr	r0, .L500+12
	ldr	r2, [r0, #4]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	ldr	r1, .L500+16
	add	r3, r3, r3, lsl #8
	ldr	ip, .L500+20
	add	r3, r3, r3, lsl #16
	sub	r1, r1, r3
	cmp	r1, ip
	str	r2, [r0, #4]
	bcc	.L495
.L477:
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L478
	ldr	r2, .L500+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L496
.L478:
	tst	r3, #4
	beq	.L479
	ldr	r2, .L500+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L497
.L479:
	tst	r3, #2
	beq	.L480
	ldr	r3, .L500+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L498
.L480:
	ldr	r3, .L500+24
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L499
	pop	{r4, lr}
	bx	lr
.L495:
	bl	playMelodyTick
	b	.L477
.L499:
	ldr	r3, .L500+28
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L500+32
	ldr	r3, .L500+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L498:
	bl	shootFireball
	b	.L480
.L496:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L478
.L497:
	bl	goToLose
	ldrh	r3, [r4]
	b	.L479
.L501:
	.align	2
.L500:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	.LANCHOR1
	.word	143165576
	.word	286331153
	.word	soundA
	.word	backgroundMusic_length
	.word	backgroundMusic_data
	.word	playSoundA
	.size	gameState, .-gameState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L535
	mov	lr, pc
	bx	r3
	ldr	r4, .L535+4
	ldr	r3, .L535+8
	ldr	r10, .L535+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L535+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L535+20
	ldr	r9, .L535+24
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	ip, [r10]
	ldr	r8, .L535+28
	ldr	r5, .L535+32
	ldr	r7, .L535+36
	ldr	fp, .L535+40
.L504:
	strh	ip, [r6]	@ movhi
	ldrh	r3, [fp, #48]
	strh	r3, [r10]	@ movhi
	cmp	lr, #6
	ldrls	pc, [pc, lr, asl #2]
	b	.L514
.L506:
	.word	.L512
	.word	.L511
	.word	.L510
	.word	.L509
	.word	.L508
	.word	.L507
	.word	.L505
.L505:
	tst	ip, #8
	beq	.L514
	tst	r3, #8
	beq	.L534
.L514:
	mov	ip, r3
	b	.L504
.L507:
	tst	ip, #8
	beq	.L514
	ldr	r3, .L535+44
	mov	lr, pc
	bx	r3
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L508:
	tst	ip, #8
	beq	.L514
	mov	lr, pc
	bx	r7
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L509:
	mov	lr, pc
	bx	r5
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L510:
	tst	ip, #8
	beq	.L514
	mov	lr, pc
	bx	r8
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L512:
	tst	ip, #8
	beq	.L514
	mov	lr, pc
	bx	r9
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L511:
	tst	ip, #8
	beq	.L514
	tst	r3, #8
	bne	.L514
	ldr	r3, .L535+48
	mov	lr, pc
	bx	r3
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L534:
	ldr	r3, .L535+16
	mov	lr, pc
	bx	r3
	ldrb	lr, [r4]	@ zero_extendqisi2
	ldrh	r3, [r10]
	b	.L514
.L536:
	.align	2
.L535:
	.word	initSound
	.word	state
	.word	initialize
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	startState.part.0
	.word	instructionsState.part.0
	.word	gameState
	.word	pauseState.part.0
	.word	67109120
	.word	loseState.part.0
	.word	goToInstructions
	.size	main, .-main
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	powerups,60,4
	.comm	state,1,1
	.global	destroyedTiles
	.global	melodyIndex
	.global	melodyLength
	.global	melody
	.global	updateCount
	.comm	tileUpdates,192,4
	.comm	player,92,4
	.comm	shadowOAM,1024,4
	.comm	enemies,368,4
	.comm	fireballs,200,4
	.global	frameCounter
	.global	loopingSoundPlayed
	.global	currentLevel
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	currentLevel, %object
	.size	currentLevel, 4
currentLevel:
	.word	1
	.type	melody, %object
	.size	melody, 16
melody:
	.short	2670
	.short	2464
	.short	2292
	.short	2102
	.short	2102
	.short	2292
	.short	2464
	.short	2670
	.type	melodyLength, %object
	.size	melodyLength, 4
melodyLength:
	.word	8
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	updateCount, %object
	.size	updateCount, 4
updateCount:
	.space	4
	.type	frameCounter, %object
	.size	frameCounter, 4
frameCounter:
	.space	4
	.type	melodyIndex, %object
	.size	melodyIndex, 4
melodyIndex:
	.space	4
	.type	destroyedTiles, %object
	.size	destroyedTiles, 4096
destroyedTiles:
	.space	4096
	.type	loopingSoundPlayed, %object
	.size	loopingSoundPlayed, 4
loopingSoundPlayed:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
