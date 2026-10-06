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
