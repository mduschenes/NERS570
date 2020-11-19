	.file	"matvec.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s = ["
.LC1:
	.string	"%s"
.LC2:
	.string	"      "
.LC3:
	.string	"%d"
.LC4:
	.string	" ]"
	.text
	.p2align 4,,15
	.type	printa.constprop.0, @function
printa.constprop.0:
.LFB4814:
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
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC0(%rip), %rsi
	movl	%edi, %ebp
	movl	$1, %edi
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movb	$0, 23(%rsp)
	call	__printf_chk@PLT
	testl	%ebp, %ebp
	jle	.L2
	leal	-1(%rbp), %r13d
	xorl	%ebx, %ebx
	leaq	23(%rsp), %r14
	movq	%r13, %rbp
	addq	$1, %r13
	movq	%r13, %rax
	andl	$3, %eax
	je	.L7
	cmpq	$1, %rax
	je	.L31
	cmpq	$2, %rax
	je	.L32
	movl	$32, %edi
	vcvttsd2si	(%r12), %ebx
	call	putchar@PLT
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%ebx, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%ebp, %ebp
	je	.L62
	movl	$10, %edi
	call	putchar@PLT
.L39:
	movl	$1, %ebx
.L32:
	testq	%rbx, %rbx
	vcvttsd2si	(%r12,%rbx,8), %ecx
	movl	%ebx, %r15d
	movl	%ecx, 12(%rsp)
	jne	.L40
	movl	$32, %edi
	call	putchar@PLT
	movl	12(%rsp), %edx
.L41:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r15d
	je	.L63
	movl	$10, %edi
	call	putchar@PLT
.L43:
	addq	$1, %rbx
.L31:
	testq	%rbx, %rbx
	vcvttsd2si	(%r12,%rbx,8), %esi
	movl	%ebx, %r15d
	movl	%esi, 12(%rsp)
	jne	.L44
	movl	$32, %edi
	call	putchar@PLT
	movl	12(%rsp), %edi
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L44:
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %edi
.L45:
	leaq	.LC3(%rip), %rsi
	movl	%edi, %edx
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r15d
	je	.L64
	movl	$10, %edi
	call	putchar@PLT
.L47:
	addq	$1, %rbx
	cmpq	%rbx, %r13
	je	.L2
.L7:
	testq	%rbx, %rbx
	vcvttsd2si	(%r12,%rbx,8), %r8d
	movl	%ebx, %r15d
	movl	%r8d, 12(%rsp)
	jne	.L65
	movl	$32, %edi
	call	putchar@PLT
	movl	12(%rsp), %r9d
.L4:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r9d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r15d
	je	.L5
	movl	$10, %edi
	call	putchar@PLT
.L6:
	addq	$1, %rbx
	testq	%rbx, %rbx
	vcvttsd2si	(%r12,%rbx,8), %r10d
	movl	%ebx, %r15d
	jne	.L66
	movl	$32, %edi
	movl	%r10d, 12(%rsp)
	call	putchar@PLT
	movl	12(%rsp), %r11d
.L48:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r11d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r15d
	je	.L67
	movl	$10, %edi
	call	putchar@PLT
.L50:
	leaq	1(%rbx), %rax
	testq	%rax, %rax
	vcvttsd2si	(%r12,%rax,8), %ecx
	movl	%eax, %r15d
	movl	%ecx, 12(%rsp)
	jne	.L51
	movl	$32, %edi
	call	putchar@PLT
	movl	12(%rsp), %edx
.L52:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r15d
	je	.L68
	movl	$10, %edi
	call	putchar@PLT
.L54:
	leaq	2(%rbx), %rsi
	testq	%rsi, %rsi
	vcvttsd2si	(%r12,%rsi,8), %edi
	movl	%esi, %r15d
	movl	%edi, 12(%rsp)
	jne	.L55
	movl	$32, %edi
	call	putchar@PLT
	movl	12(%rsp), %r8d
.L56:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r8d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebp, %r15d
	je	.L69
	movl	$10, %edi
	call	putchar@PLT
.L58:
	addq	$3, %rbx
	cmpq	%rbx, %r13
	jne	.L7
.L2:
	movl	$10, %edi
	call	putchar@PLT
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L70
	addq	$40, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %r8d
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L51:
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %edx
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L66:
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%r10d, 12(%rsp)
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %r11d
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L65:
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %r9d
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	.LC1(%rip), %rsi
	movq	%r14, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %edx
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L5:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L67:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L68:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L69:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L64:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L62:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L63:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L43
.L70:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4814:
	.size	printa.constprop.0, .-printa.constprop.0
	.p2align 4,,15
	.globl	position
	.type	position, @function
position:
.LFB4801:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	testl	%esi, %esi
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
	movl	%edi, -52(%rbp)
	movq	%rcx, -64(%rbp)
	jle	.L137
	xorl	%r11d, %r11d
	leal	-1(%rsi), %eax
	xorl	%r12d, %r12d
	addl	$1, %r11d
	movq	%rdx, %rdi
	leaq	4(%rdx), %r9
	cmpl	%r11d, %esi
	movl	%eax, -56(%rbp)
	vpxor	%xmm2, %xmm2, %xmm2
	je	.L73
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%r9, %r15
	movl	-56(%rbp), %r14d
	movl	%esi, %ebx
	shrq	$2, %r15
	subl	%r11d, %ebx
	movl	$12, %r13d
	negq	%r15
	andl	$7, %r15d
	leal	7(%r15), %r8d
	cmpl	$12, %r8d
	cmovb	%r13d, %r8d
	subl	%r11d, %r14d
	cmpl	%r14d, %r8d
	ja	.L80
	testl	%r15d, %r15d
	je	.L81
	cmpl	$1, %r15d
	movl	(%r9), %r8d
	leal	2(%r12), %eax
	je	.L75
	cltq
	imull	(%rdi,%rax,4), %r8d
	cmpl	$2, %r15d
	leal	3(%r12), %eax
	je	.L75
	cltq
	imull	(%rdi,%rax,4), %r8d
	cmpl	$3, %r15d
	leal	4(%r12), %eax
	je	.L75
	cltq
	imull	(%rdi,%rax,4), %r8d
	cmpl	$4, %r15d
	leal	5(%r12), %eax
	je	.L75
	cltq
	imull	(%rdi,%rax,4), %r8d
	cmpl	$5, %r15d
	leal	6(%r12), %eax
	je	.L75
	cltq
	imull	(%rdi,%rax,4), %r8d
	cmpl	$7, %r15d
	leal	7(%r12), %eax
	jne	.L75
	cltq
	imull	(%rdi,%rax,4), %r8d
	leal	8(%r12), %eax
.L75:
	subl	%r15d, %ebx
	leaq	1(%r12), %r13
	movl	$1, %ecx
	movl	%ebx, %r14d
	shrl	$3, %r14d
	addq	%r13, %r15
	leal	-1(%r14), %r10d
	leaq	(%rdi,%r15,4), %r15
	andl	$7, %r10d
	cmpl	%r14d, %ecx
	vmovdqa	(%r15), %ymm0
	leaq	32(%r15), %rdx
	jnb	.L134
	testl	%r10d, %r10d
	je	.L77
	cmpl	$1, %r10d
	je	.L116
	cmpl	$2, %r10d
	je	.L117
	cmpl	$3, %r10d
	je	.L118
	cmpl	$4, %r10d
	je	.L119
	cmpl	$5, %r10d
	je	.L120
	cmpl	$6, %r10d
	jne	.L139
.L121:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rdx
.L120:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rdx
.L119:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rdx
.L118:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rdx
.L117:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rdx
.L116:
	addl	$1, %ecx
	vpmulld	(%rdx), %ymm0, %ymm0
	addq	$32, %rdx
	cmpl	%r14d, %ecx
	jnb	.L134
.L77:
	addl	$8, %ecx
	vpmulld	(%rdx), %ymm0, %ymm1
	addq	$256, %rdx
	vpmulld	-224(%rdx), %ymm1, %ymm3
	vpmulld	-192(%rdx), %ymm3, %ymm4
	vpmulld	-160(%rdx), %ymm4, %ymm5
	vpmulld	-128(%rdx), %ymm5, %ymm6
	vpmulld	-96(%rdx), %ymm6, %ymm7
	vpmulld	-64(%rdx), %ymm7, %ymm8
	vpmulld	-32(%rdx), %ymm8, %ymm0
	cmpl	%r14d, %ecx
	jb	.L77
.L134:
	vperm2i128	$33, %ymm2, %ymm0, %ymm9
	movl	%ebx, %r15d
	andl	$-8, %r15d
	addl	%r15d, %eax
	vpmulld	%ymm9, %ymm0, %ymm10
	vperm2i128	$33, %ymm2, %ymm10, %ymm11
	vpalignr	$8, %ymm10, %ymm11, %ymm12
	vpmulld	%ymm12, %ymm10, %ymm13
	vperm2i128	$33, %ymm2, %ymm13, %ymm14
	vpalignr	$4, %ymm13, %ymm14, %ymm15
	vpmulld	%ymm15, %ymm13, %ymm0
	vmovd	%xmm0, %r14d
	imull	%r14d, %r8d
	cmpl	%r15d, %ebx
	je	.L78
