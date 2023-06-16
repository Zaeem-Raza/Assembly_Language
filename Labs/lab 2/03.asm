 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    msg1       equ 0dh,0ah,"Enter first character: $"
    msg2       equ 0dh,0ah,"Enter second character: $"
    msg3       equ 0dh,0ah,"Enter third character: $"
    Prompt1    db  msg1
    Prompt2    db  msg2
    Prompt3    db  msg3
    character1 db  0
    character2 db  0
    character3 db  0

.CODE
MAIN PROC
                MOV  AX, @DATA            ; initialize DS
                MOV  DS, AX

                mov  dl,'?'
                mov  ah,2
                int  21h
                call line


                mov  ah,9
                mov  dx,offset Prompt1
                int  21h

                mov  ah,1
                int  21h
                mov  character1,al

                mov  ah,9
                mov  dx,offset Prompt2
                int  21h

                mov  ah,1
                int  21h
                mov  character2,al


                mov  ah,9
                mov  dx,offset Prompt3
                int  21h

                mov  ah,1
                int  21h
                mov  character3,al

                call line

                call eleven_star
                call four_star
                
                mov  ah,2
                mov  dl,character1
                int  21h
                mov  dl,character2
                int  21h
                mov  dl,character3
                int  21h

                call four_star

                call line

                call eleven_star
                

                         
                MOV  AH, 4CH              ; return control to DOS
                INT  21H
MAIN ENDP

eleven_star proc
                mov  bx,5
    L1:         
                mov  cx,11
    L2:         
                mov  ah,2
                mov  dl,'*'
                int  21h
                loop L2
                call line
                
                dec  bx
                jnz  L1
                ret
eleven_star endp


line proc
                mov  ah,2
                mov  dl,0dh
                int  21h
                mov  dl,0ah
                int  21h
                ret
line endp


four_star proc
                mov  cx,4
    l3:         
                mov  dl,'*'
                mov  ah,2
                int  21h
                Loop l3
                ret
four_star endp
 END MAIN
