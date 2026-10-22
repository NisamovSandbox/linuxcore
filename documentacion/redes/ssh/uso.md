# Comandos y Casos de Uso

## Conexiones y Ejecución Remota

**Conexión estándar**
El caso de uso más habitual, especificando únicamente el usuario y la dirección IP o dominio.

```bash
ssh admin@192.168.1.50
```

**Conexión por un puerto no estándar**
Por seguridad, muchos servidores cambian el puerto 22 por otro. Se especifica con el parámetro `-p`.

```bash
ssh -p 2222 admin@192.168.1.50
```

**Ejecución de un único comando sin abrir sesión interactiva**
Útil para scripts o comprobaciones rápidas. Se conecta, ejecuta el comando y devuelve el resultado a la máquina local, cerrando la conexión de inmediato.

```bash
ssh admin@192.168.1.50 df -h
```

## Transferencia de Archivos (SCP)

SSH incluye herramientas derivadas para mover datos cifrados entre máquinas.

**Subir un archivo al servidor remoto**
Copia `documento.pdf` desde tu ordenador al directorio `/var/www/` del servidor.

```bash
scp documento.pdf admin@192.168.1.50:/var/www/
```

**Descargar una carpeta completa del servidor**
El parámetro `-r` permite copiar directorios enteros de forma recursiva hacia tu máquina local.

```bash
scp -r admin@192.168.1.50:/var/logs/ ./logs_locales/
```

## Túneles y Redirección de Puertos (Port Forwarding)

SSH permite encapsular otros servicios dentro de su conexión segura, ideal para acceder a recursos internos que no están expuestos a internet.

**Local Port Forwarding (Acceso a bases de datos internas)**
Redirige el puerto 3306 de tu ordenador al puerto 3306 del servidor remoto. Permite usar herramientas gráficas locales (como DBeaver o DataGrip) para gestionar una base de datos remota protegida detrás de un firewall.

```bash
ssh -L 3306:localhost:3306 admin@192.168.1.50
```

**Dynamic Port Forwarding (Proxy SOCKS5)**
Convierte la conexión SSH en un proxy temporal. Todo el tráfico de tu navegador local saldrá a internet con la IP del servidor remoto, ideal para evadir bloqueos geográficos o cifrar la navegación en redes Wi-Fi públicas.

```bash
ssh -D 8080 admin@192.168.1.50
```

## Simplificación con el Archivo de Configuración

En lugar de recordar puertos, usuarios, IPs y rutas de claves, puedes automatizar las conexiones configurando el archivo local `~/.ssh/config`.

**Definición de un entorno en `~/.ssh/config`:**

```text
Host produccion
    HostName 203.0.113.10
    User operador
    Port 4422
    IdentityFile ~/.ssh/clave_prod
```

**Uso del alias:**
Tras guardar el archivo, la conexión se reduce a un único comando que aplica todos los parámetros automáticamente sin tener que escribirlos.

```bash
ssh produccion
```

## Gestión de Claves Protegidas (`ssh-agent`)

Si proteges tu clave privada con una contraseña (*passphrase*), tendrás que teclearla en cada conexión. El agente SSH permite guardarla en memoria temporalmente.

**Iniciar el agente en tu terminal**

```bash
eval $(ssh-agent -s)
```

**Añadir la clave privada a la memoria**
Te pedirá la contraseña una única vez. A partir de ese momento, podrás usar SSH libremente hasta que cierres la sesión.

```bash
ssh-add ~/.ssh/clave_prod
```
