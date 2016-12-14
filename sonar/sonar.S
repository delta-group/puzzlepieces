; sonar.S - Assembly Sonar function, returns int (distance)

	section .text:
__ctors_end:
	eor	r1, r1
	out	0x3f, r1		; 63
	ldi	r28, 0xFF		; 255
	ldi	r29, 0x08		; 8
	out	0x3e, r29		; 62
	out	0x3d, r28		; 61

__do_clear_bss:
	ldi	r17, 0x01		; 1
	ldi	r26, 0x00		; 0
	ldi	r27, 0x01		; 1
	rjmp	.+2     	; 0xd8 <.do_clear_bss_start>

do_clear_bss_loop:
	st	X+, r1

do_clear_bss_start:
	cpi	r26, 0x09		; 9
	cpc	r27, r17
	brne	.-8     	; 0xd6 <.do_clear_bss_loop>
	call	0x4aa		; 0x4aa <main>
	jmp	0x548			; 0x548 <_exit>

__bad_interrupt:
	jmp	0	; 0x0 <__vectors>

setup:
	ldi	r22, 0x01		; 1
	ldi	r24, 0x02		; 2
	jmp	0x2b6			; 0x2b6 <pinMode>

_Z5sonarv:
	ldi	r22, 0x00		; 0
	ldi	r24, 0x02		; 2
	call	0x328		; 0x328 <digitalWrite>
	ldi	r24, 0x02		; 2
	ldi	r25, 0x00		; 0
	call	0x1d8		; 0x1d8 <delayMicroseconds>
	ldi	r22, 0x01		; 1
	ldi	r24, 0x02		; 2
	call	0x328		; 0x328 <digitalWrite>
	ldi	r24, 0x0A		; 10
	ldi	r25, 0x00		; 0
	call	0x1d8		; 0x1d8 <delayMicroseconds>
	ldi	r22, 0x00		; 0
	ldi	r24, 0x02		; 2
	call	0x328		; 0x328 <digitalWrite>
	ldi	r22, 0x00		; 0
	ldi	r24, 0x04		; 4
	call	0x2b6		; 0x2b6 <pinMode>
	ldi	r18, 0x40		; 64
	ldi	r19, 0x42		; 66
	ldi	r20, 0x0F		; 15
	ldi	r21, 0x00		; 0
	ldi	r22, 0x01		; 1
	ldi	r24, 0x04		; 4
	call	0x394		; 0x394 <pulseIn>
	movw	r24, r22
	ldi	r22, 0x3A		; 58
	ldi	r23, 0x00		; 0
	call	0x4da		; 0x4da <__divmodhi4>
	movw	r24, r22
	ret

loop:
	jmp	0xf2			; 0xf2 <_Z5sonarv>

__vector_16:
	push	r1
	push	r0
	in	r0, 0x3f		; 63
	push	r0
	eor	r1, r1
	push	r18
	push	r19
	push	r24
	push	r25
	push	r26
	push	r27
	lds	r24, 0x0101
	lds	r25, 0x0102
	lds	r26, 0x0103
	lds	r27, 0x0104
	lds	r19, 0x0100
	ldi	r18, 0x03		; 3
	add	r18, r19
	cpi	r18, 0x7D		; 125
	brcc	.+8      	; 0x17e <__vector_16+0x3a>
	adiw	r24, 0x01	; 1
	adc	r26, r1
	adc	r27, r1
	rjmp	.+10     	; 0x188 <__vector_16+0x44>
	ldi	r18, 0x86		; 134
	add	r18, r19
	adiw	r24, 0x02	; 2
	adc	r26, r1
	adc	r27, r1
	sts	0x0100, r18
	sts	0x0101, r24
	sts	0x0102, r25
	sts	0x0103, r26
	sts	0x0104, r27
	lds	r24, 0x0105
	lds	r25, 0x0106
	lds	r26, 0x0107
	lds	r27, 0x0108
	adiw	r24, 0x01	; 1
	adc	r26, r1
	adc	r27, r1
	sts	0x0105, r24
	sts	0x0106, r25
	sts	0x0107, r26
	sts	0x0108, r27
	pop	r27
	pop	r26
	pop	r25
	pop	r24
	pop	r19
	pop	r18
	pop	r0
	out	0x3f, r0		; 63
	pop	r0
	pop	r1
	reti

delayMicroseconds:
	sbiw	r24, 0x01	; 1
	sbiw	r24, 0x00	; 0
	breq	.+14     	; 0x1ec <delayMicroseconds+0x14>
	add	r24, r24
	adc	r25, r25
	add	r24, r24
	adc	r25, r25
	sbiw	r24, 0x02	; 2
	sbiw	r24, 0x01	; 1
	brne	.-4      	; 0x1e8 <delayMicroseconds+0x10>
	ret

