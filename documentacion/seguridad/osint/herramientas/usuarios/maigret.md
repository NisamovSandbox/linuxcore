# Herramienta `Maigret` - Investigación OSINT de nombres de usuario

Maigret es una herramienta OSINT orientada a buscar perfiles asociados a un nombre de usuario en numerosos sitios web. Además de comprobar posibles cuentas, puede recopilar información pública disponible en las páginas encontradas y generar informes para facilitar su revisión. Es una herramienta complementaria a Sherlock: ambas trabajan con alias, pero no utilizan exactamente las mismas bases de datos, comprobaciones ni formatos de salida.

## Arquitectura de comprobación y recopilación

Maigret parte de uno o varios nombres de usuario y los compara con una base de datos de sitios y reglas de comprobación. La búsqueda predeterminada consulta un conjunto limitado de sitios de la base; la opción de búsqueda completa amplía el alcance. En las páginas que identifica, puede intentar recopilar la información pública disponible y organizarla en informes.

La cobertura y la precisión dependen de la base de datos, de la respuesta actual de cada web y de las restricciones que imponga cada servicio. Una página que responde de manera inesperada puede producir un falso positivo o impedir que se encuentre una cuenta existente.

## Capacidades principales

* **Búsqueda por alias:** buscar perfiles públicos que coincidan con el nombre de usuario indicado.
* **Búsqueda ampliada:** consultar toda la base de sitios compatible con la versión instalada.
* **Filtrado:** limitar la búsqueda a un sitio o a categorías de sitios cuando la base de datos lo permita.
* **Recopilación contextual:** reunir información pública disponible en las páginas de resultados.
* **Generación de informes:** producir informes HTML, JSON, CSV, TXT y otros formatos disponibles; la generación PDF puede requerir dependencias adicionales.
* **Análisis de varios alias:** ejecutar búsquedas sobre varios nombres de usuario y comparar las coincidencias con cautela.

## Instalación y verificación

La documentación del proyecto recomienda Python 3.10 o superior y ofrece instalación con `pipx`, que mantiene las dependencias de Maigret en un entorno aislado:

```bash
pipx install maigret
maigret --version
maigret --help
```

Si necesitas informes PDF, instala el extra correspondiente y las dependencias de sistema que indique la documentación para tu distribución:

```bash
pipx install 'maigret[pdf]'
```

Si Maigret ya estaba instalado sin el extra, consulta la documentación oficial para actualizarlo en lugar de asumir que la opción PDF funcionará automáticamente.

## Búsqueda básica de un alias

La ejecución más sencilla es:

```bash
maigret usuario_de_prueba
```

La búsqueda predeterminada utiliza una selección de sitios de la base de datos. Para ampliar el análisis a todos los sitios de esa base, utiliza:

```bash
maigret usuario_de_prueba -a
```

Para generar un informe HTML:

```bash
maigret usuario_de_prueba --html
```

Para exportar los resultados a JSON en formato NDJSON:

```bash
maigret usuario_de_prueba --json ndjson
```

Para generar varios formatos compatibles en una misma ejecución:

```bash
maigret usuario_de_prueba --html --csv --txt
```

Para consultar un sitio específico:

```bash
maigret usuario_de_prueba --site GitHub
```

Para ajustar el tiempo de espera y los reintentos en una conexión inestable:

```bash
maigret usuario_de_prueba --timeout 60 --retries 2
```

Los nombres y los parámetros son ejemplos. Ejecuta `maigret --help` para comprobar la sintaxis exacta de la versión instalada. Los informes suelen guardarse en el directorio `reports/`, salvo que se configure otra ubicación.

## Interpretación de los informes

Maigret puede encontrar perfiles que utilicen el mismo alias, pero compartir un nombre de usuario no demuestra que todos pertenezcan a la misma persona. Algunas plataformas permiten nombres duplicados, cambian sus páginas públicas o responden con páginas genéricas que la herramienta puede interpretar incorrectamente.

Para revisar los resultados:

* abre el perfil encontrado y verifica que no sea una página de error, plantilla o perfil eliminado;
* identifica qué datos proceden directamente del sitio y cuáles son inferencias de la herramienta;
* compara señales independientes y no sensibles antes de relacionar perfiles;
* conserva la fecha de recogida y las URL de origen para que otra persona pueda reproducir la comprobación.

Un informe no sustituye la verificación manual. Una búsqueda sin resultados tampoco significa que el alias no se utilice en internet.

## Aplicaciones en OSINT y auditoría

Maigret puede ayudar a revisar la huella digital de tus propios alias, realizar inventarios autorizados de presencia pública, preparar ejercicios de análisis de fuentes abiertas y documentar perfiles públicos relacionados con una investigación legítima. Los resultados deben utilizarse con un objetivo definido, minimizando la recopilación de información personal.

## Limitaciones, solicitudes y privacidad

La búsqueda puede producir muchas solicitudes a sitios externos. Algunos servicios aplican límites de frecuencia, bloqueo o comprobaciones anti-automatización; una búsqueda más amplia puede tardar bastante y aumentar la probabilidad de errores. Evita lanzar búsquedas innecesariamente grandes y no interpretes una limitación técnica como prueba de ausencia de cuenta.

No publiques informes completos sin revisar su contenido: pueden incluir enlaces, nombres de perfil u otros datos personales. Limita su acceso, elimina los datos que no necesites y respeta las condiciones de los sitios y la legislación aplicable.
