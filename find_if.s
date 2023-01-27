	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.file	"find_if.cpp"
	.globl	_Z3fooPiS_PFiiE                 # -- Begin function _Z3fooPiS_PFiiE
	.p2align	1
	.type	_Z3fooPiS_PFiiE,@function
_Z3fooPiS_PFiiE:                        # @_Z3fooPiS_PFiiE
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	mv	s2, a1
	sub	a1, a1, a0
	srli	a1, a1, 4
	sext.w	a3, a1
	blez	a3, .LBB0_11
# %bb.1:                                # %for.body.preheader
	mv	s3, a2
	addiw	s1, a1, 1
	addi	s0, a0, 8
	li	s4, 1
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a0, -8(s0)
	jalr	s3
	bnez	a0, .LBB0_7
# %bb.3:                                # %if.end
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	a0, -4(s0)
	jalr	s3
	bnez	a0, .LBB0_8
# %bb.4:                                # %if.end4
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	a0, 0(s0)
	jalr	s3
	bnez	a0, .LBB0_9
# %bb.5:                                # %if.end9
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	a0, 4(s0)
	jalr	s3
	bnez	a0, .LBB0_10
# %bb.6:                                # %if.end14
                                        #   in Loop: Header=BB0_2 Depth=1
	addiw	s1, s1, -1
	addi	s0, s0, 16
	blt	s4, s1, .LBB0_2
	j	.LBB0_11
.LBB0_7:                                # %for.body.cleanup.loopexit_crit_edge
	addi	s2, s0, -8
	j	.LBB0_11
.LBB0_8:                                # %cleanup.loopexit.split.loop.exit51
	addi	s2, s0, -4
	j	.LBB0_11
.LBB0_9:
	mv	s2, s0
	j	.LBB0_11
.LBB0_10:                               # %cleanup.loopexit.split.loop.exit
	addi	s2, s0, 4
.LBB0_11:                               # %cleanup
	mv	a0, s2
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	_Z3fooPiS_PFiiE, .Lfunc_end0-_Z3fooPiS_PFiiE
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 3c24c22cfb18fe238c75d94115507e94ba94a155)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
