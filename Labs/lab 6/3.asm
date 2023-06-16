 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    arr  db 5 dup(0)
    str1 db 0dh,0ah,"Enter numbers $"
    str2 db 0dh,0ah,"Maximum: $"
    str3 db 0dh,0ah,"Minimum: $"
    max  db 0h
    min  db 0h

.CODE
MAIN PROC
           MOV   AX, @DATA         ; initialize DS
           MOV   DS, AX

           mov   si,0h
           mov   cx,5
           mov   dx,offset str1
           mov   ah,9
           int   21h
           mov   ah,1
    L1:    
           int   21h
           mov   arr[si],al
           inc   si
           loop  L1
    
    ;array has been located
           mov   dx,offset str2
           mov   ah,9
           int   21h

           mov   al,0              ;for comparing
           mov   cx,6
           mov   si,0
        
    L2:    
           mov   bl,arr[si]
           cmp   bl,al
           jle   Skip
           mov   al,bl

    Skip:  
           inc   si
           loop  L2


    ; al is maximum
           mov   dl,al
           mov   ah,2
           int   21h

    ; find minimum

           mov   dx,offset str3
           mov   ah,09h
           int   21h

           mov   al,9
           mov   si,0
           mov   cx,5
    L3:    
           cmp   cx,0
           je    print
           mov   bl,arr[si]
           cmp   bl,al
           jle   LAbel3
    ; jge  Skip2
    ; mov  al,bl
           inc   si
           loop  L3
    Label3:
           mov   al,bl
           jmp   L3
    Skip2: 

           print:
           mov   dl,al
    ; add dl,30h
           mov   ah,2
           int   21h
    exit:  
           MOV   AH, 4CH           ; return control to DOS
           INT   21H
MAIN ENDP
 END MAIN
