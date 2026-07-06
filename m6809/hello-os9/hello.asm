********************************************************************
* Hello - Hello, world!
*
* Prints a greeting to standard output and exits. Assemble with
* lwasm --format=os9 for NitrOS-9 (or OS-9 Level 1/2).

                    nam       Hello
                    ttl       Hello, world!

                    use       defsfile

tylg                set       Prgrm+Objct
rev                 set       $01
atrv                set       ReEnt+rev
edition             set       1

                    mod       eom,name,tylg,atrv,start,size

                    org       0
                    rmb       128
size                equ       .

name                fcs       /Hello/
                    fcb       edition

start               leax      msg,pcr
                    ldy       #msglen
                    lda       #1              ; path 1 = stdout
                    os9       I$WritLn
                    bcs       exit
                    clrb
exit                os9       F$Exit

msg                 fcc       /Hello, world!/
                    fcb       C$CR
msglen              equ       *-msg

                    emod
eom                 equ       *
                    end
