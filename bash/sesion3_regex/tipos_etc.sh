re1='\.conf$'
re2='\.bak$'
re3='~$'
conf=0
copias=0

for fichero in /etc/*; do
    if [[ $fichero =~ $re1 ]];then
        echo "$fichero"
        conf=$((conf + 1))
    elif [[ $fichero =~ $re2 ]];then
        echo "$fichero"
        copias=$((copias + 1))
    fi
done

    echo "Configuracion: $conf"
    echo "Seguridad: $copias"