
org 100h
.STACK 100H
.data
total dB 0
COUNT DW 0
.code

xor ax,ax

Repeat:
      MOV AH,1
      int 21h
      cmp al,0dh
      je OUTPUT
      INC COUNT
      XOR AH,AH
      SUB AL,30H
      MOV DL,AL
      MOV AL,10
      MUL TOTAL
      ADD AL,DL
      MOV TOTAL,AL
      MOV CX,COUNT
      JMP REPEAT 
                  
OUTPUT:
  XOR AX,AX
  MOV AL,TOTAL
  MOV BL,10
  DIV BL
  MOV TOTAL,AL
  XOR BX,BX
  MOV BH,AH
  PUSH BX
  LOOP OUTPUT
  MOV CX,COUNT
  MOV DL,0DH
  MOV AH,2
  INT 21H
  MOV DL,0AH
  INT 21H
  RESULT:
  POP AX
  MOV DL,AH
  ADD DL,30H
  MOV AH,2
  INT 21H
  LOOP  RESULT
  
  
END:
ret




