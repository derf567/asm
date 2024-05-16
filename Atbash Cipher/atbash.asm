section .data
    input db 0
    output db 0
    prompt db "Enter a letter: ", 0

section .text
    global _start

_start:
    ; Prompt user for input
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, prompt       ; pointer to the prompt message
    call print_string     ; call print_string function

    ; Read user input
    mov eax, 3            ; syscall for sys_read
    mov ebx, 0            ; file descriptor 0 (stdin)
    mov ecx, input        ; buffer to store input
    mov edx, 1            ; number of bytes to read
    int 0x80              ; call kernel

    ; Check if the input is an uppercase letter
    cmp byte [input], 'A'
    jl print_input         ; If input is not a letter, print it as it is
    cmp byte [input], 'Z'
    jg print_input         ; If input is not a letter, print it as it is

    ; Calculate Atbash cipher
    mov al, 'Z'           ; Set al to 'Z'
    sub al, byte [input]  ; Subtract input from 'Z'
    add al, 'A'           ; Add 'A' to the result

    ; Store the result
    mov byte [output], al

    ; Print the output
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, output       ; pointer to the output
    mov edx, 1            ; length of the output
    int 0x80              ; call kernel

    ; Exit the program
    mov eax, 1            ; syscall for sys_exit
    xor ebx, ebx          ; exit code 0
    int 0x80              ; call kernel

print_input:
    ; Print the input character
    mov eax, 4            ; syscall for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, input        ; pointer to the input character
    mov edx, 1            ; length of the input character
    int 0x80              ; call kernel
    ret

print_string:
    ; Print a null-terminated string
    mov edx, -1           ; Set edx to -1 to print until null terminator
    jmp .L2
.L1:
    inc edx               ; Increment edx to point to the next character
.L2:
    inc edx               ; Skip the null terminator
    cmp byte [ecx + edx], 0 ; Check for null terminator
    jne .L1               ; If not null, continue looping
    mov eax, 4            ; syscall for sys_write
    int 0x80              ; call kernel
    ret
