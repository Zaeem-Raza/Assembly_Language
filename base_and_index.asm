;?Title: print the array using notation

 .MODEL SMALL
 .STACK 100H

 .DATA
 ROWSIZE =5
 array db 2h,16h,4h,22h,13h
       db 19h,42h,64h,44h,88h

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
  
    mov bx,ROWSIZE
    mov al,array[bx]            ;al=19h
               
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
