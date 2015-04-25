TITLE ALLASC (COM)
CODSEG SEGMENT PARA 'Code'
	ASSUME CS:CODSEG, DS:CODSEG, SS:CODSEG, ES:NOTHING
	ORG 100H
BEGIN: JMP MAIN
CTR DB 00, '$'

; Основная процедура:

MAIN PROC NEAR
	CALL B10CLR ;Очистить экран
	CALL C10SET ;Установить курсор
	CALL D10DISP ;Вывести символ на экран
	RET
MAIN ENDP

; Очистка экрана:
B10CLR PROC
	MOV AX,0600H ;ah 06 (прокрутка)
		     ;al 00 (весь экран)
	MOV BH,07 ;нормальный атрибут (черно/белый)
	MOV CX,0000 ;Левая верхняя позиция
	MOV DX,184FH ;Правая нижняя позиция
	INT 10H
	RET
B10CLR ENDP

; Установка курсора в 00,00:
C10SET PROC
	MOV AH,02
	MOV BH,00 ;экран 0
	MOV DX,0000 ;строка 00, столбец 00
	INT 10H
	RET
C10SET ENDP

; Вывод на экран ASCII символов:
D10DISP PROC
	MOV CX, 256 ;256 итераций
	LEA DX,CTR ;Адрес счетчика
D20:
	MOV AH,09 ;Функция вывода символа
	INT 21H
	INC CTR ;Увеличить счетчик
	LOOP D20 ;Уменьшить CX,
		 ; цикл, если не ноль
	RET
D10DISP ENDP

CODSEG ENDS
	END BEGIN
