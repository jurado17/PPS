#!/bin/bash

#Introducimos nuestro año de nacimiento
echo "Introduce tu año de nacimiento:"
read anio

#Dividimos el año introducido entre 12 y según el resto que obtenemos averiguamos el animal
animal=$(( anio % 12 ))

case $animal in
    0) echo "Tu signo es la Rata" ;;
    1) echo "Tu signo es el Buey" ;;
    2) echo "Tu signo es el Tigre" ;;
    3) echo "Tu signo es el Conejo" ;;
    4) echo "Tu signo es el Dragón" ;;
    5) echo "Tu signo es la Serpiente" ;;
    6) echo "Tu signo es el Caballo" ;;
    7) echo "Tu signo es la Cabra" ;;
    8) echo "Tu signo es el Mono" ;;
    9) echo "Tu signo es el Gallo" ;;
    10) echo "Tu signo es el Perro" ;;
    11) echo "Tu signo es el Cerdo" ;;
esac

