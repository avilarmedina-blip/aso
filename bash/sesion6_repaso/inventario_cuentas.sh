#!/bin/bash

SHELL_BUSCADA="${1:-/bin/bash}"
REGEX='^/([a-z]+/)*[a-z]+$'

if [[ ! "$SHELL_BUSCADA" =~ $REGEX ]]; then
    echo "Error: La shell '$SHELL_BUSCADA' no es una ruta absoluta válida (debe empezar por / y contener solo minúsculas)." >&2
    exit 1
fi

if [[ ! -f /etc/passwd ]]; then
    echo "Error: El fichero /etc/passwd no existe." >&2
    exit 1
fi

total_cuentas=0
uid_ge_1000=0

while IFS=':' read -r usuario pass uid gid gechos home shell; do
    if [[ "$shell" == "$SHELL_BUSCADA" ]]; then
        echo "${usuario}:${uid}:${home}:${shell}"
        
        ((total_cuentas++))
        if (( uid >= 1000 )); then
            ((uid_ge_1000++))
        fi
    fi
done < /etc/passwd

echo "Total de cuentas listadas: $total_cuentas"
echo "Cuentas con UID >= 1000: $uid_ge_1000"