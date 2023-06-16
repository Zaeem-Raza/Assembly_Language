 ;?TITLE: convert small case letter to upper case

 .MODEL SMALL
 .STACK 100H

.DATA
        string db 0dh,0ah,"Letter: $"

.CODE
MAIN PROC
              MOV AX, @DATA        ; initialize DS
              MOV DS, AX

              mov ah,1
              int 21h

              cmp al,'a'
              jl  upper
              cmp al,'z'
              jle lower

        upper:
            
              int 21h
              mov ah,2
              int 21h
        lower:
        ;       and al,11011111b
              and al,0dfh
              mov dl,al
              mov ah,2
              int 21h
              MOV AH, 4CH          ; return control to DOS
              INT 21H
MAIN ENDP
 END MAIN
