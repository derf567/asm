section .bss
    buffer resb 1

section .data
    newline db 10      

section .text
    global _start

_start:
    mov eax, 3           
    mov ebx, 0        
    mov ecx, buffer
    mov edx, 1         
    int 0x80        

    cmp byte [buffer], 'a'
    jl not_lowercase
    cmp byte [buffer], 'z'
    jg not_lowercase


    sub byte [buffer], 32 

not_lowercase:
    ; Display the entered character
    mov eax, 4         
    mov ebx, 1           
    mov ecx, buffer   
    mov edx, 1       
    int 0x80    


    ; Display a new line
    mov eax, 4           ; sys_write system call number
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, newline     ; pointer to the newline character
    mov edx, 1           ; length of the newline character
    int 0x80             ; invoke system call        

    ; Exit the program
    mov eax, 1        
    xor ebx, ebx      
    int 0x80          