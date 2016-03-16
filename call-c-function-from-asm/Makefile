buildAsmc:
	gcc -c call-function.c -o call-function-c.o
	nasm -f elf64 call-function.asm -o call-function.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc call-function.o call-function-c.o -o call-function

clean:
	rm -rf *.o
	rm call-function
