ASSUME CS:CODE,DS:DATA
DATA SEGMENT
 A DB 03H,07H,44H,12H,71H
 Y DB 01H
 MSG1 DB "FOUND$"
 MSG2 DB "NOT FOUND$"
DATA ENDS

CODE SEGMENT
START:
MOV AX,DATA
MOV DS,AX
MOV CX,0005H
MOV BL,Y
MOV SI,OFFSET A
L1:
CMP BL,[SI]
    JZ L2
     INC SI
    DEC CX
    JNZ L1
L2: 
CMP CX,0000H
JZ L3
   MOV DX,OFFSET MSG1
   MOV AH,09H
   INT 21H
   JMP L4
L3: 
MOV DX,OFFSET MSG2
   MOV AH,09H
   INT 21H   
L4: 
MOV AH,4CH
INT 21H
CODE ENDS
END START
   

      
