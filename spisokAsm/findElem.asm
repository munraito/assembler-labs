.586
.MODEL FLAT, C
.CODE
findElem PROC C mas:byte, N:dword, k:byte

		mov edi, dword ptr [mas]    ;edi = ��������� �� ������
		dec edi						;������� ��� ���������� �������� ��������, ���������� ��������� �����
		mov ecx,N					;ecx = ���������� ���������
		mov al,k					;al - ������� �������	

a0:		mov ah,byte ptr [edi+ecx]	;ah - �������� ������� �������� � �������
		cmp ah,al					;�������� ������� ������� � �������
		je	a2						;���� ��� �������, �� ������� �� �����
		loop a0
		jmp exit					;��� ������� - ������� �� ���������

a2:		dec ecx		
		mov eax,ecx					;� ������� � eax ������ ���������� ��������
exit:
ret
findElem ENDP
END