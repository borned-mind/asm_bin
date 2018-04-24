.section .rodata
str_d:
	.asciz "Result is %d\n"
was_carry:
	.string "Was carry\n"
ebx_eax:
	.string "EAX: %d EBX: %d\n"
register_was_clear:
	.string "Register was clear\n"

.globl main
.type main, @function

.text
clear_register:
	clr %eax /*clear register*/
        clr %ebx
        clr %ecx
        clr %edx

	/*clr %esp*/
	clr %ebp
        clr %edi
        clr %esi



	ret

main:
	leal 0, %eax
	leal 50, %ecx
sum: /*(1+50)*50/2*/
	addl %ecx, %eax
	jc is_carry
	loop sum

pushl %eax
pushl $str_d
call printf
addl $2*4, %esp

addl %eax, %ecx
jmp sum



no_carry:
	pushl $register_was_clear
	call printf
	addl $4, %esp
	ret

is_carry:
        pushl %ebx
        pushl %eax
        pushl $ebx_eax

        call printf
        addl $3*4, %esp

	pushl $was_carry
	call printf
	addl $4, %esp

	call clear_register

	clc /*clear carry*/
	jnc no_carry

