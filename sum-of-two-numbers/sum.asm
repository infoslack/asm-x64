section .data
        num1:   equ 100
        num2:   equ 50
        msg:    db "Sum is correct", 10

section .text
        global _start

_start:
        mov     rax, num1       ;; get value num1
        mov     rbx, num2       ;; get value num2
        add     rax, rbx        ;; get sum of num1 and num2
        cmp     rax, 150        ;; compare if result is correct
        jne     .exit           ;; if result is not 150 go to exit
        jmp     .rightSum       ;; if result is correct print msg

.rightSum:
        mov     rax, 1
        mov     rdi, 1
        mov     rsi, msg
        mov     rdx, 15
        syscall
        jmp     .exit

.exit:
        mov     rax, 60
        mov     rdi, 0

        syscall
