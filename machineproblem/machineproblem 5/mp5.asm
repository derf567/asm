section .data
    ;


section .text
    global _start

_start:
    mov eax, 4 ; System call for 'write'
    mov ebx, 1 ; File descriptor (stdout)

    get_char:
        mov eax, 3          ; System call for 'read'
        mov ebx, 0          ; File descriptor (stdin)
        mov ecx, char_in    ; Address to store character
        mov edx, 1          ; Read 1 byte
        int 0x80

       
        cmp byte [char_in], 'a'
        jl not_lower
        cmp byte [char_in], 'z'
        jg not_lower

       
        sub byte [char_in], 0x20

        jmp print_char

    not_lower:
        
        cmp byte [char_in], 'A'
        jl print_char
        cmp byte [char_in], 'Z'
        jg print_char

        

        add byte [char_in], 0x20

    print_char:
        mov eax, 4      
        mov ebx, 1
        mov ecx, char_in
        mov edx, 1
        int 0x80


mov eax, 1
mov ebx, 0
int 0x80


section .bss
    char_in resb 1


;sudo apt-get update
;sudo apt-get -y install nasm
;nasm -f elf mp5.asm
;ld -m  elf_i386 mp5.o -o mp5
;./mp5
