	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.file	"find_if2.cpp"
	.globl	_Z3fooPiS_i                     # -- Begin function _Z3fooPiS_i
	.p2align	1
	.type	_Z3fooPiS_i,@function
_Z3fooPiS_i:                            # @_Z3fooPiS_i
# %bb.0:                                # %entry
	sub	a4, a1, a0
	li	a3, 16
	blt	a4, a3, .LBB0_8
# %bb.1:                                # %for.body.preheader.i.i.i
	srli	a3, a4, 4
	li	a6, 1
	addi	a5, a3, 1
	addi	a3, a0, 8
.LBB0_2:                                # %for.body.i.i.i
                                        # =>This Inner Loop Header: Depth=1
	lw	a0, -8(a3)
	beq	a0, a2, .LBB0_18
# %bb.3:                                # %if.end.i.i.i
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	a0, -4(a3)
	beq	a0, a2, .LBB0_19
# %bb.4:                                # %if.end4.i.i.i
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	a0, 0(a3)
	beq	a0, a2, .LBB0_21
# %bb.5:                                # %if.end8.i.i.i
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	a0, 4(a3)
	beq	a0, a2, .LBB0_20
# %bb.6:                                # %if.end12.i.i.i
                                        #   in Loop: Header=BB0_2 Depth=1
	addi	a5, a5, -1
	addi	a3, a3, 16
	addi	a4, a4, -16
	blt	a6, a5, .LBB0_2
# %bb.7:                                # %for.end.loopexit.i.i.i
	addi	a0, a3, -8
.LBB0_8:                                # %for.end.i.i.i
	srai	a4, a4, 2
	li	a3, 1
	beq	a4, a3, .LBB0_16
# %bb.9:                                # %for.end.i.i.i
	li	a3, 2
	beq	a4, a3, .LBB0_13
# %bb.10:                               # %for.end.i.i.i
	li	a5, 3
	mv	a3, a1
	bne	a4, a5, .LBB0_21
# %bb.11:                               # %sw.bb.i.i.i
	lw	a3, 0(a0)
	beq	a3, a2, .LBB0_14
# %bb.12:                               # %if.end20.i.i.i
	addi	a0, a0, 4
.LBB0_13:                               # %sw.bb22.i.i.i
	lw	a3, 0(a0)
	bne	a3, a2, .LBB0_15
.LBB0_14:
	mv	a3, a0
	j	.LBB0_21
.LBB0_15:                               # %if.end25.i.i.i
	addi	a0, a0, 4
.LBB0_16:                               # %sw.bb27.i.i.i
	lw	a4, 0(a0)
	mv	a3, a0
	beq	a4, a2, .LBB0_21
# %bb.17:                               # %sw.default.i.i.i
	mv	a3, a1
	j	.LBB0_21
.LBB0_18:                               # %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit"
	addi	a3, a3, -8
	j	.LBB0_21
.LBB0_19:                               # %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit"
	addi	a3, a3, -4
	j	.LBB0_21
.LBB0_20:                               # %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17"
	addi	a3, a3, 4
.LBB0_21:                               # %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"
	xor	a0, a3, a1
	seqz	a0, a0
	addi	a0, a0, -1
	and	a0, a0, a2
	ret
.Lfunc_end0:
	.size	_Z3fooPiS_i, .Lfunc_end0-_Z3fooPiS_i
                                        # -- End function
	.ident	"clang version 16.0.0 (SC git:/tools/llvm/llvm-project/ 3c24c22cfb18fe238c75d94115507e94ba94a155)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
