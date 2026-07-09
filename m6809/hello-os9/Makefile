AS      = lwasm
OS9     = os9
MAME    = mame
MACHINE = coco2b
TARGET  = hello
SRC     = hello.asm
DSK     = hello.dsk

# NitrOS-9/6809 Level 1 minimal boot disk, built via:
#   cd nitros9/recipes/coco/floppy && make MINIMAL=1
# then copied here as bootdisk.dsk.
BOOTDSK = bootdisk.dsk

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(AS) --pragma=pcaspcr,nosymbolcase,condundefzero,undefextern,dollarnotlocal,noforwardrefmax -I$(NITROS9DIR)/defs --format=os9 -o $(TARGET) $(SRC)

$(DSK): $(TARGET) $(BOOTDSK)
	cp $(BOOTDSK) $(DSK)
	$(OS9) copy -r $(TARGET) "$(DSK),CMDS/HELLO"
	$(OS9) attr -q -epepr "$(DSK),CMDS/HELLO"

run: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -autoboot_delay 5 -autoboot_command 'DOS\n' -ext fdc -ext:fdc:wd17xx:0 525qd -flop1 $(DSK)

clean:
	rm -f $(TARGET) $(DSK) *.list *.map
