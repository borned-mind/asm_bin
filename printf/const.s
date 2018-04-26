/*
.bss
	.space 1024
*/

.data



some_var:
	.long 1, 32, 64
end_var:

str_d:
	.asciz "%d\n"

.globl main
.type main, @function

.text
main:

	pushl $some_var
	pushl $str_d
	call printf
	addl $4*2, %esp /*For just numbers $ mean that is const*/

	movl $0, %eax

/*
	leal  12(%eax,%ebx,4),%ecx == 12+%eax+%ebx*4
*/

	movl $16, some_var(,%eax,1)

/*
	movl $16, some_var == some_var+%eax*1
*/

/*	movl $3, %ecx*/

print_all:
	/*
	movl some_var, %edx
	addl $4, %edx
	pushl %edx*/

	pushl some_var
        pushl $str_d
        call printf
        addl $4*2, %esp
	/*loop print_all*/


        pushl some_var+4*1
        pushl $str_d
        call printf
        addl $4*2, %esp

        pushl some_var+4*2
        pushl $str_d
        call printf
	addl $4*2, %esp



