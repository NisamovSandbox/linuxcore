---
name: "Nuevo comando o ficha de comando"
about: "Propone añadir un comando o corregir una ficha de json/comandos/"
title: "[COMANDO] "
labels: ["documentation", "enhancement"]
assignees: ""
---

# Ficha de comando

## Comando

Indica el nombre del comando y, si es una corrección, la ruta de la ficha.

Ejemplo: `json/comandos/almacenamiento/badblocks.json`.

## Categoría propuesta

Elige una: `almacenamiento`, `archivos`, `compresion`, `info_sistema`, `miscelaneo`, `monolinea`, `paquetes`, `procesos`, `red`, `seguridad`, `servicios` o `usuarios`.

## Qué hace y por qué debería estar

Describe en una o dos frases la función del comando y en qué situaciones se usa.

## Qué hay que añadir o corregir

Si es una ficha nueva, indica las opciones más importantes y un par de ejemplos. Si es una corrección, indica el campo afectado (por ejemplo `parametros`, `seguridad` o `instalacion`) y el valor correcto.

## Riesgos

- [ ] El comando puede borrar o sobrescribir datos.
- [ ] El comando puede alterar la configuración del sistema o de la red.
- [ ] El comando puede interrumpir un servicio o terminar procesos.
- [ ] Requiere privilegios de superusuario.
- [ ] No tiene riesgos relevantes.

## Fuentes

Indica dónde has comprobado la información: salida de `man`, documentación oficial del proyecto u otra fuente fiable.

## ¿Quieres escribir la ficha tú?

- [ ] Sí, abriré un Pull Request siguiendo la [guía de contribución](https://github.com/nisamov/linuxcore/blob/main/.github/CONTRIBUTING.md).
- [ ] No, solo propongo el comando.
