.586
.MODEL FLAT, C
.CODE
sort PROC C mas:byte, N:dword

		 mov edi, dword ptr [mas]    ;edi = ��������� �� ������
		 mov ecx,N            ;ecx = ���������� ���������

a0:		 lea ebx,[edi+ecx]	;ebx = ������������ ������ � �������+1
		 mov ah,byte ptr [edi]	;eax=min=�������� ������� �������� � �������
a1:		 dec ebx				;��������� �� ������� �����
		 mov al, byte ptr [ebx]
		 cmp ah, al
		 jbe a2					;min > array[ebx] ?
		 xchg ah,al
		 mov [ebx],al			
		 mov [edi],ah			;swap(array[ebx],min)

a2:		 cmp ebx,edi
		 jnz a1					;���� ������ �� ����������, ���� ������� � ��������
		 stosb					;��������� ����
		 loop a0
ret
sort ENDP
END