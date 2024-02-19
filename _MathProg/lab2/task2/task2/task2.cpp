﻿// Main      
#include <iostream>
#include <tchar.h>
#include "Comb.h"

using std::cout;
using std::endl;



int _tmain(int argc, _TCHAR* argv[])
{
	setlocale(LC_ALL, "rus");
	char  AA[][2] = { "A", "B", "C", "D", "E"};
	cout << "Генератор сочетаний\n";
	cout << endl << "Исходное множество: ";
	cout << "{ ";

	for (int i = 0; i < sizeof(AA) / 2; i++)
		cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
	cout << "}\n";

	cout << endl << "Генерация сочетаний ";


	comb::xcombination xc(sizeof(AA) / 2, 3);
	cout << "из " << xc.n << " по " << xc.m;
	int  n = xc.getfirst();
	while (n >= 0)
	{
		cout << endl << xc.nc << ": { ";
		for (int i = 0; i < n; i++)
			cout << AA[xc.ntx(i)] << ((i < n - 1) ? ", " : " ");
		cout << "}";
		n = xc.getnext();
	};


	cout << endl << "Всего сочетаний: " << xc.count() << endl;
	system("pause");
	return 0;
}