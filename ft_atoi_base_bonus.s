extern	ft_strlen

global	ft_atoi_base
    
    section .text

error:
	xor		rax, rax
	ret

verif_base:
	cmp		r12, 2				; si taille de la base < 2 jump error
	jl		error
	mov		rbx, r13
	xor		rcx, rcx
	xor		rdx, rdx

loop_verif_base:
	mov		r9, 1				; r9 = compteur
	mov		dl,[rbx]			; dl = caractere a comparer
	cmp		dl, 0x0
	jz		parse_nb

loop_verif_base2:
	mov		cl,[rbx + r9]		; cl = caractere suivant
	cmp		cl, 0x0				; fi cl == null jump a inc_rcx
	jz		inc_rbx
	cmp		dl, cl				; si dl = cl jump error
	je		error
	inc		r9					; r9++
	jmp		loop_verif_base2

inc_rbx:
	inc		rbx					; rcx++
	jmp		loop_verif_base

is_base:
	xor		rcx, rcx
	mov		rbx, r13			; rbx = chaine de la base
	xor		r9, r9				; r9 = compteur a 0

loop_base:
	mov		cl,[rbx + r9]		; cl = caractere suivant
	cmp		cl, 0x0
	jz		done
    cmp 	cl, 33				; si cl < que 33 jump skip
	jl		error
    cmp 	cl, 126				; si cl > que 126 jump skip
	jg		error
	cmp		cl, sil				; si caractere actuel == caractere suivant jump a calcul
	je		calcul
	inc		r9					; r9++
	jmp		loop_base

ft_atoi_base:
	cmp		rdi, 0x0			; si rdi == null jump a error
	jz		error
	cmp		rsi, 0x0			; si rsi == null jump a error
	jz		error
	push	rdi
	mov		rdi, rsi
	call	ft_strlen			; rax = taille de la base
	pop		rdi
	mov		r12, rax			; r12 = rax | r12 = taille de la base
	mov		r13, rsi			; r13 = chaine de la la base
	xor		rsi, rsi
    xor		rax, rax			; rax = null
	mov		r11, 1				; r11 = 1
     
pars_skip:
    mov sil, byte [rdi]			; sil = premier caractere
    test rsi, rsi				; si sil == \0 jmp done
    je done
    cmp sil, 33					; si sil < que 33 jump skip
    jl		skip
    cmp sil, 126				; si sil > que 126 jump skip
    jg		skip

pars_sign:
    cmp sil, '-'				; si sil == '-' jump neg_sign
    je		neg_sign
    cmp		sil, '+'			; si sil == '+' jump pos_sign
    je		pos_sign
	jmp		verif_base

parse_nb:

loop_parse_nb:
	cmp		sil, 0				; si sil == null jump done
	jz		done
    cmp		sil, 33				; si sil < que 33 jump done
    jl		done
    cmp		sil, 126			; si sil > que 126 jump done
    jg		done
	jmp		is_base

calcul:
    imul	rax, r12			; rax = rax * rax
    add		rax, r9				; rax = rax + sil
    inc		rdi					; rdi++
    mov		sil, byte [rdi]		; sil = nouveau caractere
    jmp		loop_parse_nb

done:
	imul	rax, r11			; multiplie le resultat par neg
    ret

skip:
	inc		rdi					; rdi++
	jmp		pars_skip			; jump pars_skip

neg_sign:
	inc		rdi					; rdi++
    mov sil, byte [rdi]			; sil = nouveau caractere
	cmp		r11, 1				; si r11 == 1 je jump a neg sinon je jump a pos
	je		neg
	jne		pos

pos_sign:
	inc		rdi					; rdi++
    mov		sil, byte [rdi]		; sil = nouveau caractere
	jmp		pars_sign			; jump a pars_sign

pos:
	mov		r11, 1
	jmp		pars_sign

neg:
	mov		r11, -1
	jmp		pars_sign
