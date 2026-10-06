if [[ $# -eq 0 ]];then
    echo "Debe indicar un parámetro"
    exit
fi

re='[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
if [[ $1 =~ $re ]];then
    echo "$1 tiene un formato válido"
else
    echo "$1 no tiene un formato válido"
fi

# Responde que es un formato válido, porque el script solo comprueba
# que tenga al menos 1 dígito y máximo 3, no que le número esté entre
# el 0 y el 255