#!/bin/bash

echo "Introduce la altura en cm de la primera persona:"
read altura1

echo "Introduce la altura en cm de la segunda persona:"
read altura2

echo "Introduce la altura en cm de la tercera persona:"
read altura3

mayor=$altura1
if (( altura2 > mayor )); then
    mayor=$altura2
fi
if (( altura3 > mayor )); then
    mayor=$altura3
fi

altura_metros=$(echo "scale=2; $mayor / 100" | bc)
echo "La persona más alta mide $altura_metros metros."

