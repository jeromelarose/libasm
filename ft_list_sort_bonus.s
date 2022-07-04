global ft_list_sort

section .text

;rsi = ft_strcmp

ft_list_sort:

	cmp		rdi, 0				; si adress &list == null return
	jz		return				; return
	mov		rcx, [rdi]			; rcx = curent
	mov		r11, rcx			; r11 = curent

loop:

	cmp		rcx, 0				; si adress rcx == null return
	jz		return				; return
	mov		rbx, [rcx + 8]		; rbx == noeud suivant
	cmp		rbx, 0				; si adress list == null return
	jz		return				; return
	push	rdi
	push	rsi
	mov		rax, rsi			; rax = ft_strcmp
	mov		rdi, [rcx]			; rdi = data
	mov		rsi, [rbx]			; rsi = rcx -> next -> data
	cmp		rdi, 0				; si adress rdi == null return
	jz		init_rdi			;return
	cmp		rsi, 0				; si adress rsi == null return
	jz		init_rsi			; return
	push	rbx
	push	rcx
	push	r11
	call	rax
	pop		r11
	pop		rcx
	pop		rbx
	pop		rsi
	pop		rdi
	cmp		al, 0x0
	jg		swap					; if > 0 jump to swap
	mov		r11, rcx				; r11 = rcx
	mov		rcx, [rcx + 8]			; rcx = rcx -> next
	jmp		loop 

swap:
	mov		r12, [rbx + 8]
	mov		[rcx + 8], r12			; rcx -> next = rbx -> next
	mov		[rbx + 8], rcx			; rbx -> next = rcx
	cmp		r11, rcx
	jz		first
	mov		[r11 + 8], rbx			; r11 -> next = rbx
	mov		rcx, [rdi]
	jmp		loop

first:
	mov		[rdi], rbx
	mov		rcx, [rdi]
	jmp		loop

init_rdi:
	pop		rsi
	pop		rdi
	mov		r11, rcx				; r11 = rcx
	mov		rcx, [rcx + 8]			; rcx = rcx -> next
	jmp		loop 

init_rsi:
	pop		rsi
	pop		rdi
	jmp		swap

return:
	ret
