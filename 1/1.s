# информация о файле и определение fact как функции в глобальном пространстве
	.file	"1.c"
	.text
	.p2align 4
	.globl	fact
	.type	fact, @function
# определение глобальной метки, обозначающей функцию fact 
fact:
.LFB23:
	.cfi_startproc
	endbr64
	movl	$1, %eax # запись единицы в регистр eax
	testl	%edi, %edi # проверка на равенство нулю
	je	.L4 # прыжок в метку L4 при получении истины в предыдущей строке
	.p2align 4,,10
	.p2align 3
.L3:
	imull	%edi, %eax # умножение, запись результата в регистр eax, эквивалентно: eax = eax * edi
	subl	$1, %edi # вычитание единицы из edi
	jne	.L3 # выполнение проверки на не равенство нулю, в случае истины переход на метку L3 (можно считать циклом)
	ret # возврат
	.p2align 4,,10
	.p2align 3
# метка обозначающая полный выход из цикла
.L4:
	ret
	.cfi_endproc
.LFE23:
	.size	fact, .-fact
	.section	.rodata.str1.1,"aMS",@progbits,1
# определение строк и функции main в глобальной области
.LC0:
	.string	"Hello, world!"
.LC1:
	.string	"Fact of %d is %d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
# глобальная метка main, функция
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp # вычитание 8 из регистра rsp
	.cfi_def_cfa_offset 16
	leaq	.LC0(%rip), %rdi # вычисление и запись эффективного (текущего) адреса строки "Hello, world!" из локальной метки в регистр rdi
	call	puts@PLT # вызов макроса puts для вывода строки
	movl	$3628800, %ecx # сохранение числа 3628800 в регистр ecx
	movl	$10, %edx # сохранение 10 в edx
	xorl	%eax, %eax # выполнение исключительного или для регистра eax
	leaq	.LC1(%rip), %rsi # вычисление и запись эффективного (текущего) адреса строки с результатом вычисления факториала из локальной метки в регистр rsi
	movl	$1, %edi # сохранение 10 в edx
	call	__printf_chk@PLT # вызов макроса printf для вывода форматированной строки
	xorl	%eax, %eax 
	addq	$8, %rsp # прибавление 8 к rsp
	.cfi_def_cfa_offset 8
	ret # возврат из функции
	.cfi_endproc
# системная информвция касательно настроек, названия и типа компилятора, выравнивания, стека
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
