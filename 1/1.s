# ���������� � ����� � ����������� fact ��� ������� � ���������� ������������
	.file	"1.c"
	.text
	.p2align 4
	.globl	fact
	.type	fact, @function
# ����������� ���������� �����, ������������ ������� fact 
fact:
.LFB23:
	.cfi_startproc
	endbr64
	movl	$1, %eax # ������ ������� � ������� eax
	testl	%edi, %edi # �������� �� ��������� ����
	je	.L4 # ������ � ����� L4 ��� ��������� ������ � ���������� ������
	.p2align 4,,10
	.p2align 3
.L3:
	imull	%edi, %eax # ���������, ������ ���������� � ������� eax, ������������: eax = eax * edi
	subl	$1, %edi # ��������� ������� �� edi
	jne	.L3 # ���������� �������� �� �� ��������� ����, � ������ ������ ������� �� ����� L3 (����� ������� ������)
	ret # �������
	.p2align 4,,10
	.p2align 3
# ����� ������������ ������ ����� �� �����
.L4:
	ret
	.cfi_endproc
.LFE23:
	.size	fact, .-fact
	.section	.rodata.str1.1,"aMS",@progbits,1
# ����������� ����� � ������� main � ���������� �������
.LC0:
	.string	"Hello, world!"
.LC1:
	.string	"Fact of %d is %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
# ���������� ����� main, �������
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp # ��������� 8 �� �������� rsp
	.cfi_def_cfa_offset 16
	leaq	.LC0(%rip), %rdi # ���������� � ������ ������������ (��������) ������ ������ "Hello, world!" �� ��������� ����� � ������� rdi
	call	puts@PLT # ����� ������� puts ��� ������ ������
	movl	$3628800, %ecx # ���������� ����� 3628800 � ������� ecx
	movl	$10, %edx # ���������� 10 � edx
	xorl	%eax, %eax # ���������� ��������������� ��� ��� �������� eax
	leaq	.LC1(%rip), %rsi # ���������� � ������ ������������ (��������) ������ ������ � ����������� ���������� ���������� �� ��������� ����� � ������� rsi
	movl	$1, %edi # ���������� 10 � edx
	call	__printf_chk@PLT # ����� ������� printf ��� ������ ��������������� ������
	xorl	%eax, %eax 
	addq	$8, %rsp # ����������� 8 � rsp
	.cfi_def_cfa_offset 8
	ret # ������� �� �������
	.cfi_endproc
# ��������� ���������� ���������� ��������, �������� � ���� �����������, ������������, �����
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
