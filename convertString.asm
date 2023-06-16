 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    str1    db "Enter the string: $"
    str2    db 0dh,0ah,"The case string is: $"
    str3    db 0dh,0ah,"The length of the string is: $"
    string3 dw 100 dup (?)
.CODE
MAIN PROC
         MOV AX, @DATA         ; initialize DS
         MOV DS, AX

         mov dx,offset str1
         mov ah,9
         int 21h

         mov ah,1
         mov cx,0
         mov si,0
         int 21h

    L1:  
         cmp al,0dh
         je  L2
         mov bx,ax
         mov string3[si],bx
         inc si
         inc cx
         int 21h
         jmp L1
        
         mov dx,offset str3
         mov ah,9
         int 21h
         
         mov dx,si
         add dx,30h
         mov ah,2
         int 21h
         

    ; case conversion
         mov dx,offset str2
         mov ah,9
         int 21h
         mov si,0
    L2:  
      mov bx,string3[si]
    exit:
         MOV AH, 4CH           ; return control to DOS
         INT 21H
MAIN ENDP
line PROC
         mov dl,0dh
         mov ah,2
         int 21H
         mov dl,0ah
         int 21h
         ret
line ENDP
    ;description
disp PROC,
         MOV AH,2
         int 21h
         ret
disp ENDP
 END MAIN
