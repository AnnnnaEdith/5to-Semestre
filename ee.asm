.model small ;se asigna tama?o de memoria 
.stack ;modelo de pila 
.data ;inicio de datos
mensaje1 db "Tecnologico de Estudios Superiores de Jilotepec", "$" ; primer mensaje
saltoLinea db 0Dh, 0Ah, 0Dh, 0Ah, "$" ; dos saltos de l?nea (doble retorno de carro y nueva l?nea)
mensaje2 db "Ing. en Sistemas Computacionales", "$" ; segundo mensaje
.code ;inicio de c?digo
main proc ;inicia proceso principal 
    mov ax, SEG @data ;se asigna la localizacion del segmento 
    mov ds, ax ;coloca los datos contenidos en ax en el segmento 

    ; Imprimir primer mensaje
    mov ah, 09h ;funci?n de impresi?n de cadena
    lea dx, mensaje1 ;leer primer mensaje
    int 21h ;funci?n de interrupci?n que invoca al DOS

    ; Imprimir dos saltos de l?nea
    mov ah, 09h ;funci?n de impresi?n de cadena
    lea dx, saltoLinea ;leer el doble salto de l?nea
    int 21h ;funci?n de interrupci?n que invoca al DOS

    ; Imprimir segundo mensaje
    mov ah, 09h ;funci?n de impresi?n de cadena
    lea dx, mensaje2 ;leer segundo mensaje
    int 21h ;funci?n de interrupci?n que invoca al DOS

    ; Salir del programa
    mov ax, 4c00h ;salir del programa 
    int 21h
main endp ;termina procedimiento
end main