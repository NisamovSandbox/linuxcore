# Usuarios y permisos

## Crear usuarios

```sql
CREATE USER 'usuario' IDENTIFIED BY 'clave';
```

Variantes de la sentencia de creación:

- `CREATE USER`: error si el usuario ya existe.
- `CREATE OR REPLACE USER`: si el usuario existe, primero lo elimina y luego lo crea.
- `CREATE USER IF NOT EXISTS`: si el usuario ya existe no da error, solo muestra un warning.

### El usuario y su origen (host)

```sql
-- Usuario sin clave de acceso
CREATE USER 'manolo'@'localhost';

-- Creación múltiple
CREATE USER 'manolo'@'localhost', 'juan'@'localhost', 'antonio'@'localhost';

-- Usuario de un equipo específico
CREATE USER 'manolo'@'192.168.1.1';

-- Usuario de una red específica (todos los equipos de la red 192.168.7.x)
CREATE USER 'manolo'@'192.168.7.%';

-- Usuario desde cualquier equipo
CREATE USER 'manolo'@'%';
```

### La contraseña

```sql
-- Clave en texto plano
CREATE USER 'manolo'@'localhost' IDENTIFIED BY 'clave123';

-- Clave en hash
CREATE USER 'manolo'@'localhost' IDENTIFIED BY PASSWORD '*2565c0f13c54139d8b8971096faa1a7d77f7';

-- Obtener el hash de una clave para reutilizarlo
SELECT PASSWORD('manolo');
```

Los plugins de autenticación (`ed25519`, `pam`) y los requisitos SSL están en `05_seguridad_ssl_pam_apparmor.md`.

## Forzar el cambio de contraseña en el primer acceso

```sql
CREATE USER 'nuevo_usuario'@'%' IDENTIFIED BY 'miclave123' PASSWORD EXPIRE;
-- Un vez dentro de ese usuario, no permitirá ejecutar comnandos hasta que se haya cambiado su clave

-- Al entrar con ese usuario
SET PASSWORD = PASSWORD('TuNuevaContraseña');

-- Probar permisos
SHOW DATABASES;
```

## Politicas de clave

```sql
-- Politicas por defecto
CREATE USER 'usuario'@'%' IDENTIFIED BY 'clave' PASSWORD EXPIRE DEFAULT;

-- La clave no expirará
CREATE USER 'usuario'@'%' IDENTIFIED BY 'clave' PASSWORD EXPIRE NEVER;

-- Plazo antes de que la clave expire
CREATE USER 'usuario'@'%' IDENTIFIED BY 'clave' PASSWORD EXPIRE INTERVAL 365 DAY;
```

## Límites de recursos

Se pueden fijar al crear el usuario, aunque es preferible hacerlo con `ALTER USER`.

- `MAX_QUERIES_PER_HOUR`: cualquier sentencia ejecutada por el usuario (`INSERT`, `UPDATE`, `SELECT`...).
- `MAX_UPDATES_PER_HOUR`: sentencias que modifican tablas o datos. No cuenta crear usuarios, tablas, etc.
- `MAX_CONNECTIONS_PER_HOUR`: conexiones por hora.
- `MAX_USER_CONNECTIONS`: máximo de conexiones simultáneas.
- `MAX_STATEMENT_TIME`: tiempo máximo de una consulta.

```sql
CREATE USER 'borbon'@'localhost' IDENTIFIED BY 'PASS'
    WITH MAX_QUERIES_PER_HOUR 400
         MAX_UPDATES_PER_HOUR 50;
```

## Conceder permisos

```sql
-- Permisos básicos (solo conectar)
GRANT USAGE ON *.* TO 'usuario'@'localhost' IDENTIFIED BY 'clave';

-- Todos los privilegios sobre una base de datos
GRANT ALL PRIVILEGES ON nombre_bd.* TO 'usuario'@'localhost';

-- Todos los privilegios sobre todo, pudiendo conceder a otros
CREATE USER 'nisamov'@'%' IDENTIFIED BY 'clave_de_acceso';
GRANT ALL PRIVILEGES ON *.* TO 'nisamov'@'%' WITH GRANT OPTION;
```

Aplicar los cambios:

```sql
FLUSH PRIVILEGES;
```

## Listar usuarios y privilegios

```sql
-- Todos los usuarios
SELECT User, Host FROM mysql.user;

-- Un usuario concreto
SELECT User, Host FROM mysql.user WHERE User = 'usuario';

-- Privilegios de un usuario
SELECT GRANTEE, TABLE_SCHEMA, TABLE_NAME, PRIVILEGE_TYPE
FROM information_schema.table_privileges
WHERE GRANTEE = "'nombre_usuario'@'%'";

-- Parámetros cifrados (privilegios y autenticación) de un usuario
SELECT User, Host, Priv FROM mysql.global_priv WHERE User = 'root';
```

## Cambiar o recuperar la contraseña de root

```sql
-- Cambiar la clave
ALTER USER 'root'@'localhost' IDENTIFIED BY 'NuevaContraseña';

-- Restablecer la configuración inicial (se entra como root sin contraseña, por unix_socket)
ALTER USER 'root'@'localhost' IDENTIFIED VIA unix_socket;

-- Después de cualquiera de las dos
FLUSH PRIVILEGES;
```

## Eliminar usuarios

```sql
DROP USER 'nombre_usuario'@'host';
```

## Bloqueo de usuarios

```sql
-- Bloqueo de cuenta 
ALTER USER 'usuario'@'%' ACCOUNT LOCK;

-- Desbloqueo de cuenta
ALTER USER 'usuario'@'%' ACCOUNT UNLOCK;
```
