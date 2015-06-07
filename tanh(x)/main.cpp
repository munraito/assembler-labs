#include <iostream>
#include "math.h"


extern "C"{
	double func(double);
}

int main()
{
	double x, result, a;
	x = 0.001;
	result = func(x);
	a = tanh(x);
	printf("Result=%f\n", result);
	printf("Result=%f\n", a);
	return 0;
}