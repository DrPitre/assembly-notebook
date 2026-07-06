.global _start
.align 2

.text
_start:
    mov x0, #1                 // stdout file descriptor
    adrp x1, msg@PAGE          // load page address of msg
    add x1, x1, msg@PAGEOFF    // add page offset
    mov x2, #14                // message length
    mov x16, #4                // syscall number for write
    svc #0x80                  // make syscall

    mov x0, #0                 // exit status 0
    mov x16, #1                // syscall number for exit
    svc #0x80                  // make syscall

.data
msg:
    .ascii "Hello, world!\n"
msg2:
    .ascii "Hello, world!\n"
