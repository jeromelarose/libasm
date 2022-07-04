global	ft_strcpy

section		.text

ft_strcpy:
	xor		rcx, rcx				; rcx = 0 | i = 0

loop:
	mov		dl, [rsi + rcx]			; copy du caractere [s2 + i] dans dl
	mov		[rdi + rcx], dl			; copy du caractere dl dan [s1 + i] dans rdi
	cmp		byte [rsi + rcx], 0		; compare rdi a \0
	jz		end						; si null alors jump a end
	inc		rcx						; i++
	jmp		loop

end:
	mov		rax, rdi				; rax = rdi
	ret

error:
	mov		rax, 0					; rax = 0
	ret
