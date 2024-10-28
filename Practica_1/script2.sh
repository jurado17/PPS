#!/bin/bash
# Muestra el contenido de un archivo especificado como segundo parámetro y el exit code de la operación

# Revisa si el segundo parámetro fue proporcionado
if [ -z "$2" ]; then
    echo "No se ha proporcionado la ruta del archivo como segundo parámetro."
    exit 1
fi

# Muestra el contenido del archivo
cat "$2"
# Muestra el exit code de la operación anterior
echo "El exit code es: $?"

