extern printf
section .data
	str_format db 'Is: %d',0xA,0
global main

section .text

main:
;	push word 0x9
;	push word 0x8
;	mov r8d, 0x7
;	mov r9d, 0x6
;	mov eax, 0x5
;	mov ebx, 0x4
;	mov ecx, 0x3
;	mov edx, 0x2
	mov rsi, 0x62
	mov rdi, str_format
	xor rax,rax
	call printf WRT ..plt
;	add 8, rsp

