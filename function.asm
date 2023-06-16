 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    var  db 48h

.CODE
MAIN PROC
         MOV  AX, @DATA    ; initialize DS
         MOV  DS, AX

         mov  dl,var
         call disp
         call line
         mov  dl,'2'
         call disp
        
                         
    exit:
         MOV  AH, 4CH      ; return control to DOS
         INT  21H
MAIN ENDP
    ;description
line PROC
         mov  dl,0dh
         mov  ah,2
         int  21h
         mov  dl,0ah
         int  21h
         ret
line ENDP
    ;description
disp PROC
         mov  ah,2
         int  21h
         ret
disp ENDP
 END MAIN
