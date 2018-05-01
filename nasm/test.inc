%define COUNT_WRITE 100

%macro WRITE_TEXT 1-2 10
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro PRINT_TEXT 1
    %strlen szstring %1
    mov rax, 1 ; 1 NC_WRITE
    mov rdi, 1 ; destination is STDOUT
    mov rsi, %1 ; source is %1    
    mov rdx, szstring
    syscall
%endmacro
