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
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	a0, 16(sp)                      # 8-byte Folded Spill
	li	a0, 0
	sd	a0, 24(sp)                      # 8-byte Folded Spill
	j	.LBB0_1
.LBB0_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	ld	a0, 16(sp)                      # 8-byte Folded Reload
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, a1, 1
	sd	a1, 8(sp)                       # 8-byte Folded Spill
	sd	a1, 24(sp)                      # 8-byte Folded Spill
	bnez	a0, .LBB0_1
	j	.LBB0_2
.LBB0_2:                                # %do.end
	ld	a0, 8(sp)                       # 8-byte Folded Reload
	addi	a0, a0, -1
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	strlen5, .Lfunc_end0-strlen5
	.size	.Lstrlen5$local, .Lfunc_end0-strlen5
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
