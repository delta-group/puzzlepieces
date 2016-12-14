; sonar2.S - Assembly Sonar function, returns int (distance)

	section .text:
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

setup:
	ldi	r22, 0x01		; 1
	ldi	r24, 0x02		; 2
	jmp	0x2b6			; 0x2b6 <pinMode>

loop:
	jmp	0xf2			; 0xf2 <_Z5sonarv>

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