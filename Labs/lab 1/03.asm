 TITLE: Array Pointing

 .MODEL SMALL
 .STACK 100H

 .DATA
 arr db 0h,1h,2h,3h

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
   
    mov si,0

    mov ah,2
    mov dl,[arr+si]
    add dl,30h
    int 21h
    inc si
    mov dl,[arr+si]
    add dl,30h

    int 21h
    inc si
    mov dl,[arr+si]
    add dl,30h

    int 21h
    inc si
    mov dl,[arr+si]  
    add dl,30h

    int 21h



                         
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
