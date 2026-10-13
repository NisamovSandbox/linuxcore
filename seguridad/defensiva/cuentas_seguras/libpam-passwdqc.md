# Guía y Documentación de Políticas de Contraseñas en Debian

## Descripción de Módulos PAM

En sistemas Debian existen dos enfoques principales para auditar y exigir complejidad en las contraseñas mediante PAM (*Pluggable Authentication Modules*):

* **libpam-pwquality**: Módulo estándar derivado de `pam_cracklib`. Es el adecuado para aplicar reglas tradicionales como número mínimo de clases de caracteres (mayúsculas, minúsculas, números, símbolos), longitud mínima y verificación estricta contra diccionarios compilados con CrackLib (como RockYou).
* **libpam-passwdqc**: Módulo desarrollado por Openwall diseñado para auditar contraseñas y frases de paso (*passphrases*). Evalúa la entropía del secreto a través de combinaciones de palabras o clases de caracteres sin depender de bases de datos compiladas de diccionarios externos.

## Configuración con libpam-pwquality y Diccionario RockYou

Para implementar las políticas de 12 caracteres mínimos, 3 clases de caracteres distintas y filtrado mediante la lista de contraseñas de RockYou, se utiliza `libpam-pwquality` en combinación con `cracklib`.

### Instalación de Paquetes

```bash
sudo apt update
sudo apt install -y libpam-pwquality cracklib-runtime wget
```

### Descarga y Preparación del Diccionario RockYou

Descargar y descomprimir el archivo de texto:
```bash
wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt.gz -O /tmp/rockyou.txt.gz
gunzip /tmp/rockyou.txt.gz
```

Generar la base de datos binaria indexada para CrackLib:
```bash
sudo mkdir -p /var/cache/cracklib
cracklib-format /tmp/rockyou.txt | sudo cracklib-packer /var/cache/cracklib/rockyou
rm /tmp/rockyou.txt
```

### Archivo de Configuración `/etc/security/pwquality.conf`

Editar el archivo `/etc/security/pwquality.conf` y establecer los parámetros requeridos:
```ini
# Longitud mínima de 12 caracteres
minlen = 12

# Exigir al menos 3 clases de caracteres distintas
minclass = 3

# Habilitar verificación por diccionario
dictcheck = 1

# Ruta a la base de datos CrackLib generada con RockYou
dictpath = /var/cache/cracklib/rockyou
```

### Integración en PAM

Al instalar el paquete, Debian registra automáticamente el módulo en `/etc/pam.d/common-password`:
```text
password    requisite    pam_pwquality.so retry=3
```

## Configuración Alternativa con libpam-passwdqc

Si la infraestructura requiere usar la solución de Openwall (`passwdqc`) en lugar de `pwquality`, la gestión se realiza mediante su propio archivo de configuración o argumentos en la pila PAM.

### Archivos de Configuración Relevantes

* `/etc/pam.d/common-password`: Archivo del sistema de autenticación en distribuciones Debian/Ubuntu donde se integra el módulo `pam_passwdqc.so`.
* `/etc/passwdqc.conf` o `/etc/security/passwdqc.conf`: Archivo opcional de configuración global para definir parámetros de forma centralizada.
* `/etc/pam.d/system-auth`: Archivo equivalente en sistemas basados en RHEL, CentOS, Fedora o Arch Linux.

### Instalación del Módulo

```bash
sudo apt update
sudo apt install -y libpam-passwdqc
```

### Sintaxis de Integración en PAM

La directiva habitual en `/etc/pam.d/common-password` sigue la siguiente estructura:
```text
password required pam_passwdqc.so min=disabled,24,12,8,7 passphrase=3 retry=3 ask_oldauthtok enforce=everyone
```

### Parámetros y Opciones Detalladas de passwdqc

| Parámetro | Valores / Opciones | Descripción |
| --- | --- | --- |
| `config` | `/ruta/al/archivo` | Especifica la ruta absoluta de un archivo de configuración alternativo en lugar de pasar las opciones directas en la línea del módulo PAM. |
| `min` | `N0,N1,N2,N3,N4` | Define los límites de longitud mínima según complejidad: `N0` (una clase, recomendado `disabled`), `N1` (dos clases), `N2` (frases de paso), `N3` (tres clases), `N4` (cuatro clases). |
| `max` | `N` | Define la longitud máxima de la contraseña permitida (por defecto suele ser 40 u 85 según la versión). |
| `passphrase` | `N` | Número mínimo de palabras requeridas para que una secuencia sea considerada una frase de paso válida (por defecto `passphrase=3`). Las palabras deben estar separadas por espacios o puntuación. |
| `match` | `N` | Comprueba secuencias o subsecuencias repetidas de caracteres dentro de la contraseña para evitar patrones simples. |
| `similar` | `permit` | `deny` | Determina si se rechaza (`deny`) o se permite (`permit`) una contraseña que sea similar a la anterior o que contenga derivaciones del nombre de usuario (*login*) o datos personales. |
| `random` | `N` | `disabled` | Define la longitud en bits de una contraseña aleatoria sugerida por el módulo cuando la contraseña ingresada no cumple los criterios de fortaleza (ej. `random=47` o `disabled`). |
| `enforce` | `everyone` | `users` | `none` | Nivel de aplicación de la política: `everyone` (aplica a todos, incluido `root`), `users` (aplica solo a usuarios ordinarios), `none` (desactiva la verificación obligatoria y actúa solo como advertencia). |
| `retry` | `N` | Establece el número máximo de reintentos permitidos durante el cambio de contraseña en caso de fallar la validación. |
| `ask_oldauthtok` | N/A | Fuerza al módulo a solicitar la contraseña actual antes de permitir el ingreso de la contraseña nueva. |
| `use_first_pass` / `try_first_pass` | N/A | Gestiona el paso de tokens de autenticación entre módulos PAM previa o sucesivamente configurados. |
