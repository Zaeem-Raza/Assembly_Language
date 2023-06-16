.model small
.stack 100h
.code
main proc
         mov al,6Bh
         ror al,1
         rol al,3
         mov ah,4ch
         int 21h
main endp
end main