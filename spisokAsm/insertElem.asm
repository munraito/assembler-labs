.586
.MODEL FLAT, C
.CODE
insertElem PROC C mas:byte, n:dword, newElem:byte, newIndex:dword

		mov ecx, n						;в ecx - количество элементов в списке
		mov ebx, newIndex				;в ebx - на какое место поставить новый элемент
		mov edi, dword ptr [mas]		;edi = указатель на массив
		lea esi, [edi+ecx]				;в esi - конец массива
		lea edi, [esi+1]				;edi указывает на 1 байт вперед
		std								;устанавливаем df = 1, чтобы массив сдвинулся вперед, а не назад
		rep movsb						;перемещение из esi в edi
		
		mov al, newElem					;в al - новый элемент
		lea edi, [esi+ebx]				;куда поставить элемент
		cld								;df=0
		stosb							;сохраняем байт в нужном индексе
	ret
insertElem ENDP

END