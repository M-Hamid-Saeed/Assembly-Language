
org 100h 
.data
string1 db 10 dup(?)
string2 db 10 dup(?) 
count dw 0

.code
main proc
mov ax,@data
mov ds,ax
lea DI,string1
CLD
mov ah,1

while:
     int 21h      ;taking input from user
     cmp al,0dh         ;if user press enter input string 2
     je IF
     jmp IF2
IF2:
    STOSB             ;if user not press enter just take input again
    inc count
    jmp while
    
IF:
  lea DI,string2
  CALL NEXLINE

        ;pointing Di to string2 to take input in string2 using stosb         
 
  IFK:
  mov ah,1                     
  int 21h                  ;input and store result from al to DI which is string2
  STOSB
  cmp al,0dh
  je if3                                  ;if user press enter
  jmp IFK
  

if3:

lea DI,string2       ;again pointing to 1st index
lea SI,string1

mov cx,count
REPE CMPSB               ;comparing bytes

JG String_2_Large 

CALL NEXLINE
mov dl,31h
mov ah,2
int 21h
JMP EXIT

String_2_Large:  
 CALL NEXLINE                         
 mov dl,32
 mov ah,2
 int 21h
 jmp EXIT 
         
     

EXIT:
ret      

MAIN ENDP   

NEXLINE PROC
    
mov dl,0dh
mov ah,2
int 21h
mov dl,0ah
int 21h       ;string2 is greater    
    
    
RET    
NEXLINE ENDP

END MAIN





