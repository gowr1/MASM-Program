ASSUME CS:CODE,DS:DATA
DATA SEGMENT
 COUNT EQU 0005H
 A DB 00H,01H
DATA ENDS

CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX

MOV CX,COUNT
MOV SI,OFFSET A
MOV AL,00H
MOV BL,01H
INC SI
INC SI

L1:
 ADD AL,BL
 MOV DL,AL
 MOV AL,BL
 MOV BL,DL
 MOV [SI],DL
 INC SI
 LOOP L1
 
MOV AH,4CH
INT 21H
CODE ENDS
END START 