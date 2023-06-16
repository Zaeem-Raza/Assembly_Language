 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    prompt1 db 0dh,0ah,"Given String: $"
    prompt2 db 0dh,0ah,"Output String: $"
    arr     db 30 dup(?)
    var1    db 0
    var2    db 1

.CODE
MAIN PROC
                MOV  AX, @DATA            ; initialize DS
                MOV  DS, AX
        
                mov  dx,offset prompt1
                mov  ah,9
                int  21h
                mov  si,offset arr
                mov  cx,0h
                mov  bx,0h                ;counter

   
    l1:         

                mov  ah,01h
                int  21h
                inc  bx                   ; increment counter
                cmp  al,' '               ;space
                je   label2
                cmp  al,0dh
                je   label2
                mov  ah,0
                push ax
                mov  var2,0
                inc  cx
                jmp  l1
    label2:     

                cmp  var1,1
                je   l3
                cmp  al,0dh
                jne  l2
                mov  var1,1

    l2:         

                pop  ax
                mov  [si],al
                inc  si
                loop l2
                inc  si
                mov  var2,1
                cmp  var1,1
                je   printprompt
                jmp  l1

    l3:         

                inc  si
                jmp  l1
    printprompt:
    ; mov  ah,09
    ; mov  dx,offset prompt2
    ; int  21h
                mov  ah,2
                mov  si,offset arr
                mov  cx,bx
                call line
                mov  ah,09
                mov  dx,offset prompt2
                int  21h
    label3:     

                mov  dh,0
                mov  dl,[si]
                mov  ah,2
                int  21h
                inc  si
                loop label3
    exit:       
                mov  ah,4ch
                int  21h

MAIN ENDP
    ;description
line PROC
                mov  ah,2
                mov  dl,0dh
                int  21h
                mov  dl,0ah
                int  21h
                ret
line ENDP
 END MAIN
