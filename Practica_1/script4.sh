#!/bin/bash
# Verifica si se han pasado parámetros, muestra la cantidad y los parámetros mismos.

if [ $# -eq 0 ]; then
    echo "No has introducido ningún parámetro."
else
    echo "Número de parámetros recibidos: $#"
    echo "Parámetros recibidos: $@"
fi

