	.file	"dgemm.cpp"
	.text
	.p2align 4,,15
	.globl	_Z5dgemmccjjjdPKPKdS2_dPPd
	.type	_Z5dgemmccjjjdPKPKdS2_dPPd, @function
_Z5dgemmccjjjdPKPKdS2_dPPd:
.LFB1564:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	testl	%ecx, %ecx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r8d, -52(%rbp)
	movq	(%r10), %r14
	movq	8(%r10), %rax
	je	.L36
	testl	%edx, %edx
	je	.L36
	subl	$1, %ecx
	leal	-1(%rdx), %r13d
	vbroadcastsd	%xmm1, %zmm3
	leaq	8(%rax,%rcx,8), %r15
	movq	%rax, %rbx
	movl	%ecx, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rbx), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	negq	%rcx
	andl	$7, %ecx
	leal	7(%rcx), %esi
	cmpl	%r13d, %esi
	ja	.L14
	testl	%ecx, %ecx
	je	.L15
	vmulsd	(%rdi), %xmm1, %xmm2
	cmpl	$1, %ecx
	vmovsd	%xmm2, (%rdi)
	je	.L16
	vmulsd	8(%rdi), %xmm1, %xmm2
	cmpl	$2, %ecx
	vmovsd	%xmm2, 8(%rdi)
	je	.L17
	vmulsd	16(%rdi), %xmm1, %xmm2
	cmpl	$3, %ecx
	vmovsd	%xmm2, 16(%rdi)
	je	.L18
	vmulsd	24(%rdi), %xmm1, %xmm2
	cmpl	$4, %ecx
	vmovsd	%xmm2, 24(%rdi)
	je	.L19
	vmulsd	32(%rdi), %xmm1, %xmm2
	cmpl	$5, %ecx
	vmovsd	%xmm2, 32(%rdi)
	je	.L20
	vmulsd	40(%rdi), %xmm1, %xmm2
	cmpl	$6, %ecx
	vmovsd	%xmm2, 40(%rdi)
	je	.L21
	vmulsd	48(%rdi), %xmm1, %xmm2
	movl	$7, %r8d
	vmovsd	%xmm2, 48(%rdi)
.L4:
	movl	%edx, %r11d
	leaq	(%rdi,%rcx,8), %r12
	xorl	%esi, %esi
	subl	%ecx, %r11d
	xorl	%ecx, %ecx
	movl	%r11d, %r10d
	shrl	$3, %r10d
	.p2align 4,,10
	.p2align 3
.L6:
	vmulpd	(%r12,%rcx), %zmm3, %zmm2
	addl	$1, %esi
	vmovapd	%zmm2, (%r12,%rcx)
	addq	$64, %rcx
	cmpl	%esi, %r10d
	ja	.L6
	movl	%r11d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %r8d
	cmpl	%r11d, %ecx
	je	.L7
.L3:
	movl	%r8d, %ecx
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	1(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	2(%r8), %ecx
	cmpl	%edx, %ecx
	jnb	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	3(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	4(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	5(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	6(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	7(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	8(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	9(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	10(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	11(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	12(%r8), %ecx
	cmpl	%ecx, %edx
	jbe	.L7
	leaq	(%rdi,%rcx,8), %rcx
	addl	$13, %r8d
	cmpl	%r8d, %edx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	jbe	.L7
	leaq	(%rdi,%r8,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	.p2align 4,,10
	.p2align 3
.L7:
	addq	$8, %rbx
	cmpq	%rbx, %r15
	jne	.L9
	movl	-52(%rbp), %edx
	testl	%edx, %edx
	je	.L38
	movl	-52(%rbp), %ebx
	leaq	8(,%r13,8), %r13
	movq	%r14, %r15
	leal	-1(%rbx), %edx
	leaq	8(%r14,%rdx,8), %r12
	movl	-56(%rbp), %edx
	leaq	8(,%rdx,8), %r11
	.p2align 4,,10
	.p2align 3
.L12:
	movq	(%r15), %rbx
	movq	%r15, %r10
	xorl	%edi, %edi
	subq	%r14, %r10
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	(%rbx,%rdi), %r8
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r9,%rdx), %rsi
	movq	(%rax,%rdx), %rcx
	addq	$8, %rdx
	vmulsd	(%rsi,%r10), %xmm0, %xmm1
	addq	%rdi, %rcx
	cmpq	%r11, %rdx
	vmovsd	(%rcx), %xmm4
	vfmadd132sd	(%r8), %xmm4, %xmm1
	vmovsd	%xmm1, (%rcx)
	jne	.L10
	addq	$8, %rdi
	cmpq	%r13, %rdi
	jne	.L11
	addq	$8, %r15
	cmpq	%r15, %r12
	jne	.L12
.L38:
	vzeroupper
.L36:
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L16:
	.cfi_restore_state
	movl	$1, %r8d
	jmp	.L4
.L15:
	xorl	%r8d, %r8d
	jmp	.L4
.L17:
	movl	$2, %r8d
	jmp	.L4
.L14:
	xorl	%r8d, %r8d
	jmp	.L3
.L18:
	movl	$3, %r8d
	jmp	.L4
.L19:
	movl	$4, %r8d
	jmp	.L4
.L20:
	movl	$5, %r8d
	jmp	.L4
.L21:
	movl	$6, %r8d
	jmp	.L4
	.cfi_endproc
.LFE1564:
	.size	_Z5dgemmccjjjdPKPKdS2_dPPd, .-_Z5dgemmccjjjdPKPKdS2_dPPd
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd, @function
_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd:
.LFB2045:
	.cfi_startproc
	leaq	_ZStL8__ioinit(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2045:
	.size	_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd, .-_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
