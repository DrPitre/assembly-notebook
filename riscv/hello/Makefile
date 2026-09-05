AS = /opt/riscv/bin/riscv64-unknown-linux-gnu-as
LD = /opt/riscv/bin/riscv64-unknown-linux-gnu-ld

all: hello

hello: hello.o
	$(LD) -static -o hello hello.o

hello.o: hello.s
	$(AS) -o hello.o hello.s

clean:
	rm -f hello hello.o
