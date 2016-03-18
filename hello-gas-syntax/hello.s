.global _start
.text

_start:
        mov     $1, %rax                # system call 1 (write)
        mov     $1, %rdi                # file handle 1 (stdout)
        mov     $message, %rsi          # address to output
        mov     $13, %rdx               # size
        syscall                         # call OS to do the write

        mov     $60, %rax               # system call 60 (exit)
        xor     %rdi, %rdi              # return 0 to exit
        syscall                         # call OS to exit

message:
        .ascii "Hello, World\n"
