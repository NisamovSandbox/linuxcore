# Docker: Contenedorización de Aplicaciones

Docker es una plataforma de código abierto que automatiza el despliegue de aplicaciones dentro de **contenedores software**. A diferencia de las máquinas virtuales tradicionales, Docker utiliza el kernel del sistema operativo host para aislar procesos, lo que lo hace extremadamente ligero y rápido.

* Imagen: Es un paquete estático e inmutable (de solo lectura) que contiene todo lo necesario para ejecutar una aplicación: código, dependencias, librerías y configuración del sistema. Es el "plano de construcción" o molde.
* Contenedor: Es una instancia aislada en ejecución creada a partir de una imagen. Añade una capa ligera de lectura y escritura sobre la imagen para procesar datos en tiempo de ejecución.

**Mecanismos de almacenamiento en Docker:**
* **Volúmenes (Docker Volumes):** Se almacenan en una zona del disco administrada exclusivamente por Docker (`/var/lib/docker/volumes/` en Linux). Son la opción oficial recomendada por ser independientes del sistema operativo anfitrión, seguros y fáciles de respaldar.
* **Montajes de enlace (Bind Mounts):** Vinculan directamente una carpeta o archivo concreto del equipo anfitrión con una ruta dentro del contenedor. Dependen de la estructura de archivos del host, lo que los hace ideales para compartir código en tiempo real durante el desarrollo.
* **Montajes en memoria (tmpfs Mounts):** Almacenan los datos únicamente en la memoria RAM del anfitrión (no en el disco). No persisten tras apagar el equipo, pero ofrecen la máxima velocidad y seguridad para manejar información sensible o archivos temporales.

## Arquitectura y Conceptos Clave

Para entender Docker, debemos diferenciar sus cuatro componentes fundamentales:

### Los Pilares del Ecosistema

| Componente | Definición Técnica | Analogía |
| :--- | :--- | :--- |
| **Imagen** | Una plantilla de solo lectura que contiene las instrucciones para crear un contenedor. Inlcuye el código de la aplicación, bibliotecas, dependencias y configuraciones. Las imágenes se contruyen a partir de un `Dockerfile` o se descargan de un registro como `Docker Hub`. | La receta o molde. |
| **Contenedor** | Una instancia ejecutable de una imagen. Permite crear, iniciar, detener, mover y eliminar contenedores. Están aislados del sistema anfitrión y de otros contenedores | El plato cocinado. |
| **Dockerfile** | Un archivo de texto que contiene una serie de comandos/instrucciones que Docker sigue para construir una imagen automáticamente. | Pasos que se siguen. |
| **Registry** | Servicio de almacenamiento y distribución de imágenes (Docker Hub, GHCR). | La estantería de recetas. |
| **Volumen** | Mecanismo de persistencia de datos fuera del ciclo de vida del contenedor, los volúmenes de gestionan por Docker y se almacenan en una parte del sistema de archvios host. Son esenciales para bases de datos, ya que los datos dentro del contenedor se pierden si el contenedor se elimina. | El almacén externo. |
| **Docker Hub** | Sitio donde se descargan las imágenes si no se encuentran en local | Red de contenedores. |
| **Docker Compose** | Una herramienta para definir y ejecutar aplicaciones que constan de múltiples contenedores. Usa un archvios YAML (docker-compose.yaml) para configurar los servicios, redes y volúmenes de la aplicación. | Herramienta de montaje |

### ¿Cómo funciona por debajo? (Nivel Kernel)

Docker utiliza características nativas del **Kernel de Linux** para crear el aislamiento:

* **Namespaces:** Aíslan lo que el contenedor puede "ver" (Red, Procesos, Usuarios, Mount points).
* **Control Groups (cgroups):** Limitan cuánto recurso puede "usar" (CPU, RAM, I/O).
* **Union File Systems (UnionFS):** Permiten crear las capas de las imágenes de forma eficiente mediante el sistema de *copy-on-write*.

## Redes y Persistencia

### Gestión de Puertos

Los contenedores están aislados de la red del host por defecto. Para exponerlos usamos el mapeo de puertos:
`docker run -p [Puerto_Host]:[Puerto_Contenedor]`

> **Ejemplo:** `-p 8080:80` significa que si entras a `localhost:8080` en tu navegador, Docker redirige el tráfico al puerto `80` interno del contenedor.

### Persistencia de Datos

Los contenedores son **efímeros**. Si el contenedor muere, los datos generados dentro se pierden.
* **Volumes:** Gestionados por Docker (ideal para producción).
* **Bind Mounts:** Mapean una carpeta específica de tu PC (ej: `/home/user/app`) directamente al contenedor (ideal para desarrollo).
