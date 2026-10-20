#!/bin/bash

$1

if [[ $# -eq 0 ]]; then
    echo "Introduce un archivo de configuración"
    exit 1
fi

if [ -f $1 ]; then
    sed -i 's/gmail.com/alu.edu.gva.es/g; s/hotmail.com/alu.edu.gva.es/g' $1
    cat $1
else
    echo "Introduce un archivo de configuración válido"
    exit 1
fi
