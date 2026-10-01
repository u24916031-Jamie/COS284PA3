global weighted_rating ; make _start visible to the linker

section .data ; initialised data lives here
total dq 0

section .text ; instructions live here

	
;rdi Book* books, rsi long n
weighted_rating:
	xor rax, rax
	xor rcx, rcx
	xor rdx, rdx
	pxor xmm0, xmm0 ; sum rating x pages
	pxor xmm1, xmm1 ; rating
	pxor xmm2, xmm2 ; pages
	pxor xmm3, xmm3 ; sum pages
.loop:
	cmp rcx, rsi
	jge .done



	imul r8, rcx, 24
	add r8, 8
	movsd xmm1, [rdi + r8]
	add r8, 8
	mov edx, dword [rdi + r8]
	inc rcx

	cvtsi2sd xmm2, rdx

	addsd xmm3, xmm2
	mulsd xmm1, xmm2
	addsd xmm0, xmm1


	jmp .loop
	


.done:
	divsd xmm0, xmm3

	ret


