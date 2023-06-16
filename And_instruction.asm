 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
           MOV  AX, @DATA    ; initialize DS
           MOV  DS, AX

    ; if (ax>bx)&&(bx>cx): move 6 to ax else move 3 to bx
           mov  ax,6
           mov  bx,5
           mov  cx,3

           cmp  ax,bx
           jng  label2
           cmp  bx,cx        ;
           jng  label2
    label1:
           mov  ax,6
           mov  dx,ax
           call disp
           jmp  exit
    label2:
           mov  bx,3
           mov  dx,bx
           call disp
    
    exit:  
           MOV  AH, 4CH      ; return control to DOS
           INT  21H
MAIN ENDP
line PROC
           mov  dl,0dh
           mov  ah,2
           int  21H
           mov  dl,0ah
           int  21h
           ret
line ENDP
    ;description
disp PROC,
           add  dl,30h
           MOV  AH,2
           int  21h
           ret
disp ENDP
 END MAIN
