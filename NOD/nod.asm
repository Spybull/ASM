;danullbyte@gmail.com (spybull)
.MODEL small
.STACK 100h
.CODE
.startup 
	mov ax,36
	mov dx,60
	call node 
	
	xor dx,dx 
	mov dx,42 
	call node ;НОД(НОД(36,60),42)
	
	xor	cx,cx
	mov	bx,10
isDiv:	
	xor	dx,dx
	div	bx
	push	dx
	inc	cx
	or	ax,ax
	jnz	isDiv
	
isOut:
	pop	ax
	or	al,30h
	int	29h
	loop isOut

	mov  ah,4ch  
	int  21h    

node proc
_while:
	cmp ax,dx
	je _exit
	jl _elif
	sub ax,dx
	jmp _while
_elif:
	sub dx,ax
	jmp _while
_exit:
	ret
node endp
END


