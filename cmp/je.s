.data
	never:
		.asciz "never was writed\n"
	always:
		.asciz "always will write\n"
.globl main
.type main, @function
.text

/*
write_text:
	call printf
	add $2*4, %esp
*/	ret

main:
	leal 5, %eax
	cmpl $5, %eax /* 5==%eax */


	jne write_never
	je write_always


write_always:
        pushl $always
        call printf
        addl $2*4, %esp
	ret $0

write_never:
        pushl $never
        call printf
        addl $2*4, %esp
        ret $0

