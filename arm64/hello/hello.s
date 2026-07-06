.global _start
.align 2

.text
_start:
    adrp x1, msg@PAGE          // load page address of msg
    add x1, x1, msg@PAGEOFF    // add page offset
    mov x2, #msglen                // message length
    bl write_message

    adrp x1, msg2@PAGE          // load page address of msg
    add x1, x1, msg2@PAGEOFF    // add page offset
    mov x2, #msg2len                // message length
    bl write_message

exit:
    mov x0, #0                 // exit status 0
    mov x16, #1                // syscall number for exit
    svc #0x80                  // make syscall

write_message:
    mov x0, #1                 // stdout file descriptor
    mov x16, #4                // syscall number for write
    svc #0x80                  // make syscall
    ret

.data
msg:
    .ascii "Hello, world!\n"
msglen = . - msg

msg2:
    .ascii "Hello, again, world!\n"
msg2len = . - msg2    
