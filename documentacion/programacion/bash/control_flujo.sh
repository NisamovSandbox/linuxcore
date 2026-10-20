#!/bin/bash

# El bloque if ejecuta las declaraciones indicadas si la condición especificada es evaluada como verdadera
# if [[ condicion ]]; then
#   sentencias
# fi
#
# if [[ condicion ]]; then
#   sentencias
# else
#   sentencias
# fi

# Iniciar una condicional en bash es muy sencillo, se puede usar la palabra reservada 'if' seguida de una condición entre corchetes, y luego el bloque de código a ejecutar si la condición se cumple. Por ejemplo:
if [ "$1" -gt 10 ]; then
    echo "El número es mayor que 10"
# Luego, se puede usar la palabra reservada 'elif' para agregar una condición adicional, y 'else' para manejar el caso en que ninguna de las condiciones anteriores se cumpla. Por ejemplo:
elif [ "$1" -eq 10 ]; then
    echo "El número es igual a 10"
else
    echo "El número es menor que 10"
# Finalmente, se debe cerrar el bloque de código con la palabra reservada 'fi' para indicar el fin de la condicional.
fi

# También se pueden usar los caracteres '[' o '[[' y cierta sintaxis para optimizar el código, por ejemplo:
[[ $1 -gt 10 ]] && echo "El número es mayor que 10" || echo "El número es menor o igual a 10"
# De esta forma, podemos omitir código y hacerlo de una forma más compacta y eficiente

# Para realizar comparaciones más extensas, podemos optimizar el código lineal de la siguiente forma:
[[ $1 -gt 10 && $1 -lt 20 ]] && echo ">10 y <20" || [[ $1 -eq 10 ]] && echo "=10" || echo "<10 o >20"

# Se usan los operadores '&&' e '||' para encadenar las condiciones y los comandos a ejecutar, lo que permite escribir código más compacto y legible.
# El operador '&&' se utiliza para ejecutar el comando siguiente solo si la condición anterior se cumple, mientras que el operador '||' se utiliza para ejecutar el comando siguiente solo si la condición anterior no se cumple.
# Ojo: si el comando del '&&' falla, Bash intentará ejecutar el '||'. En estructuras complejas es más seguro usar if/else.

# El bucle while evalúa la condición antes de iterar a través del interior del bucle.
# Permanecerá en el interior mientras la condición de entrada sea positiva (código de retorno 0).
# 
# while [[ condición ]]; do
#   sentencias
# done
# 
# Break indica a Bash salir del bucle inmediatamente.
# Continue salta a la siguiente iteración sin ejecutar el resto del código del bloque.

contador=$1
while [[ $contador -gt 13 ]]; do
    echo "$contador es más grande que 13"
    ((contador--)) # Se decrementa para evitar un bucle infinito
done

# El bucle until funciona al revés que while: se ejecuta mientras la condición sea FALSA y termina cuando es verdadera.
i=1
until [[ $i -gt 5 ]]; do
    echo "Iteración $i"
    ((i++))
done

# El bucle for difiere de while en que se ejecuta en base a los elementos de una lista dada.
# Toma cada elemento de la lista, en orden, uno a uno, asignando que item es el valor de la variable iteradora, realiza los comandos implementados dentro de él, y repite la acción hasta que se termina la lista.

# La lista se define normalmente como una serie de strings separados por espacios.
# for var in <list>; do
#   sentencias
# done

# Ejemplos del uso del bucle for
days="Lunes Martes Miércoles" # Las asignaciones en bash no llevan '$' al inicio de la variable
for day in $days; do
    echo $day
done

# Iteración a lo largo de los elementos de un directorio
for item in /etc/*; do
    echo $item
done

# En una iteración o array, los índices empiezan en 0: ${mi_lista[0]}, ${mi_lista[1]}...
# Nota: Evitar ceros a la izquierda (ej. [01]) para que Bash no los interprete como números en base octal.
mi_lista=("primer_elemento" "segundo_elemento" "tercer_elemento")
echo "El primer elemento guardado es: ${mi_lista[0]}"

# Otro enfoque del bucle for (sin espacios en la asignación de variables)
end=5
for i in $(seq 1 $end); do
    echo $i
done

# Formato estilo C para el bucle for
for ((i=1; i<=end; i++)); do
    echo "Índice $i"
done

# La estructura case (en otros lenguajes de programación se llama switch) permite simplificar una serie de estancias de if y elif que son demasiado largas.
# Se usa para generar menús y comprobaciones de argumentos.
#
# case $v in
#     patron-1)
#         comandos
#         ;;
#     patron-2)
#         comandos
#         ;;
#     patron-n)
#         comandos
#         ;;
# esac

echo "¿Estás de acuerdo? S o N"
read -r inp
case "$inp" in
    [sS]|"SI"|"si")
        echo "SI"
        ;;
    [nN]|"NO"|"no")
        echo "NO"
        ;;
    *)
        echo "Ni si ni no"
        ;;
esac