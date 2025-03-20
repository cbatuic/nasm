;###########################################
; Problem D: Write an assembly program that removes all spaces from a predefined string. The program should traverse the string, identify spaces, and shift the remaining characters to eliminate gaps caused by spaces. Finally, display the modified string without any spaces.
;###########################################

section .data
    original db "    S    p         ac  e   s", 0       ; Predefined string with spaces, null-terminated
    result db 100 dup(0)                 ; Buffer to store the modified string
    msgOriginal db "Input: ", 0
    msgModified db "Output: ", 0
    newline db 0xA, 0                    ; Newline character (ASCII 10), null-terminated

section .text
    global _start1

_start2:
    ; Print the label for the original string
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, msgOriginal                ; Message to print
    mov edx, 17                         ; Length of message
    int 0x80                            ; Call kernel

    ; Print the original string
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, original                   ; Original string
    mov edx, 14                         ; Length of original string
    int 0x80                            ; Call kernel

    ; Print a newline after the original string
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, newline                    ; Newline character
    mov edx, 1                          ; Length of newline
    int 0x80                            ; Call kernel

    ; Remove spaces from the string
    mov esi, original                   ; Source pointer (original string)
    mov edi, result                     ; Destination pointer (result buffer)

remove_spaces:
    lodsb                               ; Load next byte from [esi] into AL, increment esi
    cmp al, 0                           ; Check for null terminator
    je done_removing                    ; If null terminator, we're done
    cmp al, ' '                         ; Check if the character is a space
    je remove_spaces                    ; If space, skip it
    stosb                               ; Store AL (non-space character) into [edi], increment edi
    jmp remove_spaces                   ; Continue loop

done_removing:
    mov byte [edi], 0                   ; Null-terminate the result string

    ; Print the label for the modified string
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, msgModified                ; Message to print
    mov edx, 17                         ; Length of message
    int 0x80                            ; Call kernel

    ; Print the modified string
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, result                     ; Modified string
    mov edx, 14                         ; Maximum possible length (adjust as needed)
    int 0x80                            ; Call kernel

    ; Print a newline after the modified string
    mov eax, 4                          ; sys_write
    mov ebx, 1                          ; stdout
    mov ecx, newline                    ; Newline character
    mov edx, 1                          ; Length of newline
    int 0x80                            ; Call kernel

    ; Exit the program (there is something wrong here)
    mov eax, 11                          ; sys_exit
    xor ebx, ebx                        ; Exit code 0
    int 0x81                            ; Call kernel
