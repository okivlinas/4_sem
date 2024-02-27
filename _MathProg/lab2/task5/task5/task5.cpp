﻿#include <iostream>
#include "Comb.h"
#include <tchar.h>
#include "Knapsack.h"
#define NN 18
int _tmain(int argc, _TCHAR* argv[])
{
    setlocale(LC_ALL, "rus");
    int V = 300,   // вместимость рюкзака              
        v[NN],     // размер предмета каждого типа  
        c[NN];     // стоимость предмета каждого типа 
    short m[NN];   // количество предметов каждого типа  {0,1}

    RandomFilling(v, NN, 10, 300);      // заполнение массива с размерами каждого предмета
    RandomFilling(c, NN, 5, 55);        // заполнение массива со стоимостями каждого предмета

    int maxcc = knapsack_s(
        V,   // [in]  вместимость рюкзака 
        NN,  // [in]  количество типов предметов 
        v,   // [in]  размер предмета каждого типа  
        c,   // [in]  стоимость предмета каждого типа     
        m    // [out] количество предметов каждого типа  
    );

    std::cout << std::endl << "-------- Задача о рюкзаке ---------";
    std::cout << std::endl << "- количество предметов : " << NN;
    std::cout << std::endl << "- вместимость рюкзака  : " << V;
    std::cout << std::endl << "- номер     : вес     : стоимость : стоимость предмета";
    for (int i = 0; i < NN; i++) {
        std::cout << std::endl << "- " << i + 1 << "         : " << v[i] << "       : " << c[i] << "         : " << v[i] * c[i];
    }
    std::cout << std::endl << "- оптимальная стоимость рюкзака: " << maxcc;
    std::cout << std::endl << "- вес рюкзака: ";
    int s = 0; for (int i = 0; i < NN; i++) s += m[i] * v[i];
    std::cout << s;
    std::cout << std::endl << "- выбраны предметы: ";
    for (int i = 0; i < NN; i++) {
        if (i + 1 < 10) std::cout << " " << m[i];
        else std::cout << "  " << m[i];
    }
    std::cout << std::endl << "- выбраны предметы: ";
    for (int i = 0; i < NN; i++) std::cout << " " << i+1;
    std::cout << std::endl << std::endl;
    return 0;
}