 TITLE:HextoBinary

 .MODEL SMALL
 .STACK 100H

 .DATA
  string1 equ 0dh,0ah,"Enter digit (A-F)$"
  string2 equ 0dh,0ah,"Decimal: $"
  prompt1  db string1
  prompt2  db string2
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
     
     lea dx,prompt1
     mov ah,9
     int 21H

     mov ah,1
     int 21H
    mov bl,al
    lea dx,prompt2
    mov ah,9
    int 21h
     mov dl,31h
     mov ah,2
     int 21h

     sub bl,11h
     mov dl,bl
     mov ah,2
     int 21h
   


    
                         
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
