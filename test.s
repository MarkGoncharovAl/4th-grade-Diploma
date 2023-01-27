	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.file	"ex1.c"
	.globl	strlen5                         # -- Begin function strlen5
	.p2align	1
	.type	strlen5,@function
strlen5:                                # @strlen5
.Lstrlen5$local:
	.type	.Lstrlen5$local,@function
# %bb.0:                                # %entry
	li	a1, 0
.LBB0_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	add	a2, a0, a1
	lbu	a2, 0(a2)
	addi	a1, a1, 1
	bnez	a2, .LBB0_1
# %bb.2:                                # %do.end
	addi	a0, a1, -1
	ret
.Lfunc_end0:
	.size	strlen5, .Lfunc_end0-strlen5
	.size	.Lstrlen5$local, .Lfunc_end0-strlen5
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