init:
	sei
	in	r24, 0x24		; 36
	ori	r24, 0x02		; 2
	out	0x24, r24		; 36
	in	r24, 0x24		; 36
	ori	r24, 0x01		; 1
	out	0x24, r24		; 36
	in	r24, 0x25		; 37
	ori	r24, 0x02		; 2
	out	0x25, r24		; 37
	in	r24, 0x25		; 37
	ori	r24, 0x01		; 1
	out	0x25, r24		; 37
	ldi	r30, 0x6E		; 110
	ldi	r31, 0x00		; 0
	ld	r24, Z
	ori	r24, 0x01		; 1
	st	Z, r24
	ldi	r30, 0x81		; 129
	ldi	r31, 0x00		; 0
	st	Z, r1
	ld	r24, Z
	ori	r24, 0x02		; 2
	st	Z, r24
	ld	r24, Z
	ori	r24, 0x01		; 1
	st	Z, r24
	ldi	r30, 0x80		; 128
	ldi	r31, 0x00		; 0
	ld	r24, Z
	ori	r24, 0x01		; 1
	st	Z, r24
	ldi	r30, 0xB1		; 177
	ldi	r31, 0x00		; 0
	ld	r24, Z
	ori	r24, 0x04		; 4
	st	Z, r24
	ldi	r30, 0xB0		; 176
	ldi	r31, 0x00		; 0
	ld	r24, Z
	ori	r24, 0x01		; 1
	st	Z, r24
	ldi	r30, 0x7A		; 122
	ldi	r31, 0x00		; 0
	ld	r24, Z
	ori	r24, 0x04		; 4
	st	Z, r24
	ld	r24, Z
	ori	r24, 0x02		; 2
	st	Z, r24
	ld	r24, Z
	ori	r24, 0x01		; 1
	st	Z, r24
	ld	r24, Z
	ori	r24, 0x80		; 128
	st	Z, r24
	sts	0x00C1, r1
	ret

turnOffPWM:
	cpi	r24, 0x03		; 3
	breq	.+32     	; 0x288 <turnOffPWM+0x24>
	brcc	.+10     	; 0x274 <turnOffPWM+0x10>
	cpi	r24, 0x01		; 1
	breq	.+38     	; 0x294 <turnOffPWM+0x30>
	cpi	r24, 0x02		; 2
	breq	.+40     	; 0x29a <turnOffPWM+0x36>
	ret
	cpi	r24, 0x06		; 6
	breq	.+42     	; 0x2a2 <turnOffPWM+0x3e>
	cpi	r24, 0x07		; 7
	breq	.+46     	; 0x2aa <turnOffPWM+0x46>
	cpi	r24, 0x04		; 4
	brne	.+52     	; 0x2b4 <turnOffPWM+0x50>
	lds	r24, 0x0080
	andi	r24, 0xDF	; 223
	rjmp	.+6      	; 0x28e <turnOffPWM+0x2a>
	lds	r24, 0x0080
	andi	r24, 0x7F	; 127
	sts	0x0080, r24
	ret
	in	r24, 0x24		; 36
	andi	r24, 0x7F	; 127
	rjmp	.+4      	; 0x29e <turnOffPWM+0x3a>
	in	r24, 0x24		; 36
	andi	r24, 0xDF	; 223
	out	0x24, r24		; 36
	ret
	lds	r24, 0x00B0
	andi	r24, 0x7F	; 127
	rjmp	.+6      	; 0x2b0 <turnOffPWM+0x4c>
	lds	r24, 0x00B0
	andi	r24, 0xDF	; 223
	sts	0x00B0, r24
	ret

pinMode:
	push	r28
	push	r29
	ldi	r25, 0x00		; 0
	movw	r30, r24
	subi	r30, 0x84	; 132
	sbci	r31, 0xFF	; 255
	lpm	r18, Z
	movw	r30, r24
	subi	r30, 0x70	; 112
	sbci	r31, 0xFF	; 255
	lpm	r24, Z
	and	r24, r24
	breq	.+82     	; 0x322 <pinMode+0x6c>
	ldi	r25, 0x00		; 0
	add	r24, r24
	adc	r25, r25
	movw	r30, r24
	subi	r30, 0x48	; 72
	sbci	r31, 0xFF	; 255
	lpm	r26, Z+
	lpm	r27, Z
	subi	r24, 0x52	; 82
	sbci	r25, 0xFF	; 255
	movw	r30, r24
	lpm	r28, Z+
	lpm	r29, Z
	in	r25, 0x3f		; 63
	rjmp	.+16     	; 0x300 <pinMode+0x4a>
	cli
	ld	r24, X
	com	r18
	and	r24, r18
	st	X, r24
	ld	r24, Y
	and	r24, r18
	rjmp	.+20     	; 0x314 <pinMode+0x5e>
	cpi	r22, 0x02		; 2
	brne	.+20     	; 0x318 <pinMode+0x62>
	cli
	ld	r24, X
	mov	r19, r18
	com	r19
	and	r24, r19
	st	X, r24
	ld	r24, Y
	or	r24, r18
	st	Y, r24
	rjmp	.+8      	; 0x320 <pinMode+0x6a>
	cli
	ld	r24, X
	or	r24, r18
	st	X, r24
	out	0x3f, r25		; 63
	pop	r29
	pop	r28
	ret

