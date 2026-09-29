 
 puerto=$1
    

    if [[ $puerto =~ ^[0-9]+$ ]];then
        if [[ $puerto -ge 1 && $puerto -le 65535 ]];then
            echo "$puerto es un puerto válido"
        else
            echo "$puesto está fuera de rango"
        fi
    else
        echo "$puerto no es un número"
    fi