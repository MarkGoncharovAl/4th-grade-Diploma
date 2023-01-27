	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0"
	.file	"ex1.c"
	.globl	strlen5
	.p2align	1
	.type	strlen5,@function
strlen5:
	li	a1, 0
.LBB0_1:
	add	a2, a0, a1
	addi	a1, a1, 1
	lbu	a2, 0(a2)
	bnez	a2, .LBB0_1
	addi	a0, a1, -1
	ret
.Lfunc_end0:
	.size	strlen5, .Lfunc_end0-strlen5

	.ident	"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 3c24c22cfb18fe238c75d94115507e94ba94a155)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
