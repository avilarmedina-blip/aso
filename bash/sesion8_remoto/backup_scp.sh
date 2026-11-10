#!/bin/bash


if [ $# -eq 0 ]; then
    echo "Uso: debe poner un parámetro"
    exit 1
fi

carpeta="$1"
destino_base="$HOME/backups"
fecha=$(date +%F_%H-%M)
destino_final="${destino_base}/datos_${fecha}"
log="${destino_base}/backup.log"


comprobar_servidor() {
    ssh -o BatchMode=yes servidor true 2>/dev/null
    return 0
}


mkdir -p "$destino_base"


if comprobar_servidor; then
    scp -r "servidor:${carpeta}" "$destino_final"
    if [ $? -eq 0 ]; then
        echo "${fecha} - Backup OK: ${carpeta}" >> "$log"
        echo "Copia completada con éxito en $destino_final"
    else
        echo "${fecha} - Backup ERROR: ${carpeta} (Fallo al copiar)" >> "$log"
        echo "Error al realizar la copia de seguridad con scp"
        exit 1
    fi
else
    echo "${fecha} - Backup ERROR: ${carpeta} (Servidor no disponible)" >> "$log"
    echo "Error: No se puede conectar con el servidor"
    exit 1
fi