#!/bin/bash

registrar() {
    local mensaje="$1"
    echo "$(date +%H:%M:%S) $mensaje"
    logger -t aso-backup "$mensaje"
}

DIR_DESTINO="${1:-/var/backups}"
MAX_COPIAS="${2:-7}"

if [ ! -d "$DIR_DESTINO" ]; then
    registrar "Error: el directorio de destino '$DIR_DESTINO' no existe"
    exit 1
fi

if [[ ! "$MAX_COPIAS" =~ ^[0-9]+$ ]]; then
    registrar "Error: $MAX_COPIAS no es un número"
    exit 1
fi

if [ "$MAX_COPIAS" -le 0 ]; then
    registrar "Error: el número máximo de copias debe ser mayor que 0"
    exit 1
fi

FECHA_HORA=$(date +%Y%m%d-%H%M%S)
NOMBRE_ARCHIVO="etc-${FECHA_HORA}.tar.gz"
RUTA_COMPLETA="${DIR_DESTINO}/${NOMBRE_ARCHIVO}"

if tar -czf "$RUTA_COMPLETA" /etc; then
    registrar "Copia creada: $RUTA_COMPLETA"
else
    registrar "Error: no se pudo crear la copia de seguridad"
    exit 1
fi

TOTAL_COPIAS=0
REGEXP_COPIA='^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$'

for archivo in "$DIR_DESTINO"/*; do
    if [ -f "$archivo" ]; then
        nombre_base=$(basename "$archivo")
        if [[ "$nombre_base" =~ $REGEXP_COPIA ]]; then
            ((TOTAL_COPIAS++))
        fi
    fi
done

if [ "$TOTAL_COPIAS" -gt "$MAX_COPIAS" ]; then
    registrar "Aviso: hay $TOTAL_COPIAS copias y el máximo recomendado es $MAX_COPIAS"
fi