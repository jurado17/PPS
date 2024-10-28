#!/bin/bash
# Verifica si se han pasado al menos dos parámetros antes de crear un directorio y copiar un archivo

if [ $# -lt 2 ]; then
    echo "Se requieren 2 parámetros: <ruta_del_directorio> <ruta_del_archivo>"
    exit 1
fi

# Crea el directorio y copia el archivo
mkdir -p "$1"
cp "$2" "$1"

# Verifica si el archivo fue copiado
if [ $? -eq 0 ]; then
    echo "Archivo copiado a $1 exitosamente."
else
    echo "No se pudo copiar el archivo."
fi

