#!/bin/bash

mostrar_error() {
    echo "Error: $1"
    echo "Uso: $0 alta | baja identificador"
    exit 1
}

generar_id() {
    local nombre="$1"
    local ap1="$2"
    local ap2="$3"

    local p_nom=$(echo "$nombre" | cut -c1-2)
    local p_ap1=$(echo "$ap1" | cut -c1-2)
    local p_ap2=$(echo "$ap2" | cut -c1)

    echo "alu${p_nom}${p_ap1}${p_ap2}" | tr 'A-Z' 'a-z'
}

if [ $# -lt 1 ]; then
    mostrar_error "falta la acción"
fi

ACCION="$1"

if [ "$ACCION" = "alta" ]; then
    read -p "Nombre: " NOMBRE
    read -p "Apellidos: " APELLIDOS

    if [[ ! "$NOMBRE" =~ ^[a-zA-Z]+$ ]]; then
        mostrar_error "el nombre debe ser una sola palabra formada por letras"
    fi

    if [[ ! "$APELLIDOS" =~ ^[a-zA-Z]+\ [a-zA-Z]+$ ]]; then
        mostrar_error "escribe los dos apellidos separados por un espacio"
    fi

    APELLIDO1=$(echo "$APELLIDOS" | cut -d' ' -f1)
    APELLIDO2=$(echo "$APELLIDOS" | cut -d' ' -f2)

    ID=$(generar_id "$NOMBRE" "$APELLIDO1" "$APELLIDO2")
    echo "Identificador generado: $ID"

    if grep -q "^${ID}:" /etc/passwd; then
        mostrar_error "el usuario $ID ya existe en el sistema"
    fi

    echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$NOMBRE $APELLIDOS\" $ID"

elif [ "$ACCION" = "baja" ]; then
    if [ $# -lt 2 ]; then
        mostrar_error "falta el identificador"
    fi

    ID="$2"

    if [[ ! "$ID" =~ ^alu[a-z]{5}$ ]]; then
        mostrar_error "$ID no tiene el formato aluXXYYZ"
    fi

    if ! id "$ID" &>/dev/null; then
        mostrar_error "el usuario $ID no existe"
    fi

    echo "Para eliminarlo: sudo userdel -r $ID"

else
    mostrar_error "la acción $ACCION no es válida"
fi