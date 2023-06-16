.model small
.stack 100h
.code
main proc
         stc
         mov al,6Bh
         rcr al,1
         rcl al,3
         mov ah,4ch
         int 21h
main endp
end main