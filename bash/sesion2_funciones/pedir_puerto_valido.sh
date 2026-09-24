pedir_puerto_valido(){
    while true; do
    read -p "Escriba un puerto: " opcion
    if [[ (($opcion =~ ^[0-9]+$)) && (($opcion -ge 1 && puerto -le 65535)) ]];then
        echo "Puerto valido recibido: $opcion"
        exit
    else
        echo "Puerto recibido inválido"     
    fi
done
}

pedir_puerto_valido