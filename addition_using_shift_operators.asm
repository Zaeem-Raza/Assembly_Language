.model small
.stack 100h
.code
main proc
         mov  ax,2      ; test value
         mov  dx,ax
         shl  dx,4      ; AX * 16
         push dx        ; save for later
         mov  dx,ax
         shl  dx,3      ; AX * 8
         shl  ax,1      ; AX * 2
         add  ax,dx     ; AX * 10
         pop  dx        ; recall AX * 16
         add  ax,dx     ; AX * 26
         mov  ah,4ch
         int  21h
main endp
end main