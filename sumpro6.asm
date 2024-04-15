;sumpro6.asm
.model small
.stack 100h

.data
    buffer      db 250,0,254 dup(?)     ; буфер для ввода строки Первое число = к-во чисел массива
    sum         dw 0              ; сумма цифр числа
    product     dw 0              ; произведение цифр числа
    num_count   dw 0              ; счетчик чисел
cnt2 dw 0
kol dw 0
    num_list    dw 100 dup(?)     ; массив для хранения номеров чисел с необходимым условием
    prompt      db 'Vvedite stroky chisel (razdelennix probelami): ',13,10,'$'
    result_header db 13,10, "Nomera Chisel y kotorix summa men`she proizvedenia: $"
    
.code
start:
    mov ax, @data
    mov ds, ax
    
    ; выводим приглашение на ввод строки
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; считываем строку
    mov ah, 0Ah
    lea dx, buffer
    int 21h
; берем первое число = количество чисел в массиве (=kol) 
    mov si, offset buffer+2   ; указатель на начало введенной строки
xor ax,ax
xor cx,cx
go1:
mov al,[si]		; берем символ из массива
sub al,30h		; перевод в символьный вид
add cx,ax		; в сх будет само число
cmp byte ptr[si+1],20h    ; если число однозначное, 
je go2		; то берем его в kol
mov bx,10		; если число двух-значное
mul bl		; умножаем дестки на 10
mov cx,ax		; и сохраняем в сх произведение
inc si		; берем вторую цифру
jmp go1
go2: 
mov kol,cx	; kol =  количество чисел в массиве
inc si

    ; счетчик чисел устанавливаем в 0
    mov num_count, 0

check_numbers:
; =========== ЦИКЛ =========
check_next_number:
    mov bx,cnt2
    cmp bx,kol
    jbe go5
    jmp print_numbers   ; цикл закончен. все числа проверены
go5:
    mov al, [si]            ; берем символ числа
    cmp al,13	; конец строки?
    jne go9
    jmp print_numbers   ; конец строки
go9:    cmp al, 20h             ; если это пробел, значит число закончилось
    je next_number          ; переходим к следующему числу
   push si                 ; сохраняем текущее значение SI в стеке
    mov ah, 0               ; сбрасываем регистр ah перед использованием функции для конвертации
    sub al, '0'             ; конвертируем символ в число
    mov bl, al              ; сохраняем число в bl для дальнейших вычислений
    mov sum, 0              ; обнуляем сумму цифр числа

calc_sum:
	xor bh,bh
    add sum, bx             ; добавляем текущую цифру к сумме
    inc si                  ; переходим к следующей цифре
    mov al, [si]            ; берем следующий символ
    cmp al, 20h             ; если это пробел, значит число закончилось
    je calc_product         ; если конец числа, переходим к вычислению произведения
    sub al, '0'             ; конвертируем символ в число
    mov bl, al              ; сохраняем число в bl
    jmp calc_sum            ; продолжаем вычисления

calc_product:
pop si
mov bh,0
mov bl,[si]
sub bl,30h
    mov product, 1          ; устанавливаем произведение в 1 перед вычислением
calc_product_loop:
    mov ax,product
    mul bl                  ; умножаем текущую цифру на произведение
    mov product,ax
    inc si                  ; переходим к следующей цифре
    mov bl, [si]            ; берем следующий символ
    cmp bl, 13             ; если это конец строки, значит число закончилось
    je compare              ; если конец числа, переходим к сравнению
    cmp bl,20h
    je compare
    sub bl, '0'             ; конвертируем символ в число
    jmp calc_product_loop   ; продолжаем вычисления

compare:
    inc cnt2		; инкремент количества обработанных чисел
    cmp sum,  ax   ;   bx product         сравниваем сумму и произведение
    jge next_number         ; если сумма не меньше произведения, переходим к следующему числу

    ; если сумма меньше произведения, добавляем номер числа в массив
    mov di, num_count
    shl di,1
    mov bx,cnt2
    mov num_list[di],bx
    inc num_count

next_number:
    inc si                  ; переходим к следующему числу
    jmp check_next_number   ; проверяем следующее число

print_numbers:
lea dx,result_header
mov ah,9
int 21h
    ; выводим номера чисел с необходимым условием
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
    mov ax, 4C00h           ; завершаем программу
    int 21h

end start
