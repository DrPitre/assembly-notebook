ENTRY(_start)

MEMORY {
    RAM : ORIGIN = 0x3f00, LENGTH = 0x0200
}

SECTIONS {
    .text : {
        *(.text.startup)
        *(.text*)
        *(.rodata*)
    } > RAM
    .data : { *(.data*) } > RAM
    .bss  : { *(.bss*)  } > RAM
}
