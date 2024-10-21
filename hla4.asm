.model small       ; Define un modelo de memoria peque?o
.stack             ; Define una pila (stack) para el programa
.data              ; Secci?n de datos del programa
num1 db 0          ; Variable para almacenar el primer n?mero ingresado
num2 db 0          ; Variable para almacenar el segundo n?mero ingresado
num3 db 0          ; Variable para almacenar el resultado de la suma

mensaje db 10,13,7, "Primer numero ","$"      ; Mensaje para solicitar el primer n?mero
mensaje2 db 10,13,7, "Segundo numero ","$"    ; Mensaje para solicitar el segundo n?mero
mensaje3 db 10,13,7, "La suma es: ","$"       ; Mensaje para mostrar el resultado de la suma

.code              ; Secci?n de c?digo
main proc
    mov ax, SEG @data    ; Mueve el segmento de datos a AX
    mov ds, ax           ; Carga el segmento de datos en DS para acceder a las variables

    ; Solicitar primer n?mero
    mov ah, 09h          ; Funci?n 09h de la interrupci?n 21h: mostrar cadena de caracteres
    lea dx, mensaje      ; Carga la direcci?n del mensaje en DX
    int 21h              ; Llamada a la interrupci?n para mostrar el mensaje

    mov ah, 01h          ; Funci?n 01h de la interrupci?n 21h: leer un car?cter
    int 21h              ; Leer el car?cter ingresado por el usuario
    sub al, 30h          ; Convierte el valor ASCII a su valor num?rico restando 30h
    mov num1, al         ; Almacenar el primer n?mero en la variable 'num1'

    ; Solicitar segundo n?mero
    mov ah, 09h          ; Funci?n 09h para mostrar el segundo mensaje
    lea dx, mensaje2     ; Carga la direcci?n del segundo mensaje en DX
    int 21h              ; Llamada a la interrupci?n para mostrar el segundo mensaje

    mov ah, 01h          ; Funci?n 01h para leer el segundo car?cter ingresado
    int 21h              ; Leer el segundo car?cter ingresado por el usuario
    sub al, 30h          ; Convierte el valor ASCII a su valor num?rico
    mov num2, al         ; Almacenar el segundo n?mero en la variable 'num2'

    ; Sumar los dos n?meros
    mov al, num1         ; Carga el primer n?mero en AL
    add al, num2         ; Sumar el segundo n?mero al valor en AL
    add al, 30h          ; Convierte el resultado de nuevo a su valor ASCII
    mov num3, al         ; Almacena el resultado en la variable 'num3'

    ; Mostrar el mensaje de suma
    mov ah, 09h          ; Funci?n 09h para mostrar el mensaje de la suma
    lea dx, mensaje3     ; Cargar la direcci?n del mensaje en DX
    int 21h              ; Llamada a la interrupci?n para mostrar el mensaje
    ; Mostrar el resultado
    mov ah, 02h          ; Funci?n 02h para desplegar un car?cter en pantalla
    mov dl, num3         ; Cargar el resultado de la suma en DL
    int 21h              ; Llamada a la interrupci?n para mostrar el resultado

    ; Terminar el programa
    mov ax, 4c00h        ; Funci?n 4Ch de la interrupci?n 21h: terminar el programa
    int 21h              ; Llamada a la interrupci?n para terminar la ejecuci?n
main endp
end main
