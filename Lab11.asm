;Author: Yet Chun Fong 300376480 
;Date: 11/5/2020

.586
.MODEL FLAT

.STACK 4096


.DATA
primeArray	DWORD 100 DUP (?)		; Initialize array with size 100   
divide		DWORD ?
primeCount	DWORD 1

.CODE

main PROC
	mov ecx, 542					;Start from 542 because 541 is the last prime number from first 100 primes
	lea	esi, primeArray				;Retrieve the address of array

Loop1: 
	mov divide, 2					;The divisor will start from 2
	add primeCount, 1				; Add primecount will keep adding 
	cmp primeCount, 2
	je	Insert						;If prime count equal to 2, then jump to insertion 
	cmp	primeCount, 3
	je Insert

isPrime:
	mov eax, primeCount				
	cmp eax, 542					;Make sure that it's less than 542, because 541 is the last prime we need 
	je	theEnd						;Exit program
	cdq
	div	divide						
	cmp	edx, 0						;If remainder is 0, then it's not prime 
	je	Loop1						;Go back to Loop 1 
	add	divide, 1					
	cmp	divide, eax					;Compare prime count with eax
	jle	isPrime						;If it's less than or equal to eax, jump back to isPrime 
	jmp	Insert						;If not, then jump to insert 

Insert: 
	mov	edi, primeCount				
	mov	DWORD PTR[esi], edi			;Register indirect add the value into array 
	add	esi, 4						; Allocate memory 
	loop Loop1						;Go back to loop 1

theEnd: 
	mov eax, 0 
	ret

main ENDP 
END