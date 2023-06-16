 ;?TITLE:

 .MODEL SMALL
 .STACK 100H
.DATA
key=239                                   ;can be byte value
bufmax=128
         buffer  byte bufmax+1 dup (0)
         bufsize dword bufmax
.386
.CODE
MAIN PROC
         MOV  AX, @DATA          ; initialize DS
         MOV  DS, AX

         mov  ecx,bufsize
         mov  esi,0

         mov  ecx,bufSize        ; loop counter
         mov  esi,0              ; index 0 in buffer
    L1:  
         xor  buffer[esi],KEY    ; translate a byte
         inc  esi                ; point to next byte
         loop L1

                         
    exit:
         MOV  AH, 4CH            ; return control to DOS
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
         MOV  AH,2
         int  21h
         ret
disp ENDP
 END MAIN
