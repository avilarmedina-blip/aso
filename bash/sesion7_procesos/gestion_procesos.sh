#!/bin/bash

listar_usuario(){
    if id "$1" >/dev/null; then
        ps -u "$1"
    else
        echo "El usuario no existe"
    fi
}

buscar_proceso(){
    #comando=$(ps -C $1)
    if ps -C $1 -o pid,user,%cpu,cmd  >/dev/null;then
        ps -C $1 -o pid,user,%cpu,cmd
    else
        echo "No existe el proceso"
    fi
}

#top_cpu(){}


#cambiar_prioridad(){}

#finalizar_proceso(){}



while ! [[ $opcion == 6 ]]; do
    echo "===== GESTIÓN DE PROCESOS ====="
    echo "1) Listar los procesos de un usuario"
    echo "2) Buscar un proceso por nombre"
    echo "3) Mostrar los N procesos que más CPU consumen"
    echo "4) Cambiar la prioridad de un proceso"
    echo "5) Finalizar un proceso"
    echo "6) Salir"
    echo "Opción:"

    read -p "Elige una opción: " opcion

    case $opcion in 
        1)
        read -p "Indica un nombre de usuario: " usuario   
        (listar_usuario $usuario);;
        2)
        read -p "Indica el nombre del proceso: " proceso
        (buscar_proceso $proceso);;
        3)(top_cpu);;
        4)(cambiar_prioridad);;
        5)(finalizar_proceso);;
        6)exit 0
    esac




done