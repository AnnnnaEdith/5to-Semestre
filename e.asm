.model small ; se asigna el tama?o de memoria
.stack ; modelo de pila
.data ; inicio de datos
mensaje db "Tecnologico de Estudios Superiores de Jilotepec",'$'
.code; inicio de codigo
main proc ;inicia el proceso principal
mov ax, SEG @data ; se asigna localizacion del segmento
mov ds,ax ; coloca los datos contenidos en ax en el segmento
mov ah,09; se imprime la cadena
lea dx, mensaje ;leer mensaje
int 21h; funcion de interrupcion que invoca al DOS
mov ax,4c00h ;salir del programa
int 21h
main endp; termina el procedimiento
end main