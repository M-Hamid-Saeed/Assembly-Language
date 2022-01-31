;program to take input from user and print it onto the screen

dosseg
.model small
.stack 100h
.data
.code
main proc

mov ah, 1  ;taking input
int 21h
mov bl, al		;moving input to bl

mov dl,10       ;for carriage return
mov ah,2		;display carriage return
int 21h		;executing carriage return

mov dl,13		;line feed
mov ah,2		;display line feed
int 21h		;executing line feed

mov dl,bl		;moving character to dl
mov ah,2		;display character
int 21h


mov ah,4ch
int 21h

main endp
end main
