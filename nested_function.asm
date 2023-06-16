 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    string1 db "This is func 1 $ "
    string2 db "This is func 2 $ "
    string3 db "This is func 3 $ "
    string4 db "This is func 4 $ "

.CODE
MAIN PROC
          MOV  AX, @DATA            ; initialize DS
          MOV  DS, AX

          call func1
                         
          MOV  AH, 4CH              ; return control to DOS
          INT  21H
MAIN ENDP
func1 proc
          mov  dx,offset string1
          mov  ah,9
          int  21h
          call line
          call func2
          ret
func1 endp
func2 proc
          mov  dx,offset string2
          mov  ah,9
          int  21h
          call line
          call func3
          ret
func2 endp
func3 proc
          mov  dx,offset string3
          mov  ah,9
          int  21h
          call line
          call func4
          ret
func3 endp
func4 proc
          call line
          mov  dx,offset string4
          mov  ah,9
          int  21h
          ret
func4 endp
line proc

          mov  ah,2
          mov  dl,0dh
          int  21H
          mov  dl,0ah
          int  21h
          ret
line endp
 END MAIN
