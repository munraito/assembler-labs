        .model tiny
        .code
        org		100h		; начало СОМ-файла
start:

	mov		ax,0600h	;ah 06 (прокрутка)
		     			;al 00 (весь экран)
	mov		bh,07 		;нормальный атрибут (черно/белый)
	mov 		cx,0000 	;Левая верхняя позиция
	mov 		dx,184Fh 	;Правая нижняя позиция
	int 		10h

	mov		ah,02
	mov 		bh,00 		;экран 0
	mov 		dx,0000		;переводим курсор в строку 00, столбец 00
	int 		10h

        mov		cx,256		; вывести 256 символов
        mov		dl,0		; первый символ - с кодом 00
        mov		ah,2		; номер функции DOS "вывод символа"
cloop:
	int		21h		; вызов DOS
        inc		dl		; увеличение DL на 1 - следующий символ

	push		dx	
	mov		dl,20h		;так мы выводим пробел после каждого символа
	int		21h
	pop		dx

        test		dl,0Fh		; если DL не кратен 16,
        jnz		continue_loop	; продолжить цикл,
        push		dx		; иначе: сохранить текущий символ
        mov		dl,0Dh		; переводим каретку на в начало строки
        int		21h
        mov		dl,0Ah		; переводим каретку на следующую строку
        int		21h
        pop		dx		; восстановить текущий символ
continue_loop:
        loop		cloop		; продолжить цикл
	ret				; завершение СОМ-файла
        end		start
