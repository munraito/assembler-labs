.586
.MODEL FLAT, C
.CODE
insertElem PROC C mas:byte, n:dword, newElem:byte, newIndex:dword

		mov ecx, n						;� ecx - ���������� ��������� � ������
		mov ebx, newIndex				;� ebx - �� ����� ����� ��������� ����� �������
		mov edi, dword ptr [mas]		;edi = ��������� �� ������
		lea esi, [edi+ecx]				;� esi - ����� �������
		lea edi, [esi+1]				;edi ��������� �� 1 ���� ������
		std								;������������� df = 1, ����� ������ ��������� ������, � �� �����
		rep movsb						;����������� �� esi � edi
		
		mov al, newElem					;� al - ����� �������
		lea edi, [esi+ebx]				;���� ��������� �������
		cld								;df=0
		stosb							;��������� ���� � ������ �������
	ret
insertElem ENDP

END