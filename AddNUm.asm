;Write a program to add 3 numbers by using 2 registers and see result in register AX.
;This program works for 0 to 9 digits only.
org 100h

.model small
.stack 100h
.data
   

.code 
     main proc
 
     
      MOV DX,1D
      MOV AX,3D
      ADD DX,AX
      ADD DX,1D 
      ADD DX,30H ;to show answer on screen we are adding in ascii code bcz characters use 
		      ;ascii codes to print
      mov AH,2H  
      int 21h
      mov AH,4ch
      int 21h
         
      main endp
   
     end main
