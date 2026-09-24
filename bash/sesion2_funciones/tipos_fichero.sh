ext=$2
carpeta=$1

contar_por_extension() {
    for contar in $carpeta; do
    if [[ -d $carpeta ]];then
        find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l
    fi
done
}

contar_por_extension