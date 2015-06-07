.586
.MODEL FLAT, C
.CODE
findElem PROC C mas:byte, N:dword, k:byte

		mov edi, dword ptr [mas]    ;edi = указатель на массив
		dec edi						;костыль для нахождения нулевого элемента, отодвигаем указатель назад
		mov ecx,N					;ecx = количество элементов
		mov al,k					;al - искомый элемент	

a0:		mov ah,byte ptr [edi+ecx]	;ah - величина первого элемента в проходе
		cmp ah,al					;сравнили искомый элемент и текущий
		je	a2						;если они совпали, то выходим из цикла
		loop a0
		jmp exit					;при неудаче - выходим из процедуры

a2:		dec ecx		
		mov eax,ecx					;и заносим в eax индекс найденного элемента
exit:
ret
findElem ENDP
END