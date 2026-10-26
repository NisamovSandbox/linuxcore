# Herramienta `Sherlock` - Búsqueda de nombres de usuario en redes y servicios

Sherlock es una herramienta OSINT que comprueba si un nombre de usuario aparece en distintos sitios web, redes sociales y plataformas públicas. Automatiza la consulta de muchas páginas a partir de un alias y presenta las URL en las que parece existir un perfil. Está diseñada para la fase de reconocimiento: ayuda a localizar posibles cuentas, pero no demuestra por sí sola que esas cuentas pertenezcan a una misma persona.

## Arquitectura de búsqueda de perfiles

La unidad principal de entrada es el nombre de usuario. Sherlock consulta los sitios que tiene definidos en su base de datos y evalúa las respuestas de cada servicio mediante los criterios que la herramienta conoce para ese sitio. La respuesta puede basarse, por ejemplo, en un código HTTP, una redirección o el contenido devuelto por la página.

La lista de sitios y sus mecanismos de comprobación cambian con el tiempo. Una web puede modificar su diseño, bloquear solicitudes automatizadas o responder de forma distinta según la región o la sesión. Por ello, un resultado debe tratarse como una pista que se valida manualmente, no como una identificación concluyente.

## Capacidades principales

* **Búsqueda de alias:** comprobar un nombre de usuario en numerosos servicios desde una sola ejecución.
* **Búsquedas múltiples:** analizar varios nombres de usuario en el mismo proceso.
* **Selección de sitios:** limitar la consulta a uno o varios servicios concretos para reducir solicitudes y facilitar la revisión.
* **Exportación de resultados:** guardar la información obtenida en formatos como TXT, CSV, JSON o XLSX, según las opciones disponibles en la versión instalada.
* **Control de ejecución:** ajustar el tiempo de espera, mostrar solo las coincidencias encontradas y utilizar un proxy cuando exista una necesidad de red legítima y autorizada.

## Instalación y verificación

En sistemas donde esté disponible `pipx`, se recomienda instalar Sherlock en un entorno aislado para evitar conflictos con los paquetes de Python del sistema:

```bash
pipx install sherlock-project
sherlock --version
sherlock --help
```

Si `pipx` no está instalado, consulta el método correspondiente a tu distribución y las instrucciones oficiales antes de instalarlo. En Kali o Parrot también puede existir un paquete mantenido por la distribución; sus versiones pueden diferir de la versión publicada por el proyecto.

## Búsqueda de un nombre de usuario

Para realizar una búsqueda básica:

```bash
sherlock usuario_de_prueba
```

Para mostrar en el terminal las coincidencias encontradas:

```bash
sherlock usuario_de_prueba --print-found
```

Para guardar la salida en un archivo de texto:

```bash
sherlock usuario_de_prueba --output resultados.txt
```

Para exportar los resultados como CSV:

```bash
sherlock usuario_de_prueba --csv --output resultados.csv
```

Para consultar únicamente un sitio, repite la opción `--site` si quieres incluir varios:

```bash
sherlock usuario_de_prueba --site GitHub
```

Para consultar varios alias y separar los resultados por usuario:

```bash
mkdir -p resultados_sherlock
sherlock alias_prueba1 alias_prueba2 --folderoutput resultados_sherlock
```

Los nombres anteriores son valores de ejemplo. Comprueba las opciones disponibles en tu versión con `sherlock --help`, ya que los parámetros y la base de sitios pueden cambiar entre versiones.

## Interpretación y validación de resultados

Una coincidencia significa que Sherlock detectó una respuesta compatible con la existencia del perfil; no confirma que el perfil esté activo, que lo controle una persona concreta o que use el mismo alias en todos los servicios. Una ausencia de resultados tampoco prueba que no exista una cuenta: el sitio podría no estar cubierto, haber limitado las consultas o haber cambiado su respuesta.

Para validar una coincidencia:

* abre manualmente la URL y comprueba que el perfil realmente existe;
* compara datos públicos no sensibles y coherentes, sin basarte únicamente en el alias;
* registra la fecha de consulta y la fuente, porque los resultados pueden cambiar;
* distingue los hechos observados de las hipótesis sobre quién controla la cuenta.

## Aplicaciones en OSINT y seguridad

Sherlock puede utilizarse para auditar la exposición pública de tus propios alias, revisar nombres de usuario asociados a cuentas de una organización con permiso, apoyar investigaciones de fuentes abiertas y estudiar la reutilización de alias en ejercicios formativos. No debe utilizarse para acosar, doxxear, acceder a cuentas ni construir conclusiones personales sin corroboración.

## Solicitudes, privacidad y límites

Aunque se considera una herramienta OSINT, Sherlock puede realizar solicitudes web directas a los sitios consultados. Estas solicitudes pueden generar registros en los servicios de destino, activar límites de frecuencia o ser bloqueadas. Ejecutarlo a través de un proxy no garantiza anonimato. Limita las búsquedas al alcance autorizado y evita guardar o publicar datos personales que no sean necesarios.
