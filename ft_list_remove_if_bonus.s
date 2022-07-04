global ft_list_remove_if 

section .text

; rdi = &list		rsi = data_ref		rdx = cmp	rcx = free

ft_list_remove_if :
	push	rsp
	xor		rax, rax
	cmp		rdi, 0					; si &list == null return
	jz		return
	cmp		rdx, 0					; si cmp == null return
	jz		return
	cmp		rcx, 0					; si free == null return
	jz		return
	xor		r10, r10
	mov		r10, [rdi]				; r10 = noeud curent
	mov		r8, r10					; r8 = noeud curent

loop:
	cmp		r10, 0
	jz		return

	push	r12
	push	r8
	push	rdx
	push	rsi
	push	rdi
	push	rcx
	push	r10

	xor		rax, rax				; rax = null
	mov		rdi, [r10]				; rdi = data
	cmp		rsi, 0					; si data_ref == null jump rsi_null
	jz		null_rsi
	cmp		rdi, 0
	jz		null_rdi				; si list->data == null jump null rdi
	call	rdx

	pop		r10
	pop		rcx
	pop		rdi
	pop		rsi
	pop		rdx
	pop		r8
	pop		r12

	cmp		al, 0x0					; si data == data_ref
	jz		free_node
	mov		r8, r10					; r8 = noeud precedent
	mov		r10, [r10 + 8]			; r10 = nouveau noeud courent
	jmp		loop

free_node:
	mov		r12, [r10 + 8]			; r12 = noeud suivant
	mov		[r8 + 8], r12			; noeud precedent -> next = noeud suivant
	push	r12
	push	r8
	push	rdx
	push	rsi
	push	rdi
	push	rcx
	push	r10
	mov		rdi, [r10]				; rdi = data
	cmp		rdi, 0
	jz		free_elem
	call	rcx						; free data

free_elem:
	pop		r10
	pop		rcx
	push	rcx
	push	r10
	mov		rdi, r10				; rdi = noeud courent

	call	rcx						; free noeud courent

	pop		r10
	pop		rcx
	pop		rdi
	pop		rsi
	pop		rdx
	pop		r8
	pop		r12

	cmp		r10, r8					; si noeud pecedent == noeud courent jump first
	jz		first
	mov		r10, r12				; noeud courent devient noeud suivant
	jmp		loop

first:
	mov		r10, r12				; noeud courent devient noeud suivant
	mov		r8, r12					; noeud precedent devient noeud suivant
	mov		[rdi], r12				; &list pointe ver noeud suivant
	jmp		loop

null_rdi:
	pop		r10
	pop		rcx
	pop		rdi
	pop		rsi
	pop		rdx
	pop		r8
	pop		r12
	mov		r8, r10					; noeud precedent devient noeud courent
	mov		r10, [r10 + 8]			; noeud courent devient noeud suivant
	jmp		loop

null_rsi:
	mov		rbx, rdi				; rbx = data
	pop		r10
	pop		rcx
	pop		rdi
	pop		rsi
	pop		rdx
	pop		r8
	pop		r12

	cmp		rbx, 0					; si data == null jump free_node
	jz		free_node
	mov		r8, r10					; noeud precendent devient noeud courent
	mov		r10, [r10 + 8]			; noeud courent devient noeud suivant
	jmp		loop

return:

	pop rsp
	ret
