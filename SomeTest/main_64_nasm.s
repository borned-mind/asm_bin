extern printf

section .bss
	RESB 1024

section .rodata

section .data
SomeText: db 'Some text %d', 0xA, 0 ;
SomeTextS: equ $-SomeText
m_sock: dd 0


global main
;global m_sock

section .text
main:

	push rbp
	mov rbp, rsp
	sub rbp, 4
	mov dword [rbp-4], 0xB ; byte 8, word 16, (double word) long 32(int), quad 64, ...


	mov rax, 1
	mov rdi, 1
	mov rsi, SomeText
	mov rdx, SomeTextS
	syscall

	mov rdi, SomeText
	mov rsi, [rbp-4]
	call printf WRT ..plt


	in ax, 60h ; read from 60h to ax
	out 60h, ax ; pot to 60h ax


	pop rbp
