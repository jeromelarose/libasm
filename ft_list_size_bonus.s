global ft_list_size

section .text

ft_list_size:
	xor		rax, rax
	xor		rcx, rcx

loop:
	cmp		rdi, 0				; if list == null return 0;
	jz		return
	add		rax, 1				; rax == 1
	mov		rcx, [rdi + 8]		; rcx = list->next
	mov		rdi, rcx			; rdi = list->next
	jmp		loop

return:
	ret
