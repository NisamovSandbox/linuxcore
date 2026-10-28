#!/bin/bash

# Un comentario se inicia con el símbolo # y se extiende hasta el final de la línea.
# Se pueden poner tantos '#' como uno desee (ej. ##, ###) para estructurar secciones o dar prioridad visual.
## Este formato permite identificar fácilmente secciones de código con mayor relevancia, de la siguiente forma:

if [[ $1 -gt 10 ]]; then
    echo "El número es mayor que 10."
elif [[ $1 -eq 10 ]]; then
    echo "El número es igual a 10."
##  echo "¡Exactamente 10!" -> De esta forma se resalta con mayor facilidad sectores de código importantes o en revisión.
#   echo "¡Increíble!" -> Comentario común para desactivar código temporalmente.
else
    echo "El número es menor a 10."
fi

# El Shebang (#!/bin/bash) en la primera línea es un caso especial: indica al sistema qué intérprete usar.
# Los comentarios pueden ir al inicio de la línea o al final de una instrucción (comentarios inline):
echo "Hola mundo" # Esto es un comentario inline (a la derecha de la instrucción)

# Usos principales de los comentarios:
#   Documentar la lógica y propósito del código para futuras referencias.
#   Desactivar fragmentos de código en pruebas/depuración sin borrarlos.

# Limitaciones de los comentarios en Bash:
# No es posible anidar comentarios (comentarios dentro de otros comentarios).
# No se pueden comentar múltiples líneas con un solo símbolo #, cada línea debe iniciarse con '#'.
# Bash no tiene un operador nativo de bloque de comentarios (como /* */ en C o Java).

# Truco habitual para comentar bloques de múltiples líneas (Here-Document nulo):
: << 'MI_COMENTARIO'
Todo este texto no se ejecutará.
Sirve para escribir bloques extensos de documentación
o anular temporalmente grandes bloques de código.
MI_COMENTARIO

# Casos donde el símbolo '#' NO actúa como comentario:
#   Dentro de cadenas entrecomilladas: echo "Esto # no es un comentario"
#   En expansión de parámetros/variables: ${#VARIABLE} (devuelve la longitud del string)
#   Si está escapado con barra invertida: echo Esto\ \#\ no\ es\ comentario

# Cuidado con la barra invertida '\' al final de un comentario:
# Si un comentario termina con '\', el compilador continuará el comentario en la siguiente línea.
# # Comentario que continúa \
echo "Esta línea NO se ejecutaría si el comentario anterior termina en '\"