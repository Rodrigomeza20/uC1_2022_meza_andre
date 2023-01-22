
; @file    parcial1_mezasanchez_rodrigoandre.s
; @brief   (DESARROLLO DE EXAMEN PARCIAL DE MICROCONTROLADORES )
; @date 20/11/2022
; @author Rodrigo Andre Meza Sanchez

PROCESSOR 18F57Q84

#include <xc.inc>

PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
 Main:
    MOVLW 2  ; Le damos un  valor a x para comparar con w,y ver si cumplen la condicion
    MOVWF 0x500,a  ; Movemos el valor asignado al registro f, en este caso banco 5, ubicacion 00
    MOVLW 4  ; Le damos un  valor a y para comparar con x 
    CPFSGT 0x500,a  ; Realizamos la comparación
    GOTO Falso  ;si no se cumple la condicion, va directo a falso     
  
 Verdadero:     ;si cumple la condicion,realizara la operacion de 5x+3y
    MOVLW 2    ;se le asigna a x el valor de 2,en w para poder realizar 5x 
    MOVWF 0x500,a   ;trasladamos el 2 que asignamos en la ubicacion anterior a 0x500
    MOVLW 5       ;le asignamos 5 al acumulador,para despues multiplicarlo
    MULWF 0x500,a  ;realizamos la multiplicacion y el resultado por defecto ira a 0x4F3
    MOVF 0x4F3,w,a  ;trasladamos el resultado al acumulador
    MOVWF 0x502,a  ;trasladamos  el contenido del acumulador a 0x502
    MOVLW 4    ;le asignamos el valor de 4 al w,para luego pasarlo al y
    MOVWF 0x501,a  ;trasladamos lo que contiene el acumulador a otro banco que represente a y
    MOVLW 3      ;le asignamos al acumulador el valor de 3 ,para poder multiplicarlo con y
    MULWF 0x501,a  ;se hace la multiplicacion y este resultado se ira a 0x4F3
    MOVF 0x4F3,w,a   ;trasladamos el resultado a al acumulador
    ADDWF 0x502,f,a  ;sumamos las multiplicaciones y nos dara la respuesta
    GOTO Salir   ;finaliza el programa
 
 Falso:    ;si no se cumple la condicion,se opera el 7x-9y
    CLRF 0x500,a  ;se limpia el registro
    MOVLW 2      ;le asigno el 2 al w,que es el valor de x
    MOVWF 0x500,a   ;trasladamos el w a 0x500 (x=2)
    MOVLW 7         ;le asignamos 7 al acumuladoe para multiplicarlo y tener el 7 por x
    MULWF 0x500,a   ;se realiza la multiplicacion y por defecto se va a 0x4F3
    MOVF 0x4F3,w,a  ;trasladamos el contenido de la multiplicacion al acumulador
    MOVWF 0x502,a   ;el contenido del acumulador,lo trasladamos a 0x502
    MOVLW 4         ;le asigno 4 al acumulador,este valor representa el valor de y (y=4)
    MOVWF 0x501,a   ;trasladamos el contenido de w al banco que representa a y
    MOVLW 9         ;le asigno 9 al acumulador,para multiplicarlo
    MULWF 0x501,a   ;se realiza la multiplicacion y este resultado por defecto va a 0X4F3
    MOVF 0x4F3,w,a  ;se traslada el contenido de la multiplicacion a w
    SUBWF 0x502,f,a  ;se resta las multiplicaciones y el resultado estara en 0x502
    GOTO Salir   ;finaliza el programa
 Salir:
    NOP
    
END resetVect


