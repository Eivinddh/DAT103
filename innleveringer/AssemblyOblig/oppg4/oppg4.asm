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
section .data
  crlf db cr,lf
  crlflen equ $ - crlf


; Datasegment
section .bss
  a resb 1
  i resb 1
  siffer resb 4

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
  push edx
  push ebx
  push eax
  add edx,'0'
  mov [siffer],ecx
  mov ecx,siffer
  mov edx,1
  mov ebx,STDOUT
  mov eax,SYS_WRITE
  int 80h
  mov eax,SYS_EXIT
  mov ebx,0
  int 80h
  
nylinje:
  push eax
  push ebx
  push ecx
  push edx
  mov edx,crlflen
  mov ecx,crlf
  mov ebx,STDOUT
  mov eax,SYS_WRITE
  int 80h
  pop edx
  pop ecx
  pop ebx
  pop eax
  ret
; End _start
