#include "stdafx.h"
#include "math.h"

int _tmain(int argc, _TCHAR* argv[])
{
	float x, result, a;
	x = 5;
	__asm{
		fld x; //загружаем x
		fld st; 
		fadd; // x+x=2x
		fldl2e; 
		fmul; // log2(exp) * 2x
		fld st; 
		frndint; //округляем значение из вершины
		fsub st(1), st; //находим разницу
		fxch st(1); // результат в вершину
		f2xm1; // 2^(st) - 1
		fld1;
		fadd; //st(0) = 2^(log2(exp)*2x)
		fscale;	//=exp(2x)
		fld st; //продублировали в вершину стека
		fld1;
		fsub;	//в вершине e^(2x)-1
		fxch st(1); // теперь в st(0) e^(2x)
		fld1;
		fadd; // в st(0) e^(2x)+1
		fdiv; //разделили st(1) на st(0)
		fstp result;
	}
	a = tanh(x);
	printf("Result=%f\n", result);
	printf("Result=%f\n", a);
	return 0;
}
