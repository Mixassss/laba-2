;sumpro6.asm
.model small
.stack 100h

.data
    buffer      db 250,0,254 dup(?)     ; ����� ��� ����� ������ ������ ����� = �-�� ����� �������
    sum         dw 0              ; ����� ���� �����
    product     dw 0              ; ������������ ���� �����
    num_count   dw 0              ; ������� �����
cnt2 dw 0
kol dw 0
    num_list    dw 100 dup(?)     ; ������ ��� �������� ������� ����� � ����������� ��������
    prompt      db 'Vvedite stroky chisel (razdelennix probelami): ',13,10,'$'
    result_header db 13,10, "Nomera Chisel y kotorix summa men`she proizvedenia: $"
    
.code
start:
    mov ax, @data
    mov ds, ax
    
    ; ������� ����������� �� ���� ������
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; ��������� ������
    mov ah, 0Ah
    lea dx, buffer
    int 21h
; ����� ������ ����� = ���������� ����� � ������� (=kol) 
    mov si, offset buffer+2   ; ��������� �� ������ ��������� ������
xor ax,ax
xor cx,cx
go1:
mov al,[si]		; ����� ������ �� �������
sub al,30h		; ������� � ���������� ���
add cx,ax		; � �� ����� ���� �����
cmp byte ptr[si+1],20h    ; ���� ����� �����������, 
je go2		; �� ����� ��� � kol
mov bx,10		; ���� ����� ����-�������
mul bl		; �������� ������ �� 10
mov cx,ax		; � ��������� � �� ������������
inc si		; ����� ������ �����
jmp go1
go2: 
mov kol,cx	; kol =  ���������� ����� � �������
inc si

    ; ������� ����� ������������� � 0
    mov num_count, 0

check_numbers:
; =========== ���� =========
check_next_number:
    mov bx,cnt2
    cmp bx,kol
    jbe go5
    jmp print_numbers   ; ���� ��������. ��� ����� ���������
go5:
    mov al, [si]            ; ����� ������ �����
    cmp al,13	; ����� ������?
    jne go9
    jmp print_numbers   ; ����� ������
go9:    cmp al, 20h             ; ���� ��� ������, ������ ����� �����������
    je next_number          ; ��������� � ���������� �����
   push si                 ; ��������� ������� �������� SI � �����
    mov ah, 0               ; ���������� ������� ah ����� �������������� ������� ��� �����������
    sub al, '0'             ; ������������ ������ � �����
    mov bl, al              ; ��������� ����� � bl ��� ���������� ����������
    mov sum, 0              ; �������� ����� ���� �����

calc_sum:
	xor bh,bh
    add sum, bx             ; ��������� ������� ����� � �����
    inc si                  ; ��������� � ��������� �����
    mov al, [si]            ; ����� ��������� ������
    cmp al, 20h             ; ���� ��� ������, ������ ����� �����������
    je calc_product         ; ���� ����� �����, ��������� � ���������� ������������
    sub al, '0'             ; ������������ ������ � �����
    mov bl, al              ; ��������� ����� � bl
    jmp calc_sum            ; ���������� ����������

calc_product:
pop si
mov bh,0
mov bl,[si]
sub bl,30h
    mov product, 1          ; ������������� ������������ � 1 ����� �����������
calc_product_loop:
    mov ax,product
    mul bl                  ; �������� ������� ����� �� ������������
    mov product,ax
    inc si                  ; ��������� � ��������� �����
    mov bl, [si]            ; ����� ��������� ������
    cmp bl, 13             ; ���� ��� ����� ������, ������ ����� �����������
    je compare              ; ���� ����� �����, ��������� � ���������
    cmp bl,20h
    je compare
    sub bl, '0'             ; ������������ ������ � �����
    jmp calc_product_loop   ; ���������� ����������

compare:
    inc cnt2		; ��������� ���������� ������������ �����
    cmp sum,  ax   ;   bx product         ���������� ����� � ������������
    jge next_number         ; ���� ����� �� ������ ������������, ��������� � ���������� �����

    ; ���� ����� ������ ������������, ��������� ����� ����� � ������
    mov di, num_count
    shl di,1
    mov bx,cnt2
    mov num_list[di],bx
    inc num_count

next_number:
    inc si                  ; ��������� � ���������� �����
    jmp check_next_number   ; ��������� ��������� �����

print_numbers:
lea dx,result_header
mov ah,9
int 21h
    ; ������� ������ ����� � ����������� ��������
    mov cx,  num_count
    cmp cx,0
    je exi
    mov si, offset num_list

print_loop:
    mov ax, [si]
aam     
add ax, 3030h   
mov bx, ax      
mov ah, 02       
mov dl, bh       
int 21h          
mov dl, bl       
int 21h
mov dl,20h
mov ah,2
int 21h
add si,2
    loop print_loop
exi:
end_program:
    mov ax, 4C00h           ; ��������� ���������
    int 21h

end start
