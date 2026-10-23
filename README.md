<p align="center">
  <img src=".github/media/top.png" alt="LinuxCore Header" width="100%">
</p>

<div align="center">

# Linux Core

[![MIT License](https://img.shields.io/github/license/nisamov/linuxcore?style=flat-square&color=0969da)](LICENSE) [![Website](https://img.shields.io/badge/website-linuxcore.site-0969da?style=flat-square)](https://linuxcore.site/) [![DB Build](https://img.shields.io/github/actions/workflow/status/nisamov/linuxcore/commands_db_gen.yaml?style=flat-square&color=0969da&label=db%20build)](https://github.com/nisamov/linuxcore/actions) [![Docker](https://img.shields.io/badge/ghcr.io-nisamov%2Flinuxcore-0969da?style=flat-square&logo=docker&logoColor=white)](https://github.com/nisamov/linuxcore/pkgs/container/linuxcore) [![Visitas](https://api.visitorbadge.io/api/combined?path=nisamov.linuxcore&countColor=0969da&style=flat-square)](https://github.com/nisamov/linuxcore)

**Documentación y fundamentos de informática en Español**

</div>

> [!IMPORTANT]
> **Repositorio en desarrollo activo:** La estructura de carpetas y la documentación están sujetas a cambios.

## Descripción del Proyecto

**Linux Core** es un repositorio creado a raíz de su predecesor [LinuxCommands](https://github.com/nisamov/LinuxCommands), con el fin de consolidar años de experiencia en sistemas Linux, arquitectura de computadores, prácticas de seguridad e infraestructuras modernas.

El objetivo es proporcionar el contexto técnico necesario para comprender no solo cómo utilizar una herramienta, servicio o protocolo, sino también el porqué de su funcionamiento y en qué escenarios debe aplicarse.

El contenido se desarrolla en español y está orientado tanto al aprendizaje estructurado como a la consulta técnica rápida.

> [!NOTE]
> **Base de datos exportable**
> El proyecto distribuye la referencia de comandos y distribuciones en formato **JSON**, optimizada para alimentar el sitio web **[linuxcore.site](https://linuxcore.site)**.
>
> __Descargar la última versión compilada:__ [![Latest Release](https://img.shields.io/github/v/release/nisamov/linuxcore?display_name=release&style=flat-square&color=0969da&label=release)](https://github.com/nisamov/linuxcore/releases/latest)

> [!TIP]
> **LinuxCore en local con Docker**
> Ejecuta la web en tu equipo, con los datos de la última release y sin depender de `linuxcore.site`:
>
> ```bash
> docker run -d --name linuxcore -p 8080:80 --restart unless-stopped ghcr.io/nisamov/linuxcore:latest
> ```
>
> Abre <http://localhost:8080>. Para actualizar: `docker pull ghcr.io/nisamov/linuxcore:latest` y recrea el contenedor.

## Estructura de Contenidos

### Sistema

| Tema | Documento | Contenido |
| --- | --- | --- |
| Linux | [Teoría de Linux](documentacion/sistema/linux/teoria_linux.md) | Fundamentos del sistema operativo. |
| Linux | [Linus Torvalds](documentacion/sistema/linux/linus_torvalds.md) | Origen y contexto histórico. |
| Permisos | [Permisos de archivos y directorios](documentacion/sistema/permisos/permisos_archivos_directorios.md) | Modelo clásico `rwx`, propietarios y grupos. |
| Permisos | [Listas de control de acceso](documentacion/sistema/permisos/listas_acceso.md) | ACLs con `getfacl` / `setfacl`. |
| Procesos | [Teoría de procesos](documentacion/sistema/procesos/teoria_de_procesos.md) | Ciclo de vida, estados y señales. |
| Procesos | [Proceso zombie](documentacion/sistema/procesos/proceso_zombie.md) | Qué son y cómo tratarlos. |
| Procesos | [Proceso consumiendo CPU](documentacion/sistema/procesos/proceso_consumiendo_cpu.md) | Diagnóstico de uso excesivo de CPU. |
| Almacenamiento | [Teoría de almacenamiento](documentacion/sistema/almacenamiento/teoria_almacenamiento.md) | Conceptos generales. |
| Almacenamiento | [Discos y particiones](documentacion/sistema/almacenamiento/teoria_discos_particiones.md) | Tablas de particiones y sistemas de archivos. |
| Almacenamiento | [Ampliar una partición](documentacion/sistema/almacenamiento/ampliar_particion.md) | Procedimiento paso a paso. |
| Almacenamiento | [Reemplazar un disco](documentacion/sistema/almacenamiento/reemplazar_disco.md) | Sustitución de disco. |
| Almacenamiento | [Recuperar sistema de archivos](documentacion/sistema/almacenamiento/recuperar_sistema_archivos.md) | Reparación y recuperación. |
| RAID | [Teoría de RAID](documentacion/sistema/almacenamiento/raid/teoria_raid.md) | Niveles y casos de uso. |
| RAID | [RAID 1](documentacion/sistema/almacenamiento/raid/raid1.md) | Montaje práctico. |
| RAID | [RAID (versión compacta)](documentacion/sistema/almacenamiento/raid/raid_compressed.md) | Resumen rápido. |
| Hardware | [RAM](documentacion/sistema/hardware/ram.md) | Funcionamiento y tipos de memoria. |

### Redes

| Tema | Documento | Contenido |
| --- | --- | --- |
| Fundamentos | [Topología de redes](documentacion/redes/fundamentos/topologia_redes.md) | Tipos de topología. |
| Fundamentos | [Puertos](documentacion/redes/fundamentos/teoria_puertos.md) | Puertos y servicios asociados. |
| Fundamentos | [ARP](documentacion/redes/fundamentos/arp.md) | Resolución de direcciones. |
| Fundamentos | [TTL e ICMP](documentacion/redes/fundamentos/ttl_icmp.md) | Funcionamiento de `ping` y `traceroute`. |
| Diagnóstico | [Diagnosticar conectividad](documentacion/redes/diagnostico/diagnosticar_conectividad.md) | Comprobación de conexión. |
| Diagnóstico | [Diagnosticar rutas](documentacion/redes/diagnostico/diagnosticar_rutas.md) | Análisis de rutas. |
| DHCP | [Teoría de DHCP](documentacion/redes/dhcp/teoria_dhcp.md) | ISC DHCP: concepto y configuración. |
| DHCP | [DHCP *failover*](documentacion/redes/dhcp/failover/teoria_dhcp_failover.md) | Alta disponibilidad con ISC. |
| DHCP | [Kea](documentacion/redes/dhcp/kea/teoria_kea.md) | Servidor DHCP moderno. |
| DHCP | [Kea *failover*](documentacion/redes/dhcp/kea/failover/teoria_kea_failover.md) | Alta disponibilidad con Kea. |
| DHCP | [Ficheros de configuración](documentacion/redes/dhcp/configuracion/) | `dhcpd.conf` y Netplan de ambos servidores. |
| DNS | [Teoría de DNS](documentacion/redes/dns/teoria_dns.md) | Jerarquía y resolución. |
| DNS | [Diagnosticar DNS](documentacion/redes/dns/diagnosticar_dns.md) | Resolución de problemas. |
| DNS | [BIND9](documentacion/redes/dns/bind9/teoria_bind9.md) | Servidor autoritativo. |
| DNS | [DDNS en BIND9](documentacion/redes/dns/bind9/dinamico/procedimiento.md) | Actualizaciones dinámicas. |
| DNS | [Zonas y configuración BIND9](documentacion/redes/dns/bind9/) | Zonas directa/inversa, maestro y esclavo. |
| FTP | [Teoría de FTP](documentacion/redes/ftp/teoria_ftp.md) | Protocolo y modos. |
| NFS | [Teoría de NFS](documentacion/redes/nfs/teoria_nfs.md) | Recursos compartidos en red; ver también [`exports`](documentacion/redes/nfs/exports) y [`fstab`](documentacion/redes/nfs/fstab). |
| Samba | [General de Samba](documentacion/redes/samba/general_samba.md) | Compartición con Windows; ver [`smb.conf`](documentacion/redes/samba/smb.conf). |
| SSH | [Teoría de SSH](documentacion/redes/ssh/teoria_ssh.md) | Acceso remoto seguro. |

### Seguridad

| Tema | Documento | Contenido |
| --- | --- | --- |
| General | [Teoría de seguridad](documentacion/seguridad/teoria_seguridad.md) | Principios y conceptos. |
| Autenticación | [libpam-passwdqc](documentacion/seguridad/autenticacion/libpam-passwdqc.md) | Política de contraseñas. |
| Criptografía | [Cifrado](documentacion/seguridad/criptografia/cifrado/teoria_cifrado.md) | Simétrico y asimétrico. |
| Criptografía | [Hash](documentacion/seguridad/criptografia/hash/teoria_hash.md) | Funciones resumen e integridad. |
| Criptografía | [Firma digital](documentacion/seguridad/criptografia/firma_digital/teoria_firma_digital.md) | Fundamentos. |
| Criptografía | [Firma SSL](documentacion/seguridad/criptografia/firma_digital/firma_ssl.md) | Aplicación práctica. |
| Criptografía | [Certificado RSA con OpenSSL](documentacion/seguridad/criptografia/certificados/certificado_rsa_openssl.md) | Generación de certificados. |
| Criptografía | [Entidad certificadora](documentacion/seguridad/criptografia/certificados/entidad_certificadora.sh) | Script de CA. |
| Cortafuegos | [iptables](documentacion/seguridad/firewall/iptables/teoria_iptables.md) | Reglas y cadenas. |
| Cortafuegos | [UFW](documentacion/seguridad/firewall/ufw/teoria_ufw.md) | Cortafuegos simplificado. |
| Cortafuegos | [nftables](documentacion/seguridad/firewall/nftables/nftables.conf) | Configuración de ejemplo. |
| Forense | [Teoría forense](documentacion/seguridad/forense/teoria_forense.md) | Metodología. |
| Forense | [Planificación de auditoría](documentacion/seguridad/forense/auditoria/audit_planning.md) | Auditoría con `auditd`. |
| Forense | [Foremost](documentacion/seguridad/forense/herramientas/foremost.md) | Recuperación de archivos. |
| Forense | [Definición de datos](documentacion/seguridad/forense/herramientas/datadefinition.md) | Conceptos de datos. |
| Forense | [Logrotate](documentacion/seguridad/forense/herramientas/logrotate.md) | Rotación de registros. |
| OSINT | `seguridad/osint/` | En preparación. |

### Servicios

| Tema | Documento | Contenido |
| --- | --- | --- |
| Web | [Apache2](documentacion/servicios/web/apache2/teoria_apache2.md) | Servidor web. |
| Web | [Nginx](documentacion/servicios/web/nginx/teoria_nginx.md) | Servidor web y proxy inverso. |
| Sistema | [Cron](documentacion/servicios/sistema/cron/teoria_cron.md) | Tareas programadas. |
| Sistema | [Journal](documentacion/servicios/sistema/journal/teoria_journal.md) | Registros con `journald`. |
| Sistema | [Diagnosticar systemd](documentacion/servicios/sistema/systemd/diagnosticar_systemd.md) | Resolución de problemas. |
| Sistema | [Ejemplo de unidad](documentacion/servicios/sistema/systemd/ejemplo.service) | Fichero `.service` de ejemplo. |

### Infraestructura

| Tema | Documento | Contenido |
| --- | --- | --- |
| Virtualización | [Máquinas virtuales](documentacion/infraestructura/virtualizacion/teoria_mv.md) | Conceptos básicos. |
| Virtualización | [Hipervisores](documentacion/infraestructura/virtualizacion/teoria_hipervisor.md) | Tipo 1 y tipo 2. |
| Virtualización | [Proxmox](documentacion/infraestructura/virtualizacion/teoria_proxmox.md) | Plataforma de virtualización. |
| Virtualización | [VirtualBox](documentacion/infraestructura/virtualizacion/teoria_virtualbox.md) | Hipervisor de escritorio. |
| Virtualización | [Hyper-V](documentacion/infraestructura/virtualizacion/teoria_hyper-v.md) | Hipervisor de Microsoft. |
| Contenedores | [Docker: teoría](documentacion/infraestructura/contenedores/docker/teoria_docker.md) | Conceptos. |
| Contenedores | [Docker: instalación](documentacion/infraestructura/contenedores/docker/instalacion.md) | Puesta en marcha. |
| Contenedores | [Kubernetes](documentacion/infraestructura/contenedores/kubernetes/teoria_kubernetes.md) | Orquestación. |
| Contenedores | [LXC](documentacion/infraestructura/contenedores/lxc/teoria_lxc.md) | Contenedores de sistema. |
| Copias de seguridad | [Borg](documentacion/infraestructura/copias_seguridad/borg/teoria_borg.md) | Backups deduplicados. |

### Bases de datos

MySQL / MariaDB, en orden de lectura recomendado:

1. [Fundamentos](documentacion/bases_de_datos/mysql_mariadb/fundamentos.md)
2. [Instalación y servicio](documentacion/bases_de_datos/mysql_mariadb/instalacion_y_servicio.md)
3. [Configuración del servidor](documentacion/bases_de_datos/mysql_mariadb/configuracion_servidor.md)
4. [Bases y tablas](documentacion/bases_de_datos/mysql_mariadb/bases_y_tablas.md)
5. [Consultas y funciones](documentacion/bases_de_datos/mysql_mariadb/consultas_y_funciones.md)
6. [Joins y uniones](documentacion/bases_de_datos/mysql_mariadb/joins_y_uniones.md)
7. [Usuarios y permisos](documentacion/bases_de_datos/mysql_mariadb/usuarios_y_permisos.md)
8. [Seguridad](documentacion/bases_de_datos/mysql_mariadb/seguridad.md)
9. [Transacciones y concurrencia](documentacion/bases_de_datos/mysql_mariadb/transacciones_y_concurrencia.md)
10. [Metadatos y caché de consultas](documentacion/bases_de_datos/mysql_mariadb/metadatos_y_cache_de_consultas.md)
11. [Copias de seguridad y recuperación](documentacion/bases_de_datos/mysql_mariadb/copias_seguridad_y_recuperacion.md)

Scripts SQL: [`declaracion`](documentacion/bases_de_datos/mysql_mariadb/sql/declaracion.sql) · [`condicionales`](documentacion/bases_de_datos/mysql_mariadb/sql/condicionales.sql) · [`funciones`](documentacion/bases_de_datos/mysql_mariadb/sql/funciones.sql) · [`delimitador`](documentacion/bases_de_datos/mysql_mariadb/sql/delimitador.sql)

### Programación

| Tema | Documento | Contenido |
| --- | --- | --- |
| Conceptos | [Introducción](documentacion/programacion/conceptos/introduccion.md) | Fundamentos de programación. |
| Bash | [Comentarios](documentacion/programacion/bash/comentarios.sh) · [Input](documentacion/programacion/bash/input.sh) · [Operadores aritméticos](documentacion/programacion/bash/operadores_aritmeticos.sh) | Sintaxis básica. |
| Bash | [Condiciones](documentacion/programacion/bash/condiciones_evaluacion.sh) · [Control de flujo](documentacion/programacion/bash/control_flujo.sh) · [Devolución](documentacion/programacion/bash/devolucion.sh) | Lógica y funciones. |
| PHP | [Comentarios](documentacion/programacion/php/comentarios.php) · [Variables](documentacion/programacion/php/variables.php) · [Concatenación](documentacion/programacion/php/concatenacion.php) | Sintaxis básica. |
| PHP | [Condicionales](documentacion/programacion/php/condicionales.php) · [Conversión](documentacion/programacion/php/conversion.php) | Lógica y tipos. |

## LinuxCore.site

[![Vista previa de LinuxCore Web | Comandos y Distribuciones](.github/media/linuxcore-site-preview.GIF)](https://linuxcore.site/)
<p align="center">
  <a href="https://linuxcore.site/">
    <img src="https://img.shields.io/badge/Abrir_LinuxCore_Web-ffffff?style=flat&logoColor=0969da&labelColor=ffffff&color=0969da" alt="Abrir LinuxCore Web" />
  </a>
</p>

## Colaboradores

<div align="center">
  <a href="https://github.com/nisamov/linuxcore/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=Nisamov/linuxcore" alt="Contribuyentes de LinuxCore" />
  </a>
</div>

**¿Deseas contribuir?**  
Este proyecto nace con fines de aprendizaje y referencia técnica. Si encuentras alguna errata, quieres corregir un procedimiento o añadir nuevo contenido, ¡las contribuciones son más que bienvenidas! Abre un [Issue](https://github.com/nisamov/linuxcore/issues) o envía un [Pull Request](https://github.com/nisamov/linuxcore/pulls).

<div align="center">
  <p><b>Linux Core - Nisamov | MIT License - 2026</b></p>
  <p><b>Contacto:</b> <a href="mailto:nisamov.contact@gmail.com">nisamov.contact@gmail.com</a></p>
  <p align="center">
    <img src=".github/media/bottom.png" alt="LinuxCore Footer" width="100%">
  </p>
</div>