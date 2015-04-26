.model tiny
.code
        org	100h		; начало СОМ-файла
start:

	;Для начала очистим экран:
	mov	ax,0600h	;ah 06 (прокрутка)
		     		;al 00 (весь экран)
	mov	bh,07h		;нормальный атрибут (черно/белый)
	mov	cx,0000h 	;Левая верхняя позиция
	mov	dx,184Fh 	;Правая нижняя позиция
	int 	10h

	;И переместим курсор в левую верхнюю позицию
	mov	ah,02h
	mov	bh,00		;экран 0
	mov	dx,0000h	;переводим курсор в строку 00, столбец 00
	int	10h

        mov	cx,256		; всего будет 256 символов
        mov	dl,00		; первый символ - с кодом 00
        mov	ah,02h		; номер функции DOS "вывод символа"
cloop:  
	cmp	cx,1
	je	continue_loop
	call	WRITE_HEX	;печатаем код символа
	;cmp	dl,0Ah
	;je	increment
	int	21h
increment:
        inc	dl		; и за ним сам следующий символ
	
	push	dx		;откидываем значение регистра dx в стек
	mov	dl,20h		;для удобства чтения таблицы разделяем пробелом после каждого символа
	int	21h
	pop	dx		;возвращаем инкрементированное значение dx

        test	dl,0Fh		; если DL не кратен 16,
        jnz	continue_loop	; продолжить цикл,
        push	dx		; иначе: сохранить текущий символ
        mov	dl,0Dh		; переводим каретку на начало строки
        int	21h
        mov	dl,0Ah		; переводим каретку на следующую строку
        int	21h
        pop	dx		; восстановить текущий символ
continue_loop:
        loop	cloop		; продолжить цикл


WRITE_HEX proc			;Данная процедура печатает две шест. цифры
	push 	cx
	push	dx		;Сохраняем значения
	mov	dh,dl		;копируем значение регистра перед сдвигом битов
	mov	cl,4		
	shr	dl,cl		;осуществляем логический сдвиг операнда DL на 4 бита вправо
	call	WRITE_HEX_DIGIT	;печатаем старшую тетраду
	mov	dl,dh		;восстанавливаем регистр
	and	dl,0Fh		;побитовым "И" зануляем старшие 4 бита
	call	WRITE_HEX_DIGIT	;печатаем младшую тетраду
	pop	dx
	pop	cx		;восстанавливаем старые значения регистров для работы в основном теле программы
	ret
WRITE_HEX endp

WRITE_HEX_DIGIT proc
	push	dx		;Сохраняем значение регистра dx
	cmp	dl,0Ah		;если значение dl >9
	jae 	hex_letter	;то печатаем букву
	add	dl,30h		;добавляем 30h позиций, чтобы вывести цифру
	jmp	write_digit
hex_letter:
	add	dl,37h		;добавляем 37h позиций, чтобы вывести букву
write_digit:
	mov	ah,2
	int	21h		;выводим получившееся значение
	pop	dx		;восстанавливаем регистр
	ret
WRITE_HEX_DIGIT endp
	ret			; завершение СОМ-файла
        end	start
