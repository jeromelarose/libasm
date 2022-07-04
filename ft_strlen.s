global ft_strlen

section	.text

ft_strlen:
	xor		rax, rax				; rax = 0 | i = 0

boucle:
	cmp		byte [rdi + rax], 0		; compare [s1 + i] et \0
	jz		fin						; si [s1 + i] == \0 je ret
	inc		rax						; i++
	jmp		boucle

fin:
	ret
