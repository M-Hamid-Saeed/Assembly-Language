
org 100h

org 100h

; add your code here
.data
N dw 0
;n1 dw 0
result dw 0
.code

main proc
mov ax,3
push ax
call factorial

Ret 
main endp


factorial proc

mov bp,sp

mov ax,[bp+2]
mov N,ax

cmp N,1
jne again
;---------
;n==1
mov result,1
jmp exit
;----------

again:
dec N
push N
call factorial

;get the parameter again of this call from stack
mov bp,sp
mov ax,[bp+2]
;-----------

mul result
mov result,ax

exit:
ret 2

factorial endp


ret




