# Teoría General de NFS (Network File System)

## Configuración del Servidor y Cliente

### Instalación de paquetes en el equipo servidor

```sh
sudo apt update
sudo apt install nfs-kernel-server rpcbind
```

### Instalación de paquetes en el equipo cliente

```sh
sudo apt update
sudo apt install nfs-common
```

### Edición de configuración en el equipo servidor (`/etc/exports`)

Añadir las rutas y reglas de acceso en el archivo `/etc/exports`:

```conf
/home/ejemplo/carpeta1 192.168.10.10(rw,sync,no_subtree_check,no_root_squash)
/home/ejemplo/carpeta2 *(ro,sync,no_subtree_check,no_root_squash)
```

### Aplicar cambios de configuración y reiniciar servicio

Para exportar los directorios compartidos sin necesidad de reinicios innecesarios o verificar errores:

```sh
# Exportar/actualizar todas las rutas del archivo /etc/exports
sudo exportfs -ra

# Reiniciar o recargar el servicio servidor NFS
sudo systemctl restart nfs-kernel-server
```

## Configuraciones y Sintaxis de NFS

Dentro del fichero `/etc/exports` se definen las rutas absolutas que se van a compartir, así como los equipos autorizados y sus permisos de acceso.

### Sintaxis básica:

```conf
/ruta/absoluta equipo_cliente(permiso1,permiso2,...)
```

### Formato del parámetro `equipo_cliente`:

* **IP individual:** `192.168.10.10`
* **Rango de red (Notación CIDR):** `192.168.10.0/24`
* **Uso de comodines:** `192.168.10.*` o `*.mi-dominio.com`
* **Todos los equipos:** `*`

## Tabla de Parámetros y Opciones de Permisos

| **Permiso** | **Descripción** |
| --- | --- |
| `rw` | Permite lectura y escritura. |
| `ro` | Permite solo lectura (opción por defecto). |
| `root_squash` | Asigna las peticiones del usuario `root` del cliente a un usuario anónimo (habitualmente `nobody`). Previene accesos no autorizados con privilegios elevados. |
| `no_root_squash` | Mantiene los privilegios del usuario `root` del cliente en el servidor (usar con precaución). |
| `sync` | Fuerza al servidor a responder a las peticiones solo tras escribir los cambios en el disco (más seguro). |
| `async` | Permite responder antes de escribir en disco. Mejora el rendimiento, pero hay riesgo de corrupción de datos si hay un corte eléctrico. |
| `no_subtree_check` | Desactiva la comprobación de subárboles. Mejora la estabilidad y el rendimiento cuando se comparten subdirectorios (recomendado). |
| `subtree_check` | Fuerza la verificación de subárboles. Comprueba si el archivo está en un subdirectorio exportado. |
| `wdelay` | El servidor retrasa la escritura en disco si prevé otra solicitud de escritura inminente (activo por defecto). |
| `no_wdelay` | Desactiva el retraso de escritura; escribe inmediatamente en disco (útil si `async` está activado). |
| `anonuid=UID` | Establece de forma explícita el UID (User ID) asignado a las conexiones anónimas. |
| `anongid=GID` | Establece de forma explícita el GID (Group ID) asignado a las conexiones anónimas. |
