#!/bin/bash

#INtroducimos un número por teclado y comprobamos que sea múltipl de 10

echo "Introduce un número" 
read numero

if(( numero % 10 == 0)); then
	echo "$numero es múltiplo de 10"
else
	echo "$numero no es múltiplo de 10"
fi
