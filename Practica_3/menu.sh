#!/bin/bash

#Funcion para mostrar el menu

function menu(){
	echo "1.- EJECUTAR COPIA DE SEGURIDAD"
	echo "2.- DAR DE ALTA AL USUARIO"
	echo "3.- DAR DE BAJA AL USUSARIO"
	echo "4.- MOSTRAR USUARIOS"
	echo "5.- MOSTRAR LOGS DEL SISTEMA"
	echo "6.- SALIR"
}

#llamada a la funcion  del menu
menu

#Este codigo verifica la existencia del archivo.csv. Si no existe lo crea
if [ ! -f usuarios.csv ]; then
	touch usuarios.csv
fi


#Funcion para realizar una copia de seguridad del archivo usuarios.csv

function copia() {
	fecha=$(date +"%d%m%Y_%H-%M-%S")
	zip "copia_usuarios_$fecha.zip" usuarios.csv

	#Mantener solo las copias mas recientes
	total_copias=$(ls copia_usuarios_*.zip | wc -l)
	if [ "$total_copias" -gt 2 ]; then
		ls -t coipia_usuarios_*.zip | tail -n +3 | xargs rm -- #Borra la coipa mas antigua
	fi
}


#Funcion para generar automaticamente el nombre del usuario
#Este usara la primera letra del nombre, 3 del primer apellido, 3 del segundo apellido y 3 ultimos digitos del dni
function generaruser() {
	local nombre=$1
	local apellido1=$2
	local apellido2=$3
	local dni=$4

	echo "${nombre:0:1}${apellido1:0:3}${apellido2:0:3}${dni: -3}" | tr '[:upper:]' '[:lower:]'
}

#Funcion para comprobar que el usuario no existe
#Verifica que el usuario no existe en usuarios.csv
function existe() {
	grep -q ":$1$" usuarios.csv
	return $? 
}

#Funcion para dar de alta al usuario
function alta() {
	read -p "Nombre " nombre
	read -p "Apellido 1 " apellido1
	read -p "Apellido 2 " apellido2
	read -p "DNI " dni

	usuario=$(generaruser "$nombre" "$apellido1" "$apellido2" "$dni")

	if existe "$usuario"; then
		echo "El usuario ya existe"
	else
		echo "$nombre:$apellido1:$apellido2:$dni:$usuario" >> usuarios.csv
	        echo "INSERTADO $nombre:$apellido1:$apellido2:$dni:$usuario el $(date +"%d/%m/%Y a las %H:%M")" >> log.log
	fi
}


#Funcion para dar de baja a un usuario
#Busca al usuario por su nombre de usuario. Si existe lo da de baja
function baja() {
	read -p  "Nombre del usuario: " usuario
	if existe "$usuario"; then
		grep -v "$usuario$" usuarios.csv > temp.csv $$ mv temp.csv usuarios.csv
		echo "BORRADO $usuario el $(date +"%d/%m/%Y a las %H:%M")" >> log.log
	else
		echo "El usuario no existe"
	fi

}


#Hace un listado de los usuarios dados de alta
function mostrar_usuarios() {
	echo "Lista de Usuarios"
	sort -t: -k5 usuarios.csv | awk -F: '{print $5, " ", $1, $2, $3}'
}

#Muestra el log
function log() {
	if [ -f log.log ]; then
		cat log.log
	else
		echo "No hay log del sistema"
	fi
}

function login() {
	for((i=0; i<3; i++)); do
		read -sp "Usuario " usuario
		echo ""
		if [[ "$usuario" == "admin" ]]; then
			return 0
		elif existe $usuario; then
			return 0
		else
			echo "Error"
		fi
	done
	echo "Acceso denegado"
	exit 1
}

#llamada a la funcion 
login


while true; do
	menu
	read -p "Selecciona una opcion: " opcion
	case $opcion in
		1) copia ;;
		2) alta ;;
		3) baja ;;
		4) mostrar_usuarios ;;
		5) log ;;
		6) exit 0 ;;
		*) echo "Opcion no valida" ;;
	esac
done
