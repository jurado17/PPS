#!/bin/bash

# Bucle infinito para permitir la consulta de múltiples usuarios
while true; do
    # Solicita al usuario que ingrese el nombre de un usuario del sistema
    echo "Introduce el nombre de usuario:"
    read usuario

    # Verifica si el usuario existe en el sistema utilizando el comando 'id'
    if id "$usuario" &>/dev/null; then
        # Si el usuario existe, muestra su información relevante
        echo "Nombre de usuario: $usuario"
        echo "UID: $(id -u $usuario)"            # Muestra el UID del usuario
        echo "GID: $(id -g $usuario)"            # Muestra el GID del usuario
        echo "Directorio de trabajo: $(eval echo ~$usuario)"  # Muestra el directorio de trabajo
    else
        # Si el usuario no existe, muestra un mensaje de error
        echo "El usuario $usuario no existe."
    fi

    # Pregunta al usuario si desea consultar otro usuario o salir
    echo "¿Quieres introducir otro usuario? (s/n)"
    read respuesta

    # Si la respuesta es distinta de 's', el programa termina
    if [[ $respuesta != "s" ]]; then
        break
    fi
done

