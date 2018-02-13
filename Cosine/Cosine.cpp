//-------------------------------------------------------------------------------------------------
// Programa: cos 																				  -
// Arquivo: Cosine.cpp																			  -
// Descrição: Rotina em C++ para implementar o coração do programa.								  -
//																								  -
// Escrito por Miguel Nischor - github.com/miguelnischor 										  -
// Testado utilizando Ubuntu 17.10, Kernel 4.13, Compilador GCC 7.2								  -
//-------------------------------------------------------------------------------------------------
// Como compilar:																				  -
//																								  -
// g++ -m32 -O3 -std=c++14 -c Cosine.cpp -o cpp_x86.o											  -
// g++ -m64 -O3 -std=c++14 -c Cosine.cpp -o cpp_amd64.o											  -
//-------------------------------------------------------------------------------------------------
#include <iostream>
#include <cstdlib>

using namespace std;

// Nossa função que será importada do arquivo Cosine.s
extern "C" double Cosine(double);

int main(int argc, char** argv)
{
	if (argc < 2)
	{
		cout << "\033[31mOne argument is required.\033[0m\n";
		return 0;
	};

	double Radians = strtod(argv[1], 0);

	cout << Cosine(Radians) << endl;
	return 0;
};
