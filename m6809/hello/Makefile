AS      = lwasm
DECB    = decb
MAME    = mame
MACHINE = coco2b
TARGET  = hello.bin
SRC     = hello.asm
DSK     = hello.dsk

# LLVM-MC6809 toolchain for CoCo DECB C build (-target mc6809-unknown-decb).
# The target driver selects mc6809-decb.lds automatically, which emits
# OUTPUT_FORMAT(decb-program) — lld wraps the binary directly, no post-
# processing needed.
LLVMDIR = $(HOME)/Projects/llvm-mc6809/build
CLANG   = $(LLVMDIR)/bin/clang
CTARGET = helloc.bin

.PHONY: all run run-c clean

all: $(TARGET) $(CTARGET)

$(TARGET): $(SRC)
	$(AS) --format=decb -o $(TARGET) $(SRC)

 helloc.s: hello.c
	$(CLANG) -target mc6809-unknown-decb -O2 -S $< -o $@

$(CTARGET): hello.c crt0.s putchar.s
	$(CLANG) -target mc6809-unknown-decb -O2 $^ -o $@

$(DSK): $(TARGET) $(CTARGET)
	$(DECB) dskini $(DSK)
	$(DECB) copy -2 -b $(TARGET) "$(DSK),HELLO.BIN"
	$(DECB) copy -2 -b $(CTARGET) "$(DSK),HELLOC.BIN"

run: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -flop1 $(DSK) -autoboot_command 'LOADM"HELLO":EXEC\n' -autoboot_delay 2

run-c: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -flop1 $(DSK) -autoboot_command 'LOADM"HELLOC":EXEC\n' -autoboot_delay 2

clean:
	rm -f $(TARGET) $(DSK) $(CTARGET) *.o *.list *.map
