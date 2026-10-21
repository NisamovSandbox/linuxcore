<p align="center">
  <img src=".github/media/top.png" alt="LinuxCore Header" width="100%">
</p>

<div align="center">

# Linux Core

[![MIT License](https://img.shields.io/github/license/nisamov/linuxcore?style=flat-square&color=0969da)](LICENSE) [![Website](https://img.shields.io/badge/website-linuxcore.site-0969da?style=flat-square)](https://linuxcore.site/) [![DB Build](https://img.shields.io/github/actions/workflow/status/nisamov/linuxcore/commands_db_gen.yaml?style=flat-square&color=0969da&label=db%20build)](https://github.com/nisamov/linuxcore/actions) [![Last Commit](https://img.shields.io/github/last-commit/nisamov/linuxcore?style=flat-square&color=0969da)](https://github.com/nisamov/linuxcore/commits)[![Views](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnisamov%2Flinuxcore&count_bg=%230969DA&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=views&edge_flat=true)](https://github.com/nisamov/linuxcore)

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

## Estructura de Contenidos

### Sistema

<table border="1">
    <thead>
        <tr>
            <th>Tema</th>
            <th>Documento</th>
            <th>Contenido</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Linux</td>
            <td><a href="documentacion/sistema/linux/teoria_linux.md">Teoría de Linux</a></td>
            <td>Fundamentos del sistema operativo.</td>
        </tr>
        <tr>
            <td>Linux</td>
            <td><a href="documentacion/sistema/linux/linus_torvalds.md">Linus Torvalds</a></td>
            <td>Origen y contexto histórico.</td>
        </tr>
        <tr>
            <td>Permisos</td>
            <td><a href="documentacion/sistema/permisos/permisos_archivos_directorios.md">Permisos de archivos y directorios</a></td>
            <td>Modelo clásico <code>rwx</code>, propietarios y grupos.</td>
        </tr>
        <tr>
            <td>Permisos</td>
            <td><a href="documentacion/sistema/permisos/listas_acceso.md">Listas de control de acceso</a></td>
            <td>ACLs con <code>getfacl</code> / <code>setfacl</code>.</td>
        </tr>
        <tr>
            <td>Procesos</td>
            <td><a href="documentacion/sistema/procesos/teoria_de_procesos.md">Teoría de procesos</a></td>
            <td>Ciclo de vida, estados y señales.</td>
        </tr>
        <tr>
            <td>Procesos</td>
            <td><a href="documentacion/sistema/procesos/proceso_zombie.md">Proceso zombie</a></td>
            <td>Qué son y cómo tratarlos.</td>
        </tr>
        <tr>
            <td>Procesos</td>
            <td><a href="documentacion/sistema/procesos/proceso_consumiendo_cpu.md">Proceso consumiendo CPU</a></td>
            <td>Diagnóstico de uso excesivo de CPU.</td>
        </tr>
        <tr>
            <td>Almacenamiento</td>
            <td><a href="documentacion/sistema/almacenamiento/teoria_almacenamiento.md">Teoría de almacenamiento</a></td>
            <td>Conceptos generales.</td>
        </tr>
        <tr>
            <td>Almacenamiento</td>
            <td><a href="documentacion/sistema/almacenamiento/teoria_discos_particiones.md">Discos y particiones</a></td>
            <td>Tablas de particiones y sistemas de archivos.</td>
        </tr>
        <tr>
            <td>Almacenamiento</td>
            <td><a href="documentacion/sistema/almacenamiento/ampliar_particion.md">Ampliar una partición</a></td>
            <td>Procedimiento paso a paso.</td>
        </tr>
        <tr>
            <td>Almacenamiento</td>
            <td><a href="documentacion/sistema/almacenamiento/reemplazar_disco.md">Reemplazar un disco</a></td>
            <td>Sustitución de disco.</td>
        </tr>
        <tr>
            <td>Almacenamiento</td>
            <td><a href="documentacion/sistema/almacenamiento/recuperar_sistema_archivos.md">Recuperar sistema de archivos</a></td>
            <td>Reparación y recuperación.</td>
        </tr>
        <tr>
            <td>RAID</td>
            <td><a href="documentacion/sistema/almacenamiento/raid/teoria_raid.md">Teoría de RAID</a></td>
            <td>Niveles y casos de uso.</td>
        </tr>
        <tr>
            <td>RAID</td>
            <td><a href="documentacion/sistema/almacenamiento/raid/raid1.md">RAID 1</a></td>
            <td>Montaje práctico.</td>
        </tr>
        <tr>
            <td>RAID</td>
            <td><a href="documentacion/sistema/almacenamiento/raid/raid_compressed.md">RAID (versión compacta)</a></td>
            <td>Resumen rápido.</td>
        </tr>
        <tr>
            <td>Hardware</td>
            <td><a href="documentacion/sistema/hardware/ram.md">RAM</a></td>
            <td>Funcionamiento y tipos de memoria.</td>
        </tr>
    </tbody>
</table>

### Redes

<table border="1">
    <thead>
        <tr>
            <th>Tema</th>
            <th>Documento</th>
            <th>Contenido</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Fundamentos</td>
            <td><a href="documentacion/redes/fundamentos/topologia_redes.md">Topología de redes</a></td>
            <td>Tipos de topología.</td>
        </tr>
        <tr>
            <td>Fundamentos</td>
            <td><a href="documentacion/redes/fundamentos/teoria_puertos.md">Puertos</a></td>
            <td>Puertos y servicios asociados.</td>
        </tr>
        <tr>
            <td>Fundamentos</td>
            <td><a href="documentacion/redes/fundamentos/arp.md">ARP</a></td>
            <td>Resolución de direcciones.</td>
        </tr>
        <tr>
            <td>Fundamentos</td>
            <td><a href="documentacion/redes/fundamentos/ttl_icmp.md">TTL e ICMP</a></td>
            <td>Funcionamiento de <code>ping</code> y <code>traceroute</code>.</td>
        </tr>
        <tr>
            <td>Diagnóstico</td>
            <td><a href="documentacion/redes/diagnostico/diagnosticar_conectividad.md">Diagnosticar conectividad</a></td>
            <td>Comprobación de conexión.</td>
        </tr>
        <tr>
            <td>Diagnóstico</td>
            <td><a href="documentacion/redes/diagnostico/diagnosticar_rutas.md">Diagnosticar rutas</a></td>
            <td>Análisis de rutas.</td>
        </tr>
        <tr>
            <td>DHCP</td>
            <td><a href="documentacion/redes/dhcp/teoria_dhcp.md">Teoría de DHCP</a></td>
            <td>ISC DHCP: concepto y configuración.</td>
        </tr>
        <tr>
            <td>DHCP</td>
            <td><a href="documentacion/redes/dhcp/failover/teoria_dhcp_failover.md">DHCP <em>failover</em></a></td>
            <td>Alta disponibilidad con ISC.</td>
        </tr>
        <tr>
            <td>DHCP</td>
            <td><a href="documentacion/redes/dhcp/kea/teoria_kea.md">Kea</a></td>
            <td>Servidor DHCP moderno.</td>
        </tr>
        <tr>
            <td>DHCP</td>
            <td><a href="documentacion/redes/dhcp/kea/failover/teoria_kea_failover.md">Kea <em>failover</em></a></td>
            <td>Alta disponibilidad con Kea.</td>
        </tr>
        <tr>
            <td>DHCP</td>
            <td><a href="documentacion/redes/dhcp/configuracion/">Ficheros de configuración</a></td>
            <td><code>dhcpd.conf</code> y Netplan de ambos servidores.</td>
        </tr>
        <tr>
            <td>DNS</td>
            <td><a href="documentacion/redes/dns/teoria_dns.md">Teoría de DNS</a></td>
            <td>Jerarquía y resolución.</td>
        </tr>
        <tr>
            <td>DNS</td>
            <td><a href="documentacion/redes/dns/diagnosticar_dns.md">Diagnosticar DNS</a></td>
            <td>Resolución de problemas.</td>
        </tr>
        <tr>
            <td>DNS</td>
            <td><a href="documentacion/redes/dns/bind9/teoria_bind9.md">BIND9</a></td>
            <td>Servidor autoritativo.</td>
        </tr>
        <tr>
            <td>DNS</td>
            <td><a href="documentacion/redes/dns/bind9/dinamico/procedimiento.md">DDNS en BIND9</a></td>
            <td>Actualizaciones dinámicas.</td>
        </tr>
        <tr>
            <td>DNS</td>
            <td><a href="documentacion/redes/dns/bind9/">Zonas y configuración BIND9</a></td>
            <td>Zonas directa/inversa, maestro y esclavo.</td>
        </tr>
        <tr>
            <td>FTP</td>
            <td><a href="documentacion/redes/ftp/teoria_ftp.md">Teoría de FTP</a></td>
            <td>Protocolo y modos.</td>
        </tr>
        <tr>
            <td>NFS</td>
            <td><a href="documentacion/redes/nfs/teoria_nfs.md">Teoría de NFS</a></td>
            <td>Recursos compartidos en red; ver también <a href="documentacion/redes/nfs/exports"><code>exports</code></a> y <a href="documentacion/redes/nfs/fstab"><code>fstab</code></a>.</td>
        </tr>
        <tr>
            <td>Samba</td>
            <td><a href="documentacion/redes/samba/general_samba.md">General de Samba</a></td>
            <td>Compartición con Windows; ver <a href="documentacion/redes/samba/smb.conf"><code>smb.conf</code></a>.</td>
        </tr>
        <tr>
            <td>SSH</td>
            <td><a href="documentacion/redes/ssh/teoria_ssh.md">Teoría de SSH</a></td>
            <td>Acceso remoto seguro.</td>
        </tr>
        <tr>
            <td>SSH</td>
            <td><a href="documentacion/redes/ssh/diagnosticar_ssh.md">Diagnosticar SSH</a></td>
            <td>Resolución de problemas.</td>
        </tr>
    </tbody>
</table>

### Seguridad

<table border="1">
    <thead>
        <tr>
            <th>Tema</th>
            <th>Documento</th>
            <th>Contenido</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>General</td>
            <td><a href="documentacion/seguridad/teoria_seguridad.md">Teoría de seguridad</a></td>
            <td>Principios y conceptos.</td>
        </tr>
        <tr>
            <td>Autenticación</td>
            <td><a href="documentacion/seguridad/autenticacion/libpam-passwdqc.md">libpam-passwdqc</a></td>
            <td>Política de contraseñas.</td>
        </tr>
        <tr>
            <td>Criptografía</td>
            <td><a href="documentacion/seguridad/criptografia/cifrado/teoria_cifrado.md">Cifrado</a></td>
            <td>Simétrico y asimétrico.</td>
        </tr>
        <tr>
            <td>Criptografía</td>
            <td><a href="documentacion/seguridad/criptografia/hash/teoria_hash.md">Hash</a></td>
            <td>Funciones resumen e integridad.</td>
        </tr>
        <tr>
            <td>Criptografía</td>
            <td><a href="documentacion/seguridad/criptografia/firma_digital/teoria_firma_digital.md">Firma digital</a></td>
            <td>Fundamentos.</td>
        </tr>
        <tr>
            <td>Criptografía</td>
            <td><a href="documentacion/seguridad/criptografia/firma_digital/firma_ssl.md">Firma SSL</a></td>
            <td>Aplicación práctica.</td>
        </tr>
        <tr>
            <td>Criptografía</td>
            <td><a href="documentacion/seguridad/criptografia/certificados/certificado_rsa_openssl.md">Certificado RSA con OpenSSL</a></td>
            <td>Generación de certificados.</td>
        </tr>
        <tr>
            <td>Criptografía</td>
            <td><a href="documentacion/seguridad/criptografia/certificados/entidad_certificadora.sh">Entidad certificadora</a></td>
            <td>Script de CA.</td>
        </tr>
        <tr>
            <td>Cortafuegos</td>
            <td><a href="documentacion/seguridad/firewall/iptables/teoria_iptables.md">iptables</a></td>
            <td>Reglas y cadenas.</td>
        </tr>
        <tr>
            <td>Cortafuegos</td>
            <td><a href="documentacion/seguridad/firewall/ufw/teoria_ufw.md">UFW</a></td>
            <td>Cortafuegos simplificado.</td>
        </tr>
        <tr>
            <td>Cortafuegos</td>
            <td><a href="documentacion/seguridad/firewall/nftables/nftables.conf">nftables</a></td>
            <td>Configuración de ejemplo.</td>
        </tr>
        <tr>
            <td>Forense</td>
            <td><a href="documentacion/seguridad/forense/teoria_forense.md">Teoría forense</a></td>
            <td>Metodología.</td>
        </tr>
        <tr>
            <td>Forense</td>
            <td><a href="documentacion/seguridad/forense/auditoria/audit_planning.md">Planificación de auditoría</a></td>
            <td>Auditoría con <code>auditd</code>.</td>
        </tr>
        <tr>
            <td>Forense</td>
            <td><a href="documentacion/seguridad/forense/herramientas/foremost.md">Foremost</a></td>
            <td>Recuperación de archivos.</td>
        </tr>
        <tr>
            <td>Forense</td>
            <td><a href="documentacion/seguridad/forense/herramientas/datadefinition.md">Definición de datos</a></td>
            <td>Conceptos de datos.</td>
        </tr>
        <tr>
            <td>Forense</td>
            <td><a href="documentacion/seguridad/forense/herramientas/logrotate.md">Logrotate</a></td>
            <td>Rotación de registros.</td>
        </tr>
        <tr>
            <td>Ofensiva</td>
            <td><code>seguridad/ofensiva/</code></td>
            <td>En preparación.</td>
        </tr>
        <tr>
            <td>OSINT</td>
            <td><code>seguridad/osint/</code></td>
            <td>En preparación.</td>
        </tr>
    </tbody>
</table>

### Servicios

<table border="1">
    <thead>
        <tr>
            <th>Tema</th>
            <th>Documento</th>
            <th>Contenido</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Web</td>
            <td><a href="documentacion/servicios/web/apache2/teoria_apache2.md">Apache2</a></td>
            <td>Servidor web.</td>
        </tr>
        <tr>
            <td>Web</td>
            <td><a href="documentacion/servicios/web/nginx/teoria_nginx.md">Nginx</a></td>
            <td>Servidor web y proxy inverso.</td>
        </tr>
        <tr>
            <td>Sistema</td>
            <td><a href="documentacion/servicios/sistema/cron/teoria_cron.md">Cron</a></td>
            <td>Tareas programadas.</td>
        </tr>
        <tr>
            <td>Sistema</td>
            <td><a href="documentacion/servicios/sistema/journal/teoria_journal.md">Journal</a></td>
            <td>Registros con <code>journald</code>.</td>
        </tr>
        <tr>
            <td>Sistema</td>
            <td><a href="documentacion/servicios/sistema/systemd/diagnosticar_systemd.md">Diagnosticar systemd</a></td>
            <td>Resolución de problemas.</td>
        </tr>
        <tr>
            <td>Sistema</td>
            <td><a href="documentacion/servicios/sistema/systemd/ejemplo.service">Ejemplo de unidad</a></td>
            <td>Fichero <code>.service</code> de ejemplo.</td>
        </tr>
    </tbody>
</table>

### Infraestructura

<table border="1">
    <thead>
        <tr>
            <th>Tema</th>
            <th>Documento</th>
            <th>Contenido</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Virtualización</td>
            <td><a href="documentacion/infraestructura/virtualizacion/teoria_mv.md">Máquinas virtuales</a></td>
            <td>Conceptos básicos.</td>
        </tr>
        <tr>
            <td>Virtualización</td>
            <td><a href="documentacion/infraestructura/virtualizacion/teoria_hipervisor.md">Hipervisores</a></td>
            <td>Tipo 1 y tipo 2.</td>
        </tr>
        <tr>
            <td>Virtualización</td>
            <td><a href="documentacion/infraestructura/virtualizacion/teoria_proxmox.md">Proxmox</a></td>
            <td>Plataforma de virtualización.</td>
        </tr>
        <tr>
            <td>Virtualización</td>
            <td><a href="documentacion/infraestructura/virtualizacion/teoria_virtualbox.md">VirtualBox</a></td>
            <td>Hipervisor de escritorio.</td>
        </tr>
        <tr>
            <td>Virtualización</td>
            <td><a href="documentacion/infraestructura/virtualizacion/teoria_hyper-v.md">Hyper-V</a></td>
            <td>Hipervisor de Microsoft.</td>
        </tr>
        <tr>
            <td>Contenedores</td>
            <td><a href="documentacion/infraestructura/contenedores/docker/teoria_docker.md">Docker: teoría</a></td>
            <td>Conceptos.</td>
        </tr>
        <tr>
            <td>Contenedores</td>
            <td><a href="documentacion/infraestructura/contenedores/docker/instalacion.md">Docker: instalación</a></td>
            <td>Puesta en marcha.</td>
        </tr>
        <tr>
            <td>Contenedores</td>
            <td><a href="documentacion/infraestructura/contenedores/kubernetes/teoria_kubernetes.md">Kubernetes</a></td>
            <td>Orquestación.</td>
        </tr>
        <tr>
            <td>Contenedores</td>
            <td><a href="documentacion/infraestructura/contenedores/lxc/teoria_lxc.md">LXC</a></td>
            <td>Contenedores de sistema.</td>
        </tr>
        <tr>
            <td>Copias de seguridad</td>
            <td><a href="documentacion/infraestructura/contenedores/borg/teoria_borg.md">Borg</a></td>
            <td>Backups deduplicados.</td>
        </tr>
    </tbody>
</table>

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

<table border="1">
    <thead>
        <tr>
            <th>Tema</th>
            <th>Documento</th>
            <th>Contenido</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Conceptos</td>
            <td><a href="documentacion/programacion/conceptos/introduccion.md">Introducción</a></td>
            <td>Fundamentos de programación.</td>
        </tr>
        <tr>
            <td>Bash</td>
            <td><a href="documentacion/programacion/bash/comentarios.sh">Comentarios</a> · <a href="documentacion/programacion/bash/input.sh">Input</a> · <a href="documentacion/programacion/bash/operadores_aritmeticos.sh">Operadores aritméticos</a></td>
            <td>Sintaxis básica.</td>
        </tr>
        <tr>
            <td>Bash</td>
            <td><a href="documentacion/programacion/bash/condiciones_evaluacion.sh">Condiciones</a> · <a href="documentacion/programacion/bash/control_flujo.sh">Control de flujo</a> · <a href="documentacion/programacion/bash/devolucion.sh">Devolución</a></td>
            <td>Lógica y funciones.</td>
        </tr>
        <tr>
            <td>PHP</td>
            <td><a href="documentacion/programacion/php/comentarios.php">Comentarios</a> · <a href="documentacion/programacion/php/variables.php">Variables</a> · <a href="documentacion/programacion/php/concatenacion.php">Concatenación</a></td>
            <td>Sintaxis básica.</td>
        </tr>
        <tr>
            <td>PHP</td>
            <td><a href="documentacion/programacion/php/condicionales.php">Condicionales</a> · <a href="documentacion/programacion/php/conversion.php">Conversión</a></td>
            <td>Lógica y tipos.</td>
        </tr>
    </tbody>
</table>

## LinuxCore.site
[![Vista previa de LinuxCore Web | Comandos y Distribuciones](.github/media/linuxcore-site-preview.GIF)](https://linuxcore.site/)
<p align="center">
  <a href="https://linuxcore.site/">
    <strong>Abrir LinuxCore Web</strong>
  </a>
</p>

## Colaboradores

<div align="center">
  <a href="https://github.com/nisamov/linuxcore/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=nisamov/linuxcore" alt="Contribuyentes de LinuxCore" />
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