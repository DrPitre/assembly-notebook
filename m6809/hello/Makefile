AS      = lwasm
DECB    = decb
MAME    = mame
MACHINE = coco2b
TARGET  = hello.bin
SRC     = hello.asm
DSK     = hello.dsk

# LLVM-MC6809 toolchain for bare-metal C build (clang -target mc6809-unknown-none).
LLVMDIR  = $(HOME)/Projects/llvm-mc6809/build
CLANG    = $(LLVMDIR)/bin/clang
OBJCOPY  = $(LLVMDIR)/bin/llvm-objcopy
CTARGET  = helloc.bin
LOADADDR = 0x3f00

.PHONY: all run run-c clean

all: $(TARGET) $(CTARGET)

$(TARGET): $(SRC)
	$(AS) --format=decb -o $(TARGET) $(SRC)

crt0.o: crt0.s
	$(CLANG) -target mc6809-unknown-none -c $< -o $@

putchar.o: putchar.s
	$(CLANG) -target mc6809-unknown-none -c $< -o $@

 helloc.s: hello.c
	$(CLANG) -target mc6809-unknown-none -O2 -ffreestanding -S $< -o $@

helloc.o: hello.c
	$(CLANG) -target mc6809-unknown-none -O2 -ffreestanding -c $< -o $@

helloc.elf: crt0.o putchar.o helloc.o
	$(CLANG) -target mc6809-unknown-none -T coco.ld -nostdlib -Wl,--no-gc-sections $^ -o $@

helloc.raw: helloc.elf
	$(OBJCOPY) -O binary $< $@

$(CTARGET): helloc.raw
	python3 -c "import struct; d=open('helloc.raw','rb').read(); h=struct.pack('>BHH',0,len(d),$(LOADADDR)); t=struct.pack('>BHH',0xff,0,$(LOADADDR)); open('$@','wb').write(h+d+t)"

$(DSK): $(TARGET) $(CTARGET)
	$(DECB) dskini $(DSK)
	$(DECB) copy -2 -b $(TARGET) "$(DSK),HELLO.BIN"
	$(DECB) copy -2 -b $(CTARGET) "$(DSK),HELLOC.BIN"

run: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -flop1 $(DSK) -autoboot_command 'LOADM"HELLO":EXEC\n' -autoboot_delay 2

run-c: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -flop1 $(DSK) -autoboot_command 'LOADM"HELLOC":EXEC\n' -autoboot_delay 2

clean:
	rm -f $(TARGET) $(DSK) $(CTARGET) helloc.elf helloc.raw *.o *.list *.map
