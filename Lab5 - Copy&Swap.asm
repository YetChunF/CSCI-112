; Example assembly language program -- add 158 to number in memory
; Author: Yet Chun Fong
; Date 2020-09-23

.586
.MODEL FLAT

.STACK 4096				;reserve 4096-byte stack 

.DATA					;reserve storage for data
dval	DWORD	-1
dval2	DWORD	-100
bval	BYTE	-10
tval	DWORD	-1
sum		DWORD	? 

.CODE
main	PROC
		;mov		eax, 000001A2h
		;mov		eax, 100

		;mov		eax, 001234ABh
		;mov		AH, 0

		;mov		edx, 0FF754C2Eh
		;mov		edx, dval

		;mov		ecx, 00003A4Ch
		;mov		dval2, ecx 

		;mov		ebx, 00000000h
		;mov		ebx, 128

		mov		ecx, 1A2B3C4Dh
		mov		CL, bval
		
		;mov		eax, 1A2B3C4Dh
		;xchg	tval, eax
		
		;mov		dx,	0000FF75h
		;xchg		dl, dh

		;mov		eax, 12BC9A78h
		;mov		edx, 56DE34F0h
		;xchg		eax,edx

		;mov		ebx, 1234567Bh
		;mov		edx, 9ABCDEF0h
		;xchg		ebx,edx

		mov		eax, 0
		ret
main ENDP

END
