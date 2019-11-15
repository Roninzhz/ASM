;已知x、y、z、v均为16位带符号数，
;编程计算(v-(x*y+z-400))/x,
;要求上式计算结果的商存入AX,余数存入DX寄存器
Data segment
	x dw 40
	y dw 20
	z dw 100
	v dw 1000
Data ends
Code segment
	Assume cs:code,ds:data
Start:  Mov AX,Data
		Mov DS,AX
		Mov AX,x
		Imul y
		Mov CX,AX
		Mov BX,DX
		Mov AX,z
		Cwd
		Add CX,AX
		Adc BX,DX
		Sub CX,400
		Sbb BX,0
		Mov AX,v
		Cwd
		Sub AX,CX
		Sbb DX,BX
		Idiv x
		Mov AH,4ch
		Int 21h
Code ends
	End start