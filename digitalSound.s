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
	.file	"digitalSound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, lr}
	mov	lr, #128
	mov	r4, #0
	mov	ip, #1
	ldr	r2, .L4
	ldrh	r0, [r3, #4]
	ldrh	r1, [r2]
	strh	lr, [r3, #132]	@ movhi
	ldr	lr, .L4+4
	orr	r0, r0, #8
	strh	r0, [r3, #4]	@ movhi
	strh	r4, [r3, #128]	@ movhi
	strh	lr, [r3, #130]	@ movhi
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	orr	r1, r1, ip
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	pop	{r4, lr}
	str	r3, [r0, #4092]
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109376
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupSoundInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSoundInterrupts, %function
setupSoundInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L8
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L8+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L8+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L9:
	.align	2
.L8:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupSoundInterrupts, .-setupSoundInterrupts
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r5, r1
	mov	r6, r0
	mov	r7, r2
	mov	r1, r0
	ldr	r2, .L12+8
	mov	r0, #1
	ldr	r4, .L12+12
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L12+16
	ldr	r3, .L12+20
	strh	r8, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L12+24
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L12+28
	adr	r3, .L12
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L12+32
	ldr	r3, .L12+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L12+40
	mov	lr, pc
	bx	r3
	str	r8, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	3
.L12:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #67108864
	mov	r7, #0
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #208]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L16+8
	ldr	r4, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L16+16
	ldr	r3, .L16+20
	strh	r7, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	ldr	r3, .L16+24
	str	r6, [r4]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L16+28
	adr	r3, .L16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L16+32
	ldr	r3, .L16+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L16+40
	mov	lr, pc
	bx	r3
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	3
.L16:
	.word	1443109011
	.word	1078844686
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L33
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L20
	ldr	r3, .L33+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L22
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L22
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L31
	mov	r0, #67108864
	ldr	r1, .L33+8
	str	r2, [r3, #8]
	str	r2, [r0, #196]
	strh	r2, [r1, #2]	@ movhi
.L22:
	ldr	r3, .L33+12
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L20
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L32
	mov	r0, #67108864
	ldr	r1, .L33+8
	str	r2, [r3, #8]
	str	r2, [r0, #208]
	strh	r2, [r1, #6]	@ movhi
.L20:
	mov	r1, #1
	ldr	r3, .L33
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L31:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L22
.L32:
	ldm	r3, {r0, r1}
	bl	playSoundB
	b	.L20
.L34:
	.align	2
.L33:
	.word	67109376
	.word	soundA
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L36
	ldr	r0, .L36+4
	ldr	r1, .L36+8
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L39
	ldr	ip, .L39+4
	ldr	r0, .L39+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #8]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #8]
	bx	lr
.L40:
	.align	2
.L39:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L42
	ldr	ip, .L42+4
	ldr	r0, .L42+8
	str	r3, [ip, #8]
	str	r3, [r0, #8]
	strh	r3, [r1, #2]	@ movhi
	str	r3, [r2, #196]
	strh	r3, [r1, #6]	@ movhi
	str	r3, [r2, #208]
	bx	lr
.L43:
	.align	2
.L42:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSounds, .-stopSounds
	.comm	soundB,24,4
	.comm	soundA,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
