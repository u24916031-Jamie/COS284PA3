global total_pages ; make _start visible to the linker

section .data ; initialised data lives here
total dq 0

section .text ; instructions live here

	
;rdi Book* books, rsi long n
total_pages:
	xor rax, rax
	xor rcx, rcx

.loop:
	cmp rcx, rsi
	jge .done
	

	imul r8, rcx, 24
	add r8, 16
	mov edx, dword [rdi + r8]
	add rax, rdx
	inc rcx
	jmp .loop
	

.done:
	ret


