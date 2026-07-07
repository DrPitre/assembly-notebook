.global _start
.text

_start:
    li 3, 1                    # stdout file descriptor
    lis 4, msg@ha              # high 16 bits of msg address
    la  4, msg@l(4)            # add low 16 bits of msg address
    li 5, msglen                # message length
    bl write_message

    lis 4, msg2@ha              # high 16 bits of msg2 address
    la  4, msg2@l(4)            # add low 16 bits of msg2 address
    li 5, msg2len                # message length
    bl write_message

exit:
    li 0, 1                    # syscall number for exit
    li 3, 0                    # exit status 0
    sc                         # make syscall

write_message:
    li 0, 4                    # syscall number for write
    sc                         # make syscall
    blr

.data
msg:
    .ascii "Hello, world!\n"
msglen = . - msg

msg2:
    .ascii "Hello, again, world!\n"
msg2len = . - msg2
