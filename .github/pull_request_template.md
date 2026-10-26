## Resumen

Explica en pocas frases qué cambia este Pull Request y por qué. Si resuelve una incidencia, indícalo con `Closes #número`.

## Tipo de cambio

- [ ] Nueva documentación
- [ ] Corrección de documentación (errata, enlace roto, procedimiento incorrecto)
- [ ] Nueva ficha de comando
- [ ] Corrección o mejora de una ficha de comando
- [ ] Nueva ficha de distribución o corrección de una existente
- [ ] Mejora de automatización, scripts o plantillas
- [ ] Ajuste de estructura (mover o renombrar archivos)
- [ ] Otro: _______

## Archivos afectados

Enumera los archivos principales modificados, creados o movidos.

## Validaciones ejecutadas

Marca solo las que correspondan a tu cambio. Las instrucciones están en la [guía de contribución](https://github.com/nisamov/linuxcore/blob/main/.github/CONTRIBUTING.md).

- [ ] `python3 .github/scripts/validate_markdown.py` termina sin errores (cualquier cambio en archivos `.md`).
- [ ] `python3 .github/scripts/validate_commands.py` termina sin errores (cambios en `json/comandos/`).
- [ ] `python3 .github/scripts/distros_db_gen.py` termina sin errores y no he incluido cambios en `.github/db/` (cambios en `json/distribuciones/`).
- [ ] He probado los comandos, scripts o configuraciones en una máquina virtual o contenedor, no en un sistema en producción.

## Revisión del contenido

- [ ] El contenido está en español y es técnico y neutro.
- [ ] He verificado la información con `man`, la documentación oficial o una fuente fiable.
- [ ] He advertido de forma explícita de los comandos que pueden borrar datos, alterar el sistema o interrumpir un servicio.
- [ ] No incluyo contraseñas, claves, direcciones privadas ni datos personales.
- [ ] Si he creado un documento nuevo en `documentacion/`, lo he añadido a las tablas de `README.md`.
- [ ] Si he tocado `documentacion/`, he seguido las normas de [accesibilidad del proyecto](https://github.com/nisamov/linuxcore/blob/main/ACCESSIBILITY.md).
- [ ] No he modificado `.github/db/`, `CHANGELOG.md` ni `AGRADECIMIENTOS.md`.

## Notas para quien revise

Indica contexto adicional: fuentes consultadas, decisiones que dudas, riesgos conocidos o partes que quieres que se revisen con más atención.
