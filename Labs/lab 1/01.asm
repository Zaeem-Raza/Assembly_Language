Title: Lab-01 Character encryption

 .MODEL SMALL
 .STACK 100H

 .DATA
 var1 db 0   ; hex of a
 var2 db 7Ah   ;hex of z
 var3 db 0     ;for answer
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
     
     mov ah,1
     int 21H
     mov var3,al               ; var3 has input
     sub var3,61h              ;subtracted 97 from var3

     mov bh,var3               ;  bh has var3 
      mov var3,7Ah              ;var3 has z

     sub var3,bh               ;

     mov dl,var3
     mov ah,2
     int 21h


     
                         
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
