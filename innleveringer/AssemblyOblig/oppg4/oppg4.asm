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

global _start
_start:
  mov edx,a
  mov ecx,i
  mov [edx],byte 0
  mov [ecx],byte 0
  
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
  inc edx
  
Sub:
  push edx
  sub edx
  
Slutt:
  sub edx,'0'
  mov ebx,STDOUT
  mov eax,SYS_EXIT
  mov ebx,0
  int 80h
