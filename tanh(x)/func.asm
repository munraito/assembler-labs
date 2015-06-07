	.586
	.model flat, C

	.code
	func proc x:qword
	
		fld x; //��������� x
		fld st;
		fadd; // x+x=2x
		fldl2e;
		fmul; // log2(exp) * 2x
		fld st; //�������� � ������� �����
		frndint; //��������� �������� �� �������
		fsub st(1), st; //������� �������
		fxch st(1); // ��������� � �������
		f2xm1; // st(0) = 2^(st) - 1
		fld1;
		fadd; // st(0) = 2^(st)
		fscale;	//=exp(2x)
		fld st; //�������������� � ������� �����
		fld1;
		fsub;	//� ������� e^(2x)-1
		fxch st(1); // ������ � st(0) e^(2x)
		fld1;
		fadd; // � st(0) e^(2x)+1
		fdiv; //��������� st(1) �� st(0)
		ret

	func ENDP

	END
