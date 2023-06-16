.MODEL SMALL
.STACK 100h
.DATA
    str0    db 0DH,0AH,'Give Number 1:$'
    str1    db 0DH,0AH,'Given Number 2:$'
    str2    db 0DH,0AH,'Give Option:$'
    str3    db 0DH,0AH,'Option is not valid$'
    str4    db 0DH,0AH,'Cannot divide with 0$'
    number1 db ?
    number2 db ?
.CODE
MAIN PROC
               MOV AX, @DATA     ; initialize DS
               MOV DS, AX        ; moving ax in data segment
               LEA DX,str0
               MOV AH,9
               INT 21H
               MOV AH,1
               INT 21H
               SUB AL,30H
               MOV number1,AL
               LEA DX,str1
               MOV AH,9
               INT 21H
               MOV AH,1
               INT 21H
               SUB AL,30H
               MOV number2,AL
               LEA DX,str2
               MOV AH,9
               INT 21H
               MOV AH,1
               INT 21H
               SUB AL,30H
               CMP AL,1
               JE  _ADD
               CMP AL,2
               JE  _SUB
               CMP AL,3
               JE  _MUL
               CMP AL,4
               JE  _DIV
               LEA DX,str3
               MOV AH,9
               INT 21H
    _ADD:      
               MOV AL,number1
               ADD AL,number2
               MOV AH,0
               AAA
               MOV BX,AX
               ADD BH,30H
               ADD BL,30H
               MOV AH,2
               MOV DL,BH
               INT 21H
               MOV AH,2
               MOV DL,BL
               INT 21H
               JMP END_FUNC
    _SUB:      
    ;     LEA DX,str3
    ;     MOV AH,9
    ;     INT 21H
               MOV AL,number1
               SUB AL,number2
               MOV BL,AL
               ADD BL,30H
               MOV AH,2
               MOV DL,BL
               INT 21H
               jmp END_FUNC
    _MUL:      
               MOV AL,number1
               MUL number2
               AAM
               ADD AL,30H
               ADD AH,30H
               MOV BL,AL
               MOV BH,AH
               MOV AH,2
               MOV DL,BH
               INT 21H
               MOV AH,2
               MOV DL,BL
               INT 21H
               JMP END_FUNC
    _DIV:      
               CMP number2,0
               JE  _Exception
               MOV AL,number1
               MOV AH,0
               DIV number2
               AAD
               MOV BX,AX
               ADD BL,30H
               ADD BH,30H
               MOV AH,2
               MOV DL,BH
               INT 21H
               MOV AH,2
               MOV DL,BL
               INT 21H
               JMP END_FUNC
    _Exception:
               LEA DX,str4
               MOV AH,9
               INT 21H
    END_FUNC:  
               MOV AH,4CH
               INT 21H           ; return control to DOS
MAIN ENDP
    ;description
line PROC
               mov dl,0dh
               mov ah,2
               int 21H
               mov dl,0ah
               int 21h
               ret
line ENDP
    ;description
disp PROC
               MOV AH,2
               int 21h
               ret
disp ENDP                        ;ending main proc function
    END MAIN