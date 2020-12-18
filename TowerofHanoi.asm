; Assembly language program -- Tower of Hanoi
.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096
.LISTMACRO

.DATA
numdisk word 0
Rod1 BYTE 100 DUP(0)
Rod2 BYTE 100 DUP(0)
Rod3 BYTE 100 DUP(0)

Rod1Count DWORD 0
Rod2Count DWORD 0
Rod3Count DWORD 0

inprompt BYTE "Enter the numbner of disks to move:",0
instring    BYTE 10 DUP(0)

rptstr  BYTE "Move Disk-" 
disknum DWORD "XXXX"
fromrodprefix BYTE " from Rod-"
fromrod BYTE "X to Rod-"
torod   BYTE "X",0
tempstr BYTE 7 DUP(' ')
tempnum DWORD 4 DUP (0)

rptlabel BYTE "STEP-X", 0




.CODE

RodPush MACRO RodNum, DiskNum
    LOCAL LabelR1, LabelR2, LabelR3, ENDLOGIC
    push EDI
    cmp RodNum, 1
    jz LabelR1
    cmp RodNum, 2
    jz LabelR2
    cmp RodNum, 3
    jz LabelR3
    jmp ENDLOGIC
  LabelR1: 
    lea EDI, Rod1
    add EDI,Rod1Count
    mov BYTE PTR [EDI], DiskNum
    inc Rod1Count
    jmp ENDLOGIC
  LabelR2: 
    lea EDI, Rod2
    add EDI,Rod2Count
    mov BYTE PTR [EDI], DiskNum
    inc Rod2Count
    jmp ENDLOGIC
  LabelR3: 
    lea EDI, Rod3
    add EDI,Rod3Count
    mov BYTE PTR [EDI], DiskNum
    inc Rod3Count
    jmp ENDLOGIC

  ENDLOGIC:
    pop EDI
ENDM

RodPop MACRO RodNum, DiskNum
    LOCAL LabelR1, LabelR2, LabelR3, ENDLOGIC
    push EDI
    cmp RodNum, 1
    jz LabelR1
    cmp RodNum, 2
    jz LabelR2
    cmp RodNum, 3
    jz LabelR3
    jmp ENDLOGIC
  LabelR1: 
    dec Rod1Count
    lea EDI, Rod1
    add EDI,Rod1Count
    mov DiskNum, BYTE PTR [EDI]
    jmp ENDLOGIC
  LabelR2: 
    dec Rod2Count
    lea EDI, Rod2
    add EDI,Rod2Count
    mov DiskNum, BYTE PTR [EDI]
    jmp ENDLOGIC
  LabelR3: 
    dec Rod3Count
    lea EDI, Rod3
    add EDI,Rod3Count
    mov DiskNum, BYTE PTR [EDI]
    jmp ENDLOGIC

  ENDLOGIC:
    mov BYTE PTR [EDI], 0
    pop EDI

ENDM



MoveDiskBetweenTowers PROC ; MoveDiskBetweenTowers(numdisk,source,target,aux)
    push EBP
    mov ebp, esp
    push CX  ; 
    push SI  ;
    push DI  ;
    push DX  ;

    ; Read the arguments
    mov CX, [ebp+8]     ; number of disks
    mov SI, [ebp+10]    ; source rod#
    mov DI, [ebp+12]    ; target rod# 
    mov DX, [ebp+14]    ; aux rod# 

    ; Main logic
    cmp CX,0            ; if zero or less disk to move exit
    jle ExitCode
    cmp CX,1            ; if one didsk to move , just move one disk from source to target
    jz LastMove
                        ; Else move n-1 disks from source to aux, 1 disk from source to target, n-1 disks from aux to target - recursive call
    push DI             ; Move n-1 disks from source to aux
    push DX
    push SI
    mov CX, [ebp+8]
    dec CX
    push CX
    call MoveDiskBetweenTowers
    add esp, 8

    push DX             ; Move 1 disk from source to target
    push DI
    push SI
    mov CX, 1
    push CX
    call MoveDiskBetweenTowers
    add esp, 8

    push SI             ; Move n-1 disks from aux to target
    push DI
    push DX
    mov CX, [ebp+8]
    dec CX
    push CX
    call MoveDiskBetweenTowers
    add esp, 8

    jmp ExitCode

 
 LastMove:
    mov EAX, 0
    RodPop SI, AL
    RodPush DI, AL
    dtoa tempstr, eax
    mov eax, tempnum
    mov disknum, eax
    mov eax,0
    mov ax, si
    add ax, 48
    mov fromrod, al
    mov ax, di
    add ax, 48
    mov torod, al
    output rptlabel, rptstr


 ExitCode:
    pop DX
    pop DI
    pop SI
    pop CX
    pop EBP
    ret
MoveDiskBetweenTowers ENDP

TowerofHanoiMain PROC
    ; Prompt the user for input: Number of disks to move
    input inprompt, instring, 10
    atod instring
    mov numdisk, AX
    

    mov ECX, 0
    mov EAX, 0

;---- Initialize Rod1 with disks
    mov CX,numdisk
    mov AX,1
  begin1:
    RodPush AL, CL
  LOOP begin1


 ;--- Call the recursive proc   
    mov AX, 3
    push AX
    mov AX, 2
    push AX
    mov AX, 1
    push AX
    push numdisk

    call MoveDiskBetweenTowers
    
    add esp, 8
  
  ;--- Done
    ret
TowerofHanoiMain ENDP

_MainProc PROC
    call TowerofHanoiMain
    
    mov     eax, 0  ; exit with return code 0
    ret
_MainProc ENDP
END                             ; end of source code
