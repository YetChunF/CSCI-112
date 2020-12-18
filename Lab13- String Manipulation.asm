; CSCI 112 Lab 13 
; Author:  Yet Chun Fong 
; Date:    11/17/2020

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
outputLbl BYTE  "The modified string is", 0
string BYTE "ABCD1234<>", 0


.CODE
_MainProc PROC
     ;setup code 1 
        ;lea esi, string        ;Beginning of string
        ;lea edi, string+5      ;Address of 'F'
        ;cld                    ;Forward movement

    ;setup code 2
        ;lea esi, string        ;Beginning of string
        ;lea edi, string+2      ;Address of 'C'
        ;cld                    ;Forward movement 

    ;setup code 3
        ;lea esi, string+9     ;End of string
        ;lea edi, string+4     ;Address of 'E'
        ;std                   ; Backward movement
  
    ;setup code 4
        lea esi, string+9     ;End of string 
        lea edi, string+7    ;Address of 'H'
        std                   ;Backward movement

        movsb                  ;move 4 characters
        movsb
        movsb 
        movsb
        output  outputLbl, string  ;display modified string
        
        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

  