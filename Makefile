all:clean kvm main test.bin


kvm:kvm.c
	cc -o kvm kvm.c 

main:main.c
	cc -o main main.c -lpthread


test.bin: test.o
	ld -m elf_i386 --oformat binary -N -e _start -Ttext 0x10000 -o test.bin test.o

test.o: test.S
	as -32 test.S -o test.o

clean:
	rm -fr kvm main

