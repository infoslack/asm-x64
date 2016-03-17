build:
	nasm -f elf64 -o function-asm.o function-asm.asm
	gcc function-asm.o function-c.c -o function

clean:
	rm function function-asm.o
