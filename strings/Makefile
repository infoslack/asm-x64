all:
	nasm -g -f elf64 -o reverse_string.o reverse_string.asm
	ld -o reverse_string reverse_string.o

clean:
	rm reverse_string reverse_string.o
