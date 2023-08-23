section .data
    msg db 'Digite um numero: ', 0
    par db 'O numero e par.', 0
    impar db 'O numero e impar.', 0

section .bss
    numero resb 10

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 18
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, numero
    mov edx, 10
    int 0x80

    mov eax, [numero]
    sub al, '0'

    test al, 1
    jnz numero_impar

numero_par:
    mov eax, 45
    mov ebx, 1
    mov ecx, par
    mov edx, 14
    int 0x80
    jmp fim

numero_impar:
    mov eax, 4
    mov ebx, 1
    mov ecx, impar
    mov edx, 16
    int 0x80

fim:
    mov eax, 1
    xor ebx, ebx
    int 0x80
