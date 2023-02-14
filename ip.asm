ASSUME CS:CODE,DS:DATA
DATA SEGMENT
D DB ?
MSG1 DB 'ENTER YOUR CHARACTER:$'
MSG2 DB 'YOUR CHAR: $'
DATA ENDS
CODE SEGMENT
START: MOV AX,DATA
       MOV DS,AX
       
       MOV DX,OFFSET MSG1
       MOV AH,09H     ;PRINT STRING ON MONITOR
       INT 21H        ;  "

       MOV AH,01H     ;READ CHAR FROM KEYBOARD FOR STRING 00?
       INT 21H
       
       MOV SI,OFFSET D
       MOV [SI],AL
       
       mov dl,13 ;CARRIAGE RETURN
       mov ah,2
       int 21h
       mov dl,10  ;LINE FEED
       mov ah,2
       int 21h
       
       MOV DX,OFFSET MSG2
       MOV AH,09H
       INT 21H
       MOV SI,OFFSET D
       MOV DL,[SI]
       MOV AH,02H            ;PRINT CHAR ON MONITOR
       INT 21H
       MOV AH,4CH
       INT 21H
CODE ENDS
END START       

