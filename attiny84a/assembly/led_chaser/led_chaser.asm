.include "tn84def.inc"
main:
	SER R17		; R17 = 0xFF
	OUT DDRA, R17	; Make all pins in PORTA as Output
	LDI R16, 1	; R16 = 1
loop:
	OUT PORTA, R16	; PORTA = R16
	ROL R16		; Rotate R16 to left through carry
	RCALL delay	; Call delay subroutine
	RJMP loop	; repeat from loop

delay:
	SER R18		; R18 = 0xFF
d2:	SER R17		; R17 = 0xFF
d1:	DEC R17		; R17--
	BRNE d1		; if(R17 != 0) Jump to d1
	DEC R18		; R18--
	BRNE d2		; if(R18 != 0) Jump to d2
	RET
