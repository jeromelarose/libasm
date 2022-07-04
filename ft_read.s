global	ft_read

 extern __errno_location

section		.text

ft_read:
	mov		rax, 0				; chargment de read en memoire
	syscall						; appel de read
	cmp		rax, 0				; si le retour de read est < 0 jmp error
	jl		err
	ret

err:
	neg		rax					; passage du retour de read en positif
	mov		rsi, rax			; sauvegarde de rax dans rsi
	call	__errno_location	; recupere l'address de errno dans rax
	mov		[rax], rsi			; errno = rsi
	mov		rax, -1				; rax - -1 | retourne -1
	ret
