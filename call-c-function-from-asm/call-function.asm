;; nasm -f elf64 function.asm -o function.o
;; ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc \
;; funcion.o function-c.o -o program

global _start

extern print

section .text

_start:
        call    print
        mov     rax, 60
        mov     rdi, 0
        syscall
