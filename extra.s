	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0"
	.file	"extra.ll"
	.globl	iv_start_non_preheader
	.p2align	1
	.type	iv_start_non_preheader,@function
iv_start_non_preheader:
	.cfi_startproc
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)
	sd	s0, 16(sp)
	sd	s1, 8(sp)
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	beqz	a1, .LBB0_3
	mv	s0, a1
	mv	s1, a0
.LBB0_2:
	ld	a0, 0(s1)
	call	foo@plt
	addiw	s0, s0, -1
	addi	s1, s1, 8
	bnez	s0, .LBB0_2
.LBB0_3:
	ld	ra, 24(sp)
	ld	s0, 16(sp)
	ld	s1, 8(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	iv_start_non_preheader, .Lfunc_end0-iv_start_non_preheader
	.cfi_endproc

	.section	".note.GNU-stack","",@progbits
	.addrsig
