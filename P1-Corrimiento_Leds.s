;--------------------------------
    ;@brief   P1-Corrimiento_Leds
    ;@date    14/01/2023
    ;@author  Rodrigo Andre Meza Sanchez
    ;Este proyecto tendra en cuenta lo siguiente
    ;Frecuencia = 4MHz
    ;TCY = 1us
    ;----------------------------
    
PROCESSOR 18F57Q84
#include "config.inc" /config statements should precede project file includes./
#include <xc.inc>
#include "Retardos.inc"

    
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
 
Main:
    CALL Config_OSC,1 
    CALL Boton
    CALL Desplazamiento
    CALL Bucle
    NOP
Bucle:
    BTFSS PORTA,3,1  
    goto Par_Impar
    Off:
    BCF TRISE,1,0
    BCF LATE,1,0
    BCF TRISE,1,0
    BCF LATE,1,0
    BCF TRISC,0,0
    BCF LATC,0,0
    BCF TRISC,1,0
    BCF LATC,1,0
    BCF TRISC,2,0
    BCF LATC,2,0
    BCF TRISC,3,0
    BCF LATC,3,0
    BCF TRISC,4,0
    BCF LATC,4,0
    BCF TRISC,5,0
    BCF LATC,5,0
    BCF TRISC,6,0
    BCF LATC,6,0
    BCF TRISC,7,0
    BCF LATC,7,0
    GOTO Bucle
   Par_Impar:
    BCF TRISE,1,0 ;puerto como entrada(por acces)
    BSF LATE,1,0
    BCF TRISE,1,0
    BCF LATE,0,0
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    BCF TRISC,1,0
    BSF LATC,1,0
    
    BCF TRISC,2,0
    BCF LATC,2,0
    
    BCF TRISC,3,0
    BCF LATC,3,0
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    BCF TRISC,6,0
    BCF LATC,6,0
    
    
    BCF TRISC,7,0
    BCF LATC,7,0
    
    
    BTFSS PORTA,3,1  ;si decteta 1 salta a call
    GOTO Bucle
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    BCF TRISC,2,0
    BCF LATC,2,0
    
    BCF TRISC,3,0
    BSF LATC,3,0
    
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    
    BCF TRISC,6,0
    BCF LATC,6,0
    
    
    BCF TRISC,7,0
    BCF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    
    BCF TRISC,2,0
    BCF LATC,2,0
    
    BCF TRISC,3,0
    BSF LATC,3,0
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    BCF TRISC,6,0
    BCF LATC,6,0
    
   
    BCF TRISC,7,0
    BCF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    BCF TRISC,2,0
    BCF LATC,2,0
    
 
    BCF TRISC,3,0
    BCF LATC,3,0
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    BCF TRISC,5,0
    BSF LATC,5,0
    
    BCF TRISC,6,0
    BCF LATC,6,0
    
    BCF TRISC,7,0
    BCF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    BCF TRISC,2,0
    BCF LATC,2,0
   
    BCF TRISC,3,0
    BCF LATC,3,0
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    BCF TRISC,6,0
    BCF LATC,6,0
    
    
    BCF TRISC,7,0
    BSF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    
    
    BCF TRISE,0,0
    BSF LATE,0,0
    BCF TRISE,1,0
    BCF LATE,1,0
  ;para el primer led  
    BCF TRISC,0,0
    BSF LATC,0,0
  ;para el 2 do led  
    BCF TRISC,1,0
    BCF LATC,1,0
  ;para el 3 er led  
    BCF TRISC,2,0
    BCF LATC,2,0
  ;para el 4to led  
    BCF TRISC,3,0
    BCF LATC,3,0
 ;para el 5 to led   
    BCF TRISC,4,0
    BCF LATC,4,0
 ;para el 6 to led  
    BCF TRISC,5,0
    BCF LATC,5,0
    
 ;para el 7 led
    BCF TRISC,6,0
    BCF LATC,6,0
    
    ;para el 8tavo led
    BCF TRISC,7,0
    BCF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    BCF TRISC,2,0
    BSF LATC,2,0
    
    BCF TRISC,3,0
    BCF LATC,3,0
    
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    BCF TRISC,6,0
    BCF LATC,6,0
    
    BCF TRISC,7,0
    BCF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    
    BCF TRISC,0,0
    BCF LATC,0,0
    
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    BCF TRISC,2,0
    BCF LATC,2,0
    
    BCF TRISC,3,0
    BCF LATC,3,0
    
    
    BCF TRISC,4,0
    BSF LATC,4,0
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    BCF TRISC,6,0
    BCF LATC,6,0
    
    BCF TRISC,7,0
    BCF LATC,7,0
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    
   BCF TRISC,0,0
    BCF LATC,0,0
    
    BCF TRISC,1,0
    BCF LATC,1,0
    
    BCF TRISC,2,0
    BCF LATC,2,0
    
    BCF TRISC,3,0
    BCF LATC,3,0
    
    BCF TRISC,4,0
    BCF LATC,4,0
    
    BCF TRISC,5,0
    BCF LATC,5,0
    
    BCF TRISC,6,0
    BSF LATC,6,0
 
    BCF TRISC,7,0
    BCF LATC,7,0  
    
    BTFSS PORTA,3,1
    GOTO Bucle
    CALL Delay_250ms,1
    GOTO Par_Impar  
 Boton:
    BANKSEL PORTA
    CLRF PORTA,1
    CLRF ANSELA,1 ; se usa como entrada digitsl
    BSF TRISA,3,1  ;para configurar como entrada
    BSF LATA,3,1   ;para darle valor del pulsador 
    BSF WPUA,3,1   ;activar la resistencia internta
    RETURN   
Config_OSC:      
    BANKSEL OSCCON1
    MOVLW 0x60            
    MOVWF OSCCON1,1
    MOVLW 0x02    ; para que corra a 4mhz
    MOVWF OSCFRQ,1
    RETURN    
 Desplazamiento:
    BANKSEL PORTC  ;seleccionamos el puerto C
    CLRF PORTC,0   ;Lo limpiamos 
    CLRF ANSELC,0
    RETURN
    

     
    



 
END resetVect