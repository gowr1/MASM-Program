ASSUME CS:CODE,DS:DATA
DATA SEGMENT
  A DW 0065H
  B DW 0055H
  SUM DW 0000H
  CARRY DB 00H
DATA ENDS

CODE SEGMENT
START: MOV AX,DATA
       MOV DS,AX  
       
       MOV AX,A
       ADD AX,B
       JNC L1
         MOV CARRY,01H
    L1:MOV SUM,AX
       
       MOV AH,4CH
       INT 21H
CODE ENDS
END START           
