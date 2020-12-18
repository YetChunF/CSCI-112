; CSCI 112 Lab 12 
; Author:  Yet Chun Fong 
; Date:    11/11/2020 

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA

.CODE
_MainProc PROC
       ; 7.1.1

       ;a
       mov  bx, 0FA75h
       mov  cx, 3102h
       and  bx, cx

       ;b 
       mov  bx, 0FA75h
       mov  cx, 3102h
       or   bx, cx

       ;c 
       mov  bx, 0FA75h
       mov  cx, 3102h
       xor  bx, cx

       ;d 
       mov  bx, 0FA75h
       not  bx

       ;e
       mov  ax, 0FA75h
       and  ax, 000Fh

       ;f 
       mov  ax, 0FA75h 
       or   ax, 0FFF0h

       ;g
       mov  ax, 0FA75h
       xor  ax, 0FFFFh

       ;h
       mov  ax, 0FA75h 
       test ax, 0004h

       ;i 
       mov  cx, 08EBAh
       not  cx
       
       ;j 
       mov  cx, 08EBAh
       or   cx, 0EDF2h 

       ;k 
       mov  cx, 08EBAh
       and  cx, 0EDF2h

       ;l 
       mov  cx, 08EBAh
       xor  cx, 0EDF2h

       ;m 
       mov  cx, 08EBAh
       test cx, 0EDF2h 
       
       ;n 
       mov  dx, 0B6A3h
       not  dx

       ;o
       mov  dx, 0B6A3h
       or   dx, 64C8h

       ;p 
       mov  dx, 0B6A3h
       and  dx, 64C8h

       ;q
       mov  dx, 0B6A3h
       xor  dx, 64C8h

       ;r 
       mov  dx, 0B6A3h
       test dx, 64C8h

       ;7.2.1

       ;a
       mov  ax, 0A8B5h
       shl  ax, 1

       ;b
       mov  ax, 0A8B5h
       shr  ax, 1

       ;c 
       mov  ax, 0A8B5h
       sar  ax, 1

       ;d 
       mov  ax, 0A8B5h
       rol  ax, 1

       ;e 
       mov  ax, 0A8B5h
       ror  ax, 1

       ;f 
       mov  ax, 0A8B5h
       mov  cl, 04
       sal  ax, cl

       ;g
       mov  ax, 0A8B5h
       shr  ax, 4

       ;h 
       mov  ax, 0A8B5h
       mov  cl, 04
       sar  ax, cl 

       ;i
       mov  ax, 0A8B5h
       mov  cl, 04
       rol  ax, cl 

       ;j 
       mov  ax, 0A8B5h
       ror  ax, 4

       ;k 
       mov  ax, 0A8B5h
       STC
       rcl  ax, 1

       ;l 
       mov  ax, 0A8B5h
       CLC
       rcr  ax, 1

       ;m 
       mov  bx, 08EBAh
       shl  bx, 3

       ;n
       mov  bx, 08EBAh
       shr  bx, 3

       ;o
       mov  bx, 08EBAh
       sal  bx, 3

       ;p 
       mov  bx, 08EBAh
       sar  bx, 3

       mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

