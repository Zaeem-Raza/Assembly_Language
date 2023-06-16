 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
       string db "zaeem"

.CODE
MAIN PROC
            MOV  AX, @DATA              ; initialize DS
            MOV  DS, AX

            mov  bx,offset string
            mov  si,0
            mov  cx,5
            mov  ah,2
       L1:  
            mov  al,string[bx+si]
            mov  dl,al
            and  dl,11011111b
            int  21h
            inc si
            loop L1


                         
            MOV  AH, 4CH                ; return control to DOS
            INT  21H
MAIN ENDP
 END MAIN
