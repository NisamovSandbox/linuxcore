# Herramienta `Holehe` - Comprobación OSINT de cuentas asociadas a correos electrónicos

Holehe es una herramienta OSINT que comprueba si una dirección de correo electrónico parece estar asociada a una cuenta en determinados servicios en línea. Utiliza respuestas de mecanismos públicos de registro, inicio de sesión o recuperación de cuentas, según el módulo y el servicio. Su objetivo es identificar posibles asociaciones entre un correo y plataformas, no acceder a las cuentas ni recuperar contraseñas.

Por trabajar con identificadores personales, debe utilizarse únicamente con direcciones propias, casos autorizados o ejercicios de laboratorio. La presencia o ausencia de una cuenta es información que puede ser sensible y no debe difundirse sin una razón legítima.

## Mecanismo de comprobación

Holehe consulta los servicios que tiene implementados y analiza las respuestas que ofrecen a los flujos que utiliza cada módulo. La salida puede incluir el nombre del servicio, un indicador de posible existencia de cuenta y, cuando el servicio lo revela, información de recuperación parcialmente ocultada.

El comportamiento varía por plataforma. Los servicios pueden cambiar sus formularios, introducir protecciones contra enumeración, limitar las consultas o modificar el significado de sus respuestas. Por tanto, una respuesta positiva o negativa es una señal técnica y no una garantía universal sobre el estado de una cuenta.

## Capacidades principales

* **Comprobación de correos:** consultar servicios compatibles para detectar posibles cuentas vinculadas a una dirección.
* **Resultado por servicio:** mostrar qué módulos han devuelto indicios y cuáles han sufrido errores o límites de frecuencia.
* **Datos de recuperación parcialmente ocultos:** algunos servicios pueden revelar pistas como un correo o teléfono enmascarado; no todos lo hacen.
* **Ejecución desde terminal:** utilizar la herramienta de forma puntual o integrarla en flujos de análisis autorizados.
* **Integración en Python:** el proyecto incluye módulos que pueden invocarse desde código, según sus dependencias y la API interna de la versión instalada.

## Instalación y verificación

Se recomienda usar un entorno virtual de Python para separar las dependencias de Holehe de los paquetes administrados por la distribución:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install holehe
holehe --help
```

En Windows, la activación del entorno virtual se realiza con el script correspondiente a PowerShell o CMD. También se puede consultar la instalación por PyPI o Docker descrita en el repositorio oficial.

## Comprobación básica de una dirección propia

Utiliza únicamente un correo de prueba que controles o para el que exista autorización:

```bash
holehe correo-propio@example.com
```

`example.com` se utiliza aquí como dominio de ejemplo reservado; no esperes que un correo ficticio devuelva resultados reales. Sustitúyelo por la dirección de laboratorio que corresponda cuando realices una prueba autorizada.

Para conocer los formatos de salida y filtros admitidos por la versión instalada, consulta:

```bash
holehe --help
```

Las opciones exactas pueden variar por versión. Evita copiar parámetros encontrados en guías antiguas sin comprobarlos primero con la ayuda local o con la documentación del repositorio.

## Interpretación de la salida

Una salida positiva puede indicar que el servicio ha respondido de una forma compatible con la existencia de una cuenta vinculada al correo. Un resultado negativo puede deberse a que la cuenta no exista, a una limitación del módulo, a un cambio del sitio o a un error temporal. Los campos de limitación de frecuencia y los errores del módulo deben tenerse en cuenta antes de sacar conclusiones.

Para documentar una comprobación:

* registra el servicio y la fecha, sin incluir datos personales innecesarios;
* distingue una respuesta técnica positiva de una verificación manual independiente;
* no intentes deducir datos ocultos ni eludir los controles del proveedor;
* si una consulta está limitada, detén o reduce la prueba en lugar de insistir repetidamente.

## Aplicaciones en privacidad y auditoría

Holehe puede ser útil para comprobar la exposición de tus propias direcciones de correo, evaluar el riesgo de enumeración de usuarios en una revisión defensiva, enseñar cómo las respuestas de recuperación pueden revelar información o verificar un conjunto de cuentas dentro de un mandato autorizado.

Para protegerse frente a la enumeración, los operadores de servicios deben evitar respuestas que permitan distinguir de manera fiable entre cuentas existentes e inexistentes, aplicar límites adecuados y no revelar datos de recuperación más allá de lo necesario.

## Riesgos y precauciones

La enumeración de correos puede facilitar la elaboración de perfiles, el spam o ataques dirigidos. Que una consulta no envíe una notificación visible al titular no significa que sea imposible que el proveedor registre el evento ni que el uso sea apropiado. No utilices la herramienta para investigar masivamente a terceros, acceder a cuentas o recopilar información sin autorización.

Los informes deben almacenarse con acceso restringido y un período de conservación razonable. Elimina datos que no sean necesarios para el objetivo de la auditoría y respeta la legislación y las condiciones del servicio.
