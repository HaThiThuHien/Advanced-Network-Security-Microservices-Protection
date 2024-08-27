section .data
	hello:     db 'Hello, World!',10    ; 'Hello, World!' plus a linefeed character
	helloLen:  equ $-hello             ; Length of the 'Hello world!' string

section .text
	global _start

_start:
	mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,hello        ; Put the offset of hello in ecx
	mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
	int 80h              ; Call the kernel
	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return "code" of 0 (no error)
	int 80h;section .data
    num1 db 1
    num2 db 2
    num3 db 3

section .bss
    min_num resb 1

section .text
    global _start

_start:
    ; initialize registers
    mov al, [num1]
    mov bl, [num2]
    mov cl, [num3]

    ; compare and find the minimum number
    cmp al, bl
    jl set_min_num_1
    mov al, bl

set_min_num_1:
    cmp al, cl
    jl set_min_num_2
    mov al, cl

set_min_num_2:
    ; store the minimum number
    mov [min_num], al

    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80