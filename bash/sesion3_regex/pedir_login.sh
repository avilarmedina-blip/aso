while true; do
    read -p "Escriba el usuario: " usuario
    if [[ $usuario =~ (^[a-z][a-z0-9]*$) ]]; then
        echo "Login válido"
        if grep -q "^$usuario:" /etc/passwd; then
            echo "El usuario $usuario ya existe"
            
        else
            echo "Para crearlo: sudo useradd -m -s /bin/bash $usuario"
            
        fi
        break
    else
        echo "No es un nombre válido"
    fi
done