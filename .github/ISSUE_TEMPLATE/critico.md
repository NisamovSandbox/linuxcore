---
name: "Hallazgo Crítico"
about: Reporta errores graves, contenido incorrecto, corrupción de documentos o problemas estructurales
title: "[CRITICAL] "
labels:
  - critical
  - bug
assignees:
  - Nisamov
---

# Hallazgo Crítico

## Archivo o recurso afectado

Indica la ruta del archivo, script o flujo de trabajo y, si puedes, la línea o la palabra concreta.

## Resumen del problema

Describe qué falla y qué consecuencias tiene: contenido técnico peligroso o incorrecto, base de datos que no se genera, enlaces o estructura rotos, un script que da error o un archivo corrupto.

## Cómo reproducirlo

Indica los pasos o el comando ejecutado. Si hay un mensaje de error, pégalo como texto dentro de un bloque de código. Las capturas de pantalla se aceptan, pero describe también su contenido con palabras.

## Corrección propuesta (opcional)

Escribe la corrección que propones. Un Pull Request también es bienvenido.

## Ejemplos de un buen informe

> El archivo `json/comandos/miscelaneo/clear.json` contiene una errata en el campo `descripcion` (línea 38, cuarta palabra).
> Corrección: sustituir la palabra incorrecta por «palabra_correcta», que es el término que usa la documentación oficial.

> El script `.github/scripts/commands_db_gen.py` falla en la línea 54 porque usa un módulo que no se importa.
> Corrección: añadir `import zyxwv` en la línea 3. Con ello desaparece el error al ejecutar el script.
