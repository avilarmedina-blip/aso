if [[ -z $1 ]]; then
    fichero="/etc/login.def"
else
    fichero="$1"
fi

if [[ ! -f $fichero ]];then
    echo "El fichero no existe"
    break
fi
grep -v -e ^# -e "^$" $fichero

total=$(wc -l < "$fichero")
utiles=$(grep -Ec '^[[:space:]]*[^#[:space:]]' "$fichero")
echo "Total de líneas: $total"
echo "Líneas útiles: $utiles"