section .data
        msg db  "Hello, World!", `\n`

section .text
        global _start
_start:
        mov     rax, 1   ;; define write syscall
        mov     rdi, 1   ;; file descriptor
        mov     rsi, msg ;; message address
        mov     rdx, 14  ;; length of message
        syscall          ;; call write syscall

        ;; call exit
        mov     rax, 60
        mov     rdi, 0

        syscall
