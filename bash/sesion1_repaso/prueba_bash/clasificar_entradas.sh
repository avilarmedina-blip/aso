for entrada in ~/aso/bash/sesion1_repaso/prueba_bash/*; do
    if [[ -f $entrada ]]; then
        basename $entrada
        echo "archivo"
    else
        basename $entrada
        echo "directorio"
    fi
done