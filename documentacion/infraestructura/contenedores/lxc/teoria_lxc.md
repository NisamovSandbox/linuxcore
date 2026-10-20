# Teoría General LXC (Linux Containers)

## Qué es un contenedor LXC

* Concepto: LXC (Linux Containers) ofrece virtualización a nivel de sistema operativo, permitiendo ejecutar múltiples sistemas Linux aislados dentro de un mismo host compartiendo un único kernel.
* Ausencia de SO Invitado: A diferencia de una máquina virtual, no requiere instalar un sistema operativo invitado completo ni emular un kernel independiente.
* Eficiencia de recursos: Al compartir el kernel con el sistema anfitrión, el consumo de memoria RAM, CPU y disco es mínimo.
* Tiempo de arranque: El inicio de los contenedores es casi instantáneo (segundos o milisegundos), ya que no atraviesa el proceso de inicio de un kernel ni emulación de BIOS/UEFI.

## Máquinas Virtuales (KVM) vs Contenedores (LXC)

### Arquitectura e hipervisor

* KVM utiliza un hipervisor para simular hardware completo (CPU, RAM, red, disco) y requiere un kernel propio en cada máquina virtual.
* LXC no usa hipervisor ni virtualiza hardware; utiliza funcionalidades nativas del kernel de Linux para aislar procesos.

### Seguridad y aislamiento

* Las MVs ofrecen un aislamiento estricto basado en hardware. Si el SO invitado falla o es comprometido, el hipervisor y otras MVs se mantienen protegidos.
* Los contenedores LXC comparten el kernel del host. Si ocurre un fallo grave en el kernel o un escape del contenedor, puede afectar al host y a otros contenedores.

### Rendimiento y sobrecarga

* KVM introduce cierta sobrecarga de rendimiento debido a la capa de emulación e hipervisión.
* LXC proporciona un rendimiento prácticamente nativo en procesamiento, memoria e I/O al ejecutar las instrucciones directamente en el kernel del host.

### Casos de uso

* KVM es ideal para entornos multi-inquilino (multi-tenant), aplicaciones no confiables o cuando se requiere ejecutar sistemas operativos distintos de Linux (como Windows).
* LXC es ideal para maximizar la densidad de servicios en un mismo servidor Linux, entorns de desarrollo o arquitecturas donde se busca la máxima eficiencia de recursos.

## Tecnologías fundamentales del kernel en LXC

### Namespaces (Espacios de nombres)

* Proveen el aislamiento de recursos al hacer que cada contenedor vea únicamente su propia instancia de componentes del sistema.
* PID Namespace: Aísla el árbol de procesos (el contenedor tiene su propio proceso PID 1).
* NET Namespace: Aísla interfaces de red, tablas de enrutamiento y puertos.
* MNT Namespace: Aísla los puntos de montaje del sistema de archivos.
* IPC Namespace: Aísla los recursos de comunicación entre procesos (memoria compartida, semáforos).
* UTS Namespace: Permite definir un hostname y dominio propio por contenedor.
* USER Namespace: Mapea los identificadores de usuario y grupo (UID/GID) del contenedor a usuarios sin privilegios en el host.

### Control Groups (cgroups)

* Limitan, contabilizan y aíslan el uso de recursos físicos entre los contenedores.
* Asignación de CPU: Define cuotas y prioridades de procesamiento.
* Límites de Memoria: Restringe la memoria RAM máxima y el uso de Swap.
* Entrada y Salida (I/O): Regula la velocidad de lectura/escritura en disco.

### Mecanismos de seguridad adicionales

* Chroot y Pivot_root: Restringen la visión del sistema de archivos al directorio raíz del contenedor.
* Capabilities: Dividen los privilegios de root en capacidades individuales para desactivar permisos innecesarios o peligrosos.
* AppArmor / SELinux: Perfiles de seguridad obligatoria para controlar accesos a archivos y recursos del sistema.
* Seccomp: Filtra las llamadas al sistema (syscalls) permitidas hacia el kernel.

## Tipos de contenedores LXC

### Contenedores privilegiados

* El usuario root del contenedor coincide con el UID 0 (root real) del sistema anfitrión.
* Presentan mayor riesgo de seguridad si se vulnera la capa de aislamiento.

### Contenedores no privilegiados

* Utilizan USER Namespaces para mapear el root interno del contenedor a un usuario común sin privilegios en el host.
* Si un atacante obtiene acceso root dentro del contenedor, en el host solo tendrá permisos de un usuario estándar.
* Es la opción recomendada para entornos de producción.

## LXC vs Docker

* LXC gestiona contenedores de sistema: se comportan como máquinas virtuales ligeras, ejecutando un sistema operativo completo con múltiples servicios y su propio sistema de inicialización (como systemd).
* Docker gestiona contenedores de aplicación: enfocados en empaquetar y ejecutar un único servicio o proceso de manera efímera e inmutable.

## Ventajas y limitaciones

### Ventajas

* Consumo mínimo de recursos en comparación con máquinas virtuales.
* Alta densidad de ejecución en un solo servidor físico.
* Experiencia de administración idéntica a la de un servidor Linux tradicional.
* Integración nativa en plataformas como Proxmox VE.

### Limitaciones

* Dependencia del kernel host: solo es posible ejecutar distribuciones Linux.
* Menor nivel de aislamiento de seguridad frente a la virtualización completa con hipervisor.
* Vulnerabilidades en el kernel afectan a todos los contenedores activos.
