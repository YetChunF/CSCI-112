; Example assembly language program
; Author:  Yet Chun Fong 300376480

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
letter  DWORD    'y'
string  BYTE    40 DUP (?)
prompt1 BYTE    "Enter a lower case letter", 0
result1 BYTE    "The sum is", 0
result2 BYTE    "The maximum number is", 0
result3 BYTE    "The minimum number is", 0
result4 BYTE    "The upper case of it is", 0
sum DWORD   11 DUP (?), 0
max DWORD   11 DUP (?), 0
min DWORD   11 DUP (?), 0
Up  DWORD   11 DUP (?), 0

.CODE
; (1) Sum of 3 numbers
add3    MACRO   n1, n2, n3
    mov eax, n1
    add eax, n2
    add eax, n3
ENDM

;(2) Maximum of 2 numbers
max2    MACRO   n1, n2
   cmp  n1, n2
   ja  small
   jb   big

big:
    mov eax, n2

small:
    mov eax, n1

ENDM

;(3) Minimum of 3 numbers
min3    MACRO   n1,n2,n3
    cmp n1, n2
    ja  smaller
    
compare:
    cmp eax, n3
    ja  smallest 
    jmp minEnd
    
smaller:
    mov eax, n2
    jmp compare

smallest:
    mov eax, n3

minEnd:
    mov eax, n1
ENDM

;(4) Convert lower case to upper case letter
toUpper MACRO letter
    mov eax, DWORD PTR[letter]
    sub eax, 32
ENDM

_MainProc PROC
        ;add3 10,20,30
        ;dtoa    sum, eax        
        ;output  result1, sum    
        
        ;mov     eax, 30
        ;max2    eax, 70
        ;dtoa    max, eax
        ;output  result2, max

        ;mov     eax, 57
        ;min3    eax, 7, 15
        ;dtoa    min, eax 
        ;output result3, min

        toUpper letter
        mov Up, eax 
        output  result4, Up
       

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

