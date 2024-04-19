#include <stdio.h>
#include "Auxil.h"                            // ��������������� ������� 
#include <iostream>
#include <ctime>
#include <locale>
#include <chrono>
#include "Factorial.h"

#define  CYCLE  3000000                    // ���������� ������  

using namespace std;

void main()
{
	double  av1 = 0, av2 = 0;
	clock_t  t1 = 0, t2 = 0;

	setlocale(LC_ALL, "rus");

	auxil::start();                          // ����� ��������� 
	t1 = clock();                            // �������� ������� 
	for (int i = 0; i < CYCLE; i++)
	{
		av1 += (double)auxil::iget(-100, 100); // ����� ��������� ����� 
		av2 += auxil::dget(-100, 100);         // ����� ��������� ����� 
	}
	t2 = clock();                            // �������� ������� 


	std::cout << "���������� ������:         " << CYCLE;
	std::cout << std::endl << "������� �������� (int):    " << av1 / CYCLE;
	std::cout << std::endl << "������� �������� (double): " << av2 / CYCLE;
	std::cout << std::endl << "����������������� (�.�):   " << (t2 - t1);
	std::cout << std::endl << "                  (���):   "
		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);
	std::cout << std::endl;
	system("pause");

	cout << endl;


	auto start = std::chrono::steady_clock::now();
	long double res = factorial(140);
	auto end = std::chrono::steady_clock::now();

	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
	std::cout << "��������� �����: " << res << std::endl;
	std::cout << "����������� �����: " << duration << " �����������" << std::endl;

	system("pause");

}