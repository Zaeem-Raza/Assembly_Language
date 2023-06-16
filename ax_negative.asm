.model small
.stack 100h
.data
    prompt db 'AX IS NEGATIVE$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov ax,1000000001111001b
    ;  and ax,1000000000000000b
                 cmp ax,0
                 js  NEGATIVE
                 jmp exit_program
    NEGATIVE:    
                 mov dx,offset prompt
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main