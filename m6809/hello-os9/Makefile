AS      = lwasm
OS9     = os9
MAME    = mame
MACHINE = coco2b
TARGET  = hello
SRC     = hello.asm
DSK     = hello.dsk

# LLVM-MC6809 toolchain build (clang -target mc6809-unknown-os9).
LLVMDIR   = $(HOME)/Projects/llvm-mc6809/build
CLANG     = $(LLVMDIR)/bin/clang
CTARGET   = helloc
CSRC      = hello.c
CDSK      = helloc.dsk

# NitrOS-9/6809 Level 1 minimal boot disk, built via:
#   cd nitros9/recipes/coco/floppy && make MINIMAL=1
# then copied here as bootdisk.dsk.
BOOTDSK = bootdisk.dsk

.PHONY: all run run-c clean

all: $(TARGET) $(CTARGET)

$(TARGET): $(SRC)
	$(AS) --pragma=pcaspcr,nosymbolcase,condundefzero,undefextern,dollarnotlocal,noforwardrefmax -I$(NITROS9DIR)/defs --format=os9 -o $(TARGET) $(SRC)

$(CTARGET): $(CSRC)
	$(CLANG) -target mc6809-unknown-os9 -O2 $(CSRC) -o $(CTARGET)

$(DSK): $(TARGET) $(BOOTDSK)
	cp $(BOOTDSK) $(DSK)
	$(OS9) copy -r $(TARGET) "$(DSK),CMDS/HELLO"
	$(OS9) attr -q -epepr "$(DSK),CMDS/HELLO"

$(CDSK): $(CTARGET) $(BOOTDSK)
	cp $(BOOTDSK) $(CDSK)
	$(OS9) copy -r $(CTARGET) "$(CDSK),CMDS/HELLOC"
	$(OS9) attr -q -epepr "$(CDSK),CMDS/HELLOC"

run: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -autoboot_delay 5 -autoboot_command 'DOS\n' -ext fdc -ext:fdc:wd17xx:0 525qd -flop1 $(DSK)

run-c: $(CDSK)
	$(MAME) $(MACHINE) -skip_gameinfo -autoboot_delay 5 -autoboot_command 'DOS\n' -ext fdc -ext:fdc:wd17xx:0 525qd -flop1 $(CDSK)

clean:
	rm -f $(TARGET) $(DSK) $(CTARGET) $(CDSK) *.list *.map
