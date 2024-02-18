#include "Factorial.h"
#include <iostream>
using namespace std;

long double factorial(long double num) {
    if (num == 1) {
        return 1;
    }
    return num * factorial(num - 1);
}