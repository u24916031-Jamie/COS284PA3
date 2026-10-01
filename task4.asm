global best_book ; make _start visible to the linker

section .data ; initialised data lives here
total dq 0

section .text ; instructions live here

	
;rdi Book* books, rsi long n
best_book:
	xor rax, rax
	xor rcx, rcx
	xor rdx, rdx
	pxor xmm0, xmm0
	pxor xmm1, xmm1
.loop:
	cmp rcx, rsi
	jge .done



	imul r8, rcx, 24
	add r8, 8
	movsd xmm0, [rdi + r8]
	inc rcx
	ucomisd xmm0, xmm1
	ja .greater

	jmp .loop
	

.greater
	movsd xmm1, xmm0
	mov rax, r8
	add rax, rdi
	sub rax, 8
	jmp .loop

.done:

	ret


