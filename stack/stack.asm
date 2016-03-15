section .data
        SYS_WRITE       equ 1
        STD_IN          equ 1
        SYS_EXIT        equ 60
        EXIT_CODE       equ 0
        NEW_LINE        db 0xa
        WRONG_ARGC      db "Must be two command line argument", 0xa

section .text
        global _start

_start:
        pop     rcx ; rcx - argc
        cmp     rcx, 3 ; check argc
        jne     argcError

        add     rsp, 8
        pop     rsi ; get argv[1]
        call    str_to_int ; convert argv[1] str to int
        mov     r10, rax
        pop     rsi ; get argv[2]
        call    str_to_int
        mov     r11, rax
        add     r10, r11 ; sum args

        ;; convert to string
        mov     rax, r10
        xor     r12, r12
        jmp     int_to_str

;; print argc error
argcError:
        mov     rax, 1
        mov     rdi, 1
        mov     rsi, WRONG_ARGC
        mov     rdx, 34
        syscall
        jmp     exit

;; convert int to string
int_to_str:
        mov     rdx, 0
        mov     rbx, 10
        div     rbx
        add     rdx, 48
        add     rdx, 0x0
        push    rdx
        inc     r12
        cmp     rax, 0x0
        jne     int_to_str
        jmp     print

;; convert string to int
str_to_int:
        xor     rax, rax
        mov     rcx, 10
next:
        cmp     [rsi], byte 0
        je      return_str
        mov     bl, [rsi]
        sub     bl, 48
        mul     rcx
        add     rax, rbx
        inc     rsi
        jmp     next

return_str:
        ret

;; print result
print:
        mov     rax, 1
        mul     r12
        mov     r12, 8
        mul     r12
        mov     rdx, rax

        mov     rax, SYS_WRITE
        mov     rdi, STD_IN
        mov     rsi, rsp
        syscall
        jmp     printNewline

printNewline:
        mov     rax, SYS_WRITE
        mov     rdi, STD_IN
        mov     rsi, NEW_LINE
        mov     rdx, 1
        syscall
        jmp     exit

;; exit program
exit:
        mov     rax, SYS_EXIT
        mov     rdi, EXIT_CODE
        syscall
