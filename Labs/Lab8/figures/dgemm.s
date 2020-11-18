	.file	"dgemm.cpp"
	.text
	.p2align 4,,15
	.globl	_Z5dgemmccjjjdPKPKdS2_dPPd
	.type	_Z5dgemmccjjjdPKPKdS2_dPPd, @function
_Z5dgemmccjjjdPKPKdS2_dPPd:
.LFB1538:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	movq	24(%rbp), %r11
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	testl	%ecx, %ecx
	je	.L27
	testl	%edx, %edx
	je	.L27
	movl	%edx, %r12d
	leal	-1(%rcx), %eax
	movl	%edx, %ebx
	movq	%r11, %rdi
	shrl	$2, %r12d
	movq	%rax, %r10
	leaq	8(%r11,%rax,8), %r13
	andl	$-4, %ebx
	leal	-1(%rdx), %r14d
	salq	$5, %r12
	vbroadcastsd	%xmm1, %ymm3
	.p2align 4,,10
	.p2align 3
.L7:
	movq	(%rdi), %rsi
	cmpl	$2, %r14d
	jbe	.L12
	movq	%rsi, %rax
	leaq	(%r12,%rsi), %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	vmovupd	(%rax), %xmm5
	vinsertf128	$0x1, 16(%rax), %ymm5, %ymm2
	addq	$32, %rax
	vmulpd	%ymm3, %ymm2, %ymm2
	vmovups	%xmm2, -32(%rax)
	vextractf128	$0x1, %ymm2, -16(%rax)
	cmpq	%rax, %rcx
	jne	.L4
	movl	%ebx, %eax
	cmpl	%ebx, %edx
	je	.L5
.L3:
	movl	%eax, %ecx
	leaq	(%rsi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	1(%rax), %ecx
	cmpl	%ecx, %edx
	jbe	.L5
	leaq	(%rsi,%rcx,8), %rcx
	addl	$2, %eax
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	cmpl	%eax, %edx
	jbe	.L5
	leaq	(%rsi,%rax,8), %rax
	vmulsd	(%rax), %xmm1, %xmm2
	vmovsd	%xmm2, (%rax)
.L5:
	addq	$8, %rdi
	cmpq	%r13, %rdi
	jne	.L7
	testl	%r8d, %r8d
	je	.L29
	movq	16(%rbp), %r12
	leal	-1(%r8), %eax
	leaq	8(,%r14,8), %rbx
	xorl	%r8d, %r8d
	leaq	8(%r12,%rax,8), %r13
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%r12), %r14
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L9:
	leaq	(%r14,%rsi), %rdi
	xorl	%eax, %eax
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%rdx, %rax
.L8:
	movq	(%r11,%rax,8), %rdx
	movq	(%r9,%rax,8), %rcx
	vmulsd	(%rdi), %xmm0, %xmm1
	addq	%rsi, %rdx
	vmovsd	(%rdx), %xmm4
	vfmadd132sd	(%rcx,%r8), %xmm4, %xmm1
	vmovsd	%xmm1, (%rdx)
	leaq	1(%rax), %rdx
	cmpq	%rax, %r10
	jne	.L13
	addq	$8, %rsi
	cmpq	%rsi, %rbx
	jne	.L9
	addq	$8, %r12
	addq	$8, %r8
	cmpq	%r12, %r13
	jne	.L10
.L29:
	vzeroupper
.L27:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L12:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE1538:
	.size	_Z5dgemmccjjjdPKPKdS2_dPPd, .-_Z5dgemmccjjjdPKPKdS2_dPPd
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd, @function
_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd:
.LFB2019:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE2019:
	.size	_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd, .-_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z5dgemmccjjjdPKPKdS2_dPPd
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
