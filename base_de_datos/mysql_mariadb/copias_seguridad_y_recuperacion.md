# Copias de seguridad y recuperación

## Copias lógicas (mysqldump)

Generan un fichero `.sql` con las sentencias necesarias para recrear los datos.

```sh
# Una base de datos concreta, desde un servidor remoto
mysqldump -u usuario -h 192.168.x.x -p nombre_db > backup_db.sql

# Varias bases de datos (incluye los CREATE DATABASE)
mysqldump -u usuario -h 192.168.x.x -p --databases libreria empresa cine > copia_multidb.sql

# Copia total de todo el servidor
mysqldump -u usuario -h 192.168.x.x -p --all-databases > copia_total.sql
```

### Restaurar una copia lógica

Si el `.sql` no contiene `CREATE DATABASE`, primero hay que crear la base de datos en MariaDB.

```sh
mysql -u usuario -h 192.168.x.x -p nombre_db_destino < backup_db.sql
```

## Copias físicas (mariadb-backup)

Copian directamente los archivos binarios. Es mucho más rápido en bases de datos grandes.

```sh
# Backup completo inicial
sudo mariadb-backup --backup \
  --target-dir=/home/osboxes/copiacompleta \
  --user="root" -p

# Backup incremental (solo lo que cambió desde la completa)
# --target-dir es donde se guarda lo nuevo; --incremental-basedir es la base
sudo mariadb-backup --backup \
  --target-dir=/home/osboxes/inc_martes \
  --incremental-basedir=/home/osboxes/copiacompleta \
  --user="root" -p
```

### Preparar (fusionar) las copias

Los incrementales se aplican sobre la base completa.

```sh
# Primero se prepara la completa
sudo mariadb-backup --prepare --target-dir=/home/osboxes/copiacompleta

# Después se fusiona el incremental en la completa
sudo mariadb-backup --prepare \
  --target-dir=/home/osboxes/copiacompleta \
  --incremental-dir=/home/osboxes/inc_martes
```

## Bloqueos y administración para copias manuales

```sql
-- Evita escrituras durante una copia manual
FLUSH TABLES WITH READ LOCK;

-- Posición actual del log binario (útil para backups incrementales manuales)
SHOW MASTER STATUS;

-- Liberar el bloqueo
UNLOCK TABLES;
```

## Recuperación por log binario (Point-in-Time Recovery)

Sirve para recuperar los datos entre el último backup y el momento del fallo. Se restaura el backup y después se reaplican las operaciones del log binario entre dos posiciones.

```sh
sudo mysqlbinlog --start-position=123 --stop-position=456 /var/lib/mysql/logbinario.000002 \
    | mysql -u usuario -p
```

Nota: `SET sql_log_bin=OFF` evita que la restauración se vuelva a escribir en el log binario actual, y con ello posibles bucles.