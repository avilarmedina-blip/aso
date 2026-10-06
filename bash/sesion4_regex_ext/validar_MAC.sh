if [[ $# -eq 0 ]];then
    echo "Debe indicar un parámetro"
    exit
fi

re='[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}'
if [[ $1 =~ $re ]];then
    echo "$1 tiene un formato válido"
else
    echo "$1 no tiene un formato válido"
fi