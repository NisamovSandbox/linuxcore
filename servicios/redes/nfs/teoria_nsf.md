# Teoría General y Administración de Permisos en NFS (Network File System)

## Instalación de paquetes

**En el equipo servidor:**

```sh
sudo apt update
sudo apt install nfs-kernel-server rpcbind
```

**En el equipo cliente:**

```sh
sudo apt update
sudo apt install nfs-common
```

## Edición de configuración en el equipo servidor (`/etc/exports`)

Dentro del fichero `/etc/exports` se definen las rutas absolutas que se van a compartir, así como los equipos autorizados y sus permisos de acceso.

**Sintaxis básica:**

```conf
/ruta/absoluta equipo_cliente(permisoA,permisoB,...)
```

**Formato del parámetro `equipo_cliente`:**

* **IP individual:** `192.168.10.10`
* **Rango de red (Notación CIDR):** `192.168.10.0/24`
* **Uso de comodines:** `192.168.10.*` o `*.mi-dominio.com`
* **Todos los equipos:** `*`

**Ejemplo de configuración:**

```conf
/home/ejemplo/carpeta1 192.168.10.10(rw,sync,no_subtree_check,no_root_squash)
/home/ejemplo/carpeta2 *(ro,sync,no_subtree_check,no_root_squash)
```

## Aplicar cambios y reiniciar servicio

Para exportar los directorios compartidos o actualizar reglas sin necesidad de reiniciar completamente el servidor, o para verificar errores de sintaxis:

```sh
# Exportar/actualizar todas las rutas del archivo /etc/exports
sudo exportfs -ra

# Ver lo que se está exportando activamente
sudo exportfs -v

# Reiniciar o recargar el servicio servidor NFS (solo si hay cambios profundos)
sudo systemctl restart nfs-kernel-server
```

## Tabla de Parámetros y Opciones de Permisos

| Permiso | Descripción |
| --- | --- |
| `rw` | Permite lectura y escritura. |
| `ro` | Permite solo lectura (opción por defecto). |
| `root_squash` | Asigna las peticiones del usuario `root` del cliente a un usuario anónimo (habitualmente `nobody`). Previene accesos no autorizados con privilegios elevados. |
| `no_root_squash` | Mantiene los privilegios del usuario `root` del cliente en el servidor (usar con precaución extrema). |
| `all_squash` | Mapea a **todos** los usuarios que se conecten (sean root o no) al usuario anónimo. Ideal para centralizar permisos. |
| `sync` | Fuerza al servidor a responder a las peticiones solo tras escribir los cambios en el disco (más seguro). |
| `async` | Permite responder antes de escribir en disco. Mejora el rendimiento, pero hay riesgo de pérdida de datos ante cortes eléctricos. |
| `no_subtree_check` | Desactiva la comprobación de subárboles. Mejora la estabilidad y el rendimiento (muy recomendado). |
| `subtree_check` | Fuerza la verificación de subárboles. Comprueba si el archivo está en un subdirectorio exportado. |
| `wdelay` | El servidor retrasa la escritura en disco si prevé otra solicitud inminente (activo por defecto). |
| `no_wdelay` | Desactiva el retraso de escritura; escribe inmediatamente (útil junto con `async`). |
| `anonuid=UID` | Establece explícitamente el UID (User ID) del servidor al que se asignarán las conexiones mapeadas. |
| `anongid=GID` | Establece explícitamente el GID (Group ID) del servidor al que se asignarán las conexiones mapeadas. |

## Gestión Avanzada de Usuarios (UID)

NFS se basa en la **confianza en los UIDs**: cuando un cliente escribe un archivo, envía al servidor su identificador local. Existen dos grandes enfoques para manejar esto en entornos reales.

**Coincidencia directa de UIDs (Sin mapeo):**
Si no se fuerza ningún mapeo, el cliente con UID `1003` guardará los archivos en el servidor como si pertenecieran al UID `1003` local del servidor. Requiere que ambos equipos tengan configurados exactamente los mismos UIDs para los mismos usuarios. Presenta un riesgo de seguridad: si el cliente es administrador de su propia máquina, puede crear un usuario falso con el UID deseado para acceder a datos ajenos.

**Mapeo forzado con anonuid (Recomendado para centralizar):**
Aunque el parámetro se llame `anonuid` (usuario anónimo), su función principal es **centralizar** la propiedad de los archivos en el servidor, obligando a que cualquier cliente escriba bajo un UID seguro y controlado.

```conf
/var/nfs/compartido 192.168.1.0/24(rw,sync,no_subtree_check,all_squash,anonuid=1003)
```

Al combinar `all_squash` con `anonuid=1003`, el servidor ignora el UID original del cliente y guarda todos los archivos obligatoriamente a nombre del UID `1003` del servidor. Así se evita tener que sincronizar UIDs entre máquinas y se mitigan los problemas de seguridad por suplantación de identidad en el cliente.

## Gestión Avanzada de Grupos (GID)

Para permitir que varios usuarios colaboren en una misma carpeta compartida, el manejo de grupos se puede enfocar desde los permisos POSIX del disco duro o desde el servicio NFS.

**Permisos a nivel de Sistema de Archivos (El bit SGID):**
Es el método más sólido para trabajo colaborativo. Se configura un grupo propietario en la carpeta del servidor y se le aplica el bit SGID.

* Se asigna el grupo: `sudo chgrp -R nombre_grupo /var/nfs/compartido`
* Se dan permisos de escritura: `sudo chmod -R 775 /var/nfs/compartido`
* **Se activa el bit SGID:** `sudo chmod g+s /var/nfs/compartido`

Al aplicar `g+s`, cualquier archivo o subdirectorio creado dentro de esa carpeta por cualquier cliente NFS heredará automáticamente el grupo `nombre_grupo`, garantizando que todos los miembros de dicho grupo puedan editar los archivos de los demás. En el archivo `/etc/exports` basta con exportar la carpeta con permisos `rw`.

**Mapeo forzado a un Grupo con anongid:**
Si se prefiere que NFS controle la asignación de grupo ignorando la configuración del cliente, se utiliza `anongid`.

```conf
/var/nfs/compartido 192.168.1.0/24(rw,sync,no_subtree_check,all_squash,anongid=2000)
```

Toda escritura realizada desde los equipos clientes quedará registrada en el disco del servidor perteneciendo al GID `2000`, unificando el acceso sin importar a qué grupos pertenezca el usuario en su equipo de origen.
