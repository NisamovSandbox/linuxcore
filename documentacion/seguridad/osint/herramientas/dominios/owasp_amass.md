# Herramienta `OWASP Amass` - Descubrimiento de activos y mapeo de superficie de ataque

OWASP Amass es una herramienta de reconocimiento y mapeo de activos que ayuda a identificar la infraestructura de internet relacionada con una organización. Combina información de fuentes abiertas y técnicas de reconocimiento para descubrir nombres de dominio, subdominios y relaciones entre activos. Sus capacidades concretas dependen de la versión, las fuentes configuradas y el modo de ejecución.

Amass es útil para auditorías autorizadas de superficie de ataque porque puede ayudar a crear un inventario más completo que una consulta manual aislada. Los descubrimientos deben validarse y asociarse al alcance correcto antes de iniciar cualquier prueba posterior.

## Arquitectura de descubrimiento

Amass utiliza fuentes de datos y técnicas de reconocimiento para recopilar entidades y relaciones que pueden almacenarse en una base de datos de activos. La versión actual del proyecto utiliza una arquitectura centrada en Asset Database y el Open Asset Model. El comando `enum` es una de las interfaces principales para la enumeración, aunque los detalles de instalación y configuración han evolucionado entre versiones principales.

Es importante diferenciar los modos pasivos de los activos. Un modo pasivo se basa en fuentes externas y evita, en lo posible, validar directamente cada candidato; un modo activo puede realizar consultas DNS u otras interacciones directas que generan tráfico hacia la infraestructura. Comprueba siempre el alcance antes de activar opciones de reconocimiento.

## Capacidades principales

* **Descubrimiento de subdominios:** identificar nombres relacionados con un dominio raíz a partir de fuentes configuradas.
* **Mapeo de infraestructura:** relacionar nombres, direcciones IP y otras entidades cuando las fuentes proporcionan esos datos.
* **Reconocimiento pasivo y activo:** escoger un enfoque adecuado al alcance de la investigación y a la autorización disponible.
* **Persistencia de resultados:** almacenar descubrimientos para consultar y comparar el inventario con el tiempo, según la configuración.
* **Fuentes configurables:** habilitar las fuentes compatibles y las credenciales que correspondan, cuando sean necesarias.
* **Integración con procesos de seguridad:** utilizar los resultados para mantenimiento del inventario, auditoría de DNS y gestión de exposición externa.

## Instalación y verificación

Amass dispone de varias opciones de instalación. La documentación oficial actual contempla instalación con Go y ejecución mediante la imagen Docker del proyecto. Para instalar desde el código con Go:

```bash
CGO_ENABLED=0 go install -v github.com/owasp-amass/amass/v5/cmd/amass@main
```

El ejecutable se instala en el directorio `bin` de Go, que puede ser `$GOPATH/bin` o, con la configuración habitual, `~/go/bin`. Si no se encuentra el comando, comprueba que esa ubicación esté incluida en la variable `PATH`.

Verifica la instalación y consulta las opciones de la versión instalada:

```bash
amass -h
amass enum -h
```

También se puede utilizar la imagen oficial de Docker. Consulta el repositorio y la documentación para seleccionar una versión etiquetada y persistir correctamente el directorio de configuración y los datos; no dependas de una etiqueta mutable sin controlar las actualizaciones.

## Enumeración inicial

El siguiente ejemplo utiliza el dominio reservado `example.com` para mostrar la sintaxis. La ejecución consulta las fuentes que la configuración y versión tengan habilitadas:

```bash
amass enum -d example.com
```

Para probar el modo pasivo, si está disponible en la versión instalada:

```bash
amass enum -passive -d example.com
```

Para guardar la salida de una enumeración en un archivo de texto, comprueba primero que la opción `-o` está disponible en tu versión:

```bash
amass enum -d example.com -o resultados.txt
```

Las opciones pueden cambiar entre versiones principales. La referencia definitiva para la instalación local es `amass enum -h`; no asumas que un tutorial de Amass 3 o 4 describe exactamente el comportamiento de Amass 5.

## De resultados candidatos a inventario validado

Una enumeración puede incluir nombres encontrados en fuentes externas, candidatos que ya no resuelven, registros antiguos o activos que pertenecen a un tercero o a un proveedor compartido. Por ello, la herramienta no confirma automáticamente que cada host esté activo ni que todo el resultado pertenezca al dominio bajo evaluación.

Al preparar un inventario:

* registra el dominio raíz y el alcance autorizado;
* conserva la fecha, las fuentes y la configuración utilizada;
* separa los activos confirmados de los candidatos pendientes de validar;
* realiza comprobaciones DNS o HTTP adicionales únicamente cuando estén autorizadas;
* compara ejecuciones sucesivas para detectar cambios, sin asumir que un nuevo hallazgo constituye por sí solo una vulnerabilidad.

## Aplicaciones en seguridad y OSINT

Amass puede emplearse para mantener inventarios de activos externos, apoyar una auditoría de DNS y subdominios, comprobar cambios en la superficie pública de una organización y preparar una fase posterior de evaluación de seguridad. Los resultados ayudan a orientar el trabajo, pero no sustituyen la verificación de propiedad ni las pruebas autorizadas.

## Reconocimiento responsable y límites

El modo activo puede generar tráfico DNS y otras conexiones contra sistemas relacionados con el objetivo. La enumeración agresiva, el uso de listas de nombres o la selección de técnicas adicionales puede incrementar la carga y producir alertas. Define el alcance antes de empezar, utiliza primero el modo menos intrusivo que sirva al objetivo y no escales la actividad fuera del permiso concedido.

Protege la base de datos y los informes: el inventario de activos externos puede revelar infraestructura que no se desea difundir públicamente. Mantén las credenciales de proveedores fuera del repositorio y consulta la documentación oficial para configurar claves y fuentes de datos de forma segura.
