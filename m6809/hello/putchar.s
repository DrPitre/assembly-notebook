	.section .text,"ax"
	.global putchar
putchar:
	tfr	b,a
	jsr	[$a002]
	rts
