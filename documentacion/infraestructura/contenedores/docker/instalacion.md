# Instalación de Docker y Docker Compose

Guía de instalación de Docker Engine y del plugin Docker Compose en Ubuntu y Debian, con la descripción técnica y el motivo de cada comando.

## Qué método elegir

Hay dos métodos. Elige uno y no combines ambos, porque los paquetes `docker.io` y `docker-ce` entran en conflicto.

| | Método 1: repos de la distribución | Método 2: repo oficial de Docker |
|---|---|---|
| Paquete del motor | `docker.io` | `docker-ce` |
| Mantenido por | Canonical / Debian | Docker Inc. |
| Versión | Más antigua | Última estable |
| Complejidad | Muy baja (2 comandos) | Media (clave GPG y repo) |
| Actualizaciones | Con el ciclo de la distribución | Inmediatas vía `apt upgrade` |
| Recomendado para | Pruebas y laboratorio | Servidores y producción |

## Método 1: repositorios de la distribución

### Actualizar el índice de paquetes

```bash
sudo apt update
```

- **Qué hace:** descarga las listas de paquetes de los repositorios configurados.
- **Por qué:** evita instalar versiones obsoletas o fallar por un índice desactualizado.

### Instalar el motor y Compose

```bash
sudo apt install -y docker.io docker-compose-v2
```

- **Qué hace:** instala `docker.io` (demonio `dockerd`, cliente `docker` y `containerd` como dependencia) y `docker-compose-v2` (el comando `docker compose`).
- **Por qué:** es la forma más corta de tener Docker funcionando. `-y` acepta la confirmación automáticamente.
- **Nota:** `docker-compose-plugin` solo existe en el repo oficial de Docker (método 2). En Ubuntu 22.04 o superior el equivalente es `docker-compose-v2`; en Debian, `docker-compose`.

### Activar el servicio

```bash
sudo systemctl enable --now docker
```

- **Qué hace:** `enable` hace que `dockerd` arranque con el sistema y `--now` lo inicia en este momento.
- **Por qué:** en Ubuntu suele arrancar solo, pero así queda garantizado y explícito.

### Permisos sin sudo

```bash
sudo usermod -aG docker $USER
newgrp docker
```

- **Qué hace:** `usermod -aG` añade tu usuario al grupo `docker` (`-a` añade sin quitar otros grupos, `-G` indica grupos suplementarios). `newgrp` abre una subshell con el grupo ya activo.
- **Por qué:** el socket `/var/run/docker.sock` pertenece a `root:docker`. Sin estar en el grupo, cada comando requiere `sudo`. Los grupos se leen al iniciar sesión, por eso hace falta `newgrp` o reiniciar la sesión.
- **Seguridad:** pertenecer al grupo `docker` equivale a tener root en la máquina, ya que se puede montar `/` dentro de un contenedor. Añade solo usuarios de confianza.

### Verificar

```bash
docker version
docker compose version
docker run --rm hello-world
```

- **Qué hace:** muestra versiones de cliente y servidor, y ejecuta un contenedor de prueba que se elimina al terminar (`--rm`).
- **Por qué:** `docker version` confirma que cliente y demonio se comunican (un *permission denied* indica que el cambio de grupo no se aplicó). `hello-world` valida toda la cadena: descarga, creación y ejecución.

## Método 2: repositorio oficial de Docker

Método recomendado por la documentación de Docker. Incluye versiones actualizadas y el plugin `docker-compose-plugin`.

### Eliminar versiones conflictivas

```bash
sudo apt remove docker.io docker-doc docker-compose podman-docker containerd runc
```

- **Por qué:** los paquetes de la distribución y los de Docker Inc. entran en conflicto. Si vienes del método 1, es obligatorio.
- **Nota:** las imágenes y volúmenes de `/var/lib/docker` no se borran con este comando.

### Instalar dependencias

```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
```

