; Konstanter
  cr equ 13 ; Vognretur
  lf equ 10 ; Linjeskift
  SYS_EXIT equ 1
  SYS_READ equ 3
  SYS_WRITE equ 4
  STDIN equ 0
  STDOUT equ 1
  STDERR equ 2

; Datasegment
section .bss
  a resb 1
  i resb 1

section .text

global _start
_start:
  mov [a],byte 0
  mov [i],byte 0
  mov edx,a
  mov ecx,i
  call MyLoop
  
MyLoop:
  push edx
  push ecx
  
  cmp ecx,10
  ja Sub ;conditioned/unconditioned?
  jl Add
  inc ecx
  cmp ecx,20
  je Slutt
  loop MyLoop
  
Add:
  push edx
  INC edx
  
Sub:
  push edx
  DEC edx
  
skrivsiffer:
; Skriver ut sifferet lagret i ecx. Ingen sjekk på verdiområde.
push eax
push ebx
push ecx
push edx
add ecx,'0' ; converter tall til ascii.
mov [siffer],ecx
mov ecx,siffer
mov edx,1
mov ebx,STDOUT
mov eax,SYS_WRITE
int 80h
push edx
push ecx
push ebx
push eax
ret

Slutt:
  mov ecx, a
  call skrivsiffer

  mov ebx,STDOUT
  mov eax,SYS_EXIT
  mov ebx,0
  int 80h
