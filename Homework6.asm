; Convert ASCII	to floating point numbers
; Author:  Yet Chun Fong 
; Date:    12/5/2020    

.586
.MODEL FLAT

INCLUDE io.h

.STACK  4096            ; reserve 4096-byte stack

.DATA	
string		BYTE 80 DUP (?)
inPrompt	BYTE	"Enter a string: ",0
resultLbl	BYTE	"After trim: ",0

strLen	MACRO	str
	lea		eax,str
	push	eax
	call	strLenProc
	add		esp,4
	ENDM

trim	MACRO	str
	push	eax
	lea		eax,str
	push	eax
	call	trimProc
	add		esp,4
	pop		eax
	ENDM

atof MACRO	str
	push	eax
	lea		eax,str
	push	eax
	call	atofProc
	add		esp,4
	pop		eax
	ENDM

.CODE       

;strlen return the length of a string and stored it in eax.
strLenProc		PROC
	push	ebp
	mov		ebp,esp
	push	esi
	mov		esi,[ebp+8]
	mov		eax,0

	checkChar:
	cmp		BYTE PTR [esi],0
	je		done
	inc		eax

	nextChar:
	inc		esi
	jmp		checkChar

	done:
	pop		esi
	pop		ebp
	ret
strLenProc		ENDP

;trimproc removes take extra space
trimProc		PROC
	push	ebp
	mov		ebp,esp
	push	ecx
	push	esi
	push	edi
	mov		esi,[ebp+8]
	mov		edi,[ebp+8]

	SkipSpace:
		cmp	BYTE PTR [esi],0
		je	finish
		cmp	BYTE PTR [esi],' '
		jne	saveChar

	nextChar:
		inc		esi
		jmp		SkipSpace

	saveChar:
		movsb
		jmp		SkipSpace

	finish:
		mov	BYTE PTR [edi],0
		pop		edi
		pop		esi
		pop		ecx
		pop		ebp
	ret

trimProc	ENDP

;atof convert ASCII to floating point numbers 
;Store in ST(0)

atofProc	PROC
	push	ebp
	mov		ebp,esp
	sub		esp,16
	mov		DWORD PTR [ebp-4],10
	mov		DWORD PTR [ebp-8],0
	mov		DWORD PTR [ebp-12],0
	push	eax
	push	ebx
	push	ecx
	push	esi
	mov		esi,[ebp+8]
	push	esi
	call	trimProc
	call	strLenProc
	add		esp,4
	mov		ecx,0

	initializeST:
		fld1
		fldz

	CheckSign:
		cmp		BYTE PTR [esi],'-'
		jne		ExtraDigit
		mov		DWORD PTR [ebp-12],-1
		inc		ecx
		inc		esi

	ExtraDigit:
		cmp		ecx,eax
		je		ifNeg
		mov		bl,BYTE PTR [esi]
		cmp		bl,'.'
		je		point
		and		ebx,0000000fh
		mov		DWORD PTR [ebp-16],ebx
		fimul	DWORD PTR [ebp-4]
		fiadd	DWORD PTR [ebp-16]

	checkPoint:
		cmp		DWORD PTR [ebp-8],-1
		jne		nextDigit
		fxch	
		fimul	DWORD PTR [ebp-4]
		fxch
		jmp		nextDigit

	point:
	mov		DWORD PTR [ebp-8],-1

	nextDigit:
		inc		ecx
		inc		esi
		jmp		ExtraDigit
	
	ifNeg:
		cmp		DWORD PTR [ebp-12],-1
		jne		noMoreDigit
		fchs

	noMoreDigit:
		fdivr
		pop		esi
		pop		ecx
		pop		ebx
		pop		eax
		mov		esp,ebp
		pop		ebp
	ret
atofProc	ENDP

_MainProc    PROC
	input	inPrompt,string,80
	atof	string
	output	resultLbl,string
	mov		eax,0
	ret
_MainProc    ENDP

END					;End of source code 
