if [[ $# -eq 0 ]];then
    echo "Debe indicar un parámetro"
    exit
fi

re='[a-z0-9.-_]+@(alu\.edu\.gva\.es)|(edu\.gva\.es)'
if [[ $1 =~ $re ]]; then
    if [[ $1 =~ ·*alu.*$ ]]; then
        echo "El correo $1 es un correo de estudiante"
    else
        echo "El correo $1 es de profesor"
    fi
else
    echo "No ha introducido un correo válido"
fi