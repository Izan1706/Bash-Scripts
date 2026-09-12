#!/bin/bash

# Iniciamos variables a 0
VALOR="0"
MEDIA="0"
SUM="0"
NUM="0"

#Obligamos a entrar al bucle
while true; do
    #Solicitamos al usuario sus notas, seguira pidiendo hasta que lo marque con 1
    echo -n "Escribe tus notas de 0 a 10, ('q' for quit): "; read VALOR;
    # Comprueba que son notas validas, que esten entre 0 y 10
    if (("$VALOR" < "0")) || (("$VALOR" > "10")); then
        echo "Nota no valida, deberias probar de nuevo: "
    elif [ "$VALOR" == "q" ]; then
        #Salida por pantalla de los resultados, tanto la media como el mensaje complementario
        echo "Tu media es de $MEDIA"
        if [ "$MEDIA" -gt 9 ]; then
            echo "Muy bien hecho"
            break
        elif [ "$MEDIA" -gt 7 ]; then
            echo "Muy bien, podemos hacerlo aún mejor??"
            break
        elif [ "$MEDIA" -gt 5 ]; then
            echo "Aprobado, pero mejora un poco mas"
            break
        else
            echo "Deberias mejorar esa nota"
            break
        fi
    else
        #Calculos
        SUM=$[$SUM + $VALOR]
        NUM=$[$NUM + 1]
        MEDIA=$[$SUM / $NUM]
    fi
done
echo "FIN"
