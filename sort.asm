ASSUME CS:CODE,DS:DATA
DATA SEGMENT
 LIST DB 05H,07H,02H,01H,04H
 COUNT EQU 0005H
DATA ENDS

CODE SEGMENT
START: MOV AX,DATA
       MOV DS,AX
       
       MOV CX,COUNT
AGAIN1:MOV SI,OFFSET LIST
       MOV DX,CX
       
    L2:MOV AL,[SI]
       CMP AL,[SI+1]
       JC L1
         XCHG AL,[SI+1]
         XCHG AL,[SI]
    L1:INC SI    
       DEC DX
       JNZ L2
       
       LOOP AGAIN1
       
       MOV AH,4CH
       INT 21H
CODE ENDS
END START        
       
       
       
