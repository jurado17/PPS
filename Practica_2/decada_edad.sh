#!/bin/bash
echo "Introduce tu edad:"
read edad

# Verificamos que la edad esté entre 15 y 60 años
if (( edad < 15 || edad > 60 )); then
    echo "La edad debe estar entre 15 y 60 años."
    exit 1
fi

# Obtenemos el año actual
anio_actual=$(date +%Y)

# Calculamos el año de nacimiento y la década
anio_nacimiento=$(( anio_actual - edad ))
decada=$(( anio_nacimiento / 10 * 10 ))

echo "Si naciste en $anio_nacimiento, naciste en la década de $decada."

