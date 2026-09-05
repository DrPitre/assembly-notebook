.data
msg:
    .ascii "Hello, world!\n"
.equ msglen, . - msg		#get msg length

.global _start
.text

_start:
    li a0, 1			#stdout 1
    la a1, msg
    li a2, msglen
    li a7, 64			#sys_write 64
    ecall

    li a0, 0			#exit status 0
    li a7, 93			#sys_exit 93
    ecall
