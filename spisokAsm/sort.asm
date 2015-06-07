.586
.MODEL FLAT, C
.CODE
sort PROC C mas:byte, N:dword

		 mov edi, dword ptr [mas]    ;edi = указатель на массив
		 mov ecx,N            ;ecx = количество элементов

a0:		 lea ebx,[edi+ecx]	;ebx = максимальный индекс в проходе+1
		 mov ah,byte ptr [edi]	;eax=min=величина первого элемента в проходе
a1:		 dec ebx				;двигаемся по проходу вверх
		 mov al, byte ptr [ebx]
		 cmp ah, al
		 jbe a2					;min > array[ebx] ?
		 xchg ah,al
		 mov [ebx],al			
		 mov [edi],ah			;swap(array[ebx],min)

a2:		 cmp ebx,edi
		 jnz a1					;если проход не закончился, идем обратно к элементу
		 stosb					;сохраняем байт
		 loop a0
ret
sort ENDP
END