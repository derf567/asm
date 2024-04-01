section .data
    prompt db 'Enter your password: ', 0
    weak_msg db 'Your password is weak.', 0
    strong_msg db 'Your password is strong.', 0

section .bss
    password resb 20

section .text
    global main

main:
    ; Prompt the user to enter a password
    mov eax, 4       ; sys_write
    mov ebx, 1       ; stdout
    mov ecx, prompt  ; address of the prompt message
    mov edx, 21      ; length of prompt
    int 0x80         ; syscall

    ; Read the password from the user
    mov eax, 3       ; sys_read
    mov ebx, 0       ; stdin
    mov ecx, password ; buffer to store the input
    mov edx, 20      ; maximum number of characters to read
    int 0x80         ; syscall

    ; Check if the password is weak or strong
    mov esi, password  ; address of password
    mov ecx, 0         ; counter for password length
loop_start:
    cmp byte [esi], 0 ; check for null terminator
    je end_loop
    inc esi            ; move to the next character
    inc ecx            ; increment password length counter
    jmp loop_start
end_loop:
    cmp ecx, 8         ; compare password length with 8
    jl weak_password
    jmp strong_password

weak_password:
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, weak_msg    ; address of weak message
    mov edx, 21          ; length of weak message
    int 0x80             ; syscall
    jmp exit_program

strong_password:
    mov eax, 4             ; sys_write
    mov ebx, 1             ; stdout
    mov ecx, strong_msg    ; address of strong message
    mov edx, 23            ; length of strong message
    int 0x80               ; syscall
    jmp exit_program

exit_program:
    mov eax, 1             ; sys_exit
    xor ebx, ebx           ; exit status 0
    int 0x80               ; syscall


; sudo apt-get update
; sudo apt-get -y install nasm
;nasm -f elf password.asm
;ld -m  elf_i386 password.o -o password
;ld -m elf_i386 -e main password.o -o password
;./password
