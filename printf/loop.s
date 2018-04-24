.section .rodata
str_d:
	.asciz "Result is %d\n"
was_carry:
	.string "Was carry\n"
ebx_eax:
	.string "EAX: %d EBX: %d\n"
.globl main
.type main, @function

.text
main:
	leal 0, %eax
	leal 10, %ecx
sum:
	addl %ecx, %eax
	jc is_carry
	loop sum

pushl %eax
pushl $str_d
call printf
addl $2*4, %esp

addl %eax, %ecx
jmp sum

is_carry:
        pushl %ebx
        pushl %eax
        pushl $ebx_eax

        call printf
        addl $3*4, %esp

	pushl $was_carry
	call printf
	addl $4, %esp



	ret
