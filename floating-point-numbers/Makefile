build:
	gcc -g -c float-c.c -o c.o
	nasm -f elf64 float.asm -o float.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc float.o c.o -o testFloat

clean:
	rm *.o
	rm testFloat
