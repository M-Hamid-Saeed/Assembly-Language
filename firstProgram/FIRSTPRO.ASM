;program to print a single character in assembly language
;Muhammad Hamid Saeed
dosseg  ;To arrange the segments automatically
.model small       ;for getting space in ram for data and code
.stack 100h
.data

.code

main proc ;main procedure starts here

mov dl, 'H'
mov ah,2
int 21h

mov dl, 'A'
mov ah,2
int 21h

mov dl, 'D'
mov ah,2
int 21h

mov ah,4ch
int 21h
main endp  ;end procudure

end main
