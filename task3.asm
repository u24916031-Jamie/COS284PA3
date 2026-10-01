global count_above ; make _start visible to the linker

section .data ; initialised data lives here
total dq 0

section .text ; instructions live here

	
;rdi Book* books, rsi long n
count_above:
	xor rax, rax
	xor rcx, rcx
	
.loop:
	cmp rcx, rsi
	jge .done



	imul r8, rcx, 24
	add r8, 8
	movsd xmm1, [rdi + r8]
	inc rcx
	ucomisd xmm1, xmm0
	ja .greater

	jmp .loop
	

.greater
	inc rax
	jmp .loop

.done:
	cvtsi2sd xmm1, rsi
	divsd xmm0, xmm1
	ret


