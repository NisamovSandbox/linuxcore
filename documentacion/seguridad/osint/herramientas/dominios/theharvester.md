# Herramienta `theHarvester` - Reconocimiento OSINT de dominios y organizaciones

theHarvester es una herramienta de reconocimiento que recopila información pública relacionada con un dominio u organización a partir de fuentes configuradas. Según las fuentes seleccionadas y las capacidades de la versión, puede encontrar nombres de subdominio, direcciones de correo, URL, direcciones IP, sistemas autónomos y otros datos relacionados con la huella pública de una organización.

Es especialmente útil al inicio de una auditoría de superficie de ataque autorizada: permite reunir pistas procedentes de distintas fuentes y preparar una lista de activos que después debe validarse.

## Arquitectura de fuentes de información

El objetivo se especifica mediante el dominio, mientras que el parámetro de fuentes determina qué servicios se consultarán. Algunas fuentes son pasivas desde el punto de vista del objetivo porque consultan catálogos externos, buscadores o bases de datos; aun así, esas fuentes externas reciben la consulta y pueden registrar el dominio investigado.

La herramienta consolida los datos obtenidos, pero no todas las fuentes proporcionan los mismos tipos de resultado ni tienen la misma disponibilidad. Las credenciales API son opcionales para algunas fuentes y necesarias para otras. Una fuente sin credenciales puede omitirse o devolver un resultado limitado.

## Capacidades principales

* **Reconocimiento de dominios:** recopilar nombres de host y subdominios publicados en las fuentes seleccionadas.
* **Descubrimiento de correos:** identificar direcciones de correo que las fuentes relacionen públicamente con el dominio.
* **Agregación de fuentes:** comparar resultados procedentes de varios proveedores en una ejecución.
* **Resolución DNS opcional:** intentar resolver nombres descubiertos; esta fase genera consultas DNS adicionales.
* **Exportación:** guardar resultados en formatos estructurados, incluido JSONL para automatización y trazabilidad, además de formatos de compatibilidad según versión.
* **Automatización:** integrarse en procedimientos de reconocimiento, revisiones periódicas y herramientas de análisis propias.

## Instalación y verificación

En Kali Linux, el paquete de la distribución puede instalarse mediante APT:

```bash
sudo apt update
sudo apt install theharvester
theHarvester -h
```

Para instalar la versión actual desde el repositorio oficial, la documentación utiliza `uv` para preparar el entorno y las dependencias. Sigue la versión de Python indicada por el archivo `.python-version` del repositorio:

```bash
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
uv sync
uv run theHarvester -h
```

No mezcles métodos de instalación en el mismo entorno sin comprobar cuál ejecutable se está utilizando. Los paquetes de Kali pueden ir por detrás de la versión del repositorio principal.

## Reconocimiento pasivo básico

Para mostrar la sintaxis con la instalación desde código fuente:

```bash
uv run theHarvester -h
```

Ejemplo de consulta usando dos fuentes públicas de certificados para el dominio reservado `example.com`:

```bash
uv run theHarvester -d example.com -b crtsh,certspotter
```

Si se utiliza el paquete de Kali, se omite `uv run`:

```bash
theHarvester -d example.com -b crtsh,certspotter
```

Para guardar los resultados en un informe llamado `informe`:

```bash
uv run theHarvester -d example.com -b crtsh,certspotter -f informe
```

En las versiones actuales documentadas por el proyecto, esto genera un informe JSONL y archivos JSON/XML de compatibilidad. Comprueba la documentación de la versión instalada, ya que los formatos y parámetros pueden cambiar.

## Resolución de nombres descubiertos

La resolución DNS genera tráfico hacia los resolvers y puede revelar los nombres consultados. Úsala solo cuando forme parte del alcance autorizado. Define explícitamente un dominio que controles o para el que tengas permiso:

```bash
DOMINIO_AUTORIZADO='dominio-que-controlas.example'
uv run theHarvester -d "$DOMINIO_AUTORIZADO" -b crtsh,certspotter -r
```

El nombre de dominio del ejemplo debe sustituirse por un dominio real autorizado antes de ejecutar el comando. Revisa `theHarvester -h` para confirmar cómo pasar resolvers personalizados y qué fuentes están disponibles en tu instalación.

## Selección de fuentes y lectura de resultados

Conviene empezar con unas pocas fuentes y ampliar la consulta solo si es necesario. La opción de seleccionar todas las fuentes puede consumir cuotas, generar más solicitudes a proveedores y dificultar la interpretación de errores.

Al revisar la salida:

* distingue los datos encontrados de los estados de ejecución de cada fuente;
* anota qué proveedor obtuvo cada evidencia cuando el formato lo permita;
* valida los subdominios mediante una comprobación separada y autorizada antes de considerarlos activos;
* no interpretes una respuesta vacía como prueba de que un dominio no tiene activos públicos;
* registra la fecha, las fuentes seleccionadas y los errores para poder repetir la investigación.

## Aplicaciones en seguridad y OSINT

Puede utilizarse para elaborar inventarios iniciales de exposición pública, revisar qué direcciones de correo o subdominios aparecen en fuentes externas, ayudar a una auditoría autorizada de DNS y preparar tareas posteriores de validación. El resultado es una lista de indicios, no una certificación de que cada activo siga activo o pertenezca al objetivo.

## Límites de uso y privacidad

Una búsqueda que se describe como pasiva puede seguir enviando información a los proveedores consultados; además, las opciones de resolución DNS producen tráfico adicional. La herramienta no concede permiso para examinar una organización. Define el alcance por adelantado, evita acciones activas fuera de autorización y protege los informes, que pueden incluir direcciones de correo y otros datos delicados.
