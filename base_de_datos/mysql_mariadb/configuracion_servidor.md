# Configuración del servidor

## Fichero de configuración

Ruta estándar en Debian/Ubuntu: `/etc/mysql/mariadb.conf.d/50-server.cnf`. Las variables del servidor se definen bajo la sección `[mysqld]`.

### Red y conexión

```ini
[mysqld]
# IP en la que escucha el servidor.
# 127.0.0.1 = solo conexiones locales. 0.0.0.0 = todas las interfaces.
bind-address = 0.0.0.0

# Puerto TCP de escucha (por defecto 3306)
port = 3306

# Conexiones simultáneas máximas (por defecto suele ser 151)
max_connections = 100

# Desactiva la resolución DNS inversa en cada conexión (mejora el rendimiento)
skip-name-resolve = 1
```

### Codificación y cotejo

```ini
[mysqld]
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
```

### Diagnóstico y logs

```ini
[mysqld]
# Registro de consultas lentas (0 = desactivado, 1 = activado)
slow_query_log = 1

# Archivo donde se guardan
slow_query_log_file = /var/log/mysql/mariadb-slow.log

# Segundos a partir de los cuales una consulta se considera lenta
long_query_time = 2

# Registra también las consultas que no usan índices
log_queries_not_using_indexes = 1

# Log de errores general
log_error = /var/log/mysql/error.log
```

Valores por defecto de las variables de consultas lentas: `slow_query_log` en OFF, `long_query_time` en 10 segundos (todo lo que tarde más se guarda en `slow_query_log_file`).

### Rendimiento y memoria (InnoDB)

```ini
[mysqld]
# Memoria para caché de datos e índices de InnoDB.
# Es el parámetro clave de rendimiento; en servidores dedicados suele ser el 50-70% de la RAM.
innodb_buffer_pool_size = 1G

# Tamaño máximo de un paquete o sentencia SQL
max_allowed_packet = 64M

# Motor de almacenamiento por defecto
default_storage_engine = InnoDB

# Directorio físico de los archivos de la base de datos
datadir = /var/lib/mysql
```

## Tipos de variables

- **Globales**: afectan a todas las conexiones.
- **De sesión**: afectan solo al usuario conectado.
- **Dinámicas**: se aplican sin reiniciar, con `SET`.
- **Estáticas**: son las que se definen en `50-server.cnf`; requieren reinicio.
- **De estado**: son solo de consulta.

Más información: https://mariadb.com/docs/server/server-management/variables-and-modes/server-system-variables

## Ruta de almacenamiento de las bases de datos

La ruta lógica es la variable `datadir`. En Debian/Ubuntu suele ser `/var/lib/mysql` (en estos apuntes también aparece `/var/lib/mariadb/`).

```sql
SHOW GLOBAL VARIABLES LIKE 'datadir';
```

## Motores de almacenamiento (storage engines)

- **InnoDB** (por defecto): motor estándar actual. Soporta transacciones (ACID), claves foráneas y bloqueo a nivel de fila.
- **MyISAM**: motor antiguo (legacy). No admite claves foráneas ni transacciones, y bloquea a nivel de tabla. Históricamente era más rápido para lecturas masivas, hoy está desfasado.
- **MEMORY (Heap)**: guarda las tablas en RAM. Acceso ultrarrápido, pero los datos son volátiles y se pierden al reiniciar.

```sql
CREATE TABLE nombre (
    id INT,
    nombre VARCHAR(5)
) ENGINE = MEMORY;

ALTER TABLE nombre ENGINE = MyISAM;
```

## Juegos de caracteres (character sets)

Determinan cómo se codifica el texto en binario.

- **utf8mb4**: estándar recomendado (Unicode completo). Usa hasta 4 bytes por carácter, por lo que admite emojis, símbolos matemáticos y alfabetos como el chino o el japonés. En MySQL/MariaDB el nombre técnico exacto es `utf8mb4`.
- **latin1**: codificación básica de 1 byte. Soporta los idiomas de Europa occidental (incluye ñ y tildes), pero no emojis ni otros alfabetos.

## Cotejo (collation)

Conjunto de reglas para comparar, buscar y ordenar cadenas. Afecta a `WHERE`, `ORDER BY`, `GROUP BY`, etc. Se identifica por sufijos:

- **CI** (case insensitive): no distingue mayúsculas de minúsculas (A = a).
- **CS** (case sensitive): sí las distingue (A ≠ a).
- **AI** (accent insensitive): no distingue acentos (á = a).
- **AS** (accent sensitive): sí los distingue (á ≠ a).

## Jerarquía de configuración

El juego de caracteres y el cotejo se pueden definir a varios niveles:

```
Columna > Tabla > Base de datos > Servidor
```

- **Sobrescritura**: el nivel más específico invalida al general. La columna sobrescribe a la tabla, la tabla a la base de datos y la base de datos al servidor.
- **Herencia**: si un nivel no define su juego de caracteres o cotejo, hereda el del nivel superior.