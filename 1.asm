Data segment
	x db 3
	y db 4
	w db ?
Data ends
Code segment
	assume cs:code,ds:data
	start:mov ax,data
	mov ds,ax
	mov al,x;al 的值是二者之和，3+4=7
	add al,y
	mov w,al;w=07h
	mov dl,al
	add dl,30h;dl=37h，即7字符的ASCLL码
	mov ah,02
	int 21h;调用中断，屏幕显示
	mov ah,4ch
	int 21h;调用中断，返回DOS系统
Code ends
	end start