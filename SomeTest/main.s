.file "main.s"

.section .bss

.section .rodata
	SomeText:
        	.asciz "Test %d\n"
        	.set SomeTextS, .-SomeText



.section .data

.globl m_sock
.type m_sock, @object

.globl main
.type main, @function
m_sock:
	.align 4
	.size m_sock, 4
	.long 0
.section .text

main:

	movl %esp, %ebp
	movl $24, -4(%ebp)

	pushl -4(%ebp)
	pushl $SomeText
	call printf
	addl $2*4, %esp

/*
	mov $1, %rax 
	mov $1, %rdi 
	mov $SomeText, %rsi 
	mov $SomeTextS, %rdx
	syscall
*/



