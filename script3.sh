#!/bin/bash
# Crea un directorio y copia un archivo en él

# Revisa si se pasaron los dos parámetros
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Uso: $0 <ruta_del_directorio> <ruta_del_archivo>"
    exit 1
fi

# Crea el directorio si no existe
mkdir -p "$1"

# Copia el archivo al directorio
cp "$2" "$1"

# Verifica si el archivo se copió exitosamente
if [ $? -eq 0 ]; then
    echo "El archivo se ha copiado exitosamente en $1"
else
    echo "No se pudo copiar el archivo."
fi

