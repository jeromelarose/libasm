global ft_list_push_front

extern malloc

section .text

ft_list_push_front:
	cmp		rdi, 0				; si &list == NULL jump error
	jz		error
	push	rsi
	push	rdi
	xor		rdi, rdi
	xor		rax, rax
	mov		rdi, 16				; rdi = taille de t_list
	call	malloc				; rax = adresse malloc du nouveau noeud
	pop		rdi
	pop		rsi
	cmp		rax, 0				; if le malloc a echouer error
	jz		error
	xor		rcx, rcx
	mov		[rax], rsi			; nouveau noeud->data = data
	mov		rcx, [rdi]			; rcx = list
	mov		[rax + 8], rcx		; nouveau noeud->next = list
	mov		[rdi], rax			; &list = nouveau noeud

error:
	xor		rax, rax

return:
	ret
