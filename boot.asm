ORG 0        ; set origin to address 0x7C00
BITS 16           ; set execution mode to 16 bits

jmp 0x7C0: start
start:
  cli             ; clear interrupts
  mov ax, 0x7C0
  mov ds, ax
  mov es, ax

  mov ax, 0x00
  mov ss, ax
  mov sp, 0x7C00
  sti             ; enable interrupts
  mov si, message
  call print
  jmp $

print:
  mov bx, 0
.loop:
  lodsb
  cmp al, 0
  je .done
  call print_char
  jmp .loop
.done:
  ret

print_char:
  mov ah, 0eh
  int 0x10        ; bios interrupt
  ret

message: db "Hello, Ritu !", 0

times 510-($-$$) db 0
dw 0xAA55