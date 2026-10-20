# Despliegue y Configuración de Servidor Samba

## Instalación del Servicio

Instalación de paquetes clave (`samba` y herramientas cliente para diagnóstico):

```bash
sudo apt update
sudo apt install -y samba samba-common-bin
```

### Gestión de Usuarios y Permisos del Sistema

Samba requiere que los usuarios existan en el sistema operativo host antes de ser añadidos a su propia base de datos de autenticación.

```bash
# Crear usuario en el sistema (sin directorio home si es solo para red)
sudo adduser --no-create-home --shell /bin/false usuario1
sudo adduser --no-create-home --shell /bin/false usuario2

# Crear un grupo de sistema para gestionar accesos compartidos
sudo groupadd smbgroup
sudo usermod -aG smbgroup usuario1
sudo usermod -aG smbgroup usuario2

# Dar de alta y definir contraseña en el backend de Samba
sudo smbpasswd -a usuario1
sudo smbpasswd -a usuario2
sudo smbpasswd -e usuario1  # Habilitar el usuario
```

### Preparación de Directorios y Permisos POSIX

Creación del directorio de almacenamiento en una ruta adecuada y asignación de permisos estricto con bit SGID (`2`) para asegurar que los archivos creados hereden el grupo propietario.

```bash
# Crear directorio de trabajo
sudo mkdir -p /srv/samba/carpeta1
# Asignar propietario y grupo
sudo chown -R root:smbgroup /srv/samba/carpeta1
# Permisos: rwxrws--- (Propietario: Todo, Grupo: Todo + Heredar grupo, Otros: Ninguno)
sudo chmod -R 2770 /srv/samba/carpeta1
```

### Configuración del Recurso Compartido (`/etc/samba/smb.conf`)

Respaldo de la configuración original antes de editar:

```bash
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
```

Edición del archivo `/etc/samba/smb.conf` (añadir al final del documento):

```ini
[carpeta1]
    comment = Directorio Compartido de Trabajo
    path = /srv/samba/carpeta1
    browseable = yes
    read only = no
    guest ok = no
    valid users = @smbgroup
    write list = usuario1, usuario2
    
    # Máscaras de creación para coherencia de permisos POSIX
    create mask = 0660
    directory mask = 0770
    
    # Bloqueo de extensiones no permitidas
    veto files = /*.avi/*.mp3/*.pdf/*.exe/
    delete veto files = yes

    # Obligar a usar version 2 de SMB (por razones de seguridad/otros)
    server min protocol = SMB2_10
```

### Validación y Reinicio de Servicios

Verificación de la sintaxis del archivo de configuración antes de reiniciar:

```bash
# Comprobar errores de sintaxis en el archivo smb.conf
testparm -s
# Reiniciar los demonios de SMB (archivos) y NMBD (resolución NetBIOS/Nombres)
sudo systemctl restart smbd nmbd
sudo systemctl enable smbd nmbd
```

### Métodos de Conexión Cliente

* **Windows (Explorador de archivos):**
* Dirección de red: `\\192.168.10.10\carpeta1`

* **Linux (GNOME Files / Nautilus / CLI):**
* GUI (Otras ubicaciones): `smb://192.168.10.10/carpeta1`
* Montaje mediante CLI (fstab/cifs):

```bash
sudo mount -t cifs -o username=usuario1 //192.168.10.10/carpeta1 /mnt/samba
```
