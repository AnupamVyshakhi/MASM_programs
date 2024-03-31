data segment
     msg1 db 0ah,0dh,"Enter the numbers $"
     msg2 db 0ah,0dh,"Enter the key to be found $"
     msg3 db 0ah,0dh,"Key found $"
     msg4 db 0ah,0dh,"key notfound $"
     n db 09h dup(?)
data ends
code segment
     assume cs:code,ds:data
     start:mov ax,data 
           mov ds,ax

           mov si,offset n 

           lea dx,msg1
           mov ah,09h
           int 21h
           mov cl,00h

    scan:mov ah,01h
         int 21h
         cmp al,0dh
         jz ended
         mov [si],al
         inc si
         inc cl
         jmp scan

    ended:lea dx,msg2
          mov ah,09h
          int 21h
           mov ah,01h
           int 21h
          mov bl,al

    check:dec si
         cmp bl,[si]
         jz found
         dec cl
         jnz check
         jmp notfound

   found:lea dx,msg3
         mov ah,09h
         int 21h
         jmp stopped

notfound:lea dx,msg4
         mov ah,09h
         int 21h

  stopped:mov ah,4ch
          int 21h

code ends
end start