| Paquete | Función |
|---|---|
| `ca-certificates` | Certificados raíz para validar conexiones HTTPS |
| `curl` | Cliente para descargar la clave GPG |
| `gnupg` | Herramienta `gpg`, que convierte la clave al formato de `apt` |

- **Por qué:** sin ellos no se puede descargar ni validar de forma segura un repositorio externo.

### Instalar la clave GPG oficial

```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

- **Línea 1:** crea `/etc/apt/keyrings` con permisos `755` (`-d` = crear directorio).
- **Línea 2:** descarga la clave pública y la convierte de ASCII a binario con `--dearmor`. Flags de `curl`: `-f` falla en errores HTTP, `-s` silencioso, `-S` muestra errores aun en modo silencioso, `-L` sigue redirecciones.
- **Línea 3:** da permiso de lectura a todos los usuarios.
- **Por qué:** `apt` comprueba con esta clave que los paquetes proceden de Docker y no han sido alterados. Sin permiso de lectura, el usuario `_apt` no puede usarla y falla con `NO_PUBKEY`.
- **Debian:** cambia `linux/ubuntu` por `linux/debian` en la URL.

### Añadir el repositorio

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

- **Qué hace:** crea `/etc/apt/sources.list.d/docker.list` con la línea del repositorio.
  - `$(dpkg --print-architecture)`: arquitectura del sistema (`amd64`, `arm64`...).
  - `signed-by=...`: asocia este repo solo a la clave de Docker, más seguro que una clave global.
  - `$(. /etc/os-release && echo "$VERSION_CODENAME")`: nombre en clave de la versión (`jammy`, `noble`...).
  - `stable`: canal de versiones estables.
  - `sudo tee ... > /dev/null`: escribe el archivo como root (una redirección `>` normal no hereda `sudo`) y silencia la salida.
- **Por qué:** indica a `apt` de dónde descargar Docker.
- **Importante:** escríbelo en una sola línea. Al partirlo con `\`, cualquier espacio o salto de más rompe las comillas.
- **Debian:** cambia `linux/ubuntu` por `linux/debian`. En derivados de Ubuntu (Mint, etc.) usa `UBUNTU_CODENAME` en lugar de `VERSION_CODENAME`.

### Instalar Docker Engine

```bash
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

| Paquete | Función |
|---|---|
| `docker-ce` | Demonio `dockerd` |
| `docker-ce-cli` | Comando `docker` |
| `containerd.io` | Runtime de contenedores de bajo nivel que usa `dockerd` |
| `docker-buildx-plugin` | Construcción avanzada de imágenes (multiarquitectura, caché) |
| `docker-compose-plugin` | Comando `docker compose` (v2) para stacks multicontenedor en YAML |

- **Por qué `apt-get update` antes:** `apt` necesita leer el repositorio recién añadido.

### Post-instalación y verificación

```bash
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker

docker version
docker compose version
docker run --rm hello-world
```

- **Por qué:** igual que en el método 1. El servicio queda activo y persistente, se evita `sudo` en cada comando y `hello-world` comprueba el funcionamiento de extremo a extremo.

## Diagnóstico

```bash
systemctl status docker
journalctl -u docker -e
docker info
```

- `systemctl status docker`: estado del demonio.
- `journalctl -u docker -e`: últimos logs del servicio (`-e` salta al final).
- `docker info`: configuración, storage driver y número de contenedores.

## Probar LinuxCore con Docker

Con Docker instalado, puedes ejecutar LinuxCore en local:

```bash
docker run -d --name linuxcore -p 8080:80 ghcr.io/nisamov/linuxcore
```

- **Qué hace:** descarga la imagen y la ejecuta en segundo plano (`-d`), publicando el puerto 80 del contenedor (nginx) en el 8080 del host (`-p 8080:80`).
- **Por qué:** permite usar LinuxCore sin depender de internet ni de un servidor propio. Accede desde `http://localhost:8080`.
- **Detener y eliminar:** `docker rm -f linuxcore`.
