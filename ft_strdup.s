extern	ft_strlen
extern	ft_strcpy
extern	malloc
extern	__errno_location

global	ft_strdup

section		.text

ft_strdup:
	push	rdi
	call	ft_strlen				; rax = taille de str
	inc		rax						; rax = taille de str avec \0
	mov		rdi, rax				; rdi = rax
	call	malloc					; rax = adress retourner de malloc
	cmp		rax, 0					; si rax = null jump a error
	jz		error
	pop		rdi
	mov		rsi, rdi				; rdi = str
	mov		rdi, rax				; rsi = adress malloc
	call	ft_strcpy				; rax = copie de str
	ret

error:
	mov		rcx, rax				; sauvegarde de rax dans rcx
	call	__errno_location		; rax = adresse de errno
	mov		[rax], rcx				; errno = rcx
	pop		rdi
	xor		rax, rax				; rax = null | retourne null
	ret
