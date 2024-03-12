section .text
    global _start

_start:

    mov   eax, 4      ; set assembler to write
    mov   ebx, 1      ; stdout fileno

    push  'M'
    mov   ecx, esp    ; esp now points to your char
    mov   edx, 1      ; edx should contain how many characters to print
    int   80h         ; sys_write(1, "M", 1)


    mov   eax, 4
    mov   ebx, 1
    push  10           ; ASCII code for line feed
    mov   ecx, esp
    mov   edx, 1
    int   80h


    mov   eax, 4
    mov   ebx, 1
    push  'A'
    mov   ecx, esp
    mov   edx, 1
    int   80h


    mov   eax, 4
    mov   ebx, 1
    push  10
    mov   ecx, esp
    mov   edx, 1
    int   80h

   

    
    mov   eax, 4
    mov   ebx, 1
    push  'R'
    mov   ecx, esp
    mov   edx, 1
    int   80h

    
    mov   eax, 4
    mov   ebx, 1
    push  10
    mov   ecx, esp
    mov   edx, 1
    int   80h

   
    mov   eax, 4
    mov   ebx, 1
    push  'I'
    mov   ecx, esp
    mov   edx, 1
    int   80h

   
    mov   eax, 4
    mov   ebx, 1
    push  10
    mov   ecx, esp
    mov   edx, 1
    int   80h

   
    mov   eax, 4
    mov   ebx, 1
    push  'N'
    mov   ecx, esp
    mov   edx, 1
    int   80h

   
    mov   eax, 4
    mov   ebx, 1
    push  10
    mov   ecx, esp
    mov   edx, 1
    int   80h

 
    mov   eax, 4
    mov   ebx, 1
    push  'A'
    mov   ecx, esp
    mov   edx, 1
    int   80h

   
    mov   eax, 4
    mov   ebx, 1
    push  10
    mov   ecx, esp
    mov   edx, 1
    int   80h


    mov   eax, 4
    mov   ebx, 1
    push  'Y'
    mov   ecx, esp
    mov   edx, 1
    int   80h

  
    mov   eax, 4
    mov   ebx, 1
    push  10
    mov   ecx, esp
    mov   edx, 1
    int   80h

    ; return value in EAX = 1 (byte written), or error (-errno)

    ; System exit
    mov eax,1            
    mov ebx,0            
    int 80h




;sudo apt-get update
;sudo apt-get -y install nasm
;nasm -f elf mp1.asm
;ld -m  elf_i386 mp1.o -o mp1
;./mp1
