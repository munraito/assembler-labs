	.586
	.model flat, C

	.code
	func proc x:qword
	
		fld x; //загружаем x
		fld st;
		fadd; // x+x=2x
		fldl2e;
		fmul; // log2(exp) * 2x
		fld st; //копируем в вершину стека
		frndint; //округляем значение из вершины
		fsub st(1), st; //находим разницу
		fxch st(1); // результат в вершину
		f2xm1; // st(0) = 2^(st) - 1
		fld1;
		fadd; // st(0) = 2^(st)
		fscale;	//=exp(2x)
		fld st; //продублировали в вершину стека
		fld1;
		fsub;	//в вершине e^(2x)-1
		fxch st(1); // теперь в st(0) e^(2x)
		fld1;
		fadd; // в st(0) e^(2x)+1
		fdiv; //разделили st(1) на st(0)
		ret

	func ENDP

	END
