; Lesson 7.3 - Calculating string length
; to calculate the length of the string we will use a "pointer arithmetic" technique. EAX
; "Hello!" 
; EAX : H , then incement by 1
; EAX : e , + 1
; EAX : l , + 1
; EAX : l , + 1
; EAX : o , + 1
; EAX : ! , + 1
; EAX : 0
; EAX = 6
; mov edx, 6
; mov edx, eax

SECTION .data
    msg     db  'Hello!', 0xA
    msg2    db  'World', 0xA
SECTION .text
    global _start

_start:
    mov ebx, msg    ; move the address of our message string into EBX | EBX = 1001
    mov eax, ebx    ; move the address in EBX into EAX as well (Both now point to the same segment in memory) | EAX = 1001

nextchar:
    cmp byte[eax], 0      ; compare the byte pointed to by EAX at this address against zero (Zero is an end of string delimeter)
    jz  finished          ; jump (if the zero flagged has been set)  to the point in the code labeled as 'finished'
    inc eax               ; increment the address in EAX by one byte
    jmp nextchar          ; jump to the point in the code labeled as 'nextchar'

; eax = 1001, 1002, 1003, 1004, 1005, 1006, 1007

finished:
    sub eax, ebx          ; eax = eax - ebx ; eax = 1007 - 1001 ; eax = 6

    ; use the code earlier
    ; display a message
    mov edx, eax    
    mov ecx, msg   
    mov ebx, 1
    mov eax, 4
    int 80h 

; labelformsg2
    mov ebx, msg2    ; move the address of our message string into EBX | EBX = 1001
    mov eax, ebx    ; move the address in EBX into EAX as well (Both now point to the same segment in memory) | EAX = 1001

nextchar2:
    cmp byte[eax], 0      ; compare the byte pointed to by EAX at this address against zero (Zero is an end of string delimeter)
    jz  finished2          ; jump (if the zero flagged has been set)  to the point in the code labeled as 'finished'
    inc eax               ; increment the address in EAX by one byte
    jmp nextchar2          ; jump to the point in the code labeled as 'nextchar'

finished2:
    sub eax, ebx          ; eax = eax - ebx ; eax = 1007 - 1001 ; eax = 6

    ; use the code earlier
    ; display a message
    mov edx, eax    
    mov ecx, msg2   
    mov ebx, 1
    mov eax, 4
    int 80h 

    ; quit the program
    mov ebx, 0                          ; our program exited successfully
    mov eax, 1                          ; service 1, perform exit
    int 80h                             ; see https://second.wiki/wiki/int_80h for more details

; ===== NOTES
;           | H  | e   | l   |  l    |  o  | !  | end of the string
;           | 72 | 101 | 108 |  108  | 111 | 33 | 0
; address    1001  1002  1003 1004     1005 1006 1007
; EAX = 1001
; byte[eax] = 72
; 0 base 10 -> 0000 0000 base 2 in a byte
; ax, bx, cx, dx -> 
; ax - accumulator register - size of 2 bytes 16 bits
; 0000 0000 0000 0000
; mov ax , 1   ; 0000 0000 0000 0001
; is also equivalent to
; mov ah, 0
; mov al, 1
; ======================
; mov bx, 34    ; 0000 0000 0010 0010
; is also equivalent to
; mov bh, 0 
; mov bl, 34
; ======================
; extended registers: eax, ebx, ecx, edx
; 0000 0000 0000 0000 0000 0000 0000 0000 -> 32 bits
; mov ebx, 0
; is also equivalent to
; mov bh, 0
; mov bl, 0

; $ sudo apt-get install nasm
; $ nasm -f elf balaman_lesson3.asm
; $ ld -m elf_i386 balaman_lesson3.o -o balaman_lesson3
; $ ./balaman_lesson3
