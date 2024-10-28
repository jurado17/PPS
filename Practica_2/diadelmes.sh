#!/bin/bash

#Obtemos el mes actual
mes=$(date +%B)

#CAlculamos cuantos dias tiene el mes
dias=$(date +%d -d "$(date +%Y-%m-01) +1 month -1 day")

echo "Estamos en $mes, un mes con $dias días."

