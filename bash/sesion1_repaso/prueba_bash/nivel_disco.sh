porcentaje=$((($1 * 100) / $2))

if [[ $# -eq 2 ]] ; then
    if [[ $porcentaje -lt 70 ]];then
        echo "OK"
    elif [[ $porcentaje -lt 90 ]];then
        echo "AVISO"
    else    
        echo "CRÍTICO"
    fi
else
    echo "Debe poner los párametros"
fi
    