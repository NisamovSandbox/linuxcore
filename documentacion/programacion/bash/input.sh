#!/bin/bash

# La entrada de parámetros es una parte fundamental de cualquier programa, ya que permite al usuario interactuar con el programa y proporcionar información necesaria para su ejecución. En Bash, existen varias formas de manejar la entrada de parámetros, como el uso de variables, argumentos posicionales y opciones.
# De esta forma pueden asignarse parámetros tanto de forma manual como mediante scripts.
# Los parámetros sirven para proporcionar información al programa, como por ejemplo, el nombre de un archivo, una dirección de correo electrónico o una fecha. Además, los parámetros también pueden ser utilizados para controlar el comportamiento del programa, como por ejemplo, activar o desactivar ciertas funciones o establecer valores predeterminados.

# En Bash los parámetros posicionales estándar van desde $1 hasta $9.
# Para acceder a parámetros de dos o más dígitos (10 en adelante), es OBLIGATORIO usar llaves: ${10}, ${11}, etc.
# De esta forma, podremos implementar scripts que usen el input como argumentos posicionales.

# Nota de corrección: En [ ] el operador mayor o igual es '-ge' ( Greater or Equal ). 
# El uso de '>=' genera error dentro de [ ]; solo se puede usar dentro de (( )).
if [ "$1" -ge 10 ]; then
    echo "El número es mayor o igual a 10"
else
    echo "El número es menor a 10"
fi

# Haciendo esto, indicamos que el primer valor al llamar al script sea comparado con el dígito indicado.
# Para pasar parámetros de forma manual, se realiza de la siguiente forma:
# ./input.sh 15
# En este caso, el número 15 se asignará a $1, y el programa evaluará si es mayor o igual a 10, imprimiendo el resultado correspondiente.

# De la misma manera, se pueden pasar múltiples parámetros, por ejemplo:
# ./input.sh 15 20
# En este caso, $1 sería 15 y $2 sería 20, y el programa podría ser modificado para evaluar ambos parámetros según sea necesario.

# Variables especiales de parámetros posicionales e información del script:
# $0      Nombre del script o ejecutable
# $1..$N  Parámetros posicionales recibidos
# ${10}   Parámetro en posición 10 o superior (requiere llaves)
# $#      Número total de parámetros pasados al script
# $@      Todos los argumentos como una lista de palabras separadas ("$1" "$2" "$3")
# $*      Todos los argumentos concatenados en un solo string ("$1 $2 $3")
# $?      Código de salida del último comando ejecutado (0 = éxito, !=0 = error)
# $$      PID (Process ID) del proceso del script en ejecución
# $!      PID del último proceso ejecutado en segundo plano (&)

# Comprobación típica del número de parámetros recibidos antes de ejecutar código:
if [ $# -lt 1 ]; then
    echo "Error: Se requiere al menos 1 parámetro."
    echo "Uso: $0 <numero>"
    exit 1
fi

# Asignación de valores predeterminados (expansión de parámetros):
# Si $1 no se proporciona o está vacío, toma el valor '10' por defecto:
VALOR=${1:-10}

# Uso del comando 'shift' para desplazar parámetros:
# 'shift' elimina $1 y mueve $2 a $1, $3 a $2, etc. Es útil para iterar argumentos posicionales:
while [ $# -gt 0 ]; do
    echo "Procesando parámetro actual ($1)"
    shift # Avanza al siguiente parámetro
done

# Lectura interactiva de entrada de usuario con 'read':
# Cuando no se pasan como argumentos al llamar al script, sino durante la ejecución:
# read -p "Introduce un valor: " variable_entrada

# Procesamiento de opciones y flags con el comando 'getopts':
# Permite capturar opciones estructuradas como ./script.sh -f archivo.txt -v
# while getopts "f:v" opt; do
#     case $opt in
#         f) archivo="$OPTARG" ;; # El símbolo ':' indica que la opción requiere un valor ($OPTARG)
#         v) verbose=1 ;;
#         \?) echo "Opción no válida" ;;
#     esac
# done