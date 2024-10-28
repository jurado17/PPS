#!/bin/bash
# Verifica si se han pasado parámetros y retorna 1 si no hay parámetros y 0 si los muestra

if [ $# -eq 0 ]; then
    echo "No has introducido ningún parámetro."
    exit 1
else
    echo "Número de parámetros recibidos: $#"
    echo "Parámetros recibidos: $@"
    exit 0
fi

