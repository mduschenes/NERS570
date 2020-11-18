	.file	"matmul.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4,,15
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1295:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1295:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4,,15
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.4, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.4:
.LFB2733:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L10
	cmpb	$0, 56(%rbx)
	je	.L5
	movzbl	67(%rbx), %eax
.L6:
	movl	$_ZSt4cout, %edi
	movsbl	%al, %esi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv
.L5:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rdx
	je	.L6
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*%rdx
	jmp	.L6
.L10:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE2733:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.4, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"["
.LC1:
	.string	"]"
	.text
	.p2align 4,,15
	.globl	_Z12print_matrixPKPKdjj
	.type	_Z12print_matrixPKPKdjj, @function
_Z12print_matrixPKPKdjj:
.LFB2227:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	movl	$1, %edx
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	movl	$_ZSt4cout, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebx
	movl	$.LC0, %esi
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	testl	%ebx, %ebx
	je	.L20
	leal	-1(%rbx), %eax
	leaq	8(%rbp,%rax,8), %r14
	leal	-1(%r13), %eax
	leaq	8(,%rax,8), %r12
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$1, %edx
	movl	$.LC0, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	xorl	%ebx, %ebx
	testl	%r13d, %r13d
	je	.L17
	.p2align 4,,10
	.p2align 3
