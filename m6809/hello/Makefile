AS      = lwasm
DECB    = decb
MAME    = mame
MACHINE = coco2b
TARGET  = hello.bin
SRC     = hello.asm
DSK     = hello.dsk

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(AS) --format=decb -o $(TARGET) $(SRC)

$(DSK): $(TARGET)
	$(DECB) dskini $(DSK)
	$(DECB) copy -2 -b $(TARGET) "$(DSK),HELLO.BIN"

run: $(DSK)
	$(MAME) $(MACHINE) -skip_gameinfo -flop1 $(DSK) -autoboot_command 'LOADM"HELLO"\n' -autoboot_delay 2

clean:
	rm -f $(TARGET) $(DSK) *.list *.map
