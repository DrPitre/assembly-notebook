LLVM    = $(shell brew --prefix llvm)/bin
CLANG   = $(LLVM)/clang
OBJDUMP = $(LLVM)/llvm-objdump
TARGET  = hello
SRC     = hello.s
OBJ     = hello.o
TRIPLE  = powerpc-linux-gnu

.PHONY: all clean run disas disas-bin

all: $(TARGET)

$(OBJ): $(SRC)
	$(CLANG) --target=$(TRIPLE) -c -o $(OBJ) $(SRC)

$(TARGET): $(OBJ)
	$(CLANG) --target=$(TRIPLE) -fuse-ld=lld -nostdlib -static -o $(TARGET) $(OBJ) -Wl,-e,_start

run: $(TARGET)
	qemu-ppc ./$(TARGET)

disas: $(OBJ)
	$(OBJDUMP) -d -r $(OBJ)

disas-bin: $(TARGET)
	$(OBJDUMP) -d -r $(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
