section .data
        SYS_WRITE       equ 1
        STD_OUT         equ 1
        SYS_EXIT        equ 60
        EXIT_CODE       equ 0
        NEW_LINE        db 0xa
        INPUT           db "Hello world!"

section .bss
        OUTPUT  resb 1

section .text
        global  _start

_start:
        mov     rsi, INPUT
        xor     rcx, rcx
        cld
        mov     rdi, $ + 15
        call    calculateStrLength
        xor     rax, rax
        xor     rdi, rdi
        jmp     reverseStr

;; calculate length string
calculateStrLength:
        cmp     byte [rsi], 0
        je      exitFromRoutine
        lodsb
        push    rax
        inc     rcx
        jmp     calculateStrLength ; loop

;; exit and back to _start
exitFromRoutine:
        push    rdi
        ret

;; reverse string
reverseStr:
        cmp     rcx, 0
        je      printResult
        pop     rax
        mov     [OUTPUT + rdi], rax
        dec     rcx
        inc     rdi
        jmp     reverseStr

;; print string
printResult:
        mov     rdx, rdi
        mov     rax, 1
        mov     rdi, 1
        mov     rsi, OUTPUT
        syscall
        jmp     printNewline

printNewline:
        mov     rax, SYS_WRITE
        mov     rdi, STD_OUT
        mov     rsi, NEW_LINE
        mov     rdx, 1
        syscall
        jmp     exit

;; exit program
exit:
        mov     rax, SYS_EXIT
        mov     rdi, EXIT_CODE
        syscall
