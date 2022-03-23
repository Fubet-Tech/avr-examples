.include "tn84def.inc"
main:
	LDI R17, 0x0F	; R17 = 0x0F
	OUT DDRA, R17	; Make pins 0-3 in PORTA as Output
	SEC		; Set carry flag
rtl:
	ROL R16		; Rotate R16 to left through carry
	BRHS ltr	; If Half flag is set jump to ltr
	OUT PORTA, R16	; PORTA = R16
	RCALL delay	; Call delay subroutine
	RJMP rtl	; Repeat RTL
ltr:
	ROR R16		; Rotate R16 to Right through carry
	BREQ rtl	; If Zero flag is set jump to rtl
	OUT PORTA, R16	; PORTA = R16
	RCALL delay	; Call delay subroutine
	RJMP ltr	; repeat

delay:
	SER R18		; R18 = 0xFF
d2:	SER R17		; R17 = 0xFF
d1:	DEC R17		; R17--
	BRNE d1		; if(R17 != 0) Jump to d1
	DEC R18		; R18--
	BRNE d2		; if(R18 != 0) Jump to d2
	RET
