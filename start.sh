#!/bin/bash

# Verificar si jq está instalado
if ! command -v jq &> /dev/null; then
    echo "Error: jq no está instalado. Instálalo con 'sudo apt install jq' o el equivalente en tu sistema."
    exit 1
fi

# Verificar si el archivo JSON existe
if [ ! -f server-info.json ]; then
    echo "Error: El archivo server-info.json no existe."
    exit 1
fi

# Leer valores desde server-info.json
SERVER_NAME=$(jq -r '.server_name' server-info.json)
JAR_NAME=$(jq -r '.jar_name' server-info.json)
MIN_RAM=$(jq -r '.minimum_ram' server-info.json)
MAX_RAM=$(jq -r '.maximum_ram' server-info.json)

# Validar que las variables no estén vacías
if [[ -z "$SERVER_NAME" || -z "$JAR_NAME" || -z "$MIN_RAM" || -z "$MAX_RAM" ]]; then
    echo "Error: Faltan valores en server-info.json."
    exit 1
fi

# Verificar si el archivo JAR existe
if [ ! -f "$JAR_NAME" ]; then
    echo "Error: No se encontró el archivo $JAR_NAME."
    exit 1
fi

# Mensaje de inicio
echo -e "\n\nIniciando servidor:\n$SERVER_NAME\n\n"

# Ejecutar el servidor
java -Xmx"$MAX_RAM" -Xms"$MIN_RAM" -jar "$JAR_NAME" nogui
