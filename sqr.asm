DATA SEGMENT
 LIST DB 01h,02h,03h
 COUNT EQU 0003H
 SUM DW 0000H
 SQ DW 03 DUP(?)
DATA ENDS

ASSUME CS:CODE,DS:DATA
CODE SEGMENT
START: MOV AX,DATA
       MOV DS,AX
       
       
       MOV CX,COUNT
       MOV SI,OFFSET LIST
       MOV DI,OFFSET SQ
       MOV DX,0000H
       
    L1:MOV AL,[SI]
       MOV BL,AL
       MUL BL
       ADD DX,AX
       MOV [DI],AX
       INC SI
       INC DI
       DEC CX
       JNZ L1
       
       MOV SUM,DX       
       MOV AH,4CH
       INT 21H
CODE ENDS
END START         
