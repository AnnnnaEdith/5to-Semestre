CR EQU 13; Constante CR (Retorno de acarreo) en decimal
LF EQU 10 ; Constante LF (Salto de linea) en hex es igual
Datos Segment
    Mensaje db CR,LF,'Hola Mundo! (Con funcion o procedimiento)', CR, LF, '$'
Datos Ends
Pila Segment Stack
    db 64 DUP('PILA'); inicializacion de la pila
Pila Ends
Codigo Segment
    holam3 proc far
Assume CS:Codigo,DS:Datos,SS:Pila
mov ax,Datos ;ax direccion del segmento de datos
mov ds,ax ;ds=ax indicar el segemento de datos
lea dx,Mensaje ;ds:dx direccion del mensaje
call Escribe; llamar al procedimiento Escribe
mov ax,4c00h; funcion para terminar el programa
int 21h; y volver al DOS
holam3 endp
Escribe proc ; inicio del procedimiento Escribe
mov ah,9; funcion Dos para escribir texto en pantalla
int 21h; llamar la interrupcion del DOS
ret;volver a retornar
Escribe endp; fin del procedimiento Escribe
Codigo Ends
End holam3
