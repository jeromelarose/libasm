global ft_strcmp

section .text

ft_strcmp:
	xor		rax, rax		; rax = 0
	xor		rcx, rcx		; rcx = 0
	xor		rdx, rdx		; rdx = 0

loop:
	mov		cl, [rsi]		; cl = premier caractere de s2
	mov		al, [rdi]		; al = premier caractere de s1
	cmp		cl, 0x0			; si premier caractere de s2 est null returne 
	jz		ret
	cmp		al, 0x0			; si premier caractere de s1 est null returne
	jz		ret
	cmp		ax, cx			; ax = premier caractere de s1 - premier caractere de s1
	jne		ret				; si premier caractere de s1 est plus petit que le premier caractere de s2
	inc		rdi				; adresse de s1++
	inc		rsi				; adresse de s2++
	jmp		loop


ret:
	sub		ax, cx			; ax = premier caractere de s1 - premier caractere de s1
	cwde					; converti	ax en nombre signe
	ret
