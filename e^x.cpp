#include "stdafx.h"
#include "math.h"

int _tmain(int argc, _TCHAR* argv[])
{
	float x, result, a;
	x = 1;
	__asm{
		fld x;
		fld st;
		fadd;
		fldl2e;
		fmul;
		fld st(0);
		frndint;
		fsub st(1), st;
		fxch st(1);
		f2xm1;
		fld1;
		fadd;
		fscale;	//посчитали e^(2x)
		fld1;
		fsub;	//отняли 1
		fstp result;
	}
	a = exp(2*x) - 1;
	printf("Result=%f\n", result);
	printf("Result=%f\n", a);
	return 0;
}

