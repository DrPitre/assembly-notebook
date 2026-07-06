AS      = as
LD      = ld
TARGET  = hello
SRC     = hello.s
OBJ     = hello.o
SDK     = $(shell xcrun -sdk macosx --show-sdk-path)

.PHONY: all clean run disas disas-bin

all: $(TARGET)

$(OBJ): $(SRC)
	$(AS) -arch x86_64 -o $(OBJ) $(SRC)

$(TARGET): $(OBJ)
	$(LD) -arch x86_64 -o $(TARGET) $(OBJ) -lSystem -syslibroot $(SDK) -e _start

run: $(TARGET)
	arch -x86_64 ./$(TARGET)

disas: $(OBJ)
	otool -tvV $(OBJ)

disas-bin: $(TARGET)
	otool -tvV $(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
