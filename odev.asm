ASSUME CS:CODE,DS:DATA
DATA SEGMENT
 A DB 02H,05H,06H,78H,95H
 E DB 05 DUP(?)
 O DB 05 DUP(?)
 COUNT EQU 0005H
DATA ENDS

CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX

MOV CX,COUNT
MOV SI,OFFSET A
MOV DI,OFFSET E
MOV BL,02H
L1:
MOV AL,[SI]
SHR AL,01H
JC  L2
 MOV DL,[SI]
 MOV [DI],DL
 INC DI
L2:
INC SI
DEC CX
JNZ L1

MOV CX,COUNT
MOV SI,OFFSET A
MOV DI,OFFSET O
MOV BL,02H
L3:
MOV AL,[SI]
SHR AL,01H
JNC  L4
 MOV DL,[SI]
 MOV [DI],DL
 INC DI
L4:
INC SI
DEC CX
JNZ L3


MOV AH,4CH
INT 21H
CODE ENDS
END START