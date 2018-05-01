%include 'test.inc'



section .data

text: db 'Is test of compiler',0xA
texts: equ $-text

section .text
global main
main:



    xor rax, rax
    
    mov rcx, COUNT_WRITE
    
write_some:
    push rcx
        WRITE_TEXT text, texts
    pop rcx
    cmp rcx, 0
    jb end_write
    loop write_some
    
    end_write:
    
    
    ret
