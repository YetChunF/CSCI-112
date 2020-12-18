; CSCI 112 Lab 14
; Author:  Yet Chun Fong 
; Date:    12/2/2020

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
No1 REAL4   175.5
No2 REAL4   0.09375
No3 REAL4   -0.0078125
No4 REAL4   -11.75
No5 REAL4   3160.0
No6 REAL4   -1.25

fpValue     REAL4   0.5
intValue    DWORD   6 
fpTmp1      REAL4   9.0
fpTmp2      REAL4   12.0
fpTmp3      REAL4   23.0
fpTmp4      REAL4   24.0
fpTmp5      REAL4   35.0

.CODE
_MainProc PROC
        Initialized:
            finit
            fld    fpTmp5
            fld    fpTmp4
            fld    fpTmp3
            fld    fpTmp2
            fld    fpTmp1

        Instructions: 
            ;fld     st(2)      ;23.0 9.0 12.0 23.0 24.0 35.0
            ;fld     fpValue    ;0.5 9.0 12.0 23.0 24.0 35.0
            ;fild    intValue   ;6.0 9.0 12.0 23.0 24.0 35.0
            ;fldpi              ;3.1415926... 9.0 12.0 23.0 24.0 35.0
            ;fst     st(4)      ;9.0 12.0 23.0 24.0 9.0 
            ;fstp    st(4)      ;12.0 23.0 24.0 9.0
            ;fst     fpValue    ;9.0 12.0 23.0 24.0 35.0 fpValue = 9.0 
            fistp   intValue    ;12.0 23.0 24.0 35.0 intValue = 9


        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

