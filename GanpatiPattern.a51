       ORG 0000H
       SJMP START
DELAY: MOV TMOD, #01H 
       MOV TH0,#00H 
       MOV TL0,#00H 
       SETB TR0 
CHECK: JNB TF0, CHECK 
       CLR TR0 
       CLR TF0 
       RET 
START: MOV R0,#08H 
       MOV A,#00H 
       LABEL: SETB C 
       RLC A 
       MOV P1,A
       ACALL DELAY                   //65.535 ms delay
       ACALL DELAY 
       DJNZ R0, LABEL 
       SJMP START 
END