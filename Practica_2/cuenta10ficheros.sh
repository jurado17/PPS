#!/bin/bash

directorio=$1

if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi

contador=$(find "$directorio" -maxdepth 1 -type f | wc -l)

if (( contador > 10 )); then
    echo "El directorio $directorio contiene más de 10 ficheros."
else
    echo "El directorio $directorio no contiene más de 10 ficheros."
fi