.L15:
	movq	0(%rbp), %rax
	movl	$_ZSt4cout, %edi
	vmovsd	(%rax,%rbx), %xmm0
	addq	$8, %rbx
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rdi
	movl	$1, %edx
	leaq	15(%rsp), %rsi
	movb	$32, 15(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	cmpq	%r12, %rbx
	jne	.L15
.L17:
	movl	$1, %edx
	movl	$.LC1, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L13
	cmpb	$0, 56(%rbx)
	je	.L18
	movsbl	67(%rbx), %esi
.L19:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	addq	$8, %rbp
	call	_ZNSo5flushEv
	cmpq	%r14, %rbp
	jne	.L21
.L20:
	movl	$1, %edx
	movl	$.LC1, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L13
	cmpb	$0, 56(%rbx)
	je	.L22
	movsbl	67(%rbx), %esi
.L23:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L19
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L19
.L22:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L23
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L23
.L13:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE2227:
	.size	_Z12print_matrixPKPKdjj, .-_Z12print_matrixPKPKdjj
	.p2align 4,,15
	.globl	_Z13delete_matrixPPdj
	.type	_Z13delete_matrixPPdj, @function
_Z13delete_matrixPPdj:
.LFB2228:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testl	%esi, %esi
	je	.L40
	leal	-1(%rsi), %eax
	movq	%rdi, %rbx
	leaq	8(%rdi,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L42:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L41
	call	_ZdaPv
.L41:
	addq	$8, %rbx
	cmpq	%rbp, %rbx
	jne	.L42
.L40:
	testq	%r12, %r12
	je	.L51
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%r12, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZdaPv
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2228:
	.size	_Z13delete_matrixPPdj, .-_Z13delete_matrixPPdj
	.p2align 4,,15
	.globl	_Z22generate_random_matrixjj
	.type	_Z22generate_random_matrixjj, @function
_Z22generate_random_matrixjj:
.LFB2229:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edi, %edi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	salq	$3, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	_Znam
	movq	%rax, 8(%rsp)
	testl	%ebx, %ebx
	je	.L66
	movq	%rax, %rcx
	movq	%rax, %r14
	leal	-1(%rbx), %eax
	movl	%ebp, %r12d
	leaq	8(%rcx,%rax,8), %r13
	leal	-1(%rbp), %eax
	salq	$3, %r12
	leaq	8(,%rax,8), %rbx
	.p2align 4,,10
	.p2align 3
.L57:
	movq	%r12, %rdi
	call	_Znam
	movq	%rax, (%r14)
	testl	%ebp, %ebp
	je	.L55
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L56:
	call	rand
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	movq	(%r14), %rdx
	vmulsd	.LC2(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%r15)
	addq	$8, %r15
	cmpq	%r15, %rbx
	jne	.L56
.L55:
	addq	$8, %r14
	cmpq	%r13, %r14
	jne	.L57
.L66:
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2229:
	.size	_Z22generate_random_matrixjj, .-_Z22generate_random_matrixjj
	.p2align 4,,15
	.globl	_Z20generate_zero_matrixjj
	.type	_Z20generate_zero_matrixjj, @function
_Z20generate_zero_matrixjj:
.LFB2230:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %edi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movl	%esi, %r15d
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	salq	$3, %rdi
	subq	$40, %rsp
	call	_Znam
	movq	%rax, 8(%rsp)
	testl	%ebx, %ebx
	je	.L85
	movl	%r15d, %r13d
	movq	%rax, %rdi
	leaq	0(,%r13,8), %rsi
	movq	%rax, %r13
	leal	-1(%rbx), %eax
	leaq	8(%rdi,%rax,8), %r14
	leal	-1(%r15), %eax
	movl	%r15d, %r12d
	movq	%rsi, 24(%rsp)
	movl	%eax, 20(%rsp)
	shrl	$2, %r12d
	movl	%r15d, %ebx
	salq	$5, %r12
	andl	$-4, %ebx
	.p2align 4,,10
	.p2align 3
.L74:
	movq	24(%rsp), %rdi
	call	_Znam
	movq	%rax, 0(%r13)
	testl	%r15d, %r15d
	je	.L70
	cmpl	$2, 20(%rsp)
	jbe	.L75
	movq	%rax, %rdx
	leaq	(%rax,%r12), %rcx
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L72:
	vmovupd	%ymm0, (%rdx)
	addq	$32, %rdx
	cmpq	%rcx, %rdx
	jne	.L72
	cmpl	%ebx, %r15d
	je	.L84
	movl	%ebx, %edx
	vzeroupper
.L71:
	movl	%edx, %ecx
	movq	$0x000000000, (%rax,%rcx,8)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %r15d
	jbe	.L70
	addl	$2, %edx
	movq	$0x000000000, (%rax,%rcx,8)
	cmpl	%edx, %r15d
	jbe	.L70
	movq	$0x000000000, (%rax,%rdx,8)
.L70:
	addq	$8, %r13
	cmpq	%r14, %r13
	jne	.L74
.L85:
	movq	8(%rsp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	.cfi_restore_state
	vzeroupper
	jmp	.L70
.L75:
	xorl	%edx, %edx
	jmp	.L71
	.cfi_endproc
.LFE2230:
	.size	_Z20generate_zero_matrixjj, .-_Z20generate_zero_matrixjj
	.p2align 4,,15
	.globl	_Z16compare_matricesPKPKdS2_jjd
	.type	_Z16compare_matricesPKPKdS2_jjd, @function
_Z16compare_matricesPKPKdS2_jjd:
.LFB2231:
	.cfi_startproc
	testl	%edx, %edx
	je	.L93
	leal	-1(%rdx), %r11d
	vmovq	.LC4(%rip), %xmm2
	leal	-1(%rcx), %edx
	salq	$3, %rdx
	xorl	%r10d, %r10d
.L92:
	testl	%ecx, %ecx
	je	.L89
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %r9
	vmovsd	(%r8), %xmm1
	vsubsd	(%r9), %xmm1, %xmm1
	vandpd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm0, %xmm1
	ja	.L95
	xorl	%eax, %eax
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L91:
	vmovsd	8(%r8,%rax), %xmm1
	vsubsd	8(%r9,%rax), %xmm1, %xmm1
	addq	$8, %rax
	vandpd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm0, %xmm1
	ja	.L95
.L90:
	cmpq	%rax, %rdx
	jne	.L91
.L89:
	leaq	1(%r10), %rax
	cmpq	%r10, %r11
	je	.L93
	movq	%rax, %r10
	jmp	.L92
	.p2align 4,,10
	.p2align 3
.L95:
	xorl	%eax, %eax
	ret
.L93:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE2231:
	.size	_Z16compare_matricesPKPKdS2_jjd, .-_Z16compare_matricesPKPKdS2_jjd
	.p2align 4,,15
	.globl	_Z14flatten_matrixPKPKdjj
	.type	_Z14flatten_matrixPKPKdjj, @function
_Z14flatten_matrixPKPKdjj:
.LFB2232:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	movl	%esi, %edi
	imull	%edx, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebx
	salq	$3, %rdi
	call	_Znam
	testl	%r12d, %r12d
	je	.L113
	testl	%ebx, %ebx
	je	.L113
	leal	-1(%r12), %edx
	leaq	8(,%rdx,8), %rsi
	movl	%ebx, %r9d
	xorl	%r8d, %r8d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L104:
	movq	%rbp, %rcx
	movl	%r10d, %edx
	.p2align 4,,10
	.p2align 3
.L103:
	movq	(%rcx), %rdi
	addq	$8, %rcx
	vmovsd	(%rdi,%r8), %xmm0
	movl	%edx, %edi
	incl	%edx
	vmovsd	%xmm0, (%rax,%rdi,8)
	cmpl	%edx, %r9d
	jne	.L103
	addq	$8, %r8
	addl	%ebx, %r10d
	addl	%ebx, %r9d
	cmpq	%r8, %rsi
	jne	.L104
.L113:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2232:
	.size	_Z14flatten_matrixPKPKdjj, .-_Z14flatten_matrixPKPKdjj
	.p2align 4,,15
	.globl	_Z10call_dgemmiiidPKPKdS2_dPPd
	.type	_Z10call_dgemmiiidPKPKdS2_dPPd, @function
_Z10call_dgemmiiidPKPKdS2_dPPd:
.LFB2233:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%edi, 28(%rsp)
	movl	%edx, %edi
	imull	%r14d, %edi
	movl	%esi, 24(%rsp)
	movl	%edx, 20(%rsp)
	salq	$3, %rdi
	vmovsd	%xmm0, 8(%rsp)
	vmovsd	%xmm1, (%rsp)
	call	_Znam
	movq	%rax, %rbx
	testl	%r15d, %r15d
	je	.L116
	testl	%r14d, %r14d
	je	.L116
	leal	-1(%r15), %eax
	leaq	8(,%rax,8), %rcx
	movl	%r14d, %r9d
	xorl	%r8d, %r8d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L118:
	movq	%r12, %rdx
	movl	%r10d, %eax
	.p2align 4,,10
	.p2align 3
.L117:
	movq	(%rdx), %rsi
	addq	$8, %rdx
	vmovsd	(%rsi,%r8), %xmm0
	movl	%eax, %esi
	incl	%eax
	vmovsd	%xmm0, (%rbx,%rsi,8)
	cmpl	%eax, %r9d
	jne	.L117
	addq	$8, %r8
	addl	%r14d, %r10d
	addl	%r14d, %r9d
	cmpq	%r8, %rcx
	jne	.L118
.L116:
	movl	28(%rsp), %r15d
	movl	20(%rsp), %r14d
	movl	%r15d, %edi
	imull	%r14d, %edi
	salq	$3, %rdi
	call	_Znam
	movq	%rax, %r12
	testl	%r15d, %r15d
	je	.L119
	testl	%r14d, %r14d
	je	.L119
	leal	-1(%r15), %eax
	leaq	8(,%rax,8), %r9
	movl	%r14d, %edi
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L121:
	movq	%r13, %rdx
	movl	%r8d, %eax
	.p2align 4,,10
	.p2align 3
.L120:
	movq	(%rdx), %rcx
	addq	$8, %rdx
	vmovsd	(%rcx,%rsi), %xmm0
	movl	%eax, %ecx
	incl	%eax
	vmovsd	%xmm0, (%r12,%rcx,8)
	cmpl	%eax, %edi
	jne	.L120
	addq	$8, %rsi
	addl	%r14d, %r8d
	addl	%r14d, %edi
	cmpq	%rsi, %r9
	jne	.L121
.L119:
	movl	24(%rsp), %r15d
	movl	28(%rsp), %r14d
	movl	%r15d, %edi
	imull	%r14d, %edi
	salq	$3, %rdi
	call	_Znam
	movq	%rax, %r13
	testl	%r15d, %r15d
	je	.L122
	testl	%r14d, %r14d
	je	.L122
	leal	-1(%r15), %eax
	leaq	8(,%rax,8), %r9
	movl	%r14d, %edi
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L124:
	movq	%rbp, %rcx
	movl	%r8d, %edx
	.p2align 4,,10
	.p2align 3
.L123:
	movq	(%rcx), %rax
	addq	$8, %rcx
	vmovsd	(%rax,%rsi), %xmm0
	movl	%edx, %eax
	incl	%edx
	vmovsd	%xmm0, 0(%r13,%rax,8)
	cmpl	%edx, %edi
	jne	.L123
	addq	$8, %rsi
	addl	%r14d, %r8d
	addl	%r14d, %edi
	cmpq	%rsi, %r9
	jne	.L124
.L122:
	movb	$110, 47(%rsp)
	leaq	28(%rsp), %rdx
	leaq	20(%rsp), %r8
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	pushq	%rdx
	.cfi_def_cfa_offset 128
	pushq	%r13
	.cfi_def_cfa_offset 136
	leaq	24(%rsp), %rax
	pushq	%rax
	.cfi_def_cfa_offset 144
	pushq	%r8
	.cfi_def_cfa_offset 152
	pushq	%r12
	.cfi_def_cfa_offset 160
	pushq	%rdx
	.cfi_def_cfa_offset 168
	pushq	%rbx
	.cfi_def_cfa_offset 176
	leaq	111(%rsp), %rsi
	leaq	72(%rsp), %r9
	leaq	88(%rsp), %rcx
	movq	%rsi, %rdi
	call	dgemm_
	movl	88(%rsp), %eax
	addq	$64, %rsp
	.cfi_def_cfa_offset 112
	testl	%eax, %eax
	je	.L125
	movl	28(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L125
	decl	%eax
	leaq	8(,%rax,8), %r10
	movl	%r9d, %edi
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%rbp, %rcx
	movl	%r8d, %edx
	.p2align 4,,10
	.p2align 3
.L126:
	movl	%edx, %eax
	vmovsd	0(%r13,%rax,8), %xmm0
	movq	(%rcx), %rax
	incl	%edx
	vmovsd	%xmm0, (%rax,%rsi)
	addq	$8, %rcx
	cmpl	%edx, %edi
	jne	.L126
	addq	$8, %rsi
	addl	%r9d, %r8d
	addl	%r9d, %edi
	cmpq	%r10, %rsi
	jne	.L127
.L125:
	movq	%rbx, %rdi
	call	_ZdaPv
	movq	%r12, %rdi
	call	_ZdaPv
	movq	%r13, %rdi
	call	_ZdaPv
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2233:
	.size	_Z10call_dgemmiiidPKPKdS2_dPPd, .-_Z10call_dgemmiiidPKPKdS2_dPPd
	.p2align 4,,15
	.globl	_Z7mydgemmccjjjdPKPKdS2_dPPd
	.type	_Z7mydgemmccjjjdPKPKdS2_dPPd, @function
_Z7mydgemmccjjjdPKPKdS2_dPPd:
.LFB2234:
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
	je	.L187
	testl	%edx, %edx
	je	.L187
	movl	%edx, %r12d
	leal	-1(%rcx), %eax
	shrl	$2, %r12d
	movl	%edx, %ebx
	movq	%r11, %rdi
	movq	%rax, %r10
	leaq	8(%r11,%rax,8), %r13
	leal	-1(%rdx), %r14d
	salq	$5, %r12
	andl	$-4, %ebx
	vbroadcastsd	%xmm1, %ymm3
	.p2align 4,,10
	.p2align 3
.L167:
	movq	(%rdi), %rsi
	cmpl	$2, %r14d
	jbe	.L172
	movq	%rsi, %rax
	leaq	(%r12,%rsi), %rcx
	.p2align 4,,10
	.p2align 3
.L164:
	vmulpd	(%rax), %ymm3, %ymm2
	addq	$32, %rax
	vmovupd	%ymm2, -32(%rax)
	cmpq	%rax, %rcx
	jne	.L164
	movl	%ebx, %eax
	cmpl	%ebx, %edx
	je	.L165
.L163:
	movl	%eax, %ecx
	leaq	(%rsi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	vmovsd	%xmm2, (%rcx)
	leal	1(%rax), %ecx
	cmpl	%ecx, %edx
	jbe	.L165
	leaq	(%rsi,%rcx,8), %rcx
	vmulsd	(%rcx), %xmm1, %xmm2
	addl	$2, %eax
	vmovsd	%xmm2, (%rcx)
	cmpl	%eax, %edx
	jbe	.L165
	leaq	(%rsi,%rax,8), %rax
	vmulsd	(%rax), %xmm1, %xmm2
	vmovsd	%xmm2, (%rax)
.L165:
	addq	$8, %rdi
	cmpq	%r13, %rdi
	jne	.L167
	testl	%r8d, %r8d
	je	.L189
	movq	16(%rbp), %r12
	leal	-1(%r8), %eax
	leaq	8(%r12,%rax,8), %r13
	leaq	8(,%r14,8), %rbx
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L170:
	movq	(%r12), %r14
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L169:
	leaq	(%r14,%rsi), %rdi
	xorl	%eax, %eax
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L173:
	movq	%rdx, %rax
.L168:
	movq	(%r11,%rax,8), %rdx
	vmulsd	(%rdi), %xmm0, %xmm1
	addq	%rsi, %rdx
	vmovsd	(%rdx), %xmm4
	movq	(%r9,%rax,8), %rcx
	vfmadd132sd	(%rcx,%r8), %xmm4, %xmm1
	vmovsd	%xmm1, (%rdx)
	leaq	1(%rax), %rdx
	cmpq	%rax, %r10
	jne	.L173
	addq	$8, %rsi
	cmpq	%rsi, %rbx
	jne	.L169
	addq	$8, %r12
	addq	$8, %r8
	cmpq	%r12, %r13
	jne	.L170
.L189:
	vzeroupper
.L187:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L172:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L163
	.cfi_endproc
.LFE2234:
	.size	_Z7mydgemmccjjjdPKPKdS2_dPPd, .-_Z7mydgemmccjjjdPKPKdS2_dPPd
	.section	.rodata.str1.1
.LC5:
	.string	" is an invalid size!"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	" Performing matrix-matrix multipliciation for SIZE="
	.section	.rodata.str1.1
.LC7:
	.string	" mydgemm took "
.LC9:
	.string	" seconds!"
.LC11:
	.string	"BLAS dgemm took "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB2235:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %edi
	jle	.L194
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, %rbx
	movl	%eax, %esi
	testl	%eax, %eax
	jle	.L191
	movl	$51, %edx
	movl	$.LC6, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%ebx, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	movl	%ebx, %esi
	movl	%ebx, %edi
	call	_Z22generate_random_matrixjj
	movl	%ebx, %esi
	movl	%ebx, %edi
	movq	%rax, %r14
	call	_Z22generate_random_matrixjj
	movl	%ebx, %esi
	movl	%ebx, %edi
	movq	%rax, %r13
	call	_Z20generate_zero_matrixjj
	movl	%ebx, %esi
	movl	%ebx, %edi
	movq	%rax, (%rsp)
	call	_Z20generate_zero_matrixjj
	movq	%rax, %r12
	call	clock
	movq	%rax, 8(%rsp)
	call	clock
	movq	%rax, %rbp
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.4
	movq	%rax, %r15
	movl	$.LC7, %esi
	movl	$14, %edx
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	(%r15), %rax
	subq	8(%rsp), %rbp
	movq	-24(%rax), %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	addq	%r15, %rdx
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movl	24(%rdx), %ecx
	movq	%r15, %rdi
	andl	$-261, %ecx
	movl	%ecx, %eax
	vmulsd	.LC8(%rip), %xmm0, %xmm0
	orb	$1, %ah
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rbp
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbp, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	call	clock
	movq	.LC10(%rip), %rcx
	movq	%r12, %r9
	vmovq	%rcx, %xmm1
	vmovapd	%xmm1, %xmm0
	movq	%r13, %r8
	movq	%r14, %rcx
	movl	%ebx, %edx
	movl	%ebx, %esi
	movl	%ebx, %edi
	movq	%rax, 8(%rsp)
	call	_Z10call_dgemmiiidPKPKdS2_dPPd
	call	clock
	movq	%rax, %rbp
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.4
	movq	%rax, %r15
	movl	$.LC11, %esi
	movl	$16, %edx
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	(%r15), %rax
	subq	8(%rsp), %rbp
	movq	-24(%rax), %rdx
	vxorpd	%xmm0, %xmm0, %xmm0
	addq	%r15, %rdx
	vcvtsi2sdq	%rbp, %xmm0, %xmm0
	movl	24(%rdx), %ecx
	movq	%r15, %rdi
	andl	$-261, %ecx
	movl	%ecx, %eax
	vmulsd	.LC8(%rip), %xmm0, %xmm0
	orb	$1, %ah
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rbp
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbp, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	movl	%ebx, %esi
	movq	%r14, %rdi
	call	_Z13delete_matrixPPdj
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	_Z13delete_matrixPPdj
	movq	(%rsp), %rdi
	movl	%ebx, %esi
	call	_Z13delete_matrixPPdj
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	_Z13delete_matrixPPdj
	xorl	%eax, %eax
	jmp	.L195
.L194:
	xorl	%esi, %esi
.L191:
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movq	%rax, %rbx
	movl	$20, %edx
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbx, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	movl	$1, %eax
.L195:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2235:
	.size	main, .-main
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z12print_matrixPKPKdjj, @function
_GLOBAL__sub_I__Z12print_matrixPKPKdjj:
.LFB2727:
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
.LFE2727:
	.size	_GLOBAL__sub_I__Z12print_matrixPKPKdjj, .-_GLOBAL__sub_I__Z12print_matrixPKPKdjj
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z12print_matrixPKPKdjj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2097152
	.long	1040187392
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	2696277389
	.long	1051772663
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
