; Example assembly language program -- adds three numbers
; Author:  Yet Chun Fong 
; Date:    9/16/2020

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
number1 DWORD   ?
number2 DWORD   ?
number3 DWORD   ?
number4 DWORD   ?
prompt1 BYTE    "Enter first number", 0
prompt2 BYTE    "Enter second number", 0
prompt3 BYTE    "Enter third number" , 0
prompt4 BYTE    "Enter forth number", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The sum is", 0
sum     BYTE    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string          ; convert to integer
        mov     number1, eax    ; store in memory

        input   prompt2, string, 40      ; repeat for second number
        atod    string
        mov     number2, eax

        input   prompt3, string, 40     ;repeat for third number
        atod    string 
        mov     number3, eax

        input prompt4, string, 40      ;repeat for forth number
        atod    string
        mov     number4, eax
        
        mov     eax, number1    ; first number to EAX, Input 9 
        add     eax, number2    ; add second number, Input 8 
        add     eax, number3    ; add third number, Input 7
        sub     eax, number4    ;subtract forth number, Input 4
        dtoa    sum, eax        ; convert to ASCII characters
        output  resultLbl, sum          ; output label and sum

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

