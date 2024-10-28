#!/bin/bash

# Asignar el primer argumento del script a la variable 'directorio'
directorio=$1

# Comprobar si el parámetro es un directorio válido
if [ ! -d "$directorio" ]; then
    echo "El directorio no existe."
    exit 1
fi

# Obtener la fecha actual en formato 'ddmmaaaa'
fecha=$(date +%d%m%Y)

# Definir el nombre del archivo tar de salida usando la fecha actual
archivo_tar="copia_scripts_${fecha}.tar"

# Buscar y agregar cada archivo con extensión '.sh' en el directorio al archivo tar
find "$directorio" -name "*.sh" -exec tar -rvf "$archivo_tar" {} +

# Mensaje de confirmación al finalizar el empaquetado
echo "Copia realizada en $archivo_tar"

