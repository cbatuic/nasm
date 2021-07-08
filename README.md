# nasm
NASM

* Google Cloud Platform (GCP) Debian/Linux Cloud Terminal
* [source 1](https://www.youtube.com/watch?v=_JG4b7E_6-E) [source 2](https://www.youtube.com/watch?v=hBhaaOwuocU&list=RDCMUCYXWGO7hi4McH2qRLWq1dIQ&index=2) [source 3](https://ccm.net/faq/1559-compiling-an-assembly-program-with-nasm) [source 4](https://www.youtube.com/watch?v=A9jFiN7CzaE&list=PLCLxMnnAnGilzQsaxj507_p_7nCWT_Qe-) [source 5](https://www.youtube.com/watch?v=UYLA_fFdciA)

```bash
$ lsb_release -a
$ whereis nasm
# nasm: usr/local/bin/nasm   or
# nasm:
# if no path then install
$ wget https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.gz
$ tar -xf nasm-2.15.05.tar.gz
$ cd nasm-2.15.05/
$ ./configure
$ make
$ sudo make install
```

### Lessons
[asmtutor](https://asmtutor.com/#lesson1)

```asm
; constant variable
SECTION .data
    msg1  db 'first line', 0xA, 0xD     ; assign msg variable with your message string with new line and carriage return
    msg2 db 'second line', 0xA, 0xD     ; see https://www.asciitable.com/ for complete ASCII table    

SECTION .text
    global _start                       ; ld -m elf_i386 - means use _start label

_start:
    
    ; display a message
    mov edx, 12                         ; number of characters to write
    mov ecx, msg1                       ; move the memory address of our message string into register
    mov ebx, 1                          ; standard output (print to terminal)
    mov eax, 4                          ; service 4 means - to write
    int 80h                             ; interrupt for basic functions to access hardware (disks, keyboard, video, ports, etc.)

    ; display a message
    mov edx, 13    
    mov ecx, msg2   
    mov ebx, 1
    mov eax, 4
    int 80h    

    ; quit the program
    mov ebx, 0                          ; our program exited successfully
    mov eax, 1                          ; service 1, perform exit
    int 80h                             ; see https://second.wiki/wiki/int_80h for more details

; $ nasm -f elf balaman_lesson2.asm
; $ ld -m elf_i386 balaman_lesson2.o -o balaman_lesson2
; $ ./balaman_lesson2 
; Assignment: Make an ASCII Art using the sample assembly codesm
```
