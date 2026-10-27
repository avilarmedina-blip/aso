#!/bin/bash

if [ $# -gt 1 ]; then
    echo "Error: demasiados parámetros"
    echo "Uso: $0 [N]"
    exit 1
fi

n="$1"

if [ -n "$n" ]; then
    if [[ ! $n =~ ^[0-9]+$ ]]; then
        echo "Error: $n no es un número válido"
        exit 1
    fi
    if [ "$n" -le 0 ]; then
        echo "Error: el número debe ser mayor que 0"
        exit 1
    fi
fi

ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt

if [ -n "$n" ]; then
    head -n $((n + 1)) procesos.txt
else
    cat procesos.txt
fi

lineas=$(wc -l < procesos.txt)
total=$((lineas - 1))

echo "----"
echo "Procesos de $USER: $total"