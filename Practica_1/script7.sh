#!/bin/bash
# Verifica si una ruta dada corresponde a un archivo o un directorio

# Verifica si el parámetro fue pasado
if [ -z "$1" ]; then
    echo "Debe proporcionar una ruta como parámetro."
    exit 1
fi

if [ -d "$1" ]; then
    echo "La ruta $1 es un directorio."
elif [ -f "$1" ]; then
    echo "La ruta $1 es un archivo."
else
    echo "La ruta $1 no existe."
fi

