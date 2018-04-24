/*
	32:
        %eax -- accumulate ax - 16 ah - hight 8 al - little 8
        %ebx -- base .. too bx bh bl
        %ecx -- counter .. too cx ch cl
        %edx -- data .. too dx dh dl
        %esp -- stack pointer .. sp 16
        %ebp -- base pointer .. dp 16
        %esi -- source index .. si 16
        %edi -- destination index .. di 16


        segments(16):
                cs -- code segment .text
                ss -- stack segment
                ds -- data segment .data
                es -- extra segment
                fs -- advance F segment
                gs -- advance G segment
	flags:
	cf -- cary flag
	zf -- zero flag
	of -- overflow flag
	df -- direction flag
*/

.bss
	.space 1024
.section .rodata
hello_string:
	.asciz "Hello, world\n"
	.set size_str, . - hello_string - 1

.data /* data segment*/

.globl main /*create global main*/
.type main, @function /*set type to main of function*/


.text /*code segment*/
main:
/*
	movb // mov byte 8 bit
	movw  // word 16 bit
	movl // long 32 bit
	movq // quad 64 bit
*/
movl $4 , %eax /*4=write*/
movl $1 , %ebx /* fileno(stdout) STDIN_FILENO STDOUT_FILENO STDERR_FILENO*/
movl $hello_string, %ecx /*string to counter*/
movl $size_str , %edx /*to data size str , 3 argument of write()*/

int $0x80 /* call */



/*without $ we would put absolute number(addr)*/
