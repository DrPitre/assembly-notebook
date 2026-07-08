	.section .text.startup,"ax"
	.global _start
_start:
	lbsr	main
	rts
