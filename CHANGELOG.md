<p align="center">
  <img src=".github/media/top.png" alt="LinuxCore Header" width="100%">
</p>

<div align="center">
  <h1>Registro de Cambios | Linux Core</h1>

<p>Todos los cambios relevantes de <b>Linux Core</b> se documentan en este archivo. Las versiones más recientes aparecen primero.</p>
</div>

## [`00-00-01-02`]

## Añadido

- Creación de directorio `docker/`

### Cambiado

- Optimizado el `Dockerfile` y movido a `docker/Dockerfile`
- Nueva entrada en `README.md` referenciando el contendor.
- Cambio de shields (adaptación a cambios recientes).

---

## [`00-00-01-01`]

### Cambiado

- Cambio en la ubicación del `Dockerfile` a primer plano

### Eliminado

- Eliminado el workflow relacionado con el Dockerfile

---

## [`00-00-01-00`]

### Añadido

- Contenedor y despliegue Docker automático en nueva rama del repositorio

---

## [`00-00-00-06`]

### Corregido

- Corregido el enlace simbolico del `README.md` de `teoria_borg.md`

### Eliminado

- Eliminada la referencia del enlace a un archivo inexistente `diagnosticar_ssh.md`

---

## [`00-00-00-05`]

### Añadido

- Creada teoria general de `ssh` en `documentacion/redes/ssh/uso.md`

### Cambiado

- Ediciones generales en `README.md`:
  - Modificación de redireccionamiento a "linuxcore.site"
  - Modificación en el diseño y formato de shields
  - Modificación de Formato de colaboradores
- Modificada completa sobre la teoría `ssh` en `documentacion/redes/ssh/teoria_ssh.md`
- Corrección y expansión de apuntes en `documentacion/programacion/php/variables.php`

### Corregido

- Corregido el enlace roto en `README.md` del archivo `documentacion/infraestructura/copias_seguridad/borg/teoria_borg.md`
- Corregido enlace de contribuciones en `README.md`y `.github/CONTRIBUTING.md`

### Eliminado

- Eliminada la sección `documentación/seguridad/ofensiva/`
- Se han retirado los nombres de las entidades que no deseaban aparecer en `.github/AGRADECIMIENTOS.md`.

---

## [`00-00-00-04`]

### Añadido

- Nueva distribución `Raspbian` en `json/distribuciones/raspbian.json`
- Comando `pinky` en `json/comandos/usuarios/pinky.json`

### Cambiado

- Revertido el cambio de formato de las tablas de `README.md` introducido en `00-00-00-03` (vuelven a `markdown`)
- Modificación ligera en el formato de colaboradores
- Movido `documentacion/infraestructura/contenedores/borg/teoria_borg.md` a `documentacion/infraestructura/copias_seguridad/`

### Corregido

- Deteccion de visualizaciones de `README.md`

---

## [`00-00-00-03`]

### Cambiado

- Renombrado `CHANGELOG` a `CHANGELOG.md`
- Ajustes menores de formato en `CHANGELOG.md`
- Formato de las tablas de `README.md` cambiado de `markdown` a `html`

---

## [`00-00-00-02`]

### Corregido

- Enlaces rotos en `README.md` y `documentacion/redes/*`

---

## [`00-00-00-01`]

### Añadido

- Creación de `CHANGELOG`

### Cambiado

- Fusionados los archivos duplicados en `documentacion/redes/dhcp/teoria_dhcp.md`
- Actualizada la ruta de referencia a `ddns.key.example` en `documentacion/redes/dns/bind9/dinamico/procedimiento.md`
- `README.md` adaptado a la nueva estructura del repositorio

### Seguridad

- Renombrado `ddns.key` a `ddns.key.example` en `documentacion/redes/dns/bind9/dinamico/`

---

<div align="center">
  <p><b>Linux Core - Nisamov | MIT License - 2026</b></p>
  <p><b>Contacto:</b> <a href="mailto:nisamov.contact@gmail.com">nisamov.contact@gmail.com</a></p>
  <p align="center">
    <img src=".github/media/bottom.png" alt="LinuxCore Footer" width="100%">
  </p>
</div>