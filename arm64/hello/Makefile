AS      = as
LD      = ld
TARGET  = hello
SRC     = hello.s
OBJ     = hello.o

.PHONY: all clean run disas

all: $(TARGET)

$(OBJ): $(SRC)
	$(AS) -o $(OBJ) $(SRC)

$(TARGET): $(OBJ)
	$(LD) -o $(TARGET) $(OBJ) -lSystem -syslibroot $(shell xcrun -sdk macosx --show-sdk-path) -e _start

run: $(TARGET)
	./$(TARGET)

disas: $(OBJ)
	otool -tvV $(OBJ)

clean:
	rm -f $(OBJ) $(TARGET)
