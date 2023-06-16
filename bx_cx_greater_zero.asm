.model small
.stack 100h
.data
    prompt db 'SUBTRACTION GREATER THAN ZERO$'
.code
main proc
                 mov ax,@data
                 mov ds,ax

                 mov ax,13h
                 mov bx,8h
                 sub ax,bx          ; ax=5
                 cmp ax,0          ; ax-0
                 jg GREATER_THAN_ZERO
                 jmp exit_program
    GREATER_THAN_ZERO:  
                 mov dx,offset prompt
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main