digitalWrite:
	push	r16
	push	r17
	push	r28
	push	r29
	push	r1
	in	r28, 0x3d		; 61
	in	r29, 0x3e		; 62
	mov	r18, r24
	ldi	r19, 0x00		; 0
	movw	r30, r18
	subi	r30, 0x98	; 152
	sbci	r31, 0xFF	; 255
	lpm	r24, Z
	movw	r30, r18
	subi	r30, 0x84	; 132
	sbci	r31, 0xFF	; 255
	lpm	r17, Z
	movw	r30, r18
	subi	r30, 0x70	; 112
	sbci	r31, 0xFF	; 255
	lpm	r16, Z
	and	r16, r16
	breq	.+50     	; 0x388 <digitalWrite+0x60>
	and	r24, r24
	breq	.+8      	; 0x362 <digitalWrite+0x3a>
	std	Y+1, r22		; 0x01
	call	0x264		; 0x264 <turnOffPWM>
	ldd	r22, Y+1		; 0x01
	mov	r30, r16
	ldi	r31, 0x00		; 0
	add	r30, r30
	adc	r31, r31
	subi	r30, 0x52	; 82
	sbci	r31, 0xFF	; 255
	lpm	r26, Z+
	lpm	r27, Z
	in	r25, 0x3f		; 63
	cli
	ld	r24, X
	cpse	r22, r1
	rjmp	.+6      	; 0x382 <digitalWrite+0x5a>
	com	r17
	and	r24, r17
	rjmp	.+2      	; 0x384 <digitalWrite+0x5c>
	or	r24, r17
	st	X, r24
	out	0x3f, r25		; 63
	pop	r0
	pop	r29
	pop	r28
	pop	r17
	pop	r16
	ret

pulseIn:
 	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15
	push	r16
	push	r17
	push	r28
	push	r29
	ldi	r25, 0x00		; 0
	movw	r30, r24
	subi	r30, 0x84	; 132
	sbci	r31, 0xFF	; 255
	lpm	r16, Z
	movw	r30, r24
	subi	r30, 0x70	; 112
	sbci	r31, 0xFF	; 255
	lpm	r23, Z
	cpse	r22, r1
	rjmp	.+4      	; 0x3c6 <pulseIn+0x32>
	ldi	r17, 0x00		; 0
	rjmp	.+2      	; 0x3c8 <pulseIn+0x34>
	mov	r17, r16
	movw	r26, r20
	movw	r24, r18
	andi	r27, 0x0F	; 15
	mov	r22, r23
	ldi	r23, 0x00		; 0
	add	r22, r22
	adc	r23, r23
	subi	r22, 0x5C	; 92
	sbci	r23, 0xFF	; 255
	mov	r8, r1
	mov	r9, r1
	movw	r10, r8
	movw	r30, r22
	lpm	r28, Z+
	lpm	r29, Z
	ld	r30, Y
	and	r30, r16
	cpse	r30, r17
	rjmp	.+32     	; 0x40e <pulseIn+0x7a>
	movw	r14, r10
	movw	r12, r8
	ldi	r18, 0xFF		; 255
	sub	r12, r18
	sbc	r13, r18
	sbc	r14, r18
	sbc	r15, r18
	cp	r8, r24
	cpc	r9, r25
	cpc	r10, r26
	cpc	r11, r27
	brne	.+2      	; 0x408 <pulseIn+0x74>
	rjmp	.+130    	; 0x48a <pulseIn+0xf6>
	movw	r8, r12
	movw	r10, r14
	rjmp	.-40     	; 0x3e6 <pulseIn+0x52>
	movw	r30, r22
	lpm	r28, Z+
	lpm	r29, Z
	ld	r30, Y
	and	r30, r16
	cp	r30, r17
	breq	.+30     	; 0x43a <pulseIn+0xa6>
	movw	r14, r10
	movw	r12, r8
	ldi	r18, 0xFF		; 255
	sub	r12, r18
	sbc	r13, r18
	sbc	r14, r18
	sbc	r15, r18
	cp	r8, r24
	cpc	r9, r25
	cpc	r10, r26
	cpc	r11, r27
	breq	.+86     	; 0x48a <pulseIn+0xf6>
	movw	r8, r12
	movw	r10, r14
	rjmp	.-38     	; 0x414 <pulseIn+0x80>
	sub	r24, r8
	sbc	r25, r9
	sbc	r26, r10
	sbc	r27, r11
	ldi	r18, 0x00		; 0
	ldi	r19, 0x00		; 0
	movw	r20, r18
	movw	r30, r22
	lpm	r28, Z+
	lpm	r29, Z
	ld	r22, Y
	and	r22, r16
	cpse	r22, r17
	rjmp	.+20     	; 0x46a <pulseIn+0xd6>
	cp	r18, r24
	cpc	r19, r25
	cpc	r20, r26
	cpc	r21, r27
	breq	.+42     	; 0x48a <pulseIn+0xf6>
	subi	r18, 0xFF	; 255
	sbci	r19, 0xFF	; 255
	sbci	r20, 0xFF	; 255
	sbci	r21, 0xFF	; 255
	rjmp	.-28     	; 0x44e <pulseIn+0xba>
	ldi	r26, 0x15		; 21
	ldi	r27, 0x00		; 0
	call	0x4c4		; 0x4c4 <__muluhisi3>
	subi	r22, 0xF0	; 240
	sbci	r23, 0xFF	; 255
	sbci	r24, 0xFF	; 255
	sbci	r25, 0xFF	; 255
	ldi	r18, 0x04		; 4
	lsr	r25
	ror	r24
	ror	r23
	ror	r22
	dec	r18
	brne	.-12     	; 0x47c <pulseIn+0xe8>
	rjmp	.+6      	; 0x490 <pulseIn+0xfc>
	ldi	r22, 0x00		; 0
	ldi	r23, 0x00		; 0
	movw	r24, r22
	pop	r29
	pop	r28
	pop	r17
	pop	r16
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	ret

