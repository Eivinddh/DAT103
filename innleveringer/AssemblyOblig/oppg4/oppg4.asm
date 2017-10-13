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
  mov edx,[a]
  mov ecx,[i]
  jmp MyLoop
  
MyLoop:
  push edx
  push ecx
  cmp ecx,10
  ja Sub ;conditioned/unconditioned?
  jl Add
  
Add:
  push edx
  INC edx
  pop edx
  jmp RestLoop
  
Sub:
  push edx
  DEC edx
  pop edx
  jmp RestLoop
 
RestLoop:
  push edx
  push ecx
  inc ecx
  cmp ecx,20
  je Slutt
  jmp MyLoop 

Slutt:
  sub edx,'0'
  mov ebx,STDOUT
  int 80h
  mov eax,SYS_EXIT
  mov ebx,0
  int 80h
