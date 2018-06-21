include Irvine16.inc

len = 15

.data
input BYTE len + 1 dup(0)
output byte len + 1 dup(0)

.code

main PROC
	mov ax, @data
	mov ds, ax
	
	mov ecx, len
	call rrn
	call Crlf


	mov cx, sizeof output
	mov dx, offset output
	call WriteString
	call Crlf

	exit
main ENDP

rrn proc
	mov esi, 0

	L1:
	mov ah, 7
	int 21h
	mov input[esi], al

	mov ah, 2
	mov dl, input[esi]
	int 21h

	inc esi
	loop L1

	mov output[0], '1'
	mov output[1], '9'
	mov al, input[0]
	mov output[2], al
	mov al, input[1]
	mov output[3], al
	mov output[4], '.'
	mov al, input[2]
	mov output[5], al
	mov al, input[3]
	mov output[6], al
	mov output[7], '.'
	mov al, input[4]
	mov output[8], al
	mov al, input[5]
	mov output[9], al

	ret
rrn endp

Crlf proc
	mov ah, 2
	mov dl, 0ah
	int 21h

	mov ah, 2
	mov dl, 0dh
	int 21h

	ret
Crlf endp

WriteString proc
	mov ah, 40h
	mov bx, 1
	int 21h
	ret
WriteString endp
end main