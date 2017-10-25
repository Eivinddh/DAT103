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
  cmp ecx,10
  jl Add

  Sub:
    dec edx
    jmp RestLoop
  
Add:
  INC edx
  jmp RestLoop
 

RestLoop:
  inc ecx
  cmp ecx,20
  je Slutt
  jmp MyLoop 
  
nylinje:
  mov edx,crlflen
  mov ecx,crlf
  mov ebx,STDOUT
  mov eax,SYS_WRITE
  int 80h
  ret

Slutt:
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  add edx,'0'
  mov [siffer], edx
  mov ecx,siffer
   
  int 80h
  call nylinje
  mov eax,SYS_EXIT
  mov ebx,0
  int 80h

; End _start
