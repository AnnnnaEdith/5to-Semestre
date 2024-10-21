CR EQU 13              ; Definici?n de CR (Carriage Return) como 13
LF EQU 10              ; Definici?n de LF (Line Feed) como 10

Datos SEGMENT
    ; Definici?n de las cadenas a imprimir con CR y LF para formato
    LINEA1 DB CR, LF, 'Jesus Navarrete Martinez', CR, LF, '$'
    LINEA2 DB 'Tecnologico de Estudios Superiores de Jilotepec', CR, LF, '$'
    LINEA3 DB 'ING EN SISTEMAS COMPUTACIONALES', CR, LF, '$'
    LINEA4 DB 'Jesus ;-;', CR, LF, '$'
Datos ENDS

PILA SEGMENT STACK
    DB 64 DUP('?')  ; Reserva de 64 bytes para la pila
PILA ENDS

CODIGO SEGMENT
    ASSUME CS:CODIGO, DS:Datos, SS:PILA  ; Asume los segmentos correspondientes
    
    ; Procedimiento principal
    INICIO:
        MOV AX, Datos        ; Carga la direcci?n de segmento de Datos en AX
        MOV DS, AX           ; Mueve el valor de AX a DS para trabajar con el segmento de datos

        ; Escribe la primera l?nea
        LEA DX, LINEA1       ; Carga la direcci?n de LINEA1 en DX
        CALL ESCRIBE         ; Llama al procedimiento ESCRIBE para mostrar la l?nea

        ; Escribe la segunda l?nea
        LEA DX, LINEA2       ; Carga la direcci?n de LINEA2 en DX
        CALL ESCRIBE         ; Llama al procedimiento ESCRIBE para mostrar la l?nea

        ; Escribe la tercera l?nea
        LEA DX, LINEA3       ; Carga la direcci?n de LINEA3 en DX
        CALL ESCRIBE         ; Llama al procedimiento ESCRIBE para mostrar la l?nea

        ; Escribe la cuarta l?nea
        LEA DX, LINEA4       ; Carga la direcci?n de LINEA4 en DX
        CALL ESCRIBE         ; Llama al procedimiento ESCRIBE para mostrar la l?nea

        ; Termina el programa
        MOV AX, 4C00H        ; Carga la funci?n de terminaci?n de programa en AX
        INT 21H              ; Interrupci?n para terminar el programa

    ; Procedimiento para escribir cadenas
    ESCRIBE PROC
        MOV AH, 9            ; Funci?n 9 de la interrupci?n 21H: Mostrar cadena de caracteres
        INT 21H              ; Interrupci?n 21H para mostrar en pantalla
        RET                  ; Retorna al procedimiento llamante
    ESCRIBE ENDP             ; Fin del procedimiento ESCRIBE

CODIGO ENDS
END INICIO                   ; Marca el final del programa y establece el punto de inicio
