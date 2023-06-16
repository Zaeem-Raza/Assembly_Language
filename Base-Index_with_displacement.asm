 ;?TITLE: print the array using the notation

 .MODEL SMALL
 .STACK 100H

.DATA
ROWSIZE=5
    array db 10h,20h,30h,40h,50h
          db 60h,70h,8h,90h,0A0h
          db 0B0h,0C0h,0D0h,0E0h,0F0h


.CODE
MAIN PROC
         MOV AX, @DATA          ; initialize DS
         MOV DS, AX

         mov bx,ROWSIZE
         mov si,2
         mov dl,array[bx+si]
         add dl,30h
         mov ah,2
         int 21h
                         
         MOV AH, 4CH            ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
