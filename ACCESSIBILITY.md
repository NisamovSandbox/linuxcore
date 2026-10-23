# Accesibilidad en LinuxCore

LinuxCore quiere que su documentación técnica y los recursos publicados en [linuxcore.site](https://linuxcore.site/) sean consultables por el mayor número posible de personas, incluidas aquellas que utilizan lectores de pantalla, navegación por teclado, ampliación de pantalla, reconocimiento de voz u otras tecnologías de apoyo.

Este documento recoge los criterios que guían la creación, revisión y mejora del repositorio. LinuxCore está en desarrollo activo, por lo que la accesibilidad se entiende como un proceso continuo.

## Alcance

Estas pautas se aplican a:

- La documentación en Markdown de `documentacion/` y los contenidos explicativos del `README.md`.
- Los ejemplos de código, scripts y configuraciones.
- Los datos JSON de `json/comandos/`, `json/distribuciones/` y `json/servicios/`, así como los datos derivados que consuma la web.
- Las imágenes y gifs de `.github/media/`.
- La interfaz, navegación y contenidos de [linuxcore.site](https://linuxcore.site/).
- Las plantillas y los procesos de contribución alojados en `.github/`.

La accesibilidad de los ficheros fuente y la de la web generada están relacionadas, pero no son equivalentes: un documento Markdown bien estructurado no garantiza por sí solo que la página resultante sea accesible.

## Criterio de referencia

Como referencia de diseño y revisión se toman las **Pautas de Accesibilidad para el Contenido Web (WCAG) 2.2, nivel AA**, en la medida en que sean aplicables a cada recurso.

Esta referencia expresa un objetivo de trabajo; **no constituye una declaración de conformidad ni certifica que el repositorio o el sitio web hayan superado una auditoría de accesibilidad**. Los resultados deben comprobarse sobre la versión publicada.

## Criterios para la documentación

### Estructura y lenguaje

- Escribir en español claro y directo, sin eliminar la precisión técnica necesaria.
- Usar títulos y subtítulos descriptivos y mantener una jerarquía lógica (`#`, `##`, `###`), sin elegir un nivel únicamente por su apariencia visual.
- Dividir los procedimientos extensos en pasos ordenados y describir los requisitos previos, los resultados esperados y, cuando proceda, cómo verificar o revertir un cambio.
- Explicar las siglas y los términos especializados en su primera aparición cuando el contexto lo permita.
- Evitar transmitir información únicamente mediante expresiones como <lo de arriba>, <el elemento verde> o referencias a la posición visual.
- No usar enumeraciones en los títulos y subtítulos (`1.`, `2.`, `3.`...) ni separadores generales (`---`).

### Enlaces y navegación

- Usar textos de enlace que expliquen el destino o la función. Evitar enlaces ambiguos como <aquí> o <más> cuando no se entiendan fuera de contexto.
- Mantener rutas relativas correctas para los enlaces internos del repositorio.
- No usar una URL extensa como único texto descriptivo si puede sustituirse por el nombre del recurso.

### Imágenes, diagramas y animaciones

- Añadir texto alternativo útil a las imágenes que aporten información. El texto debe transmitir su finalidad o contenido, no limitarse a decir «imagen».
- Acompañar diagramas complejos con una explicación textual de sus relaciones o pasos.
- No agregar GIF, imagenes ni videos en la documentación, se requiere una explicación precisa y ejemplos mediante el uso de secciones de código ("```") para describir la situación.
- No agregar elementos decorativos de ninguna clase, eso aplica a emojis, GIF, imágenes, videos, u otro tipo de medio.

### Tablas, listas y bloques de código

- Reservar las tablas para datos que se entiendan mejor en filas y columnas; incluir encabezados claros y evitar estructuras excesivamente complejas.
- Usar listas numeradas para secuencias y listas con viñetas para elementos sin orden obligatorio.
- Delimitar los bloques de código con el identificador de lenguaje apropiado cuando corresponda, por ejemplo, `bash`, `json`, `sql` o `php`.
- No comunicar diferencias importantes exclusivamente mediante color, resaltado o formato visual.
- Presentar los comandos con contexto suficiente para comprender su finalidad, los permisos necesarios y sus posibles efectos. Advertir de forma explícita cuando un ejemplo pueda borrar datos, alterar el sistema o interrumpir un servicio.
- Mantener los ejemplos de texto seleccionables y copiables; no sustituirlos por imágenes de terminal.

## Datos y contenido técnico

Los ficheros JSON de comandos, distribuciones y servicios pueden terminar representados en componentes de la web. Por ello:

- Los nombres, descripciones, categorías y ejemplos deben ser comprensibles sin depender de iconos o colores.
- Las abreviaturas técnicas deben ser consistentes y, cuando sea necesario, explicarse en el contenido asociado.
- Los ejemplos de comandos deben mantenerse como texto y conservar un orden de lectura lógico.
- Los cambios de esquema o de presentación deben revisarse también desde el punto de vista de quienes navegan con teclado o tecnologías de apoyo.

La validez de un JSON o de un documento Markdown no implica, por sí sola, que su representación final cumpla estos criterios.

## Comprobaciones recomendadas

Antes de publicar cambios que afecten a la documentación o a la interfaz, conviene revisar lo siguiente:

- [ ] Se puede recorrer la página y utilizar sus controles únicamente con teclado.
- [ ] El foco del teclado es visible y sigue un orden lógico.
- [ ] Los encabezados, enlaces, listas y tablas se entienden fuera de su apariencia visual.
- [ ] Las imágenes informativas tienen alternativas textuales y las animaciones no son la única fuente de información.
- [ ] El texto y los controles tienen contraste suficiente y no dependen únicamente del color.
- [ ] El contenido sigue siendo utilizable con ampliación de pantalla y en pantallas pequeñas.
- [ ] Los campos, botones, filtros y resultados tienen nombres comprensibles para tecnologías de apoyo.
- [ ] Los bloques de código pueden leerse y copiarse como texto y las instrucciones explican los riesgos relevantes.
- [ ] Se han probado las rutas principales con teclado y, cuando sea posible, con un lector de pantalla.

Las herramientas automáticas pueden ayudar a localizar algunos problemas, pero no sustituyen las pruebas manuales. El flujo existente de validación de Markdown ayuda a comprobar aspectos del formato documental; no debe interpretarse como una auditoría de accesibilidad.

## Cómo comunicar un problema

Si encuentras una barrera de accesibilidad, abre una incidencia en [GitHub Issues de LinuxCore](https://github.com/nisamov/linuxcore/issues). Incluye, en la medida de lo posible:

* La página, ruta o fichero afectado.
* Los pasos necesarios para reproducir el problema.
* El comportamiento observado y el resultado esperado.
* El navegador, sistema operativo y tecnología de apoyo utilizados, si procede.
* Una propuesta de mejora, si tienes alguna.

No es necesario conocer la terminología técnica de accesibilidad para informar de un problema. Describe la barrera con tus propias palabras y evita incluir datos personales o información sensible en la incidencia.

También puedes proponer una corrección mediante un *Pull Request*, siguiendo las pautas de [`CONTRIBUTING.md`](.github/CONTRIBUTING.md).

## Mejora continua

La estructura y los contenidos del proyecto evolucionan. Los criterios de este documento deben revisarse cuando cambien la interfaz, el sistema de navegación, la forma de presentar los comandos o los procesos de publicación. Las incidencias reproducibles y las aportaciones de personas que utilizan tecnologías de apoyo son una parte importante de esa mejora.

---

Última revisión del documento: octubre de 2026.
