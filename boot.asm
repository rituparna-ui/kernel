ORG 0x7C00        ; set origin to address 0x7C00
BITS 16           ; set execution mode to 16 bits

start:
  mov ah, 0eh
  mov al, 'A'
  mov bx, 0
  int 0x10        ; bios interrupt
  
  jmp $

times 510-($-$$) db 0
dw 0xAA55