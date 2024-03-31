data segment
     msg1 db 0ah,0dh,"Enter the limit $"
     msg2 db 0ah,0dh,"Enter the numbers $"
     msg3 db 0ah,0dh,"Enter the sorted array $"
     n db ?
     n1 db 09h dup(?)
data ends
code segment
     assume cs:code,ds:data
     start:mov ax,data
           mov ds,ax

           lea dx,msg1
           mov ah,09h
           int 21h

           mov ah,01h
           int 21h
           sub al,30h
           mov n,al
          
          lea dx,msg2
           mov ah,09h
           int 21h

           mov cl,n

           mov si,offset n1

     scan:mov ah,01h
          int 21h
          sub al,30h
          mov [si],al
          inc si
          dec cl
          jnz scan
          
          mov cl,n

     loop1:mov ch,n
           mov si,offset n1
     loop2:mov dl,[si]
           cmp dl,[si+1]
           jc swap
           jmp swapped

     swap:mov dl,[si]
          xchg dl,[si+1]
          mov [si],dl

   swapped:inc si
           dec ch
           jnz loop2
           dec cl
           jnz loop1

           lea dx,msg3
           mov ah,09h
           int 21h

           mov cl,n
           mov si,offset n1

    print:mov dl,[si]
           add dl,30h
           mov ah,02h
           int 21h
           inc si
           dec cl
           jnz print

           mov ah,4ch
           int 21h
code ends
end start

