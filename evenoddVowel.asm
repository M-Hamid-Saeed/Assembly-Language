org 100h

.data
vowels db 'aeiou'
consonant db 'bcdfghjklmnopqrstvrswxyz'
string1 db 'No of Vowels  $'
string2 db 'No of Consonants  $'
string3 db 'Even Number $'
string4 db 'Odd Number $'
string5 db  'Square of Number is $' 
var dw ? 
count dw 0
divider db ?

vowelcount db 0
consonantcount db 0
main proc
.code
mov ax , @data
mov ds,ax
mov es ,ax
mov ah,1
int 21h
mov ah,0
mov var,ax
cmp al,30h
jge checkNumber
jmp countingString

checkNumber:
cmp al,39h
jl evenOdd
jmp countingString

input:
mov ah,1
int 21h
cmp al,0dh
je showResult
jmp countingString



countingString:
lea di, vowels
mov cx,5
repne scasb
jne consonantCounter
inc vowelCount
jmp input

consonantCounter:
lea di,consonant
mov cx,21
repne scasb
jne input
inc consonantcount
jmp input

showResult:


call nextLine
lea dx, string1
mov ah,9
int 21h
mov dl,vowelCount
add dl,30h
mov ah,2
int 21h
call nextLine
lea dx, string2
mov ah,9
int 21h
mov dl,consonantCount
add dl,30h
mov ah,2
int 21h

exit:
ret

evenOdd: 
    add al,30h
    Test al,1
    JZ even
    call nextLine
    lea dx,string4
    mov ah,9
    int 21h
    jmp Square
    jmp exit
    
    
    
    even:
    call nextLine
    lea dx,string3
    mov ah,9
    int 21h
    jmp square
    jmp exit
    
square: 
xor ax,ax
sub var,30h
mov ax,var
mul var
jmp output



output:
mov divider, 10 
div divider
mov bh,ah
push bx
mov ah,0
inc count
cmp al,0
je answer
jmp output


answer:
mov cx,count
for: 

pop bx
mov dl,bh
add dl,30h
mov ah,2
int 21h
loop for
jmp exit







nextLine proc
mov dl,0dh
mov ah,2
int 21h
mov dl,0ah
int 21h

ret
end nextLinep


    
    
   
end mainp