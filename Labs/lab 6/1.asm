 .MODEL SMALL
 .STACK 100H

.DATA
     prompt_1 db 'Given String : $'
     prompt_2 db 'Palindrome$'
     prompt_3 db 'Not Palindrome$'
     string   db 20 dup(0)
     len      dw 0h
.CODE
MAIN PROC
             MOV  AX, @DATA              ; initialize DS
             MOV  DS, AX
             mov  dx,offset prompt_1
             mov  ah,9
             int  21h
             mov  bx,offset string
             mov  si,0
             mov  ah,1
             int  21h
             mov  cx,0
     L1:     
             cmp  al,0dh
             je   next
             mov  [bx+si],al
             inc  si
             inc  cx
             push ax
             mov  ah,1
             int  21h
             jmp  L1
     next:   
             mov  si,0
     L2:     
             pop  ax
             cmp  al,[bx+si]
             jne  not_pal
             inc  si
             loop L2
             mov  dx,offset prompt_2
             mov  ah,9
             int  21h
     not_pal:
             mov  dx,offset prompt_3
             mov  ah,9
             int  21h
     exit:   
             mov  ah,4ch
             int  21h
main endp
          end main

