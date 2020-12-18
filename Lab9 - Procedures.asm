;Yet Chun Fong 300376480
;CSCI 112 Lab 9

.586
.MODEL FLAT

INCLUDE io.h

.STACK 4096 

.DATA
number DWORD ?
prompt1		BYTE    "Enter a number: ", 0
string		BYTE	40 DUP (?)
result		BYTE	"The factorial is", 0
answer		BYTE	11 DUP (?), 0


.CODE
_MainProc PROC
	input	prompt1, string, 40 
	atod	string
	mov		number, eax

	push	eax
	;call	MyFactorialProc
	call	MyFactorialProcRec
	;add		esp, 4

	dtoa	answer, eax
	output	result, answer

	mov eax, 0
	ret
_MainProc ENDP

; Non Recursive (Procedure 1)
;MyFactorialProc	PROC
	;push ebp
	;mov	 ebp, esp
	;mov	 ecx, [ebp+8]
	;mov	 eax, ecx

	;facGo:
		;cmp	 ecx, 1
		;jle	 facEnd
		
		;sub	 ecx, 1
		;mul	 ecx
		;jmp	 facGo

	;facEnd:
		;pop	ebp
		;ret
;MyFactorialProc	ENDP

; Recursive (Procedure 2)
MyFactorialProcRec	PROC
	 mov eax, DWORD PTR [esp + 4]
	 cmp eax, 1
	 jle endRec
	 dec eax
	 push eax
	 call MyFactorialProcRec
	 mov esi, DWORD PTR [esp+4]
	 mul esi

	endRec:
	 ret 4  

MyFactorialProcRec ENDP

END                             ; end of source code

