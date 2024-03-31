data segment
     msg1 db 0ah,0dh,"Enter the limit $"
     msg2 db 0ah,0dh,"Enter the numbers $"
     msg3 db 0ah,0dh,"The sorted array is $"
     n db ?
     n1 db 09h dup(?)
data ends
code segement
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

           mov cl,n

           lea dx,msg2
           mov ah,09h
           int 21h

           mov si,offset n1

    read:mov ah,01h
         int 21h
         sub al,30h
         mov [si],al
         inc si
         inc cl
         jnz read
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