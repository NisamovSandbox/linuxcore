<p align="center">
  <img src=".github/media/top.png" alt="LinuxCore Header" width="100%">
</p>

<div align="center">

# Linux Core

[![MIT License](https://img.shields.io/github/license/nisamov/linuxcore?style=flat-square&color=0969da)](LICENSE) [![Website](https://img.shields.io/badge/website-linuxcore.site-0969da?style=flat-square)](https://linuxcore.site/) [![DB Build](https://img.shields.io/github/actions/workflow/status/nisamov/linuxcore/commands_db_gen.yaml?style=flat-square&color=0969da&label=db%20build)](https://github.com/nisamov/linuxcore/actions) [![Last Commit](https://img.shields.io/github/last-commit/nisamov/linuxcore?style=flat-square&color=0969da)](https://github.com/nisamov/linuxcore/commits)

**Documentación y fundamentos de informática en Español**

</div>

> [!IMPORTANT]
> **Repositorio en desarrollo activo:** La estructura de carpetas y la documentación están sujetas a cambios.

## Descripción del Proyecto

**LinuxCore** es un repositorio creado a raíz de su predecesor [LinuxCommands](https://github.com/nisamov/LinuxCommands), con el fin de consolidar años de experiencia en sistemas Linux, arquitectura de computadores, prácticas de seguridad e infraestructuras modernas.

El objetivo es proporcionar el contexto técnico necesario para comprender no solo cómo utilizar una herramienta, servicio o protocolo, sino también el porqué de su funcionamiento y en qué escenarios debe aplicarse.

El contenido se desarrolla en español y está orientado tanto al aprendizaje estructurado como a la consulta técnica rápida.

> [!NOTE]
> **Base de datos exportable**
> El proyecto distribuye la referencia de comandos y distribuciones en formato **JSON**, optimizada para alimentar el sitio web **[linuxcore.site](https://linuxcore.site)**. 
>
> __Descargar la última versión compilada:__ [![Latest Release](https://img.shields.io/github/v/release/nisamov/linuxcore?display_name=release&style=flat-square&color=0969da&label=release)](https://github.com/nisamov/linuxcore/releases/latest)

## Estructura de Contenidos

## Estructura de Contenidos

| Directorio | Propósito | Contenido destacado |
| --- | --- | --- |
| **`datos/`** | Base de datos en JSON que alimenta [linuxcore.site](https://linuxcore.site). | `comandos/` (+400 utilidades y *one-liners*), `distribuciones/` y fichas de servicios (MariaDB, PostgreSQL, Redis). |
| **`documentacion/sistema/`** | Fundamentos del sistema operativo y del hardware. | Teoría de Linux, permisos y ACLs, procesos (zombies, CPU), discos, particiones, RAID, RAM. |
| **`documentacion/redes/`** | Protocolos y servicios de red, con teoría, configuración y diagnóstico juntos. | DHCP/Kea (*failover*), DNS/BIND9 (incluido DDNS), NFS, Samba, SSH, FTP, topologías, puertos, ARP, ICMP. |
| **`documentacion/seguridad/`** | Criptografía, protección de sistemas y análisis forense. | Hash, cifrado, firma digital, certificados RSA/SSL, iptables, UFW, nftables, auditoría con `auditd`, `foremost`. |
| **`documentacion/servicios/`** | Demonios y servicios locales del sistema. | Apache, Nginx, Cron, Journald, systemd. |
| **`documentacion/infraestructura/`** | Virtualización y contenedores. | Hipervisores, Proxmox, VirtualBox, Hyper-V, Docker, Kubernetes, LXC, Borg. |
| **`documentacion/bases_de_datos/`** | Administración y lenguaje SQL de bases de datos relacionales. | MySQL/MariaDB: instalación, usuarios, *joins*, transacciones, copias de seguridad, ejercicios y scripts SQL. |
| **`documentacion/programacion/`** | Scripting y lenguajes web. | Bash y PHP: sintaxis, control de flujo y ejercicios. |
| **`scripts/`** | Herramientas del proyecto (CI). | Generación y validación de la BD, validación de Markdown, detección de secretos. |

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