.global _start
.text

_start:
    lea msg(%rip), %rsi         # message address
    mov $msglen, %rdx           # message length
    call write_message

    lea msg2(%rip), %rsi        # message address
    mov $msg2len, %rdx          # message length
    call write_message

exit:
    mov $0, %rdi                # exit status 0
    mov $0x2000001, %rax        # syscall number for exit
    syscall

write_message:
    mov $1, %rdi                # stdout file descriptor
    mov $0x2000004, %rax        # syscall number for write
    syscall
    ret

.data
msg:
    .ascii "Hello, world!\n"
msglen = . - msg

msg2:
    .ascii "Hello, again, world!\n"
msg2len = . - msg2
