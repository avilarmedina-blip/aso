log=$1

clasificar_http() {

    if [[ $log -ge 200 && $log -le 599 ]]; then
        if [[ $log -ge 200 && $log -le 299 ]] ; then
            echo "Éxito"
        elif [[ $log -ge 300 && $log -le 399 ]];then
            echo "Redirección"
        elif [[ $log -ge 400 && $log -le 499 ]];then
            echo "Error del cliente"
        else
            echo "Error del servidor"  
        fi
    else
        echo "IMPOSIBLE"
    fi
}

clasificar_http