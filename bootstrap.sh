#!/bin/sh

#----intro message
echo ""
echo "-----------------------------------------------------------------------"
echo "¡Bienvenido! Configuremos tu Raspberry Pi con el software garrax-daemon"
echo "-----------------------------------------------------------------------"

#----confirm bootstrap
read -p "Quieres instaler garrax-daemon? [S/n] " choice </dev/tty
case "$choice" in
    "n" | "N")
        echo "OK, garrax-daemon será instalado"
        exit
        ;;
    *) ;;
esac

#----installing additional software packages
echo ""
echo "Instalación de paquetes de software adicionales (bluetooth, bluez, libbluetooth-dev, libudev-dev)."
echo "Ingrese su contraseña de root si se le solicita"
sudo apt-get install -y bluetooth bluez libbluetooth-dev libudev-dev

#----clone garrax
echo ""
echo "Estamos listos para clonar el proyecto garrax-daemon."
read -p "¿En donde dquieres clonarlo? (default: /home/pi/garrax-daemon): " DAEMON_DIR </dev/tty
if [ -z $DAEMON_DIR ]; then
    DAEMON_DIR='/home/pi/garrax-daemon'
fi

if [ ! -d $DAEMON_DIR ]; then
    echo "Clonando el proyecto garrax-daemon a $DAEMON_DIR"
    git clone https://github.com/garrapato/garrax-daemon.git $DAEMON_DIR
else
    echo "El proyecto garax-daemon ya existe en $DAEMON_DIR "
fi

#----copy config.js
echo ""
echo "Generando la configuración para garrax-daemon"
if [ ! -f $DAEMON_DIR/config.js ]; then
    echo "el archivo config.js no existe en $DAEMON_DIR, creándolo desde config.default.js"
    cp $DAEMON_DIR/config.default.js $DAEMON_DIR/config.js

    echo ""
    read -p "¿Tu TJBot tiene una cámara instalada? (s/N): " speaker </dev/tty
    read -p "¿Tu TJBot tiene u LED instalado? (s/N): " led </dev/tty
    read -p "¿Tu TJBot tiene u micrófono instalado ?s/N): " mic </dev/tty
    read -p "¿Tu TJBot tiene u servo instalada? (s/N): " servo </dev/tty
    read -p "¿Tu TJBot tiene unabocina instalada? (s/N): " speaker </dev/tty
    prefix=''
    hardware=''
    case "$camera" in
        "s" | "S")
            hardware="$hardware$prefix'camera'"
            prefix=', '
            ;;
        *) ;;
    esac
    case "$led" in
        "s" | "S")
            hardware="$hardware$prefix'led'"
            prefix=', '
            ;;
        *) ;;
    esac
    case "$mic" in
        "s" | "S")
            hardware="$hardware$prefix'microphone'"
            prefix=', '
            ;;
        *) ;;
    esac
    case "$servo" in
        "s" | "S")
            hardware="$hardware$prefix'servo'"
            prefix=', '
            ;;
        *) ;;
    esac
    case "$speaker" in
        "s" | "S")
            hardware="$hardware$prefix'speaker'"
            prefix=', '
            ;;
        *) ;;
    esac

    sed -i "s/exports.hardware = \[\];/exports.hardware = \[$hardware\];/" $DAEMON_DIR/config.js
else
    echo "El archivo config.js ya existe en $DAEMON_DIR"
fi

#----npm install
echo ""
echo "Instalando módulos Node para garrax-daemon"
npm install --prefix $DAEMON_DIR

#----instructions for watson credentials
echo ""
echo "Aviso sobre los servicios de Watson: para utilizar garrax-daemon, si aún no lo ha hecho,"
echo "necesita obtener credenciales para los servicios de Watson que necesite"
echo "Puede obtener estas credenciales de la siguiente manera:"
echo ""
echo "1. Regístrate para obtener una cuenta gratuita de IBM Bluemix en https://bluemix.net sies que no tienes una."
echo ""
echo "2. Inicia sesión en Bluemix y crea una instancia de los servicios de Watson que planeas usar. Los servicio"
echo "de Watson se enumeran en el panel de Bluemix, en Catálogo. La lista completa de los servicios de Watson utilizados por garrax-daemon son:"
echo "Asistente, Traductor de idiomas, Voz a texto, Texto a voz, Analizador de emociones y Reconocimiento visual"
echo ""
echo "3. Para cada servicio de Watson, haz clic en el botón Crear en la parte inferior derecha de la pÃ¡gina para crear una instancia del servicio."
echo ""
echo "4. Haz clic en Credenciales de servicio en la barra lateral izquierda. A continuación, haz clic en Ver credenciales en el menú Acciones."
echo ""
echo "5. Tome nota de las credenciales para cada servicio de Watson. Deberás guardar estos en $DAEMON_DIR/config.js."

#----run the daemon
echo ""
echo "Tu TJBot se ha configurado con garrax-daemon. Edita el archivo config.js"
echo "para agregar las credenciales de Watson. Puedes iniciar el daemon manualmente ejecutando"
echo "el siguiente comando:"
echo ""
echo "sudo node $DAEMON_DIR/garrax-daemon.js"
echo ""
echo "¡Listo!"
