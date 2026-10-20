#!/bin/bash


if [ $# -eq 0 ]; then
    echo "Introduce un archivo de configuración"
    exit 1
fi

if [ -f $1 ]; then
    sed -i '/^#/d; /^$/d' $1
    cat $1
else
    echo "Introduce un archivo de configuración válido"
    exit 1
fi