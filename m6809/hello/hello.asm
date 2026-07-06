; hello.asm - Hello World for the TRS-80 Color Computer (CoCo)
; Assemble with lwasm (LWTOOLS), targeting a DECB loadable binary.

startaddr equ $3f00
        org     startaddr

start:
        ldx     #msg            ; point X at the message
loop:
        lda     ,x+             ; get next character, advance pointer
        beq     done            ; branch on the null terminator
        jsr     [$a002]         ; output character via the ROM output vector
        bra     loop

done:
        rts                     ; return to BASIC (program was EXECed)

msg:
        fcc     "HELLO, WORLD!"
        fcb     13
        fcb     0

        end     startaddr