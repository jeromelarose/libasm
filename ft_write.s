global	ft_write

extern	__errno_location

section		.text

ft_write:
	mov		rax, 1				; je charge write en memoire pour le call
	syscall						; appel de write
	cmp		rax, 0
	jl		err					; si un le retour de write == -1 jump err
	ret

err:
	neg		rax
	mov		rdx, rax			; sauvegarde de rax dans rdx
	call	__errno_location	; recupere l'adresse de errno dans rax
	mov		[rax], rdx			; errno = retour de write
	mov		rax, -1				; rax = -1 | reourne -1
	ret
