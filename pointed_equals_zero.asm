.model small
.stack 100h
.data
    prompt db 'EQUAL TO ZERO$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov si,0
                 cmp word ptr [si],0
                 je EQUAL_ZERO
                 jmp exit_program
    EQUAL_ZERO:  
                 mov dx,offset prompt
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main