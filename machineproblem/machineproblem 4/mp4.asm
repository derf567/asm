section .data
    newline db 10  ; ASCII code for newline character

section .text
    global _start

    ; Function to print a character
    print_char:
        mov eax, 4       
        mov ebx, 1       
        mov ecx, esp     
        mov edx, 1       
        int 0x80         
        ret

    _start:



   
        cmp al, 'A'
        jl not_uppercase  
        cmp al, 'Z'
        jg not_uppercase 

        ; Convert to lowercase (add 32 to ASCII code)
        add al, 32

    not_uppercase:

        ; Print the character
        push eax          
        call print_char  

        ; Print line feed (optional)
        mov eax, 4        
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1        
        int 0x80         

    ; Original printing functionality (unmodified)

        mov eax, 4       
        mov ebx, 1       
        mov ecx, msg1     
        mov edx, 1       
        int 0x80          

        mov eax, 4        
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1       
        int 0x80        

        mov eax, 4       
        mov ebx, 1        
        mov ecx, msg2    
        mov edx, 1        
        int 0x80          

        mov eax, 4       
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1        
        int 0x80        

        mov eax, 4    
        mov ebx, 1       
        mov ecx, msg3     
        mov edx, 1        
        int 0x80          

        mov eax, 4        
        mov ebx, 1       
        mov ecx, newline  
        mov edx, 1        
        int 0x80          

        mov eax, 4        
        mov ebx, 1        
        mov ecx, msg4     
        mov edx, 1        
        int 0x80          

        mov eax, 4       
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1        
        int 0x80         

    ; Exit program
        mov eax, 1       
        xor ebx, ebx      
        int 0x80          

    section .data
        msg1 db 'A'       
        msg2 db 'a'      
        msg3 db 'Z'     
        msg4 db 'z'      


;sudo apt-get update
;sudo apt-get -y install nasm
;nasm -f elf mp3.asm
;ld -m  elf_i386 mp3.o -o mp3
;./mp3