main:
	call	0x1ee		; 0x1ee <init>
	call	0xea		; 0xea <setup>
	ldi	r28, 0x00		; 0
	ldi	r29, 0x00		; 0
	call	0x140		; 0x140 <loop>
	sbiw	r28, 0x00	; 0
	breq	.-8      	; 0x4b6 <main+0xc>
	call	0			; 0x0 <__vectors>
	rjmp	.-14     	; 0x4b6 <main+0xc>

__muluhisi3:
	call	0x502		; 0x502 <__umulhisi3>
	mul	r26, r21
	add	r25, r0
	mul	r27, r20
	add	r25, r0
	mul	r26, r20
	add	r24, r0
	adc	r25, r1
	eor	r1, r1
	ret

__divmodhi4:
	bst	r25, 7
	mov	r0, r23
	brtc	.+4      	; 0x4e4 <__divmodhi4+0xa>
	com	r0
	rcall	.+14     	; 0x4f2 <__divmodhi4_neg1>
	sbrc	r23, 7
	rcall	.+18     	; 0x4fa <__divmodhi4_neg2>
	call	0x520		; 0x520 <__udivmodhi4>
	sbrc	r0, 7
	rcall	.+10     	; 0x4fa <__divmodhi4_neg2>
	brtc	.+14     	; 0x500 <__divmodhi4_exit>

__divmodhi4_neg1:
	com	r25
	neg	r24
	sbci	r25, 0xFF	; 255
	ret

__divmodhi4_neg2:
	com	r23
	neg	r22
	sbci	r23, 0xFF	; 255

__divmodhi4_exit:
	ret

__umulhisi3:
	mul	r26, r18
	movw	r22, r0
	mul	r27, r19
	movw	r24, r0
	mul	r26, r19
	add	r23, r0
	adc	r24, r1
	eor	r1, r1
	adc	r25, r1
	mul	r27, r18
	add	r23, r0
	adc	r24, r1
	eor	r1, r1
	adc	r25, r1
	ret

__udivmodhi4:
	sub	r26, r26
	sub	r27, r27
	ldi	r21, 0x11		; 17
	rjmp	.+14     	; 0x536 <__udivmodhi4_ep>

__udivmodhi4_loop:
	adc	r26, r26
	adc	r27, r27
	cp	r26, r22
	cpc	r27, r23
	brcs	.+4      	; 0x536 <__udivmodhi4_ep>
	sub	r26, r22
	sbc	r27, r23

__udivmodhi4_ep:
	adc	r24, r24
	adc	r25, r25
	dec	r21
	brne	.-22     	; 0x528 <__udivmodhi4_loop>
	com	r24
	com	r25
	movw	r22, r24
	movw	r24, r26
	ret

_exit:
	cli

__stop_program:
	rjmp	.-2      	; 0x54a <__stop_program>
