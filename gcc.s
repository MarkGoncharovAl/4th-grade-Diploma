	.file	"ex1.c"
	.text
	.p2align 4
	.globl	strlen5
	.type	strlen5, @function
strlen5:
.LFB0:
	.cfi_startproc
	leaq	-1(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L2:
	addq	$1, %rax
	cmpb	$0, (%rax)
	jne	.L2
	subq	%rdi, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	strlen5, .-strlen5
	.p2align 4
	.globl	strlen2
	.type	strlen2, @function
strlen2:
.LFB1:
	.cfi_startproc
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, %rax
	cmpb	$0, -1(%rax)
	jne	.L6
	subq	%rdi, %rax
	subq	$1, %rax
	ret
	.cfi_endproc
.LFE1:
	.size	strlen2, .-strlen2
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
