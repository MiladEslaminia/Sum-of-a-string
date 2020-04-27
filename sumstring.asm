;*******************************Milad Eslaminia 810185259*****************************************
PAGE 300,310

;**********************************************************
;		DEFINING STACK SEGEMENT
;**********************************************************

STSEG   SEGMENT STACK 'STACK'
	DW 32 DUP(0)
STSEG   ENDS
;*********************************************************
;		DEFINING DATA SEGEMENT
;*********************************************************
DSEG    SEGMENT
STRING DB '810185259','$'
SUM		DB ?
TMP		DB ?


N4      DB 'Press space key to exit!','$'
DSEG    ENDS
;********************************************************
;		CODE SEGEMENT STARTS HERE!
;********************************************************
CSEG    SEGMENT
START   PROC FAR
	ASSUME CS:CSEG, DS:DSEG, SS:STSEG
	MOV AX,DSEG	
	MOV DS,AX	

;***********************************************************
	MOV CL,00H
	LEA SI,STRING

	MOV AH,9H       
	LEA DX,STRING  
	INT 21H         
	MOV AH,0EH    
	MOV AL,0AH      
	INT 10H      

ADD_LOOP:                                     ;main ADD_LOOP for scaning the string char by char

                                 
	MOV AL,[SI]
	CMP AL,'$'                      ;Searching the string that contains student id, after reaching any specific number, we add the value of that number 
	JE DONE
	CMP AL,'0'			;to toatal wich is stored in CL
	JE ADD0
	CMP AL,'1'
	JE ADD1
	CMP AL,'2'
	JE ADD2
        CMP AL,'3'
	JE ADD3
	CMP AL,'4'
	JE ADD4
	CMP AL,'5'
	JE ADD5
        CMP AL,'6'
	JE ADD6
	CMP AL,'7'
	JE ADD7
	CMP AL,'8'
	JE ADD8
        CMP AL,'9'
	JE ADD9

	ADD0:
	ADD CL,0
	INC SI
	JMP ADD_LOOP

	ADD1:							; each partition does the job of adding a number to total
	ADD CL,1d
	INC SI
	JMP ADD_LOOP

	ADD2:
	ADD CL,2d
	INC SI
	JMP ADD_LOOP

	ADD3:
	ADD CL,3d
	INC SI
	JMP ADD_LOOP

	ADD4:
	ADD CL,4d
	INC SI
	JMP ADD_LOOP

	ADD5:
	ADD CL,5d
	INC SI
	JMP ADD_LOOP

	ADD6:
	ADD CL,6d
	INC SI
	JMP ADD_LOOP

	ADD7:
	ADD CL,7d
	INC SI
	JMP ADD_LOOP

	ADD8:
	ADD CL,8d
	INC SI
	JMP ADD_LOOP

	ADD9:
	ADD CL,9d
	INC SI
	JMP ADD_LOOP


DONE:


	
ADD_LOOP2:						;second loop for adding the digits of the total number, I used division by 16 to seperate each digit, 						;	remainder is stored in AH , "khareje ghesmat' is stored in AL, we need to do this a second time, so 							;as long as AL is not zero we need to continue doing this using this loop.
	MOV AX,00H
	MOV AL,CL
	MOV DL,10
	DIV DL
	MOV CL,AL
	ADD CL,AH
	CMP AL,00H
	JNE ADD_LOOP2
	MOV DL,AH	
	ADD DL,48					;	"we add 48 to convert it to ASCII
	MOV AH,02H
	INT 21H	
	MOV AH,0EH    
	MOV AL,0AH      
	INT 10H 

MOV AH,9H       				;"press space key to exit" message
	LEA DX,N4 
	INT 21H         
	MOV AH,0EH    
	MOV AL,0AH      
	INT 10H 

EXIT_LOOP:	
	MOV AH,01					; wait for space key to terminate program.
	INT 16H
	JZ EXIT_LOOP
	MOV AH,00
	INT 16H	
	CMP AL,' '
	JNE EXIT_LOOP	
	MOV AX,4C00H 
	INT 21H

	
	


	

       
	
	MOV AX,4C00H         
	INT 21H        
START   ENDP		
CSEG    ENDS		
	END START	

;*******************************************EOP*********************************	