#!/bin/bash

#Introducimos 2 numeros para establecer un rango

echo "Introduce el primer número:"
read num1
echo "Introduce el segundo número:"
read num2

#Intercambiamos los valorres de los numeros para que el primero simepre sea menos que el segundo
if (( num1 > num2 )); then
    temp=$num1
    num1=$num2
    num2=$temp
fi

#Sumamos todos los numeros entre el primero y el segundo introducidos

suma=0
for (( i=num1; i<=num2; i++ )); do
    suma=$((suma + i))
done

echo "La suma del rango es: $suma"

