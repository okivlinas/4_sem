#include <stdio.h>
#include "Auxil.h"                            // вспомогательные функции 
#include <iostream>
#include <ctime>
#include <locale>
#include <chrono>
#include "Factorial.h"

#define  CYCLE  3000000                    // количество циклов  

using namespace std;

void main()
{
	double  av1 = 0, av2 = 0;
	clock_t  t1 = 0, t2 = 0;

	setlocale(LC_ALL, "rus");

	auxil::start();                          // старт генерации 
	t1 = clock();                            // фиксаци€ времени 
	for (int i = 0; i < CYCLE; i++)
	{
		av1 += (double)auxil::iget(-100, 100); // сумма случайных чисел 
		av2 += auxil::dget(-100, 100);         // сумма случайных чисел 
	}
	t2 = clock();                            // фиксаци€ времени 


	std::cout << "количество циклов:         " << CYCLE;
	std::cout << std::endl << "среднее значение (int):    " << av1 / CYCLE;
	std::cout << std::endl << "среднее значение (double): " << av2 / CYCLE;
	std::cout << std::endl << "продолжительность (у.е):   " << (t2 - t1);
	std::cout << std::endl << "                  (сек):   "
		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);
	std::cout << std::endl;
	system("pause");

	cout << endl;


	auto start = std::chrono::steady_clock::now();
	long double res = factorial(140);
	auto end = std::chrono::steady_clock::now();

	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
	std::cout << "‘акториал числа: " << res << std::endl;
	std::cout << "«атраченное врем€: " << duration << " микросекунд" << std::endl;

	system("pause");

}