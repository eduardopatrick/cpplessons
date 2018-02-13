#--------------------------------------------------------------------------------------------------
# Programa: tan 																				  -
# Arquivo: Tangent.s 																			  -
# Descrição: Rotina em Assembly (arquitetura x86-64) para computar a tangente de um ângulo.		  -
#																								  -
# Escrito por Miguel Nischor - github.com/miguelnischor 										  -
# Testado utilizando Ubuntu 17.10, Kernel 4.13, Compilador GCC 7.2 								  -
#--------------------------------------------------------------------------------------------------
# Como compilar:																				  -
#																								  -
# as --32 -c Tangent.s -o asm_x86.o 														 	  -
# as --64 -c Tangent.s -o asm_amd64.o 															  -
#--------------------------------------------------------------------------------------------------

# Este atributo diz ao compilador para interpretar todo o código como sintaxe Intel (o padrão é AT&T)
.intel_syntax noprefix

# Este atributo declara uma função que pode ser importada usando outras linguagens de programação
.global Tangent

# Este atributo declara onde esta função será armazenada no arquivo de código objeto
.section .text

# Nome da função que foi declarada como exportável
Tangent:
	
	# Este bloco de código só será compilado se o compilador for 32 bit (Ou usar opção --32)
	.ifdef ASMX86_32
		push ebp
		mov ebp, esp
		fld qword ptr[ebp + 8]
		fcos
		fld qword ptr[ebp + 8]
		fsin
		fdiv
		pop ebp
		ret
	.endif

	# Este bloco de código só será compilado se o compilador for 64 bit (Ou usar opção --64)
	.ifdef ASMX86_64
		push rbp
		mov rbp, rsp
		fld qword ptr[rbp + 8]
		fcos
		fld qword ptr[rbp + 8]
		fsin
		fdiv
		pop ebp
		ret
	.endif
