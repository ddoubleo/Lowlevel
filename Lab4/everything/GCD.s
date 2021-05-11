	.file	"GCD.c"
	.option nopic
	.attribute arch, "rv64i2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	GCD
	.type	GCD, @function
GCD:
	lw	a5,0(a0)
	addi	a2,a0,4
	addi	a1,a0,20
	li	a3,1
	j	.L8
.L5:
	subw	a4,a4,a5
.L6:
	beq	a5,a3,.L2
	beq	a5,a4,.L9
	beq	a4,a3,.L2
.L7:
	blt	a5,a4,.L5
	subw	a5,a5,a4
	j	.L6
.L9:
	mv	a5,a4
.L3:
	addi	a2,a2,4
	beq	a2,a1,.L2
.L8:
	lw	a4,0(a2)
	beq	a5,a3,.L2
	beq	a4,a5,.L3
	bne	a4,a3,.L7
.L2:
	sw	a5,4(a0)
	ret
	.size	GCD, .-GCD
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
