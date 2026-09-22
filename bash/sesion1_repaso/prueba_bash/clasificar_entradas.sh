for entrada in ~/aso/bash/sesion1_repaso/prueba_bash/*; do
    nombre=$(basename "$entrada")
    if [[ -d $entrada ]]; then
        echo "$nombre: directorio"
    elif [[ -f $entrada ]]; then
        echo "$nombre: fichero"
    fi
done