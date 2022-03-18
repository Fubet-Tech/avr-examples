; (C) Fubet Tech LLP, 2022
.include "tn84def.inc"	; Define device ATtiny84A
.org 0x00		; Starting address of program
main:
	SBI DDRA, 0	; Set PA0 as Output pin
loop:
	SBI PORTA, 0	; Make PA0 HIGH
	RCALL delay	; Call delay subroutine
	CBI PORTA, 0	; Make PA0 LOW
	RCALL delay	; Call delay subroutine
	RJMP loop	; Repeat from loop
delay:
	SER R16		; Set R16 = 0xFF
d2:
	SER R17		; Set R17 = 0xFF
d1:
	DEC R17		; Decrement R17
	BRNE d1		; If R17 is not 0 go back to d1
	DEC R16
	BRNE d2		; If R16 is not 0 go back to d2
	RET		; Return from delay subroutine
