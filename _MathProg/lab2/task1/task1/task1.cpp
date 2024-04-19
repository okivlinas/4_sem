#include <iostream>
#include "Comb.h"
#include <tchar.h>

using std::cout;
using std::endl;

int _tmain(int argc, _TCHAR* argv[])
{
	setlocale(LC_ALL, "rus");
	char  AA[][2] = {"A", "B", "C", "D", "E"};
	cout << "Генератор множества всех подмножеств\n";
	cout << endl << "Исходное множество: ";
	cout << "{ ";

	for (int i = 0; i < sizeof(AA) / 2; i++)
		cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
	cout << "}\n\nИтоговая генерация всех подмножеств исходного множества:";


	comb::subset s1(sizeof(AA) / 2);     // создание генератора   
	int  n = s1.getfirst();    // первое (пустое) подмножество    

	while (n >= 0)                         // пока есть подмножества 
	{
		cout << endl << "{ ";
		for (int i = 0; i < n; i++)
			cout << AA[s1.ntx(i)] << ((i < n - 1) ? ", " : " ");
		cout << "}";
		n = s1.getnext();                  // cледующее подмножество 
	};

	cout << endl << "Всего множеств: " << s1.count() << endl;
	system("pause");
	return 0;

}