.L74:
	leal	1(%rax), %ecx
	movslq	%eax, %r10
	imull	(%rdi,%r10,4), %r8d
	cmpl	%ecx, %esi
	jle	.L78
	leal	2(%rax), %ebx
	movslq	%ecx, %rdx
	imull	(%rdi,%rdx,4), %r8d
	cmpl	%ebx, %esi
	jle	.L78
	leal	3(%rax), %r15d
	movslq	%ebx, %r14
	imull	(%rdi,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L78
	leal	4(%rax), %ecx
	movslq	%r15d, %r10
	imull	(%rdi,%r10,4), %r8d
	cmpl	%ecx, %esi
	jle	.L78
	leal	5(%rax), %ebx
	movslq	%ecx, %rdx
	imull	(%rdi,%rdx,4), %r8d
	cmpl	%ebx, %esi
	jle	.L78
	leal	6(%rax), %r15d
	movslq	%ebx, %r14
	imull	(%rdi,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L78
	leal	7(%rax), %ecx
	movslq	%r15d, %r10
	imull	(%rdi,%r10,4), %r8d
	cmpl	%ecx, %esi
	jle	.L78
	leal	8(%rax), %ebx
	movslq	%ecx, %rdx
	imull	(%rdi,%rdx,4), %r8d
	cmpl	%ebx, %esi
	jle	.L78
	leal	9(%rax), %r15d
	movslq	%ebx, %r14
	imull	(%rdi,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L78
	leal	10(%rax), %ecx
	movslq	%r15d, %r10
	imull	(%rdi,%r10,4), %r8d
	cmpl	%ecx, %esi
	jle	.L78
	leal	11(%rax), %ebx
	movslq	%ecx, %rdx
	imull	(%rdi,%rdx,4), %r8d
	cmpl	%ebx, %esi
	jle	.L78
	leal	12(%rax), %r15d
	movslq	%ebx, %r14
	imull	(%rdi,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L78
	movslq	%r15d, %r10
	addl	$13, %eax
	imull	(%rdi,%r10,4), %r8d
	cmpl	%eax, %esi
	jle	.L78
	cltq
	imull	(%rdi,%rax,4), %r8d
	.p2align 4,,10
	.p2align 3
.L78:
	movl	-52(%rbp), %eax
	addl	$1, %r11d
	cltd
	idivl	%r8d
	movq	-64(%rbp), %r8
	cltd
	idivl	-4(%r9)
	addq	$4, %r9
	cmpl	%r11d, %esi
	movl	%edx, (%r8,%r12,4)
	movq	%r13, %r12
	jne	.L140
.L73:
	movl	-56(%rbp), %ecx
	movl	-52(%rbp), %eax
	movq	-64(%rbp), %rbx
	cltd
	idivl	(%rdi,%rcx,4)
	movl	%edx, (%rbx,%rcx,4)
	vzeroupper
.L137:
	popq	%rbx
	popq	%rsi
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rsi), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	movl	%r11d, %eax
	movl	$1, %r8d
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L139:
	vpmulld	32(%r15), %ymm0, %ymm0
	movl	$2, %ecx
	leaq	64(%r15), %rdx
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L80:
	movl	%r11d, %eax
	movl	$1, %r8d
	leaq	1(%r12), %r13
	jmp	.L74
	.cfi_endproc
.LFE4801:
	.size	position, .-position
	.p2align 4,,15
	.globl	lorder
	.type	lorder, @function
lorder:
.LFB4802:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	testl	%edi, %edi
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
	movq	%rsi, -56(%rbp)
	jle	.L150
	xorl	%r10d, %r10d
	leal	-1(%rdi), %eax
	xorl	%ebx, %ebx
	addl	$1, %r10d
	leaq	4(%rdx), %r12
	movl	$0, -60(%rbp)
	cmpl	%r10d, %edi
	movl	%eax, -64(%rbp)
	vpxor	%xmm2, %xmm2, %xmm2
	je	.L143
	.p2align 4,,10
	.p2align 3
.L211:
	movq	%r12, %r9
	movl	-64(%rbp), %r13d
	movl	%edi, %r11d
	shrq	$2, %r9
	subl	%r10d, %r11d
	movl	$12, %esi
	negq	%r9
	andl	$7, %r9d
	leal	7(%r9), %r8d
	cmpl	$12, %r8d
	cmovb	%esi, %r8d
	subl	%r10d, %r13d
	cmpl	%r13d, %r8d
	ja	.L151
	testl	%r9d, %r9d
	je	.L152
	cmpl	$1, %r9d
	movl	(%r12), %r8d
	leal	2(%rbx), %eax
	je	.L145
	cltq
	imull	(%rdx,%rax,4), %r8d
	cmpl	$2, %r9d
	leal	3(%rbx), %eax
	je	.L145
	cltq
	imull	(%rdx,%rax,4), %r8d
	cmpl	$3, %r9d
	leal	4(%rbx), %eax
	je	.L145
	cltq
	imull	(%rdx,%rax,4), %r8d
	cmpl	$4, %r9d
	leal	5(%rbx), %eax
	je	.L145
	cltq
	imull	(%rdx,%rax,4), %r8d
	cmpl	$5, %r9d
	leal	6(%rbx), %eax
	je	.L145
	cltq
	imull	(%rdx,%rax,4), %r8d
	cmpl	$7, %r9d
	leal	7(%rbx), %eax
	jne	.L145
	cltq
	imull	(%rdx,%rax,4), %r8d
	leal	8(%rbx), %eax
.L145:
	subl	%r9d, %r11d
	leaq	1(%rbx), %r14
	movl	$1, %esi
	movl	%r11d, %r13d
	addq	%r14, %r9
	shrl	$3, %r13d
	leaq	(%rdx,%r9,4), %r15
	leal	-1(%r13), %r9d
	andl	$7, %r9d
	cmpl	%r13d, %esi
	vmovdqa	(%r15), %ymm0
	leaq	32(%r15), %rcx
	jnb	.L205
	testl	%r9d, %r9d
	je	.L147
	cmpl	$1, %r9d
	je	.L187
	cmpl	$2, %r9d
	je	.L188
	cmpl	$3, %r9d
	je	.L189
	cmpl	$4, %r9d
	je	.L190
	cmpl	$5, %r9d
	je	.L191
	cmpl	$6, %r9d
	jne	.L210
.L192:
	vpmulld	(%rcx), %ymm0, %ymm0
	addl	$1, %esi
	addq	$32, %rcx
.L191:
	vpmulld	(%rcx), %ymm0, %ymm0
	addl	$1, %esi
	addq	$32, %rcx
.L190:
	vpmulld	(%rcx), %ymm0, %ymm0
	addl	$1, %esi
	addq	$32, %rcx
.L189:
	vpmulld	(%rcx), %ymm0, %ymm0
	addl	$1, %esi
	addq	$32, %rcx
.L188:
	vpmulld	(%rcx), %ymm0, %ymm0
	addl	$1, %esi
	addq	$32, %rcx
.L187:
	addl	$1, %esi
	vpmulld	(%rcx), %ymm0, %ymm0
	addq	$32, %rcx
	cmpl	%r13d, %esi
	jnb	.L205
.L147:
	addl	$8, %esi
	vpmulld	(%rcx), %ymm0, %ymm1
	addq	$256, %rcx
	vpmulld	-224(%rcx), %ymm1, %ymm3
	vpmulld	-192(%rcx), %ymm3, %ymm4
	vpmulld	-160(%rcx), %ymm4, %ymm5
	vpmulld	-128(%rcx), %ymm5, %ymm6
	vpmulld	-96(%rcx), %ymm6, %ymm7
	vpmulld	-64(%rcx), %ymm7, %ymm8
	vpmulld	-32(%rcx), %ymm8, %ymm0
	cmpl	%r13d, %esi
	jb	.L147
.L205:
	vperm2i128	$33, %ymm2, %ymm0, %ymm9
	movl	%r11d, %r15d
	andl	$-8, %r15d
	addl	%r15d, %eax
	vpmulld	%ymm9, %ymm0, %ymm10
	vperm2i128	$33, %ymm2, %ymm10, %ymm11
	vpalignr	$8, %ymm10, %ymm11, %ymm12
	vpmulld	%ymm12, %ymm10, %ymm13
	vperm2i128	$33, %ymm2, %ymm13, %ymm14
	vpalignr	$4, %ymm13, %ymm14, %ymm15
	vpmulld	%ymm15, %ymm13, %ymm0
	vmovd	%xmm0, %r13d
	imull	%r13d, %r8d
	cmpl	%r15d, %r11d
	je	.L148
.L144:
	leal	1(%rax), %esi
	movslq	%eax, %r9
	imull	(%rdx,%r9,4), %r8d
	cmpl	%esi, %edi
	jle	.L148
	leal	2(%rax), %r11d
	movslq	%esi, %rcx
	imull	(%rdx,%rcx,4), %r8d
	cmpl	%r11d, %edi
	jle	.L148
	leal	3(%rax), %r15d
	movslq	%r11d, %r13
	imull	(%rdx,%r13,4), %r8d
	cmpl	%r15d, %edi
	jle	.L148
	leal	4(%rax), %esi
	movslq	%r15d, %r9
	imull	(%rdx,%r9,4), %r8d
	cmpl	%esi, %edi
	jle	.L148
	leal	5(%rax), %r11d
	movslq	%esi, %rcx
	imull	(%rdx,%rcx,4), %r8d
	cmpl	%r11d, %edi
	jle	.L148
	leal	6(%rax), %r15d
	movslq	%r11d, %r13
	imull	(%rdx,%r13,4), %r8d
	cmpl	%r15d, %edi
	jle	.L148
	leal	7(%rax), %esi
	movslq	%r15d, %r9
	imull	(%rdx,%r9,4), %r8d
	cmpl	%esi, %edi
	jle	.L148
	leal	8(%rax), %r11d
	movslq	%esi, %rcx
	imull	(%rdx,%rcx,4), %r8d
	cmpl	%r11d, %edi
	jle	.L148
	leal	9(%rax), %r15d
	movslq	%r11d, %r13
	imull	(%rdx,%r13,4), %r8d
	cmpl	%r15d, %edi
	jle	.L148
	leal	10(%rax), %esi
	movslq	%r15d, %r9
	imull	(%rdx,%r9,4), %r8d
	cmpl	%esi, %edi
	jle	.L148
	leal	11(%rax), %r11d
	movslq	%esi, %rcx
	imull	(%rdx,%rcx,4), %r8d
	cmpl	%r11d, %edi
	jle	.L148
	leal	12(%rax), %r15d
	movslq	%r11d, %r13
	imull	(%rdx,%r13,4), %r8d
	cmpl	%r15d, %edi
	jle	.L148
	movslq	%r15d, %r9
	addl	$13, %eax
	imull	(%rdx,%r9,4), %r8d
	cmpl	%eax, %edi
	jle	.L148
	cltq
	imull	(%rdx,%rax,4), %r8d
	.p2align 4,,10
	.p2align 3
.L148:
	movq	-56(%rbp), %rax
	addl	$1, %r10d
	addq	$4, %r12
	imull	(%rax,%rbx,4), %r8d
	movq	%r14, %rbx
	addl	%r8d, -60(%rbp)
	cmpl	%r10d, %edi
	jne	.L211
.L143:
	movl	-64(%rbp), %edx
	movq	-56(%rbp), %rdi
	movl	-60(%rbp), %eax
	addl	(%rdi,%rdx,4), %eax
	vzeroupper
	popq	%rbx
	popq	%rcx
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rcx), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L152:
	.cfi_restore_state
	movl	%r10d, %eax
	movl	$1, %r8d
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L210:
	vpmulld	32(%r15), %ymm0, %ymm0
	movl	$2, %esi
	leaq	64(%r15), %rcx
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L151:
	movl	%r10d, %eax
	movl	$1, %r8d
	leaq	1(%rbx), %r14
	jmp	.L144
	.p2align 4,,10
	.p2align 3
.L150:
	popq	%rbx
	popq	%rcx
	.cfi_def_cfa 10, 0
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rcx), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4802:
	.size	lorder, .-lorder
	.p2align 4,,15
	.globl	zorder
	.type	zorder, @function
zorder:
.LFB4803:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movslq	%edi, %rax
	salq	$2, %rax
	leal	-1(%rdi), %r11d
	movl	$9, %ecx
	pushq	-8(%r10)
	pushq	%rbp
	movslq	%r11d, %r8
	vpxor	%xmm8, %xmm8, %xmm8
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leal	-2(%rdi), %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-32(%rsi,%rax), %rbx
	movslq	%r12d, %r13
	leal	-5(%rdi), %r12d
	leal	-3(%rdi), %r15d
	shrq	$2, %rbx
	leaq	(%rsi,%r13,4), %r14
	leaq	(%rsi,%r8,4), %r9
	andl	$7, %ebx
	movslq	%r12d, %r13
	movslq	%r15d, %r10
	leal	7(%rbx), %edx
	leal	-6(%rdi), %r15d
	cmpl	$9, %edx
	movq	%r14, -80(%rbp)
	leaq	(%rsi,%r13,4), %r14
	cmovnb	%edx, %ecx
	movq	%r9, -72(%rbp)
	leaq	(%rsi,%r10,4), %rdx
	movl	%ecx, -56(%rbp)
	leal	-4(%rdi), %ecx
	movq	%r14, -104(%rbp)
	movl	%ebx, %r14d
	movslq	%r15d, %r10
	movl	%edi, %r13d
	movslq	%ecx, %r8
	leal	-7(%rdi), %ecx
	notq	%r14
	leaq	(%rsi,%r8,4), %r9
	subl	%ebx, %r13d
	leaq	-28(%rax,%r14,4), %r14
	movslq	%ecx, %r8
	movq	%rdx, -88(%rbp)
	leaq	(%rsi,%r10,4), %rdx
	movq	%r9, -96(%rbp)
	leaq	(%rsi,%r8,4), %r9
	movl	%r13d, %r12d
	movl	%r13d, -60(%rbp)
	vmovdqa	.LC6(%rip), %ymm9
	andl	$-8, %r13d
	vmovdqa	.LC7(%rip), %ymm7
	movq	%rdx, -112(%rbp)
	shrl	$3, %r12d
	vmovdqa	.LC8(%rip), %ymm6
	movq	%r9, -120(%rbp)
	addq	%rsi, %r14
	movl	%r13d, -64(%rbp)
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L213:
	testl	%edi, %edi
	leal	1(%rdx), %r13d
	jle	.L221
	movl	$1, %r8d
	movl	%edx, %ecx
	sall	%cl, %r8d
	cmpl	-56(%rbp), %r11d
	jb	.L222
	testl	%ebx, %ebx
	je	.L223
	movq	-72(%rbp), %r15
	movl	(%r15), %r10d
	andl	%r8d, %r10d
	sall	%cl, %r10d
	orl	%r10d, %eax
	cmpl	$1, %ebx
	je	.L224
	movq	-80(%rbp), %r13
	movl	0(%r13), %r9d
	leal	1(%rdx), %r13d
	movl	%r13d, %ecx
	andl	%r8d, %r9d
	sall	%cl, %r9d
	orl	%r9d, %eax
	cmpl	$2, %ebx
	je	.L225
	movq	-88(%rbp), %r15
	leal	2(%rdx), %ecx
	movl	(%r15), %r10d
	andl	%r8d, %r10d
	sall	%cl, %r10d
	orl	%r10d, %eax
	cmpl	$3, %ebx
	je	.L226
	movq	-96(%rbp), %r9
	leal	3(%rdx), %ecx
	movl	(%r9), %r15d
	andl	%r8d, %r15d
	sall	%cl, %r15d
	orl	%r15d, %eax
	cmpl	$4, %ebx
	je	.L227
	movq	-104(%rbp), %r10
	leal	4(%rdx), %ecx
	movl	(%r10), %r9d
	andl	%r8d, %r9d
	sall	%cl, %r9d
	orl	%r9d, %eax
	cmpl	$5, %ebx
	je	.L228
	movq	-112(%rbp), %r15
	leal	5(%rdx), %ecx
	movl	(%r15), %r10d
	andl	%r8d, %r10d
	sall	%cl, %r10d
	orl	%r10d, %eax
	cmpl	$7, %ebx
	jne	.L229
	movq	-120(%rbp), %r9
	leal	6(%rdx), %ecx
	movl	(%r9), %r15d
	andl	%r8d, %r15d
	sall	%cl, %r15d
	movl	$7, %ecx
	orl	%r15d, %eax
.L215:
	vpermd	(%r14), %ymm6, %ymm1
	leal	-1(%r12), %r15d
	movl	$1, %r10d
	movl	%ecx, -52(%rbp)
	leaq	-32(%r14), %r9
	vpbroadcastd	-52(%rbp), %ymm0
	movl	%r8d, -52(%rbp)
	andl	$3, %r15d
	vpbroadcastd	-52(%rbp), %ymm5
	movl	%edx, -52(%rbp)
	cmpl	%r12d, %r10d
	vpbroadcastd	-52(%rbp), %ymm4
	vpaddd	%ymm9, %ymm0, %ymm3
	vpaddd	%ymm7, %ymm3, %ymm0
	vpand	%ymm5, %ymm1, %ymm10
	vpaddd	%ymm4, %ymm3, %ymm2
	vpsllvd	%ymm2, %ymm10, %ymm1
	jnb	.L247
	testl	%r15d, %r15d
	je	.L217
	cmpl	$1, %r15d
	je	.L242
	cmpl	$2, %r15d
	je	.L243
	vpermd	-32(%r14), %ymm6, %ymm11
	vpaddd	%ymm4, %ymm0, %ymm13
	leaq	-64(%r14), %r9
	movl	$2, %r10d
	vpaddd	%ymm7, %ymm0, %ymm0
	vpand	%ymm5, %ymm11, %ymm12
	vpsllvd	%ymm13, %ymm12, %ymm14
	vpor	%ymm14, %ymm1, %ymm1
.L243:
	vpermd	(%r9), %ymm6, %ymm15
	vpaddd	%ymm4, %ymm0, %ymm10
	addl	$1, %r10d
	subq	$32, %r9
	vpaddd	%ymm7, %ymm0, %ymm0
	vpand	%ymm5, %ymm15, %ymm3
	vpsllvd	%ymm10, %ymm3, %ymm2
	vpor	%ymm2, %ymm1, %ymm1
.L242:
	vpermd	(%r9), %ymm6, %ymm11
	addl	$1, %r10d
	subq	$32, %r9
	cmpl	%r12d, %r10d
	vpaddd	%ymm4, %ymm0, %ymm13
	vpaddd	%ymm7, %ymm0, %ymm0
	vpand	%ymm5, %ymm11, %ymm12
	vpsllvd	%ymm13, %ymm12, %ymm14
	vpor	%ymm14, %ymm1, %ymm1
	jnb	.L247
.L217:
	vpermd	(%r9), %ymm6, %ymm3
	vpaddd	%ymm4, %ymm0, %ymm2
	vpaddd	%ymm7, %ymm0, %ymm15
	vpaddd	%ymm7, %ymm15, %ymm13
	vpaddd	%ymm4, %ymm15, %ymm0
	addl	$4, %r10d
	vpermd	-32(%r9), %ymm6, %ymm14
	addq	$-128, %r9
	vpand	%ymm5, %ymm3, %ymm10
	vpermd	64(%r9), %ymm6, %ymm3
	vpsllvd	%ymm2, %ymm10, %ymm11
	vpor	%ymm11, %ymm1, %ymm12
	vpaddd	%ymm4, %ymm13, %ymm2
	vpand	%ymm5, %ymm14, %ymm1
	vpaddd	%ymm7, %ymm13, %ymm11
	vpsllvd	%ymm0, %ymm1, %ymm15
	vpermd	32(%r9), %ymm6, %ymm1
	cmpl	%r12d, %r10d
	vpor	%ymm15, %ymm12, %ymm10
	vpaddd	%ymm4, %ymm11, %ymm15
	vpand	%ymm5, %ymm3, %ymm12
	vpand	%ymm5, %ymm1, %ymm0
	vpsllvd	%ymm2, %ymm12, %ymm13
	vpor	%ymm13, %ymm10, %ymm14
	vpsllvd	%ymm15, %ymm0, %ymm10
	vpaddd	%ymm7, %ymm11, %ymm0
	vpor	%ymm10, %ymm14, %ymm1
	jb	.L217
.L247:
	vperm2i128	$33, %ymm8, %ymm1, %ymm5
	movl	-64(%rbp), %r10d
	vpor	%ymm5, %ymm1, %ymm4
	leal	(%rcx,%r10), %r9d
	vperm2i128	$33, %ymm8, %ymm4, %ymm11
	vpalignr	$8, %ymm4, %ymm11, %ymm3
	vpor	%ymm3, %ymm4, %ymm12
	vperm2i128	$33, %ymm8, %ymm12, %ymm2
	vpalignr	$4, %ymm12, %ymm2, %ymm13
	vpor	%ymm13, %ymm12, %ymm14
	vmovd	%xmm14, %r15d
	orl	%r15d, %eax
	cmpl	%r10d, -60(%rbp)
	je	.L221
.L214:
	movl	%r11d, %ecx
	subl	%r9d, %ecx
	movslq	%ecx, %r15
	leal	(%rdx,%r9), %ecx
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	sall	%cl, %r10d
	leal	1(%r9), %ecx
	orl	%r10d, %eax
	cmpl	%edi, %ecx
	jge	.L221
	movl	%r11d, %r15d
	subl	%ecx, %r15d
	addl	%edx, %ecx
	movslq	%r15d, %r10
	movl	(%rsi,%r10,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	2(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	3(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	4(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	5(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	6(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	7(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	8(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	9(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	10(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	11(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	12(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r10d
	subl	%ecx, %r10d
	addl	%edx, %ecx
	movslq	%r10d, %r15
	movl	(%rsi,%r15,4), %r10d
	andl	%r8d, %r10d
	movl	%r10d, %r15d
	sall	%cl, %r15d
	leal	13(%r9), %ecx
	orl	%r15d, %eax
	cmpl	%ecx, %edi
	jle	.L221
	movl	%r11d, %r9d
	subl	%ecx, %r9d
	addl	%edx, %ecx
	movslq	%r9d, %r10
	andl	(%rsi,%r10,4), %r8d
	sall	%cl, %r8d
	orl	%r8d, %eax
	.p2align 4,,10
	.p2align 3
.L221:
	cmpl	$32, %r13d
	movl	%r13d, %edx
	jne	.L213
	vzeroupper
	popq	%rbx
	popq	%rsi
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rsi), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L224:
	.cfi_restore_state
	movl	$1, %ecx
	leal	1(%rdx), %r13d
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L223:
	xorl	%ecx, %ecx
	leal	1(%rdx), %r13d
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L225:
	movl	$2, %ecx
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L222:
	xorl	%r9d, %r9d
	leal	1(%rdx), %r13d
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L226:
	movl	$3, %ecx
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L227:
	movl	$4, %ecx
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L228:
	movl	$5, %ecx
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L229:
	movl	$6, %ecx
	jmp	.L215
	.cfi_endproc
.LFE4803:
	.size	zorder, .-zorder
	.p2align 4,,15
	.globl	z_order
	.type	z_order, @function
z_order:
.LFB4804:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movslq	%esi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	leaq	0(,%r12,4), %r14
	pushq	%rbx
	subq	$160, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdx, -200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	18(%r14), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r12
	subq	%rax, %rsp
	leaq	3(%rsp), %rcx
	shrq	$2, %rcx
	testl	%esi, %esi
	leaq	0(,%rcx,4), %rdx
	movq	%rdx, -168(%rbp)
	jle	.L253
	shrq	$2, %rdx
	leal	-1(%rsi), %r15d
	movl	$12, %r8d
	movq	%rdx, %r9
	negq	%r9
	andl	$7, %r9d
	leal	7(%r9), %r11d
	cmpl	$12, %r11d
	cmovb	%r8d, %r11d
	cmpl	%r11d, %r15d
	jb	.L281
	testl	%r9d, %r9d
	je	.L282
	cmpl	$1, %r9d
	movl	%edi, 0(,%rcx,4)
	je	.L283
	movl	%edi, %eax
	movl	%edi, 4(,%rcx,4)
	imull	%edi, %eax
	cmpl	$2, %r9d
	je	.L284
	movl	%edi, 8(,%rcx,4)
	imull	%edi, %eax
	cmpl	$3, %r9d
	je	.L285
	movl	%edi, 12(,%rcx,4)
	imull	%edi, %eax
	cmpl	$4, %r9d
	je	.L286
	movl	%edi, 16(,%rcx,4)
	imull	%edi, %eax
	cmpl	$5, %r9d
	je	.L287
	movl	%edi, 20(,%rcx,4)
	imull	%edi, %eax
	cmpl	$7, %r9d
	jne	.L288
	movl	%edi, 24(,%rcx,4)
	movl	$7, %r13d
	imull	%edi, %eax
.L255:
	movl	%esi, %r11d
	movq	-168(%rbp), %rdx
	movl	%edi, -68(%rbp)
	subl	%r9d, %r11d
	vpbroadcastd	-68(%rbp), %ymm1
	movl	$1, %r8d
	movl	%r11d, %ecx
	shrl	$3, %ecx
	leaq	(%rdx,%r9,4), %rbx
	vmovdqa	%ymm1, %ymm0
	leal	-1(%rcx), %r9d
	vmovdqa	%ymm1, (%rbx)
	leaq	32(%rbx), %r10
	andl	$7, %r9d
	cmpl	$1, %ecx
	jbe	.L406
	testl	%r9d, %r9d
	je	.L257
	cmpl	$1, %r9d
	je	.L378
	cmpl	$2, %r9d
	je	.L379
	cmpl	$3, %r9d
	je	.L380
	cmpl	$4, %r9d
	je	.L381
	cmpl	$5, %r9d
	je	.L382
	cmpl	$6, %r9d
	je	.L383
	vmovdqa	%ymm1, (%r10)
	leaq	64(%rbx), %r10
	movl	$2, %r8d
	vpmulld	%ymm1, %ymm1, %ymm0
.L383:
	vmovdqa	%ymm1, (%r10)
	addl	$1, %r8d
	addq	$32, %r10
	vpmulld	%ymm1, %ymm0, %ymm0
.L382:
	vmovdqa	%ymm1, (%r10)
	addl	$1, %r8d
	addq	$32, %r10
	vpmulld	%ymm1, %ymm0, %ymm0
.L381:
	vmovdqa	%ymm1, (%r10)
	addl	$1, %r8d
	addq	$32, %r10
	vpmulld	%ymm1, %ymm0, %ymm0
.L380:
	vmovdqa	%ymm1, (%r10)
	addl	$1, %r8d
	addq	$32, %r10
	vpmulld	%ymm1, %ymm0, %ymm0
.L379:
	vmovdqa	%ymm1, (%r10)
	addl	$1, %r8d
	addq	$32, %r10
	vpmulld	%ymm1, %ymm0, %ymm0
.L378:
	addl	$1, %r8d
	vmovdqa	%ymm1, (%r10)
	addq	$32, %r10
	cmpl	%r8d, %ecx
	vpmulld	%ymm1, %ymm0, %ymm0
	jbe	.L406
.L257:
	addl	$8, %r8d
	vmovdqa	%ymm1, (%r10)
	addq	$256, %r10
	vmovdqa	%ymm1, -224(%r10)
	vpmulld	%ymm1, %ymm0, %ymm2
	vpmulld	%ymm1, %ymm2, %ymm3
	vmovdqa	%ymm1, -192(%r10)
	vpmulld	%ymm1, %ymm3, %ymm4
	vpmulld	%ymm1, %ymm4, %ymm5
	vmovdqa	%ymm1, -160(%r10)
	vpmulld	%ymm1, %ymm5, %ymm6
	vpmulld	%ymm1, %ymm6, %ymm7
	vmovdqa	%ymm1, -128(%r10)
	vpmulld	%ymm1, %ymm7, %ymm8
	vpmulld	%ymm1, %ymm8, %ymm0
	vmovdqa	%ymm1, -96(%r10)
	vmovdqa	%ymm1, -64(%r10)
	vmovdqa	%ymm1, -32(%r10)
	cmpl	%r8d, %ecx
	ja	.L257
.L406:
	vpxor	%xmm9, %xmm9, %xmm9
	movl	%r11d, %ecx
	andl	$-8, %ecx
	addl	%ecx, %r13d
	vperm2i128	$33, %ymm9, %ymm0, %ymm10
	vpmulld	%ymm10, %ymm0, %ymm11
	vperm2i128	$33, %ymm9, %ymm11, %ymm12
	vpalignr	$8, %ymm11, %ymm12, %ymm13
	vpmulld	%ymm13, %ymm11, %ymm14
	vperm2i128	$33, %ymm9, %ymm14, %ymm15
	vpalignr	$4, %ymm14, %ymm15, %ymm1
	vpmulld	%ymm1, %ymm14, %ymm0
	vmovd	%xmm0, %r10d
	imull	%eax, %r10d
	cmpl	%ecx, %r11d
	movl	%r10d, -152(%rbp)
	je	.L258
.L254:
	imull	%edi, %r10d
	movq	-168(%rbp), %rbx
	leal	1(%r13), %eax
	movslq	%r13d, %rdx
	cmpl	%eax, %esi
	movl	%edi, (%rbx,%rdx,4)
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	2(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	3(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	4(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	5(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	6(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	7(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	8(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	9(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	10(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	11(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	cltq
	imull	%edi, %r10d
	movl	%edi, (%rbx,%rax,4)
	leal	12(%r13), %eax
	cmpl	%eax, %esi
	movl	%r10d, -152(%rbp)
	jle	.L258
	movl	%r10d, %edx
	addl	$13, %r13d
	cltq
	imull	%edi, %edx
	cmpl	%r13d, %esi
	movl	%edi, (%rbx,%rax,4)
	movl	%edx, -152(%rbp)
	jle	.L258
	movslq	%r13d, %r13
	movl	%edi, (%rbx,%r13,4)
	imull	%edx, %edi
	movl	%edi, -152(%rbp)
.L258:
	movslq	-152(%rbp), %r9
	leaq	22(,%r9,8), %r8
	andq	$-16, %r8
	subq	%r8, %rsp
	testl	%r9d, %r9d
	movq	%rsp, -192(%rbp)
	jle	.L418
.L259:
	leal	-2(%rsi), %eax
	leaq	-32(%r12,%r14), %r13
	movq	-168(%rbp), %r11
	movslq	%r15d, %r10
	movl	$9, %ebx
	vmovdqa	.LC6(%rip), %ymm9
	cltq
	shrq	$2, %r13
	salq	$2, %r10
	leaq	(%r12,%rax,4), %rdx
	leal	-3(%rsi), %eax
	andl	$7, %r13d
	leal	7(%r13), %ecx
	addq	%r10, %r11
	addq	%r12, %r10
	cltq
	movq	%r10, -88(%rbp)
	movq	%r11, -208(%rbp)
	leaq	(%r12,%rax,4), %r9
	leal	-4(%rsi), %eax
	cmpl	$9, %ecx
	cmovnb	%ecx, %ebx
	movl	%esi, %ecx
	vmovdqa	.LC7(%rip), %ymm7
	cltq
	movl	%ebx, -72(%rbp)
	movl	%r13d, %ebx
	leaq	(%r12,%rax,4), %rdi
	leal	-5(%rsi), %eax
	notq	%rbx
	leaq	-28(%r14,%rbx,4), %r14
	subl	%r13d, %ecx
	vmovdqa	.LC8(%rip), %ymm6
	cltq
	vpxor	%xmm8, %xmm8, %xmm8
	leaq	(%r12,%rax,4), %r8
	leal	-6(%rsi), %eax
	movl	%ecx, -80(%rbp)
	leaq	(%r12,%r14), %r14
	movq	%rdx, -96(%rbp)
	movq	%r9, -104(%rbp)
	cltq
	movq	%rdi, -112(%rbp)
	movq	%r8, -120(%rbp)
	leaq	(%r12,%rax,4), %r10
	leal	-7(%rsi), %eax
	movq	$0, -160(%rbp)
	cltq
	movq	%r10, -128(%rbp)
	leaq	(%r12,%rax,4), %r11
	movq	%r11, -136(%rbp)
	movl	%ecx, %r11d
	andl	$-8, %ecx
	shrl	$3, %r11d
	movl	%ecx, -76(%rbp)
	.p2align 4,,10
	.p2align 3
.L276:
	movl	-160(%rbp), %edx
	testl	%esi, %esi
	movl	%edx, -68(%rbp)
	jle	.L278
	movq	-168(%rbp), %rcx
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	addl	$1, %r10d
	movl	%r11d, -172(%rbp)
	movl	%r13d, -176(%rbp)
	cmpl	%r10d, %esi
	movq	%r14, -184(%rbp)
	movq	%r12, -144(%rbp)
	leaq	4(%rcx), %r9
	movl	%r15d, -148(%rbp)
	movq	%r9, %r11
	je	.L261
	.p2align 4,,10
	.p2align 3
.L419:
	movq	%r11, %r15
	movl	-148(%rbp), %r8d
	movl	%esi, %r12d
	shrq	$2, %r15
	subl	%r10d, %r12d
	movl	$12, %r14d
	negq	%r15
	andl	$7, %r15d
	leal	7(%r15), %r13d
	cmpl	$12, %r13d
	cmovb	%r14d, %r13d
	subl	%r10d, %r8d
	cmpl	%r8d, %r13d
	ja	.L289
	testl	%r15d, %r15d
	je	.L290
	cmpl	$1, %r15d
	movl	(%r11), %r8d
	leal	2(%rbx), %eax
	je	.L263
	cltq
	imull	(%rcx,%rax,4), %r8d
	cmpl	$2, %r15d
	leal	3(%rbx), %eax
	je	.L263
	cltq
	imull	(%rcx,%rax,4), %r8d
	cmpl	$3, %r15d
	leal	4(%rbx), %eax
	je	.L263
	cltq
	imull	(%rcx,%rax,4), %r8d
	cmpl	$4, %r15d
	leal	5(%rbx), %eax
	je	.L263
	cltq
	imull	(%rcx,%rax,4), %r8d
	cmpl	$5, %r15d
	leal	6(%rbx), %eax
	je	.L263
	cltq
	imull	(%rcx,%rax,4), %r8d
	cmpl	$7, %r15d
	leal	7(%rbx), %eax
	jne	.L263
	cltq
	imull	(%rcx,%rax,4), %r8d
	leal	8(%rbx), %eax
.L263:
	subl	%r15d, %r12d
	leaq	1(%rbx), %r13
	movl	$1, %edi
	movl	%r12d, %r14d
	shrl	$3, %r14d
	addq	%r13, %r15
	leal	-1(%r14), %r9d
	leaq	(%rcx,%r15,4), %r15
	andl	$7, %r9d
	cmpl	%r14d, %edi
	vmovdqa	(%r15), %ymm0
	leaq	32(%r15), %rdx
	jnb	.L407
	testl	%r9d, %r9d
	je	.L265
	cmpl	$1, %r9d
	je	.L372
	cmpl	$2, %r9d
	je	.L373
	cmpl	$3, %r9d
	je	.L374
	cmpl	$4, %r9d
	je	.L375
	cmpl	$5, %r9d
	je	.L376
	cmpl	$6, %r9d
	je	.L377
	leaq	64(%r15), %rdx
	movl	$2, %edi
	vpmulld	32(%r15), %ymm0, %ymm0
.L377:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %edi
	addq	$32, %rdx
.L376:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %edi
	addq	$32, %rdx
.L375:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %edi
	addq	$32, %rdx
.L374:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %edi
	addq	$32, %rdx
.L373:
	vpmulld	(%rdx), %ymm0, %ymm0
	addl	$1, %edi
	addq	$32, %rdx
.L372:
	addl	$1, %edi
	vpmulld	(%rdx), %ymm0, %ymm0
	addq	$32, %rdx
	cmpl	%r14d, %edi
	jnb	.L407
.L265:
	addl	$8, %edi
	vpmulld	(%rdx), %ymm0, %ymm3
	addq	$256, %rdx
	vpmulld	-224(%rdx), %ymm3, %ymm10
	vpmulld	-192(%rdx), %ymm10, %ymm5
	vpmulld	-160(%rdx), %ymm5, %ymm4
	vpmulld	-128(%rdx), %ymm4, %ymm11
	vpmulld	-96(%rdx), %ymm11, %ymm12
	vpmulld	-64(%rdx), %ymm12, %ymm13
	vpmulld	-32(%rdx), %ymm13, %ymm0
	cmpl	%r14d, %edi
	jb	.L265
.L407:
	vperm2i128	$33, %ymm8, %ymm0, %ymm14
	movl	%r12d, %r15d
	andl	$-8, %r15d
	addl	%r15d, %eax
	vpmulld	%ymm14, %ymm0, %ymm15
	vperm2i128	$33, %ymm8, %ymm15, %ymm2
	vpalignr	$8, %ymm15, %ymm2, %ymm1
	vpmulld	%ymm1, %ymm15, %ymm0
	vperm2i128	$33, %ymm8, %ymm0, %ymm3
	vpalignr	$4, %ymm0, %ymm3, %ymm10
	vpmulld	%ymm10, %ymm0, %ymm5
	vmovd	%xmm5, %r14d
	imull	%r14d, %r8d
	cmpl	%r15d, %r12d
	je	.L266
.L262:
	leal	1(%rax), %edi
	movslq	%eax, %r9
	imull	(%rcx,%r9,4), %r8d
	cmpl	%edi, %esi
	jle	.L266
	leal	2(%rax), %r12d
	movslq	%edi, %rdx
	imull	(%rcx,%rdx,4), %r8d
	cmpl	%r12d, %esi
	jle	.L266
	leal	3(%rax), %r15d
	movslq	%r12d, %r14
	imull	(%rcx,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L266
	leal	4(%rax), %edi
	movslq	%r15d, %r9
	imull	(%rcx,%r9,4), %r8d
	cmpl	%edi, %esi
	jle	.L266
	leal	5(%rax), %r12d
	movslq	%edi, %rdx
	imull	(%rcx,%rdx,4), %r8d
	cmpl	%r12d, %esi
	jle	.L266
	leal	6(%rax), %r15d
	movslq	%r12d, %r14
	imull	(%rcx,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L266
	leal	7(%rax), %edi
	movslq	%r15d, %r9
	imull	(%rcx,%r9,4), %r8d
	cmpl	%edi, %esi
	jle	.L266
	leal	8(%rax), %r12d
	movslq	%edi, %rdx
	imull	(%rcx,%rdx,4), %r8d
	cmpl	%r12d, %esi
	jle	.L266
	leal	9(%rax), %r15d
	movslq	%r12d, %r14
	imull	(%rcx,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L266
	leal	10(%rax), %edi
	movslq	%r15d, %r9
	imull	(%rcx,%r9,4), %r8d
	cmpl	%edi, %esi
	jle	.L266
	leal	11(%rax), %r12d
	movslq	%edi, %rdx
	imull	(%rcx,%rdx,4), %r8d
	cmpl	%r12d, %esi
	jle	.L266
	leal	12(%rax), %r15d
	movslq	%r12d, %r14
	imull	(%rcx,%r14,4), %r8d
	cmpl	%r15d, %esi
	jle	.L266
	movslq	%r15d, %r9
	addl	$13, %eax
	imull	(%rcx,%r9,4), %r8d
	cmpl	%eax, %esi
	jle	.L266
	cltq
	imull	(%rcx,%rax,4), %r8d
	.p2align 4,,10
	.p2align 3
.L266:
	movl	-68(%rbp), %eax
	addl	$1, %r10d
	cltd
	idivl	%r8d
	movq	-144(%rbp), %r8
	cltd
	idivl	-4(%r11)
	addq	$4, %r11
	cmpl	%r10d, %esi
	movl	%edx, (%r8,%rbx,4)
	movq	%r13, %rbx
	jne	.L419
.L261:
	movl	-68(%rbp), %eax
	movq	-208(%rbp), %rdi
	movq	-88(%rbp), %r8
	movl	-172(%rbp), %r11d
	movl	-176(%rbp), %r13d
	movq	-184(%rbp), %r14
	cltd
	movq	-144(%rbp), %r12
	movl	-148(%rbp), %r15d
	idivl	(%rdi)
	movl	%edx, (%r8)
.L278:
	xorl	%edx, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L267:
	testl	%esi, %esi
	leal	1(%rax), %r10d
	jle	.L275
	movl	$1, %edi
	movl	%eax, %ecx
	sall	%cl, %edi
	cmpl	%r15d, -72(%rbp)
	ja	.L291
	testl	%r13d, %r13d
	je	.L292
	movq	-88(%rbp), %rbx
	movl	(%rbx), %r9d
	andl	%edi, %r9d
	sall	%cl, %r9d
	orl	%r9d, %edx
	cmpl	$1, %r13d
	je	.L293
	movq	-96(%rbp), %r10
	movl	(%r10), %r8d
	leal	1(%rax), %r10d
	movl	%r10d, %ecx
	andl	%edi, %r8d
	sall	%cl, %r8d
	orl	%r8d, %edx
	cmpl	$2, %r13d
	je	.L294
	movq	-104(%rbp), %rbx
	leal	2(%rax), %ecx
	movl	(%rbx), %r9d
	andl	%edi, %r9d
	sall	%cl, %r9d
	orl	%r9d, %edx
	cmpl	$3, %r13d
	je	.L295
	movq	-112(%rbp), %r8
	leal	3(%rax), %ecx
	movl	(%r8), %ebx
	andl	%edi, %ebx
	sall	%cl, %ebx
	orl	%ebx, %edx
	cmpl	$4, %r13d
	je	.L296
	movq	-120(%rbp), %r9
	leal	4(%rax), %ecx
	movl	(%r9), %r8d
	andl	%edi, %r8d
	sall	%cl, %r8d
	orl	%r8d, %edx
	cmpl	$5, %r13d
	je	.L297
	movq	-128(%rbp), %rbx
	leal	5(%rax), %ecx
	movl	(%rbx), %r9d
	andl	%edi, %r9d
	sall	%cl, %r9d
	orl	%r9d, %edx
	cmpl	$7, %r13d
	jne	.L298
	movq	-136(%rbp), %r8
	leal	6(%rax), %ecx
	movl	(%r8), %ebx
	andl	%edi, %ebx
	sall	%cl, %ebx
	movl	$7, %ecx
	orl	%ebx, %edx
.L269:
	vpermd	(%r14), %ymm6, %ymm10
	leal	-1(%r11), %ebx
	movl	$1, %r9d
	movl	%ecx, -68(%rbp)
	leaq	-32(%r14), %r8
	vpbroadcastd	-68(%rbp), %ymm2
	movl	%edi, -68(%rbp)
	andl	$3, %ebx
	vpbroadcastd	-68(%rbp), %ymm5
	movl	%eax, -68(%rbp)
	cmpl	$1, %r11d
	vpbroadcastd	-68(%rbp), %ymm4
	vpaddd	%ymm9, %ymm2, %ymm3
	vpaddd	%ymm7, %ymm3, %ymm0
	vpand	%ymm5, %ymm10, %ymm11
	vpaddd	%ymm4, %ymm3, %ymm12
	vpsllvd	%ymm12, %ymm11, %ymm1
	jbe	.L408
	testl	%ebx, %ebx
	je	.L271
	cmpl	$1, %ebx
	je	.L370
	cmpl	$2, %ebx
	je	.L371
	vpermd	-32(%r14), %ymm6, %ymm13
	vpaddd	%ymm4, %ymm0, %ymm15
	leaq	-64(%r14), %r8
	movl	$2, %r9d
	vpaddd	%ymm7, %ymm0, %ymm0
	vpand	%ymm5, %ymm13, %ymm14
	vpsllvd	%ymm15, %ymm14, %ymm2
	vpor	%ymm2, %ymm1, %ymm1
.L371:
	vpermd	(%r8), %ymm6, %ymm3
	vpaddd	%ymm4, %ymm0, %ymm11
	addl	$1, %r9d
	subq	$32, %r8
	vpaddd	%ymm7, %ymm0, %ymm0
	vpand	%ymm5, %ymm3, %ymm10
	vpsllvd	%ymm11, %ymm10, %ymm12
	vpor	%ymm12, %ymm1, %ymm1
.L370:
	vpermd	(%r8), %ymm6, %ymm13
	addl	$1, %r9d
	subq	$32, %r8
	cmpl	%r9d, %r11d
	vpaddd	%ymm4, %ymm0, %ymm15
	vpaddd	%ymm7, %ymm0, %ymm0
	vpand	%ymm5, %ymm13, %ymm14
	vpsllvd	%ymm15, %ymm14, %ymm2
	vpor	%ymm2, %ymm1, %ymm1
	jbe	.L408
.L271:
	vpermd	(%r8), %ymm6, %ymm10
	vpaddd	%ymm4, %ymm0, %ymm12
	vpaddd	%ymm7, %ymm0, %ymm3
	vpaddd	%ymm7, %ymm3, %ymm15
	vpaddd	%ymm4, %ymm3, %ymm0
	addl	$4, %r9d
	vpermd	-32(%r8), %ymm6, %ymm2
	addq	$-128, %r8
	vpand	%ymm5, %ymm10, %ymm11
	vpsllvd	%ymm12, %ymm11, %ymm13
	vpermd	64(%r8), %ymm6, %ymm12
	vpaddd	%ymm7, %ymm15, %ymm11
	vpor	%ymm13, %ymm1, %ymm14
	vpand	%ymm5, %ymm2, %ymm1
	vpand	%ymm5, %ymm12, %ymm13
	vpsllvd	%ymm0, %ymm1, %ymm3
	vpermd	32(%r8), %ymm6, %ymm1
	cmpl	%r9d, %r11d
	vpor	%ymm3, %ymm14, %ymm10
	vpaddd	%ymm4, %ymm15, %ymm14
	vpsllvd	%ymm14, %ymm13, %ymm15
	vpaddd	%ymm4, %ymm11, %ymm3
	vpand	%ymm5, %ymm1, %ymm0
	vpor	%ymm15, %ymm10, %ymm2
	vpsllvd	%ymm3, %ymm0, %ymm10
	vpaddd	%ymm7, %ymm11, %ymm0
	vpor	%ymm10, %ymm2, %ymm1
	ja	.L271
.L408:
	vperm2i128	$33, %ymm8, %ymm1, %ymm5
	movl	-76(%rbp), %r9d
	vpor	%ymm5, %ymm1, %ymm4
	leal	(%r9,%rcx), %r8d
	vperm2i128	$33, %ymm8, %ymm4, %ymm11
	vpalignr	$8, %ymm4, %ymm11, %ymm12
	vpor	%ymm12, %ymm4, %ymm13
	vperm2i128	$33, %ymm8, %ymm13, %ymm14
	vpalignr	$4, %ymm13, %ymm14, %ymm15
	vpor	%ymm15, %ymm13, %ymm2
	vmovd	%xmm2, %ebx
	orl	%ebx, %edx
	cmpl	-80(%rbp), %r9d
	je	.L275
.L268:
	movl	%r15d, %ecx
	subl	%r8d, %ecx
	movslq	%ecx, %rbx
	leal	(%r8,%rax), %ecx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	sall	%cl, %r9d
	leal	1(%r8), %ecx
	orl	%r9d, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %ebx
	subl	%ecx, %ebx
	addl	%eax, %ecx
	movslq	%ebx, %r9
	movl	(%r12,%r9,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	2(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	3(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	4(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	5(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	6(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	7(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	8(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	9(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	10(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	11(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	12(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r9d
	subl	%ecx, %r9d
	addl	%eax, %ecx
	movslq	%r9d, %rbx
	movl	(%r12,%rbx,4), %r9d
	andl	%edi, %r9d
	movl	%r9d, %ebx
	sall	%cl, %ebx
	leal	13(%r8), %ecx
	orl	%ebx, %edx
	cmpl	%ecx, %esi
	jle	.L275
	movl	%r15d, %r8d
	subl	%ecx, %r8d
	addl	%eax, %ecx
	movslq	%r8d, %r9
	andl	(%r12,%r9,4), %edi
	sall	%cl, %edi
	orl	%edi, %edx
	.p2align 4,,10
	.p2align 3
.L275:
	cmpl	$32, %r10d
	movl	%r10d, %eax
	jne	.L267
	movslq	%edx, %r10
	movq	-200(%rbp), %rdx
	movq	-160(%rbp), %rbx
	movq	-192(%rbp), %rdi
	vmovsd	(%rdx,%r10,8), %xmm1
	vmovsd	%xmm1, (%rdi,%rbx,8)
	addq	$1, %rbx
	cmpl	%ebx, -152(%rbp)
	movq	%rbx, -160(%rbp)
	jg	.L276
	movl	-152(%rbp), %r11d
	movq	%rdi, %rsi
	movq	-200(%rbp), %rdi
	subl	$1, %r11d
	leaq	8(,%r11,8), %rdx
	vzeroupper
	call	memcpy@PLT
.L252:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L420
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rsi), %rsp
	.cfi_def_cfa 7, 8
	ret
.L284:
	.cfi_restore_state
	movl	$2, %r13d
	jmp	.L255
.L285:
	movl	$3, %r13d
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L293:
	movl	$1, %ecx
	leal	1(%rax), %r10d
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L292:
	xorl	%ecx, %ecx
	leal	1(%rax), %r10d
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L294:
	movl	$2, %ecx
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L291:
	xorl	%r8d, %r8d
	leal	1(%rax), %r10d
	jmp	.L268
	.p2align 4,,10
	.p2align 3
.L295:
	movl	$3, %ecx
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L296:
	movl	$4, %ecx
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L297:
	movl	$5, %ecx
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L298:
	movl	$6, %ecx
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L290:
	movl	%r10d, %eax
	movl	$1, %r8d
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L289:
	movl	%r10d, %eax
	movl	$1, %r8d
	leaq	1(%rbx), %r13
	jmp	.L262
.L418:
	vzeroupper
	jmp	.L252
.L253:
	leaq	-64(%rbp), %rbx
	movl	$1, -152(%rbp)
	leal	-1(%rsi), %r15d
	movq	%rbx, -192(%rbp)
	jmp	.L259
.L283:
	movl	%edi, %eax
	movl	$1, %r13d
	jmp	.L255
.L282:
	xorl	%r13d, %r13d
	movl	$1, %eax
	jmp	.L255
.L281:
	movl	$1, -152(%rbp)
	xorl	%r13d, %r13d
	movl	-152(%rbp), %r10d
	jmp	.L254
.L286:
	movl	$4, %r13d
	jmp	.L255
.L420:
	call	__stack_chk_fail@PLT
.L288:
	movl	$6, %r13d
	jmp	.L255
.L287:
	movl	$5, %r13d
	jmp	.L255
	.cfi_endproc
.LFE4804:
	.size	z_order, .-z_order
	.p2align 4,,15
	.globl	size
	.type	size, @function
size:
.LFB4805:
	.cfi_startproc
	testl	%edi, %edi
	je	.L429
	movq	%rsi, %rax
	leal	-1(%rdi), %ecx
	movl	$10, %r8d
	shrq	$2, %rax
	negq	%rax
	andl	$7, %eax
	leal	7(%rax), %edx
	cmpl	$10, %edx
	cmovb	%r8d, %edx
	cmpl	%edx, %ecx
	jb	.L430
	leaq	8(%rsp), %r9
	.cfi_def_cfa 9, 0
	andq	$-32, %rsp
	testl	%eax, %eax
	pushq	-8(%r9)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r9
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	je	.L431
	cmpl	$1, %eax
	movl	(%rsi), %edx
	je	.L432
	imull	4(%rsi), %edx
	cmpl	$2, %eax
	je	.L433
	imull	8(%rsi), %edx
	cmpl	$3, %eax
	je	.L434
	imull	12(%rsi), %edx
	cmpl	$4, %eax
	je	.L435
	imull	16(%rsi), %edx
	cmpl	$5, %eax
	je	.L436
	imull	20(%rsi), %edx
	cmpl	$7, %eax
	jne	.L437
	imull	24(%rsi), %edx
	movl	$7, %r8d
.L424:
	movl	%edi, %r10d
	leaq	(%rsi,%rax,4), %rbx
	movl	$1, %ecx
	subl	%eax, %r10d
	movl	%r10d, %r11d
	vmovdqa	(%rbx), %ymm0
	leaq	32(%rbx), %rax
	shrl	$3, %r11d
	leal	-1(%r11), %r9d
	andl	$7, %r9d
	cmpl	%r11d, %ecx
	jnb	.L475
	testl	%r9d, %r9d
	je	.L426
	cmpl	$1, %r9d
	je	.L462
	cmpl	$2, %r9d
	je	.L463
	cmpl	$3, %r9d
	je	.L464
	cmpl	$4, %r9d
	je	.L465
	cmpl	$5, %r9d
	je	.L466
	cmpl	$6, %r9d
	je	.L467
	vpmulld	(%rax), %ymm0, %ymm0
	leaq	64(%rbx), %rax
	movl	$2, %ecx
.L467:
	vpmulld	(%rax), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rax
.L466:
	vpmulld	(%rax), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rax
.L465:
	vpmulld	(%rax), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rax
.L464:
	vpmulld	(%rax), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rax
.L463:
	vpmulld	(%rax), %ymm0, %ymm0
	addl	$1, %ecx
	addq	$32, %rax
.L462:
	addl	$1, %ecx
	vpmulld	(%rax), %ymm0, %ymm0
	addq	$32, %rax
	cmpl	%r11d, %ecx
	jnb	.L475
.L426:
	addl	$8, %ecx
	vpmulld	(%rax), %ymm0, %ymm1
	addq	$256, %rax
	vpmulld	-224(%rax), %ymm1, %ymm2
	vpmulld	-192(%rax), %ymm2, %ymm3
	vpmulld	-160(%rax), %ymm3, %ymm4
	vpmulld	-128(%rax), %ymm4, %ymm5
	vpmulld	-96(%rax), %ymm5, %ymm6
	vpmulld	-64(%rax), %ymm6, %ymm7
	vpmulld	-32(%rax), %ymm7, %ymm0
	cmpl	%r11d, %ecx
	jb	.L426
.L475:
	vpxor	%xmm8, %xmm8, %xmm8
	movl	%r10d, %r11d
	andl	$-8, %r11d
	leal	(%r8,%r11), %ebx
	vperm2i128	$33, %ymm8, %ymm0, %ymm9
	vpmulld	%ymm9, %ymm0, %ymm10
	vperm2i128	$33, %ymm8, %ymm10, %ymm11
	vpalignr	$8, %ymm10, %ymm11, %ymm12
	vpmulld	%ymm12, %ymm10, %ymm13
	vperm2i128	$33, %ymm8, %ymm13, %ymm14
	vpalignr	$4, %ymm13, %ymm14, %ymm15
	vpmulld	%ymm15, %ymm13, %ymm0
	vmovd	%xmm0, %eax
	imull	%edx, %eax
	cmpl	%r11d, %r10d
	je	.L496
	vzeroupper
	leal	1(%rbx), %ecx
	movl	%ebx, %r9d
	imull	(%rsi,%r9,4), %eax
	cmpl	%edi, %ecx
	jnb	.L477
	leal	2(%rbx), %edx
	imull	(%rsi,%rcx,4), %eax
	cmpl	%edx, %edi
	jbe	.L477
	leal	3(%rbx), %r8d
	imull	(%rsi,%rdx,4), %eax
	cmpl	%r8d, %edi
	jbe	.L477
	leal	4(%rbx), %r10d
	imull	(%rsi,%r8,4), %eax
	cmpl	%r10d, %edi
	jbe	.L477
	leal	5(%rbx), %r11d
	imull	(%rsi,%r10,4), %eax
	cmpl	%r11d, %edi
	jbe	.L477
	leal	6(%rbx), %r9d
	imull	(%rsi,%r11,4), %eax
	cmpl	%r9d, %edi
	jbe	.L477
	leal	7(%rbx), %ecx
	imull	(%rsi,%r9,4), %eax
	cmpl	%ecx, %edi
	jbe	.L477
	leal	8(%rbx), %edx
	imull	(%rsi,%rcx,4), %eax
	cmpl	%edx, %edi
	jbe	.L477
	leal	9(%rbx), %r8d
	imull	(%rsi,%rdx,4), %eax
	cmpl	%r8d, %edi
	jbe	.L477
	leal	10(%rbx), %r10d
	imull	(%rsi,%r8,4), %eax
	cmpl	%r10d, %edi
	jbe	.L477
	leal	11(%rbx), %r11d
	imull	(%rsi,%r10,4), %eax
	cmpl	%r11d, %edi
	jbe	.L477
	leal	12(%rbx), %r9d
	imull	(%rsi,%r11,4), %eax
	cmpl	%r9d, %edi
	jbe	.L477
	addl	$13, %ebx
	imull	(%rsi,%r9,4), %eax
	cmpl	%ebx, %edi
	jbe	.L477
	imull	(%rsi,%rbx,4), %eax
.L477:
	popq	%rbx
	popq	%rsi
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%rsi), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L433:
	.cfi_restore_state
	movl	$2, %r8d
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L429:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L432:
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movl	$1, %r8d
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L431:
	xorl	%r8d, %r8d
	movl	$1, %edx
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L496:
	vzeroupper
	jmp	.L477
	.p2align 4,,10
	.p2align 3
.L430:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	xorl	%r9d, %r9d
	movl	$1, %eax
	leal	1(%r9), %r11d
	movl	%r9d, %r10d
	imull	(%rsi,%r10,4), %eax
	cmpl	%edi, %r11d
	jnb	.L481
	leal	2(%r9), %ecx
	imull	(%rsi,%r11,4), %eax
	cmpl	%ecx, %edi
	jbe	.L481
	leal	3(%r9), %edx
	imull	(%rsi,%rcx,4), %eax
	cmpl	%edx, %edi
	jbe	.L481
	leal	4(%r9), %r8d
	imull	(%rsi,%rdx,4), %eax
	cmpl	%r8d, %edi
	jbe	.L481
	leal	5(%r9), %r10d
	imull	(%rsi,%r8,4), %eax
	cmpl	%r10d, %edi
	jbe	.L481
	leal	6(%r9), %r11d
	imull	(%rsi,%r10,4), %eax
	cmpl	%r11d, %edi
	jbe	.L481
	leal	7(%r9), %ecx
	imull	(%rsi,%r11,4), %eax
	cmpl	%ecx, %edi
	jbe	.L481
	leal	8(%r9), %edx
	imull	(%rsi,%rcx,4), %eax
	cmpl	%edx, %edi
	jbe	.L481
	leal	9(%r9), %r8d
	imull	(%rsi,%rdx,4), %eax
	cmpl	%r8d, %edi
	jbe	.L481
	leal	10(%r9), %r10d
	imull	(%rsi,%r8,4), %eax
	cmpl	%r10d, %edi
	jbe	.L481
	leal	11(%r9), %r11d
	imull	(%rsi,%r10,4), %eax
	cmpl	%r11d, %edi
	jbe	.L481
	leal	12(%r9), %ecx
	imull	(%rsi,%r11,4), %eax
	cmpl	%ecx, %edi
	jbe	.L481
	addl	$13, %r9d
	imull	(%rsi,%rcx,4), %eax
	cmpl	%r9d, %edi
	jbe	.L481
	imull	(%rsi,%r9,4), %eax
.L481:
	rep ret
	.p2align 4,,10
	.p2align 3
.L434:
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movl	$3, %r8d
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L435:
	movl	$4, %r8d
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L436:
	movl	$5, %r8d
	jmp	.L424
	.p2align 4,,10
	.p2align 3
.L437:
	movl	$6, %r8d
	jmp	.L424
	.cfi_endproc
.LFE4805:
	.size	size, .-size
	.section	.rodata.str1.1
.LC9:
	.string	"RANDOM"
.LC10:
	.string	"LINEAR"
.LC11:
	.string	"ONES"
.LC13:
	.string	"ZEROS"
	.text
	.p2align 4,,15
	.globl	arr_init
	.type	arr_init, @function
arr_init:
.LFB4806:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
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
	subq	$32, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	testl	%edi, %edi
	je	.L513
	movq	%rsi, %r8
	leal	-1(%rdi), %r9d
	movl	$10, %r11d
	shrq	$2, %r8
	negq	%r8
	andl	$7, %r8d
	leal	7(%r8), %eax
	cmpl	$10, %eax
	cmovb	%r11d, %eax
	cmpl	%eax, %r9d
	jb	.L514
	testl	%r8d, %r8d
	je	.L515
	cmpl	$1, %r8d
	movl	(%rsi), %r9d
	je	.L516
	imull	4(%rsi), %r9d
	cmpl	$2, %r8d
	je	.L517
	imull	8(%rsi), %r9d
	cmpl	$3, %r8d
	je	.L518
	imull	12(%rsi), %r9d
	cmpl	$4, %r8d
	je	.L519
	imull	16(%rsi), %r9d
	cmpl	$5, %r8d
	je	.L520
	imull	20(%rsi), %r9d
	cmpl	$7, %r8d
	jne	.L521
	imull	24(%rsi), %r9d
	movl	$7, %r10d
.L500:
	movl	%edi, %ebx
	leaq	(%rsi,%r8,4), %r13
	movl	$1, %r15d
	subl	%r8d, %ebx
	movl	%ebx, %r12d
	vmovdqa	0(%r13), %ymm0
	leaq	32(%r13), %r8
	shrl	$3, %r12d
	leal	-1(%r12), %r14d
	andl	$7, %r14d
	cmpl	$1, %r12d
	jbe	.L578
	testl	%r14d, %r14d
	je	.L502
	cmpl	$1, %r14d
	je	.L563
	cmpl	$2, %r14d
	je	.L564
	cmpl	$3, %r14d
	je	.L565
	cmpl	$4, %r14d
	je	.L566
	cmpl	$5, %r14d
	je	.L567
	cmpl	$6, %r14d
	je	.L568
	vpmulld	(%r8), %ymm0, %ymm0
	leaq	64(%r13), %r8
	movl	$2, %r15d
.L568:
	vpmulld	(%r8), %ymm0, %ymm0
	addl	$1, %r15d
	addq	$32, %r8
.L567:
	vpmulld	(%r8), %ymm0, %ymm0
	addl	$1, %r15d
	addq	$32, %r8
.L566:
	vpmulld	(%r8), %ymm0, %ymm0
	addl	$1, %r15d
	addq	$32, %r8
.L565:
	vpmulld	(%r8), %ymm0, %ymm0
	addl	$1, %r15d
	addq	$32, %r8
.L564:
	vpmulld	(%r8), %ymm0, %ymm0
	addl	$1, %r15d
	addq	$32, %r8
.L563:
	addl	$1, %r15d
	vpmulld	(%r8), %ymm0, %ymm0
	addq	$32, %r8
	cmpl	%r15d, %r12d
	jbe	.L578
.L502:
	addl	$8, %r15d
	vpmulld	(%r8), %ymm0, %ymm1
	addq	$256, %r8
	vpmulld	-224(%r8), %ymm1, %ymm2
	vpmulld	-192(%r8), %ymm2, %ymm3
	vpmulld	-160(%r8), %ymm3, %ymm4
	vpmulld	-128(%r8), %ymm4, %ymm5
	vpmulld	-96(%r8), %ymm5, %ymm6
	vpmulld	-64(%r8), %ymm6, %ymm7
	vpmulld	-32(%r8), %ymm7, %ymm0
	cmpl	%r15d, %r12d
	ja	.L502
.L578:
	vpxor	%xmm8, %xmm8, %xmm8
	movl	%ebx, %r11d
	andl	$-8, %r11d
	leal	(%r10,%r11), %r12d
	vperm2i128	$33, %ymm8, %ymm0, %ymm9
	vpmulld	%ymm9, %ymm0, %ymm10
	vperm2i128	$33, %ymm8, %ymm10, %ymm11
	vpalignr	$8, %ymm10, %ymm11, %ymm12
	vpmulld	%ymm12, %ymm10, %ymm13
	vperm2i128	$33, %ymm8, %ymm13, %ymm14
	vpalignr	$4, %ymm13, %ymm14, %ymm15
	vpmulld	%ymm15, %ymm13, %ymm0
	vmovd	%xmm0, %eax
	imull	%r9d, %eax
	cmpl	%r11d, %ebx
	je	.L597
	vzeroupper
.L499:
	leal	1(%r12), %r14d
	movl	%r12d, %r13d
	imull	(%rsi,%r13,4), %eax
	cmpl	%edi, %r14d
	jnb	.L503
	leal	2(%r12), %r15d
	imull	(%rsi,%r14,4), %eax
	cmpl	%r15d, %edi
	jbe	.L503
	leal	3(%r12), %r8d
	imull	(%rsi,%r15,4), %eax
	cmpl	%r8d, %edi
	jbe	.L503
	leal	4(%r12), %ebx
	imull	(%rsi,%r8,4), %eax
	cmpl	%ebx, %edi
	jbe	.L503
	leal	5(%r12), %r10d
	imull	(%rsi,%rbx,4), %eax
	cmpl	%r10d, %edi
	jbe	.L503
	leal	6(%r12), %r9d
	imull	(%rsi,%r10,4), %eax
	cmpl	%r9d, %edi
	jbe	.L503
	leal	7(%r12), %r11d
	imull	(%rsi,%r9,4), %eax
	cmpl	%r11d, %edi
	jbe	.L503
	leal	8(%r12), %r13d
	imull	(%rsi,%r11,4), %eax
	cmpl	%r13d, %edi
	jbe	.L503
	leal	9(%r12), %r14d
	imull	(%rsi,%r13,4), %eax
	cmpl	%r14d, %edi
	jbe	.L503
	leal	10(%r12), %r15d
	imull	(%rsi,%r14,4), %eax
	cmpl	%r15d, %edi
	jbe	.L503
	leal	11(%r12), %r8d
	imull	(%rsi,%r15,4), %eax
	cmpl	%r8d, %edi
	jbe	.L503
	leal	12(%r12), %ebx
	imull	(%rsi,%r8,4), %eax
	cmpl	%ebx, %edi
	jbe	.L503
	addl	$13, %r12d
	imull	(%rsi,%rbx,4), %eax
	cmpl	%r12d, %edi
	jbe	.L503
	imull	(%rsi,%r12,4), %eax
	.p2align 4,,10
	.p2align 3
.L503:
	testl	%eax, %eax
	movl	%eax, %ebx
	je	.L592
.L498:
	leaq	.LC9(%rip), %r14
	movq	%rdx, %r13
	leal	-1(%rbx), %r9d
	movl	$7, %edx
	movq	%rcx, %rsi
	movq	%rcx, %r15
	movq	%r14, %rdi
	movq	%rdx, %rcx
	andl	$1, %r9d
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L598
	leaq	.LC10(%rip), %rdi
	movq	%r15, %rsi
	movq	%rdx, %rcx
	repz cmpsb
	seta	%r12b
	sbbb	$0, %r12b
	testb	%r12b, %r12b
	je	.L581
	leaq	.LC11(%rip), %rdi
	movl	$5, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%r10b
	sbbb	$0, %r10b
	testb	%r10b, %r10b
	je	.L582
.L581:
	movq	$0x000000000, 0(%r13)
.L583:
	cmpl	$1, %ebx
	movl	$1, %r12d
	jbe	.L592
	testl	%r9d, %r9d
	je	.L512
	movl	$7, %r8d
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r8, %rcx
	repz cmpsb
	seta	%dl
	sbbb	$0, %dl
	testb	%dl, %dl
	je	.L580
	leaq	.LC10(%rip), %rdi
	movq	%r15, %rsi
	movq	%r8, %rcx
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L589
	.p2align 4,,10
	.p2align 3
.L596:
	leaq	.LC11(%rip), %rdi
	movl	$5, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L589
	movq	$0x000000000, 0(%r13,%r12,8)
	addq	$1, %r12
	cmpl	%r12d, %ebx
	ja	.L512
.L592:
	addq	$32, %rsp
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
	.p2align 4,,10
	.p2align 3
.L580:
	.cfi_restore_state
	call	rand@PLT
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sd	%eax, %xmm2, %xmm2
	vmovsd	%xmm2, 0(%r13,%r12,8)
.L590:
	addq	$1, %r12
	cmpl	%r12d, %ebx
	jbe	.L592
.L512:
	movl	$7, %r9d
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r9, %rcx
	movl	%r12d, %r11d
	repz cmpsb
	seta	%r8b
	sbbb	$0, %r8b
	testb	%r8b, %r8b
	je	.L599
	leaq	.LC10(%rip), %rdi
	movq	%r15, %rsi
	movq	%r9, %rcx
	repz cmpsb
	seta	%dl
	sbbb	$0, %dl
	testb	%dl, %dl
	jne	.L507
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	%r11, %xmm3, %xmm3
	vmovsd	%xmm3, 0(%r13,%r12,8)
.L506:
	movl	$7, %r9d
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%r9, %rcx
	addq	$1, %r12
	repz cmpsb
	movl	%r12d, %r11d
	seta	%r8b
	sbbb	$0, %r8b
	testb	%r8b, %r8b
	je	.L580
	leaq	.LC10(%rip), %rdi
	movq	%r15, %rsi
	movq	%r9, %rcx
	repz cmpsb
	seta	%dl
	sbbb	$0, %dl
	testb	%dl, %dl
	jne	.L596
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdq	%r11, %xmm5, %xmm5
	vmovsd	%xmm5, 0(%r13,%r12,8)
	addq	$1, %r12
	cmpl	%r12d, %ebx
	ja	.L512
	jmp	.L592
	.p2align 4,,10
	.p2align 3
.L589:
	movq	.LC12(%rip), %r10
	movq	%r10, 0(%r13,%r12,8)
	jmp	.L590
	.p2align 4,,10
	.p2align 3
.L507:
	leaq	.LC11(%rip), %rdi
	movl	$5, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L510
	movq	.LC12(%rip), %r10
	movq	%r10, 0(%r13,%r12,8)
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L599:
	call	rand@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sd	%eax, %xmm4, %xmm4
	vmovsd	%xmm4, 0(%r13,%r12,8)
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L510:
	movq	$0x000000000, 0(%r13,%r12,8)
	jmp	.L506
	.p2align 4,,10
	.p2align 3
.L598:
	movl	%r9d, -52(%rbp)
	call	rand@PLT
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	-52(%rbp), %r9d
	vcvtsi2sd	%eax, %xmm1, %xmm1
	vmovsd	%xmm1, 0(%r13)
	jmp	.L583
	.p2align 4,,10
	.p2align 3
.L582:
	movq	.LC12(%rip), %r11
	movq	%r11, 0(%r13)
	jmp	.L583
	.p2align 4,,10
	.p2align 3
.L517:
	movl	$2, %r10d
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L513:
	movl	$1, %ebx
	jmp	.L498
	.p2align 4,,10
	.p2align 3
.L516:
	movl	$1, %r10d
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L515:
	xorl	%r10d, %r10d
	movl	$1, %r9d
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L597:
	vzeroupper
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L514:
	movl	$1, %eax
	xorl	%r12d, %r12d
	jmp	.L499
	.p2align 4,,10
	.p2align 3
.L518:
	movl	$3, %r10d
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L519:
	movl	$4, %r10d
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L520:
	movl	$5, %r10d
	jmp	.L500
	.p2align 4,,10
	.p2align 3
.L521:
	movl	$6, %r10d
	jmp	.L500
	.cfi_endproc
.LFE4806:
	.size	arr_init, .-arr_init
	.p2align 4,,15
	.globl	arr_pad
	.type	arr_pad, @function
arr_pad:
.LFB4807:
	.cfi_startproc
	testl	%edx, %edx
	je	.L668
	testl	%ecx, %ecx
	je	.L668
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%r10d, %r10d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	-1(%rcx), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%r13d, %r13d
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	addq	$1, %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L603:
	cmpl	%edi, %r13d
	movq	%r12, %rbp
	setb	%r11b
	xorl	%eax, %eax
	andl	$3, %ebp
	je	.L607
	cmpq	$1, %rbp
	je	.L638
	cmpq	$2, %rbp
	je	.L639
	movl	%r10d, %eax
	testl	%esi, %esi
	leaq	(%r9,%rax,8), %r14
	je	.L617
	testb	%r11b, %r11b
	je	.L617
	movl	%ebx, %r15d
	vmovsd	(%r8,%r15,8), %xmm1
	vmovsd	%xmm1, (%r14)
.L655:
	movl	$1, %eax
.L639:
	leal	(%r10,%rax), %ebp
	cmpl	%eax, %esi
	movl	%eax, %r14d
	leaq	(%r9,%rbp,8), %r15
	jbe	.L621
	testb	%r11b, %r11b
	je	.L621
	addl	%ebx, %r14d
	vmovsd	(%r8,%r14,8), %xmm2
	vmovsd	%xmm2, (%r15)
.L657:
	addq	$1, %rax
.L638:
	leal	(%r10,%rax), %ebp
	cmpl	%eax, %esi
	movl	%eax, %r14d
	leaq	(%r9,%rbp,8), %r15
	jbe	.L625
	testb	%r11b, %r11b
	je	.L625
	addl	%ebx, %r14d
	vmovsd	(%r8,%r14,8), %xmm3
	vmovsd	%xmm3, (%r15)
.L659:
	addq	$1, %rax
	cmpq	%rax, %r12
	jne	.L607
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L671:
	testb	%r11b, %r11b
	je	.L608
	addl	%ebx, %r14d
	vmovsd	(%r8,%r14,8), %xmm4
	vmovsd	%xmm4, (%r15)
.L606:
	addq	$1, %rax
	leal	(%r10,%rax), %ebp
	cmpl	%eax, %esi
	movl	%eax, %r14d
	leaq	(%r9,%rbp,8), %r15
	jbe	.L629
	testb	%r11b, %r11b
	je	.L629
	addl	%ebx, %r14d
	vmovsd	(%r8,%r14,8), %xmm5
	vmovsd	%xmm5, (%r15)
.L661:
	leaq	1(%rax), %rbp
	leal	(%r10,%rbp), %r14d
	cmpl	%ebp, %esi
	leaq	(%r9,%r14,8), %r14
	jbe	.L632
	testb	%r11b, %r11b
	je	.L632
	leal	(%rbx,%rbp), %ebp
	vmovsd	(%r8,%rbp,8), %xmm6
	leaq	2(%rax), %rbp
	vmovsd	%xmm6, (%r14)
	leal	(%r10,%rbp), %r14d
	cmpl	%ebp, %esi
	leaq	(%r9,%r14,8), %r14
	jbe	.L635
.L664:
	testb	%r11b, %r11b
	je	.L635
	leal	(%rbx,%rbp), %ebp
	vmovsd	(%r8,%rbp,8), %xmm7
	vmovsd	%xmm7, (%r14)
.L665:
	addq	$3, %rax
	cmpq	%rax, %r12
	je	.L660
.L607:
	leal	(%r10,%rax), %ebp
	cmpl	%eax, %esi
	movl	%eax, %r14d
	leaq	(%r9,%rbp,8), %r15
	ja	.L671
.L608:
	vmovsd	%xmm0, (%r15)
	jmp	.L606
	.p2align 4,,10
	.p2align 3
.L660:
	addl	$1, %r13d
	addl	%esi, %ebx
	addl	%ecx, %r10d
	cmpl	%edx, %r13d
	jne	.L603
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L632:
	.cfi_restore_state
	leaq	2(%rax), %rbp
	vmovsd	%xmm0, (%r14)
	leal	(%r10,%rbp), %r14d
	cmpl	%ebp, %esi
	leaq	(%r9,%r14,8), %r14
	ja	.L664
.L635:
	vmovsd	%xmm0, (%r14)
	jmp	.L665
	.p2align 4,,10
	.p2align 3
.L629:
	vmovsd	%xmm0, (%r15)
	jmp	.L661
	.p2align 4,,10
	.p2align 3
.L625:
	vmovsd	%xmm0, (%r15)
	jmp	.L659
	.p2align 4,,10
	.p2align 3
.L621:
	vmovsd	%xmm0, (%r15)
	jmp	.L657
	.p2align 4,,10
	.p2align 3
.L617:
	vmovsd	%xmm0, (%r14)
	jmp	.L655
	.p2align 4,,10
	.p2align 3
.L668:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	rep ret
	.cfi_endproc
.LFE4807:
	.size	arr_pad, .-arr_pad
	.section	.rodata.str1.1
.LC15:
	.string	"    "
.LC16:
	.string	"   "
.LC17:
	.string	"  "
	.text
	.p2align 4,,15
	.globl	printa
	.type	printa, @function
printa:
.LFB4808:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	leaq	.LC0(%rip), %rsi
	movq	%rcx, %rdx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	%edi, 36(%rsp)
	movl	$1, %edi
	movb	$0, 55(%rsp)
	call	__printf_chk@PLT
	testl	%r15d, %r15d
	jle	.L673
	testl	%ebx, %ebx
	jle	.L673
	leal	-1(%rbx), %ecx
	movslq	%ebx, %rax
	leal	-1(%r15), %edx
	leaq	55(%rsp), %rsi
	salq	$3, %rax
	xorl	%ebp, %ebp
	movl	%ecx, 12(%rsp)
	addq	$1, %rcx
	movq	%rax, 40(%rsp)
	movl	%edx, 32(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	.p2align 4,,10
	.p2align 3
.L675:
	testl	%ebp, %ebp
	setg	%r15b
	xorl	%ebx, %ebx
	testb	$1, 16(%rsp)
	je	.L684
	xorl	%r12d, %r12d
	testb	%r15b, %r15b
	vcvttsd2si	0(%r13), %r14d
	je	.L736
	movq	24(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L693:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r14d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%r12d, 12(%rsp)
	je	.L719
	cmpl	$9, %r14d
	jle	.L720
	cmpl	$99, %r14d
	jle	.L721
	cmpl	$999, %r14d
	jg	.L737
	leaq	.LC17(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$1, %ebx
	call	__printf_chk@PLT
	cmpq	$1, 16(%rsp)
	jne	.L684
	.p2align 4,,10
	.p2align 3
.L725:
	addl	$1, %ebp
	addq	40(%rsp), %r13
	cmpl	%ebp, 36(%rsp)
	jne	.L675
.L673:
	movl	$10, %edi
	call	putchar@PLT
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L738
	addq	$72, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L678:
	.cfi_restore_state
	cmpl	$9, %r12d
	jle	.L739
	cmpl	$99, %r12d
	jle	.L740
	cmpl	$999, %r12d
	jg	.L683
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L680:
	addq	$1, %rbx
	testl	%ebx, %ebx
	movl	%ebx, %r14d
	vcvttsd2si	0(%r13,%rbx,8), %r12d
	jne	.L701
	testb	%r15b, %r15b
	je	.L701
	movq	24(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L702:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%r14d, 12(%rsp)
	je	.L726
	cmpl	$9, %r12d
	jle	.L727
	cmpl	$99, %r12d
	jle	.L728
	cmpl	$999, %r12d
	jle	.L729
	movl	$32, %edi
	call	putchar@PLT
	.p2align 4,,10
	.p2align 3
.L730:
	addq	$1, %rbx
	cmpq	%rbx, 16(%rsp)
	je	.L725
.L684:
	testl	%ebx, %ebx
	movl	%ebx, %r14d
	vcvttsd2si	0(%r13,%rbx,8), %r12d
	jne	.L676
	testb	%r15b, %r15b
	je	.L676
	movq	24(%rsp), %rdx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L677:
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%r14d, 12(%rsp)
	jne	.L678
	cmpl	%ebp, 32(%rsp)
	je	.L741
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L680
	.p2align 4,,10
	.p2align 3
.L676:
	movl	%r14d, %r8d
	orl	%ebp, %r8d
	jne	.L677
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L677
	.p2align 4,,10
	.p2align 3
.L701:
	movl	%r14d, %r9d
	orl	%ebp, %r9d
	jne	.L702
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L702
	.p2align 4,,10
	.p2align 3
.L726:
	cmpl	%ebp, 32(%rsp)
	je	.L731
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L730
	.p2align 4,,10
	.p2align 3
.L727:
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L730
	.p2align 4,,10
	.p2align 3
.L739:
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L680
	.p2align 4,,10
	.p2align 3
.L683:
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L680
	.p2align 4,,10
	.p2align 3
.L729:
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L730
	.p2align 4,,10
	.p2align 3
.L728:
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L730
	.p2align 4,,10
	.p2align 3
.L740:
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L680
	.p2align 4,,10
	.p2align 3
.L736:
	movl	%r12d, %edi
	orl	%ebp, %edi
	jne	.L693
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L693
	.p2align 4,,10
	.p2align 3
.L741:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L680
	.p2align 4,,10
	.p2align 3
.L731:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L730
	.p2align 4,,10
	.p2align 3
.L719:
	cmpl	%ebp, 32(%rsp)
	je	.L724
	movl	$10, %edi
	call	putchar@PLT
.L723:
	cmpq	$1, 16(%rsp)
	movl	$1, %ebx
	jne	.L684
	addl	$1, %ebp
	addq	40(%rsp), %r13
	cmpl	%ebp, 36(%rsp)
	jne	.L675
	jmp	.L673
	.p2align 4,,10
	.p2align 3
.L720:
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L723
	.p2align 4,,10
	.p2align 3
.L737:
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L723
	.p2align 4,,10
	.p2align 3
.L721:
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L723
	.p2align 4,,10
	.p2align 3
.L724:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L723
.L738:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4808:
	.size	printa, .-printa
	.p2align 4,,15
	.globl	matvec
	.type	matvec, @function
matvec:
.LFB4809:
	.cfi_startproc
	testl	%edi, %edi
	je	.L793
	testl	%esi, %esi
	je	.L793
	leal	-1(%rdi), %eax
	leal	-1(%rsi), %r10d
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edi, %edi
	leaq	8(%r8,%rax,8), %r11
	addq	$1, %r10
	.p2align 4,,10
	.p2align 3
.L745:
	movq	%r10, %r9
	xorl	%eax, %eax
	andl	$7, %r9d
	vmovsd	(%r8), %xmm0
	je	.L746
	cmpq	$1, %r9
	je	.L774
	cmpq	$2, %r9
	je	.L775
	cmpq	$3, %r9
	je	.L776
	cmpq	$4, %r9
	je	.L777
	cmpq	$5, %r9
	je	.L778
	cmpq	$6, %r9
	je	.L779
	movl	%edi, %ebx
	movl	$1, %eax
	vmovsd	(%rdx,%rbx,8), %xmm2
	vfmadd231sd	(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, (%r8)
.L779:
	leal	(%rdi,%rax), %r9d
	vmovsd	(%rdx,%r9,8), %xmm1
	vfmadd231sd	(%rcx,%rax,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%r8)
	addq	$1, %rax
.L778:
	leal	(%rdi,%rax), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm3
	vfmadd231sd	(%rcx,%rax,8), %xmm3, %xmm0
	vmovsd	%xmm0, (%r8)
	addq	$1, %rax
.L777:
	leal	(%rdi,%rax), %r9d
	vmovsd	(%rdx,%r9,8), %xmm7
	vfmadd231sd	(%rcx,%rax,8), %xmm7, %xmm0
	vmovsd	%xmm0, (%r8)
	addq	$1, %rax
.L776:
	leal	(%rdi,%rax), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm6
	vfmadd231sd	(%rcx,%rax,8), %xmm6, %xmm0
	vmovsd	%xmm0, (%r8)
	addq	$1, %rax
.L775:
	leal	(%rdi,%rax), %r9d
	vmovsd	(%rdx,%r9,8), %xmm4
	vfmadd231sd	(%rcx,%rax,8), %xmm4, %xmm0
	vmovsd	%xmm0, (%r8)
	addq	$1, %rax
.L774:
	leal	(%rdi,%rax), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm5
	vfmadd231sd	(%rcx,%rax,8), %xmm5, %xmm0
	addq	$1, %rax
	vmovsd	%xmm0, (%r8)
	cmpq	%rax, %r10
	je	.L790
.L746:
	leal	(%rdi,%rax), %r9d
	vmovsd	(%rdx,%r9,8), %xmm8
	leaq	1(%rax), %r9
	vfmadd231sd	(%rcx,%rax,8), %xmm8, %xmm0
	leal	(%rdi,%r9), %ebx
	vmovsd	%xmm0, (%r8)
	vmovsd	(%rdx,%rbx,8), %xmm9
	vfmadd231sd	(%rcx,%r9,8), %xmm9, %xmm0
	leaq	2(%rax), %r9
	vmovsd	%xmm0, (%r8)
	leal	(%rdi,%r9), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm10
	vfmadd231sd	(%rcx,%r9,8), %xmm10, %xmm0
	leaq	3(%rax), %r9
	vmovsd	%xmm0, (%r8)
	leal	(%rdi,%r9), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm11
	vfmadd231sd	(%rcx,%r9,8), %xmm11, %xmm0
	leaq	4(%rax), %r9
	vmovsd	%xmm0, (%r8)
	leal	(%rdi,%r9), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm12
	vfmadd231sd	(%rcx,%r9,8), %xmm12, %xmm0
	leaq	5(%rax), %r9
	vmovsd	%xmm0, (%r8)
	leal	(%rdi,%r9), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm13
	vfmadd231sd	(%rcx,%r9,8), %xmm13, %xmm0
	leaq	6(%rax), %r9
	vmovsd	%xmm0, (%r8)
	leal	(%rdi,%r9), %ebx
	vmovsd	(%rdx,%rbx,8), %xmm14
	vfmadd231sd	(%rcx,%r9,8), %xmm14, %xmm0
	leaq	7(%rax), %r9
	vmovsd	%xmm0, (%r8)
	addq	$8, %rax
	leal	(%rdi,%r9), %ebx
	cmpq	%rax, %r10
	vmovsd	(%rdx,%rbx,8), %xmm15
	vfmadd231sd	(%rcx,%r9,8), %xmm15, %xmm0
	vmovsd	%xmm0, (%r8)
	jne	.L746
.L790:
	addq	$8, %r8
	addl	%esi, %edi
	cmpq	%r8, %r11
	jne	.L745
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L793:
	.cfi_restore 3
	rep ret
	.cfi_endproc
.LFE4809:
	.size	matvec, .-matvec
	.p2align 4,,15
	.globl	_matvec_avx
	.type	_matvec_avx, @function
_matvec_avx:
.LFB4810:
	.cfi_startproc
	vmovupd	(%rsi), %xmm2
	vmovupd	(%rdi), %xmm0
	vinsertf128	$0x1, 16(%rsi), %ymm2, %ymm4
	vmovupd	32(%rdi), %xmm3
	vinsertf128	$0x1, 16(%rdi), %ymm0, %ymm1
	vmovupd	64(%rdi), %xmm9
	vinsertf128	$0x1, 48(%rdi), %ymm3, %ymm6
	vmovupd	96(%rdi), %xmm12
	vinsertf128	$0x1, 80(%rdi), %ymm9, %ymm10
	vinsertf128	$0x1, 112(%rdi), %ymm12, %ymm13
	vmulpd	%ymm4, %ymm1, %ymm5
	vmulpd	%ymm4, %ymm6, %ymm7
	vmulpd	%ymm4, %ymm10, %ymm11
	vmulpd	%ymm4, %ymm13, %ymm14
	vhaddpd	%ymm7, %ymm5, %ymm8
	vhaddpd	%ymm14, %ymm11, %ymm15
	vperm2f128	$33, %ymm15, %ymm8, %ymm4
	vblendpd	$12, %ymm15, %ymm8, %ymm2
	vaddpd	%ymm4, %ymm2, %ymm0
	vmovlpd	%xmm0, (%rdx)
	vzeroupper
	ret
	.cfi_endproc
.LFE4810:
	.size	_matvec_avx, .-_matvec_avx
	.section	.rodata.str1.1
.LC18:
	.string	"Init N=%d,M=%d\n"
.LC19:
	.string	"Final N=%d,M=%d,S=%d\n"
.LC20:
	.string	"A"
.LC21:
	.string	"x"
.LC22:
	.string	"y"
	.text
	.p2align 4,,15
	.globl	matvec_avx
	.type	matvec_avx, @function
matvec_avx:
.LFB4811:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%esi, %r15d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edi, %ebx
	subq	$96, %rsp
	movq	%rcx, -96(%rbp)
	movl	%esi, %ecx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	.LC18(%rip), %rsi
	movl	%edi, -72(%rbp)
	movq	%rdx, -80(%rbp)
	movl	%edi, %edx
	movl	$1, %edi
	movq	%r8, -88(%rbp)
	call	__printf_chk@PLT
	movl	%ebx, %eax
	movl	%ebx, -68(%rbp)
	movq	-80(%rbp), %r9
	testb	$3, %al
	je	.L798
	andl	$-4, %eax
	addl	$4, %eax
	movl	%eax, -68(%rbp)
.L798:
	testb	$3, %r15b
	movl	%r15d, %r13d
	je	.L799
	andl	$-4, %r13d
	addl	$4, %r13d
.L799:
	cmpl	-68(%rbp), %r13d
	jle	.L831
	movl	%r13d, -68(%rbp)
	movl	%r13d, %edx
.L800:
	movl	%edx, %r12d
	movslq	%edx, %r14
	leaq	.LC19(%rip), %rsi
	imull	%r13d, %r12d
	movq	%r14, %r8
	movl	%r13d, %ecx
	shrq	$2, %r8
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%r9, -104(%rbp)
	movl	%r12d, -80(%rbp)
	call	__printf_chk@PLT
	movslq	%r12d, %rcx
	movslq	%r13d, %rdi
	leaq	22(,%r14,8), %r10
	leaq	22(,%rcx,8), %rsi
	leaq	22(,%rdi,8), %r8
	movl	-68(%rbp), %ecx
	andq	$-16, %r10
	andq	$-16, %rsi
	andq	$-16, %r8
	subq	%rsi, %rsp
	movq	%rsp, %rbx
	subq	%r8, %rsp
	leaq	7(%rsp), %rsi
	subq	%r10, %rsp
	shrq	$3, %rsi
	movq	%rsi, -112(%rbp)
	leaq	0(,%rsi,8), %r12
	leaq	7(%rsp), %rsi
	shrq	$3, %rsi
	testl	%ecx, %ecx
	movq	%rsi, -120(%rbp)
	leaq	0(,%rsi,8), %r14
	je	.L801
	testl	%r13d, %r13d
	je	.L802
	leal	-1(%r13), %r9d
	movq	%r14, -128(%rbp)
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%r11d, %r11d
	movl	%ecx, %r14d
	leaq	1(%r9), %r8
	movq	-104(%rbp), %r9
	movq	%r12, -104(%rbp)
	.p2align 4,,10
	.p2align 3
.L807:
	cmpl	-72(%rbp), %r11d
	movq	%r8, %r12
	setb	%cl
	xorl	%eax, %eax
	andl	$3, %r12d
	je	.L806
	cmpq	$1, %r12
	je	.L949
	cmpq	$2, %r12
	je	.L950
	movl	%edx, %edi
	cmpl	%eax, %r15d
	leaq	(%rbx,%rdi,8), %r10
	jbe	.L928
	testb	%cl, %cl
	je	.L928
	movl	%esi, %eax
	vmovsd	(%r9,%rax,8), %xmm0
	vmovsd	%xmm0, (%r10)
.L1020:
	movl	$1, %eax
.L950:
	leal	(%rdx,%rax), %edi
	cmpl	%eax, %r15d
	movl	%eax, %r12d
	leaq	(%rbx,%rdi,8), %r10
	jbe	.L932
	testb	%cl, %cl
	je	.L932
	addl	%esi, %r12d
	vmovsd	(%r9,%r12,8), %xmm1
	vmovsd	%xmm1, (%r10)
.L1022:
	addq	$1, %rax
.L949:
	leal	(%rdx,%rax), %edi
	cmpl	%eax, %r15d
	movl	%eax, %r12d
	leaq	(%rbx,%rdi,8), %r10
	jbe	.L936
	testb	%cl, %cl
	je	.L936
	addl	%esi, %r12d
	vmovsd	(%r9,%r12,8), %xmm2
	vmovsd	%xmm2, (%r10)
.L1024:
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L806
	jmp	.L1025
	.p2align 4,,10
	.p2align 3
.L1046:
	testb	%cl, %cl
	je	.L840
	addl	%esi, %r12d
	vmovsd	(%r9,%r12,8), %xmm3
	vmovsd	%xmm3, (%r10)
.L805:
	addq	$1, %rax
	leal	(%rdx,%rax), %edi
	cmpl	%eax, %r15d
	movl	%eax, %r12d
	leaq	(%rbx,%rdi,8), %r10
	jbe	.L940
	testb	%cl, %cl
	je	.L940
	addl	%esi, %r12d
	vmovsd	(%r9,%r12,8), %xmm4
	vmovsd	%xmm4, (%r10)
.L1026:
	leaq	1(%rax), %rdi
	leal	(%rdx,%rdi), %r10d
	cmpl	%edi, %r15d
	leaq	(%rbx,%r10,8), %r10
	jbe	.L943
	testb	%cl, %cl
	je	.L943
	leal	(%rdi,%rsi), %edi
	vmovsd	(%r9,%rdi,8), %xmm5
	vmovsd	%xmm5, (%r10)
.L1028:
	leaq	2(%rax), %rdi
	leal	(%rdx,%rdi), %r10d
	cmpl	%edi, %r15d
	leaq	(%rbx,%r10,8), %r10
	jbe	.L946
	testb	%cl, %cl
	je	.L946
	leal	(%rdi,%rsi), %edi
	vmovsd	(%r9,%rdi,8), %xmm6
	vmovsd	%xmm6, (%r10)
.L1030:
	addq	$3, %rax
	cmpq	%r8, %rax
	je	.L1025
.L806:
	leal	(%rdx,%rax), %edi
	cmpl	%eax, %r15d
	movl	%eax, %r12d
	leaq	(%rbx,%rdi,8), %r10
	ja	.L1046
.L840:
	movq	$0x000000000, (%r10)
	jmp	.L805
	.p2align 4,,10
	.p2align 3
.L1025:
	addl	$1, %r11d
	addl	%r15d, %esi
	addl	%r13d, %edx
	cmpl	%r11d, %r14d
	jne	.L807
	movq	-104(%rbp), %r12
	movq	-128(%rbp), %r14
.L827:
	testl	%r15d, %r15d
	movl	%r15d, %edi
	jne	.L1047
	.p2align 4,,10
	.p2align 3
.L951:
	movl	%edi, %r10d
	leal	1(%rdi), %esi
	movl	%edi, %r9d
	notl	%r10d
	movq	$0x000000000, (%r12,%r9,8)
	addl	%r13d, %r10d
	andl	$7, %r10d
	cmpl	%r13d, %esi
	jnb	.L815
	testl	%r10d, %r10d
	je	.L814
	cmpl	$1, %r10d
	je	.L966
	cmpl	$2, %r10d
	je	.L967
	cmpl	$3, %r10d
	je	.L968
	cmpl	$4, %r10d
	je	.L969
	cmpl	$5, %r10d
	je	.L970
	cmpl	$6, %r10d
	je	.L971
	movq	$0x000000000, (%r12,%rsi,8)
	leal	2(%rdi), %esi
.L971:
	movl	%esi, %edx
	addl	$1, %esi
	movq	$0x000000000, (%r12,%rdx,8)
.L970:
	movl	%esi, %ecx
	addl	$1, %esi
	movq	$0x000000000, (%r12,%rcx,8)
.L969:
	movl	%esi, %r15d
	addl	$1, %esi
	movq	$0x000000000, (%r12,%r15,8)
.L968:
	movl	%esi, %r11d
	addl	$1, %esi
	movq	$0x000000000, (%r12,%r11,8)
.L967:
	movl	%esi, %eax
	addl	$1, %esi
	movq	$0x000000000, (%r12,%rax,8)
.L966:
	movl	%esi, %r8d
	addl	$1, %esi
	cmpl	%r13d, %esi
	movq	$0x000000000, (%r12,%r8,8)
	jnb	.L815
	.p2align 4,,10
	.p2align 3
.L814:
	movl	%esi, %edi
	leal	1(%rsi), %r10d
	leal	2(%rsi), %r9d
	leal	3(%rsi), %edx
	leal	4(%rsi), %ecx
	leal	5(%rsi), %r15d
	leal	6(%rsi), %r11d
	leal	7(%rsi), %eax
	addl	$8, %esi
	cmpl	%r13d, %esi
	movq	$0x000000000, (%r12,%rdi,8)
	movq	$0x000000000, (%r12,%r10,8)
	movq	$0x000000000, (%r12,%r9,8)
	movq	$0x000000000, (%r12,%rdx,8)
	movq	$0x000000000, (%r12,%rcx,8)
	movq	$0x000000000, (%r12,%r15,8)
	movq	$0x000000000, (%r12,%r11,8)
	movq	$0x000000000, (%r12,%rax,8)
	jb	.L814
.L815:
	movl	-68(%rbp), %esi
	testl	%esi, %esi
	je	.L1043
.L802:
	movl	-72(%rbp), %r8d
	testl	%r8d, %r8d
	movl	%r8d, %r10d
	jne	.L1048
	.p2align 4,,10
	.p2align 3
.L954:
	movl	-68(%rbp), %r9d
	movl	%r10d, %ecx
	leal	1(%r10), %edx
	notl	%ecx
	movl	%r10d, %edi
	movq	$0x000000000, (%r14,%rdi,8)
	addl	%r9d, %ecx
	andl	$7, %ecx
	cmpl	%edx, %r9d
	jbe	.L1043
	testl	%ecx, %ecx
	je	.L1034
	cmpl	$1, %ecx
	je	.L958
	cmpl	$2, %ecx
	je	.L959
	cmpl	$3, %ecx
	je	.L960
	cmpl	$4, %ecx
	je	.L961
	cmpl	$5, %ecx
	je	.L962
	cmpl	$6, %ecx
	je	.L963
	movq	$0x000000000, (%r14,%rdx,8)
	leal	2(%r10), %edx
.L963:
	movl	%edx, %esi
	addl	$1, %edx
	movq	$0x000000000, (%r14,%rsi,8)
.L962:
	movl	%edx, %r8d
	addl	$1, %edx
	movq	$0x000000000, (%r14,%r8,8)
.L961:
	movl	%edx, %r11d
	addl	$1, %edx
	movq	$0x000000000, (%r14,%r11,8)
.L960:
	movl	%edx, %eax
	addl	$1, %edx
	movq	$0x000000000, (%r14,%rax,8)
.L959:
	movl	%edx, %r15d
	addl	$1, %edx
	movq	$0x000000000, (%r14,%r15,8)
.L958:
	movl	%edx, %r10d
	addl	$1, %edx
	cmpl	%edx, -68(%rbp)
	movq	$0x000000000, (%r14,%r10,8)
	movl	-68(%rbp), %ecx
	jbe	.L1043
	.p2align 4,,10
	.p2align 3
.L823:
	movl	%edx, %r9d
	leal	1(%rdx), %edi
	leal	2(%rdx), %esi
	leal	3(%rdx), %r8d
	leal	4(%rdx), %r11d
	leal	5(%rdx), %eax
	leal	6(%rdx), %r15d
	leal	7(%rdx), %r10d
	addl	$8, %edx
	cmpl	%edx, %ecx
	movq	$0x000000000, (%r14,%r9,8)
	movq	$0x000000000, (%r14,%rdi,8)
	movq	$0x000000000, (%r14,%rsi,8)
	movq	$0x000000000, (%r14,%r8,8)
	movq	$0x000000000, (%r14,%r11,8)
	movq	$0x000000000, (%r14,%rax,8)
	movq	$0x000000000, (%r14,%r15,8)
	movq	$0x000000000, (%r14,%r10,8)
	ja	.L823
.L1043:
	vzeroupper
.L816:
	movl	-68(%rbp), %r15d
	leaq	.LC20(%rip), %rcx
	movq	%rbx, %rdx
	movl	%r13d, %esi
	movl	%r15d, %edi
	call	printa
	leaq	.LC21(%rip), %rdx
	movq	%r12, %rsi
	movl	%r13d, %edi
	call	printa.constprop.0
	leaq	.LC22(%rip), %rdx
	movq	%r14, %rsi
	movl	%r15d, %edi
	call	printa.constprop.0
	movl	-80(%rbp), %r14d
	testl	%r14d, %r14d
	movl	%r14d, %eax
	je	.L797
	cltd
	vmovupd	(%rbx), %xmm10
	movq	-88(%rbp), %rcx
	leal	-1(%r14), %r9d
	movl	$4, %edi
	idivl	%r13d
	vmovupd	32(%rbx), %xmm13
	shrl	$2, %r9d
	vinsertf128	$0x1, 16(%rbx), %ymm10, %ymm11
	andl	$1, %r9d
	vmovupd	64(%rbx), %xmm2
	cmpl	%r14d, %edi
	vinsertf128	$0x1, 48(%rbx), %ymm13, %ymm6
	vmovupd	96(%rbx), %xmm5
	movl	%edx, %r13d
	vinsertf128	$0x1, 80(%rbx), %ymm2, %ymm1
	vmovupd	(%r12,%r13,8), %xmm8
	vinsertf128	$0x1, 112(%rbx), %ymm5, %ymm12
	vinsertf128	$0x1, 16(%r12,%r13,8), %ymm8, %ymm9
	movl	%eax, %r12d
	leaq	(%rcx,%r12,8), %rsi
	vmulpd	%ymm9, %ymm11, %ymm14
	vmulpd	%ymm9, %ymm1, %ymm0
	vmulpd	%ymm9, %ymm6, %ymm15
	vmulpd	%ymm9, %ymm12, %ymm7
	vhaddpd	%ymm15, %ymm14, %ymm3
	vhaddpd	%ymm7, %ymm0, %ymm4
	vperm2f128	$33, %ymm4, %ymm3, %ymm10
	vblendpd	$12, %ymm4, %ymm3, %ymm8
	vaddpd	%ymm10, %ymm8, %ymm11
	vaddsd	(%rsi), %xmm11, %xmm0
	jnb	.L1018
	testl	%r9d, %r9d
	je	.L826
	vmovupd	32(%rbx), %xmm14
	movl	$8, %edi
	cmpl	-80(%rbp), %edi
	vmovupd	64(%rbx), %xmm15
	vinsertf128	$0x1, 48(%rbx), %ymm14, %ymm13
	vmovupd	96(%rbx), %xmm5
	vinsertf128	$0x1, 80(%rbx), %ymm15, %ymm3
	vmovupd	128(%rbx), %xmm4
	vinsertf128	$0x1, 112(%rbx), %ymm5, %ymm12
	vinsertf128	$0x1, 144(%rbx), %ymm4, %ymm8
	vmulpd	%ymm9, %ymm13, %ymm6
	vmulpd	%ymm9, %ymm3, %ymm2
	vmulpd	%ymm9, %ymm12, %ymm7
	vmulpd	%ymm9, %ymm8, %ymm10
	vhaddpd	%ymm2, %ymm6, %ymm1
	vhaddpd	%ymm10, %ymm7, %ymm11
	vperm2f128	$33, %ymm11, %ymm1, %ymm13
	vblendpd	$12, %ymm11, %ymm1, %ymm14
	vaddpd	%ymm13, %ymm14, %ymm6
	vaddsd	%xmm6, %xmm0, %xmm0
	jnb	.L1018
	.p2align 4,,10
	.p2align 3
.L826:
	movl	%edi, %r8d
	leal	4(%rdi), %r10d
	addl	$8, %edi
	leaq	(%rbx,%r8,8), %r11
	cmpl	%r14d, %edi
	leaq	(%rbx,%r10,8), %r15
	vmovupd	(%r11), %xmm15
	vmovupd	32(%r11), %xmm1
	vinsertf128	$0x1, 16(%r11), %ymm15, %ymm3
	vmovupd	64(%r11), %xmm4
	vinsertf128	$0x1, 48(%r11), %ymm1, %ymm5
	vmovupd	96(%r11), %xmm11
	vinsertf128	$0x1, 80(%r11), %ymm4, %ymm8
	vinsertf128	$0x1, 112(%r11), %ymm11, %ymm14
	vmovupd	64(%r15), %xmm11
	vmulpd	%ymm9, %ymm3, %ymm2
	vmulpd	%ymm9, %ymm5, %ymm12
	vmulpd	%ymm9, %ymm8, %ymm10
	vmulpd	%ymm9, %ymm14, %ymm13
	vhaddpd	%ymm12, %ymm2, %ymm7
	vinsertf128	$0x1, 80(%r15), %ymm11, %ymm14
	vhaddpd	%ymm13, %ymm10, %ymm6
	vmulpd	%ymm9, %ymm14, %ymm13
	vperm2f128	$33, %ymm6, %ymm7, %ymm3
	vblendpd	$12, %ymm6, %ymm7, %ymm15
	vmovupd	32(%r15), %xmm7
	vaddpd	%ymm3, %ymm15, %ymm2
	vmovupd	96(%r15), %xmm6
	vinsertf128	$0x1, 48(%r15), %ymm7, %ymm4
	vinsertf128	$0x1, 112(%r15), %ymm6, %ymm15
	vaddsd	%xmm2, %xmm0, %xmm5
	vmovupd	(%r15), %xmm0
	vinsertf128	$0x1, 16(%r15), %ymm0, %ymm1
	vmulpd	%ymm9, %ymm4, %ymm8
	vmulpd	%ymm9, %ymm15, %ymm3
	vmulpd	%ymm9, %ymm1, %ymm12
	vhaddpd	%ymm3, %ymm13, %ymm2
	vhaddpd	%ymm8, %ymm12, %ymm10
	vperm2f128	$33, %ymm2, %ymm10, %ymm1
	vblendpd	$12, %ymm2, %ymm10, %ymm0
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddsd	%xmm0, %xmm5, %xmm0
	jb	.L826
.L1018:
	vmovsd	%xmm0, (%rsi)
	vzeroupper
.L797:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L1049
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%rax
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%rax), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L946:
	.cfi_restore_state
	movq	$0x000000000, (%r10)
	jmp	.L1030
	.p2align 4,,10
	.p2align 3
.L943:
	movq	$0x000000000, (%r10)
	jmp	.L1028
	.p2align 4,,10
	.p2align 3
.L940:
	movq	$0x000000000, (%r10)
	jmp	.L1026
	.p2align 4,,10
	.p2align 3
.L936:
	movq	$0x000000000, (%r10)
	jmp	.L1024
	.p2align 4,,10
	.p2align 3
.L932:
	movq	$0x000000000, (%r10)
	jmp	.L1022
.L1047:
	movq	-96(%rbp), %r8
	cmpl	%r15d, %r13d
	movl	$1, %ecx
	cmovbe	%r13d, %r15d
	movl	$0, %edi
	movl	$8, %esi
	testl	%r15d, %r15d
	leal	-1(%r15), %r10d
	movq	%r8, %rax
	cmovne	%r15d, %ecx
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	testl	%r15d, %r15d
	leal	7(%rax), %edx
	cmove	%edi, %r10d
	cmpl	$8, %edx
	cmovb	%esi, %edx
	cmpl	%edx, %r10d
	jb	.L832
	testl	%eax, %eax
	je	.L833
	movq	-112(%rbp), %r9
	vmovsd	(%r8), %xmm7
	cmpl	$1, %eax
	movl	$1, %r10d
	vmovsd	%xmm7, 0(,%r9,8)
	je	.L810
	vmovsd	8(%r8), %xmm8
	cmpl	$3, %eax
	movl	$2, %r10d
	vmovsd	%xmm8, 8(,%r9,8)
	jne	.L810
	vmovsd	16(%r8), %xmm9
	movl	$3, %r10d
	vmovsd	%xmm9, 16(,%r9,8)
.L810:
	movq	-96(%rbp), %r8
	subl	%eax, %ecx
	salq	$3, %rax
	movl	%ecx, %r11d
	movl	%r10d, -104(%rbp)
	movl	$1, %r9d
	shrl	$3, %r11d
	vpbroadcastd	-104(%rbp), %ymm10
	leaq	(%r8,%rax), %r8
	leal	-1(%r11), %edi
	vmovdqa	.LC7(%rip), %ymm12
	vmovdqa	.LC5(%rip), %ymm13
	addq	%r12, %rax
	vpaddd	.LC6(%rip), %ymm10, %ymm11
	vmovapd	32(%r8), %ymm14
	andl	$3, %edi
	cmpl	$1, %r11d
	vmovapd	(%r8), %ymm15
	vpaddd	%ymm13, %ymm11, %ymm7
	leaq	64(%r8), %rsi
	vmovups	%xmm14, 32(%rax)
	vpaddd	%ymm12, %ymm11, %ymm1
	vextractf128	$0x1, %ymm15, 16(%rax)
	leaq	64(%rax), %rdx
	vmovups	%xmm15, (%rax)
	vextractf128	$0x1, %ymm14, 48(%rax)
	jbe	.L1016
	testl	%edi, %edi
	je	.L812
	cmpl	$1, %edi
	je	.L972
	cmpl	$2, %edi
	jne	.L1050
.L973:
	vmovapd	32(%rsi), %ymm3
	addl	$1, %r9d
	addq	$64, %rsi
	vmovapd	-64(%rsi), %ymm4
	addq	$64, %rdx
	vpaddd	%ymm12, %ymm1, %ymm1
	vmovups	%xmm3, -32(%rdx)
	vextractf128	$0x1, %ymm4, -48(%rdx)
	vmovups	%xmm4, -64(%rdx)
	vextractf128	$0x1, %ymm3, -16(%rdx)
.L972:
	addl	$1, %r9d
	addq	$64, %rsi
	addq	$64, %rdx
	vpaddd	%ymm13, %ymm1, %ymm7
	vpaddd	%ymm12, %ymm1, %ymm1
	vmovapd	-32(%rsi), %ymm5
	vmovapd	-64(%rsi), %ymm6
	vmovups	%xmm5, -32(%rdx)
	vextractf128	$0x1, %ymm6, -48(%rdx)
	vmovups	%xmm6, -64(%rdx)
	vextractf128	$0x1, %ymm5, -16(%rdx)
	cmpl	%r9d, %r11d
	jbe	.L1016
.L812:
	addl	$4, %r9d
	addq	$256, %rsi
	addq	$256, %rdx
	vmovapd	-224(%rsi), %ymm9
	vpaddd	%ymm12, %ymm1, %ymm8
	vpaddd	%ymm12, %ymm8, %ymm11
	vmovapd	-256(%rsi), %ymm10
	vpaddd	%ymm12, %ymm11, %ymm2
	vpaddd	%ymm13, %ymm2, %ymm7
	vmovapd	-160(%rsi), %ymm14
	vextractf128	$0x1, %ymm9, -208(%rdx)
	vpaddd	%ymm12, %ymm2, %ymm1
	vmovapd	-192(%rsi), %ymm15
	vextractf128	$0x1, %ymm10, -240(%rdx)
	vmovapd	-96(%rsi), %ymm0
	vextractf128	$0x1, %ymm14, -144(%rdx)
	vmovapd	-128(%rsi), %ymm3
	vextractf128	$0x1, %ymm15, -176(%rdx)
	vmovapd	-32(%rsi), %ymm5
	vextractf128	$0x1, %ymm0, -80(%rdx)
	vmovapd	-64(%rsi), %ymm4
	vextractf128	$0x1, %ymm3, -112(%rdx)
	vmovups	%xmm10, -256(%rdx)
	vextractf128	$0x1, %ymm4, -48(%rdx)
	vmovups	%xmm9, -224(%rdx)
	vextractf128	$0x1, %ymm5, -16(%rdx)
	vmovups	%xmm15, -192(%rdx)
	vmovups	%xmm14, -160(%rdx)
	vmovups	%xmm3, -128(%rdx)
	vmovups	%xmm0, -96(%rdx)
	vmovups	%xmm4, -64(%rdx)
	vmovups	%xmm5, -32(%rdx)
	cmpl	%r9d, %r11d
	ja	.L812
.L1016:
	vextracti128	$0x1, %ymm7, %xmm12
	movl	%ecx, %r11d
	andl	$-8, %r11d
	addl	%r11d, %r10d
	cmpl	%r11d, %ecx
	vpextrd	$3, %xmm12, %edi
	je	.L813
.L809:
	movq	-96(%rbp), %r8
	movl	%r10d, %eax
	leal	1(%r10), %edi
	cmpl	%edi, %r15d
	vmovsd	(%r8,%rax,8), %xmm13
	vmovsd	%xmm13, (%r12,%rax,8)
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm6
	vmovsd	%xmm6, (%r12,%rdi,8)
	leal	2(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm7
	vmovsd	%xmm7, (%r12,%rdi,8)
	leal	3(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm1
	vmovsd	%xmm1, (%r12,%rdi,8)
	leal	4(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm8
	vmovsd	%xmm8, (%r12,%rdi,8)
	leal	5(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm9
	vmovsd	%xmm9, (%r12,%rdi,8)
	leal	6(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm10
	vmovsd	%xmm10, (%r12,%rdi,8)
	leal	7(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm11
	vmovsd	%xmm11, (%r12,%rdi,8)
	leal	8(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm14
	vmovsd	%xmm14, (%r12,%rdi,8)
	leal	9(%r10), %edi
	cmpl	%edi, %r15d
	jbe	.L813
	vmovsd	(%r8,%rdi,8), %xmm15
	vmovsd	%xmm15, (%r12,%rdi,8)
	leal	10(%r10), %edi
	.p2align 4,,10
	.p2align 3
.L813:
	cmpl	%edi, %r13d
	ja	.L951
	jmp	.L815
.L1048:
	movl	-68(%rbp), %edi
	movq	-88(%rbp), %r10
	movl	$1, %esi
	movl	$0, %edx
	movl	$8, %r15d
	cmpl	%r8d, %edi
	movq	%r10, %rax
	cmovbe	%edi, %r8d
	testl	%r8d, %r8d
	leal	-1(%r8), %r9d
	cmovne	%r8d, %esi
	shrq	$3, %rax
	negq	%rax
	andl	$3, %eax
	testl	%r8d, %r8d
	leal	7(%rax), %ecx
	cmove	%edx, %r9d
	cmpl	$8, %ecx
	cmovb	%r15d, %ecx
	cmpl	%ecx, %r9d
	jb	.L836
	testl	%eax, %eax
	je	.L837
	movq	-120(%rbp), %r11
	vmovsd	(%r10), %xmm2
	cmpl	$1, %eax
	movl	$1, %ecx
	vmovsd	%xmm2, 0(,%r11,8)
	je	.L819
	vmovsd	8(%r10), %xmm0
	cmpl	$3, %eax
	movl	$2, %ecx
	vmovsd	%xmm0, 8(,%r11,8)
	jne	.L819
	vmovsd	16(%r10), %xmm3
	movl	$3, %ecx
	vmovsd	%xmm3, 16(,%r11,8)
.L819:
	movq	-88(%rbp), %rdi
	subl	%eax, %esi
	salq	$3, %rax
	movl	%esi, %r11d
	movl	%ecx, -72(%rbp)
	movl	$1, %r9d
	shrl	$3, %r11d
	vpbroadcastd	-72(%rbp), %ymm5
	leaq	(%rdi,%rax), %r15
	leal	-1(%r11), %r10d
	vmovdqa	.LC7(%rip), %ymm13
	vmovdqa	.LC5(%rip), %ymm6
	addq	%r14, %rax
	vpaddd	.LC6(%rip), %ymm5, %ymm12
	vmovapd	32(%r15), %ymm7
	andl	$3, %r10d
	cmpl	$1, %r11d
	vmovapd	(%r15), %ymm4
	vpaddd	%ymm6, %ymm12, %ymm2
	leaq	64(%r15), %rdi
	vmovups	%xmm7, 32(%rax)
	vpaddd	%ymm13, %ymm12, %ymm1
	vextractf128	$0x1, %ymm4, 16(%rax)
	leaq	64(%rax), %rdx
	vmovups	%xmm4, (%rax)
	vextractf128	$0x1, %ymm7, 48(%rax)
	jbe	.L1017
	testl	%r10d, %r10d
	je	.L821
	cmpl	$1, %r10d
	je	.L964
	cmpl	$2, %r10d
	jne	.L1051
.L965:
	vmovapd	32(%rdi), %ymm10
	addl	$1, %r9d
	addq	$64, %rdi
	vmovapd	-64(%rdi), %ymm11
	addq	$64, %rdx
	vpaddd	%ymm13, %ymm1, %ymm1
	vmovups	%xmm10, -32(%rdx)
	vextractf128	$0x1, %ymm11, -48(%rdx)
	vmovups	%xmm11, -64(%rdx)
	vextractf128	$0x1, %ymm10, -16(%rdx)
.L964:
	addl	$1, %r9d
	addq	$64, %rdi
	addq	$64, %rdx
	vpaddd	%ymm6, %ymm1, %ymm2
	vpaddd	%ymm13, %ymm1, %ymm1
	vmovapd	-32(%rdi), %ymm14
	vmovapd	-64(%rdi), %ymm15
	vmovups	%xmm14, -32(%rdx)
	vextractf128	$0x1, %ymm15, -48(%rdx)
	vmovups	%xmm15, -64(%rdx)
	vextractf128	$0x1, %ymm14, -16(%rdx)
	cmpl	%r9d, %r11d
	jbe	.L1017
.L821:
	addl	$4, %r9d
	addq	$256, %rdi
	addq	$256, %rdx
	vmovapd	-224(%rdi), %ymm0
	vpaddd	%ymm13, %ymm1, %ymm3
	vpaddd	%ymm13, %ymm3, %ymm12
	vmovapd	-256(%rdi), %ymm5
	vpaddd	%ymm13, %ymm12, %ymm8
	vpaddd	%ymm6, %ymm8, %ymm2
	vmovapd	-160(%rdi), %ymm7
	vextractf128	$0x1, %ymm0, -208(%rdx)
	vpaddd	%ymm13, %ymm8, %ymm1
	vmovapd	-192(%rdi), %ymm4
	vextractf128	$0x1, %ymm5, -240(%rdx)
	vmovapd	-96(%rdi), %ymm9
	vextractf128	$0x1, %ymm7, -144(%rdx)
	vmovapd	-128(%rdi), %ymm10
	vextractf128	$0x1, %ymm4, -176(%rdx)
	vmovapd	-32(%rdi), %ymm11
	vextractf128	$0x1, %ymm9, -80(%rdx)
	vmovapd	-64(%rdi), %ymm14
	vextractf128	$0x1, %ymm10, -112(%rdx)
	vmovups	%xmm5, -256(%rdx)
	vextractf128	$0x1, %ymm14, -48(%rdx)
	vmovups	%xmm0, -224(%rdx)
	vextractf128	$0x1, %ymm11, -16(%rdx)
	vmovups	%xmm4, -192(%rdx)
	vmovups	%xmm7, -160(%rdx)
	vmovups	%xmm10, -128(%rdx)
	vmovups	%xmm9, -96(%rdx)
	vmovups	%xmm14, -64(%rdx)
	vmovups	%xmm11, -32(%rdx)
	cmpl	%r9d, %r11d
	ja	.L821
.L1017:
	vextracti128	$0x1, %ymm2, %xmm13
	movl	%esi, %r11d
	andl	$-8, %r11d
	addl	%r11d, %ecx
	cmpl	%esi, %r11d
	vpextrd	$3, %xmm13, %r10d
	je	.L822
.L818:
	movq	-88(%rbp), %r15
	movl	%ecx, %eax
	leal	1(%rcx), %r10d
	cmpl	%r10d, %r8d
	vmovsd	(%r15,%rax,8), %xmm6
	vmovsd	%xmm6, (%r14,%rax,8)
	jbe	.L822
	vmovsd	(%r15,%r10,8), %xmm15
	vmovsd	%xmm15, (%r14,%r10,8)
	leal	2(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm2
	vmovsd	%xmm2, (%r14,%r10,8)
	leal	3(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm1
	vmovsd	%xmm1, (%r14,%r10,8)
	leal	4(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm3
	vmovsd	%xmm3, (%r14,%r10,8)
	leal	5(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm0
	vmovsd	%xmm0, (%r14,%r10,8)
	leal	6(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm5
	vmovsd	%xmm5, (%r14,%r10,8)
	leal	7(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm12
	vmovsd	%xmm12, (%r14,%r10,8)
	leal	8(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm7
	vmovsd	%xmm7, (%r14,%r10,8)
	leal	9(%rcx), %r10d
	cmpl	%r8d, %r10d
	jnb	.L822
	vmovsd	(%r15,%r10,8), %xmm4
	vmovsd	%xmm4, (%r14,%r10,8)
	leal	10(%rcx), %r10d
	.p2align 4,,10
	.p2align 3
.L822:
	cmpl	%r10d, -68(%rbp)
	ja	.L954
	jmp	.L1043
	.p2align 4,,10
	.p2align 3
.L928:
	movq	$0x000000000, (%r10)
	jmp	.L1020
	.p2align 4,,10
	.p2align 3
.L831:
	movl	-68(%rbp), %r13d
	movl	%r13d, %edx
	jmp	.L800
	.p2align 4,,10
	.p2align 3
.L1050:
	vmovapd	32(%rsi), %ymm0
	movl	$2, %r9d
	vpaddd	%ymm12, %ymm1, %ymm1
	vmovapd	(%rsi), %ymm2
	leaq	128(%r8), %rsi
	vmovups	%xmm0, 32(%rdx)
	vextractf128	$0x1, %ymm2, 16(%rdx)
	vmovups	%xmm2, (%rdx)
	vextractf128	$0x1, %ymm0, 48(%rdx)
	leaq	128(%rax), %rdx
	jmp	.L973
	.p2align 4,,10
	.p2align 3
.L1051:
	vmovapd	32(%rdi), %ymm8
	movl	$2, %r9d
	vpaddd	%ymm13, %ymm1, %ymm1
	vmovapd	(%rdi), %ymm9
	leaq	128(%r15), %rdi
	vmovups	%xmm8, 32(%rdx)
	vextractf128	$0x1, %ymm9, 16(%rdx)
	vmovups	%xmm9, (%rdx)
	vextractf128	$0x1, %ymm8, 48(%rdx)
	leaq	128(%rax), %rdx
	jmp	.L965
	.p2align 4,,10
	.p2align 3
.L801:
	testl	%r13d, %r13d
	je	.L816
	jmp	.L827
	.p2align 4,,10
	.p2align 3
.L837:
	xorl	%ecx, %ecx
	jmp	.L819
	.p2align 4,,10
	.p2align 3
.L833:
	xorl	%r10d, %r10d
	jmp	.L810
	.p2align 4,,10
	.p2align 3
.L1034:
	movl	%r9d, %ecx
	jmp	.L823
	.p2align 4,,10
	.p2align 3
.L832:
	xorl	%r10d, %r10d
	jmp	.L809
	.p2align 4,,10
	.p2align 3
.L836:
	xorl	%ecx, %ecx
	jmp	.L818
.L1049:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4811:
	.size	matvec_avx, .-matvec_avx
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB4812:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	subq	$32, %rsp
	movl	$0, -44(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L1053
	movl	$0, -48(%rbp)
	je	.L1054
.L1055:
	addq	$22, %rax
	leaq	-48(%rbp), %rsi
	leaq	.LC10(%rip), %rcx
	andq	$-16, %rax
	movl	$2, %edi
	leaq	-52(%rbp), %r13
	subq	%rax, %rsp
	movq	%rsp, %rbx
	movq	%rbx, %rdx
	call	arr_init
	movslq	-44(%rbp), %rdx
	movslq	-48(%rbp), %rcx
	leaq	22(,%rdx,8), %rsi
	leaq	22(,%rcx,8), %rdi
	movl	%ecx, -52(%rbp)
	leaq	.LC11(%rip), %rcx
	movl	%edx, -56(%rbp)
	andq	$-16, %rsi
	andq	$-16, %rdi
	subq	%rsi, %rsp
	leaq	-56(%rbp), %rsi
	movq	%rsp, %r14
	subq	%rdi, %rsp
	movl	$1, %edi
	movq	%r14, %rdx
	movq	%rsp, %r12
	call	arr_init
	leaq	.LC13(%rip), %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	call	arr_init
	movl	-44(%rbp), %esi
	movl	-48(%rbp), %edi
	leaq	.LC20(%rip), %rcx
	movq	%rbx, %rdx
	call	printa
	movl	-44(%rbp), %edi
	leaq	.LC21(%rip), %rdx
	movq	%r14, %rsi
	call	printa.constprop.0
	movl	-48(%rbp), %edi
	leaq	.LC22(%rip), %rdx
	movq	%r12, %rsi
	call	printa.constprop.0
	movl	-48(%rbp), %edi
	movl	-44(%rbp), %r9d
	testl	%edi, %edi
	je	.L1056
	leal	-1(%rdi), %r8d
	movq	%r12, %rcx
	xorl	%edx, %edx
	leaq	8(%r12,%r8,8), %r10
	leal	-1(%r9), %r8d
	addq	$1, %r8
	.p2align 4,,10
	.p2align 3
.L1057:
	testl	%r9d, %r9d
	je	.L1060
	movq	%r8, %r11
	xorl	%eax, %eax
	andl	$7, %r11d
	vmovsd	(%rcx), %xmm0
	je	.L1058
	cmpq	$1, %r11
	je	.L1087
	cmpq	$2, %r11
	je	.L1088
	cmpq	$3, %r11
	je	.L1089
	cmpq	$4, %r11
	je	.L1090
	cmpq	$5, %r11
	je	.L1091
	cmpq	$6, %r11
	je	.L1092
	movl	%edx, %eax
	vmovsd	(%rbx,%rax,8), %xmm2
	movl	$1, %eax
	vfmadd231sd	(%r14), %xmm2, %xmm0
.L1092:
	leal	(%rdx,%rax), %esi
	vmovsd	(%rbx,%rsi,8), %xmm1
	vfmadd231sd	(%r14,%rax,8), %xmm1, %xmm0
	addq	$1, %rax
.L1091:
	leal	(%rdx,%rax), %r11d
	vmovsd	(%rbx,%r11,8), %xmm3
	vfmadd231sd	(%r14,%rax,8), %xmm3, %xmm0
	addq	$1, %rax
.L1090:
	leal	(%rdx,%rax), %esi
	vmovsd	(%rbx,%rsi,8), %xmm7
	vfmadd231sd	(%r14,%rax,8), %xmm7, %xmm0
	addq	$1, %rax
.L1089:
	leal	(%rdx,%rax), %r11d
	vmovsd	(%rbx,%r11,8), %xmm6
	vfmadd231sd	(%r14,%rax,8), %xmm6, %xmm0
	addq	$1, %rax
.L1088:
	leal	(%rdx,%rax), %esi
	vmovsd	(%rbx,%rsi,8), %xmm4
	vfmadd231sd	(%r14,%rax,8), %xmm4, %xmm0
	addq	$1, %rax
.L1087:
	leal	(%rdx,%rax), %r11d
	vmovsd	(%rbx,%r11,8), %xmm5
	vfmadd231sd	(%r14,%rax,8), %xmm5, %xmm0
	addq	$1, %rax
	cmpq	%r8, %rax
	je	.L1103
.L1058:
	leal	(%rdx,%rax), %esi
	vmovsd	(%rbx,%rsi,8), %xmm8
	leaq	1(%rax), %rsi
	leal	(%rdx,%rsi), %r11d
	vfmadd231sd	(%r14,%rax,8), %xmm8, %xmm0
	vmovsd	(%rbx,%r11,8), %xmm9
	vfmadd231sd	(%r14,%rsi,8), %xmm9, %xmm0
	leaq	2(%rax), %rsi
	leal	(%rdx,%rsi), %r11d
	vmovsd	(%rbx,%r11,8), %xmm10
	vfmadd231sd	(%r14,%rsi,8), %xmm10, %xmm0
	leaq	3(%rax), %rsi
	leal	(%rdx,%rsi), %r11d
	vmovsd	(%rbx,%r11,8), %xmm11
	vfmadd231sd	(%r14,%rsi,8), %xmm11, %xmm0
	leaq	4(%rax), %rsi
	leal	(%rdx,%rsi), %r11d
	vmovsd	(%rbx,%r11,8), %xmm12
	vfmadd231sd	(%r14,%rsi,8), %xmm12, %xmm0
	leaq	5(%rax), %rsi
	leal	(%rdx,%rsi), %r11d
	vmovsd	(%rbx,%r11,8), %xmm13
	vfmadd231sd	(%r14,%rsi,8), %xmm13, %xmm0
	leaq	6(%rax), %rsi
	leal	(%rdx,%rsi), %r11d
	vmovsd	(%rbx,%r11,8), %xmm14
	vfmadd231sd	(%r14,%rsi,8), %xmm14, %xmm0
	leaq	7(%rax), %rsi
	addq	$8, %rax
	cmpq	%r8, %rax
	leal	(%rdx,%rsi), %r11d
	vmovsd	(%rbx,%r11,8), %xmm15
	vfmadd231sd	(%r14,%rsi,8), %xmm15, %xmm0
	jne	.L1058
.L1103:
	vmovsd	%xmm0, (%rcx)
.L1060:
	addq	$8, %rcx
	addl	%r9d, %edx
	cmpq	%rcx, %r10
	jne	.L1057
.L1056:
	leaq	.LC22(%rip), %rdx
	movq	%r12, %rsi
	call	printa.constprop.0
	leaq	.LC13(%rip), %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	call	arr_init
	movl	-44(%rbp), %esi
	movl	-48(%rbp), %edi
	movq	%r12, %r8
	movq	%r14, %rcx
	movq	%rbx, %rdx
	call	matvec_avx
	movl	-48(%rbp), %edi
	leaq	.LC22(%rip), %rdx
	movq	%r12, %rsi
	call	printa.constprop.0
	xorl	%eax, %eax
	movq	-40(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L1106
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L1053:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, -48(%rbp)
	call	strtol@PLT
	movl	%eax, -44(%rbp)
.L1061:
	movl	-48(%rbp), %eax
	imull	-44(%rbp), %eax
	cltq
	salq	$3, %rax
	jmp	.L1055
.L1054:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, -48(%rbp)
	call	strtol@PLT
	movl	%eax, -44(%rbp)
	jmp	.L1061
.L1106:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4812:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC5:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.align 32
.LC6:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC7:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.align 32
.LC8:
	.long	7
	.long	6
	.long	5
	.long	4
	.long	3
	.long	2
	.long	1
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC12:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
