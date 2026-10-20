# Bases de datos, tablas, claves y tipos de datos

## Gestión de bases de datos

```sql
CREATE DATABASE nombre_bd;
USE nombre_bd;
DROP DATABASE nombre_bd;
DROP DATABASE IF EXISTS base1;
SHOW DATABASES;
```

## Gestión de tablas

### Crear tablas

```sql
CREATE TABLE producto (
    nombre VARCHAR(128) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL,
    id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);

-- Tabla con clave primaria compuesta
CREATE TABLE pe_incluye_prod (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_pedido, id_producto)
);
```

### Consultar la estructura

```sql
SHOW TABLES IN nombre_bd;
DESCRIBE producto;
DESCRIBE nombre_bd.producto;
SHOW CREATE TABLE producto;   -- definición completa, incluye nombres de constraints
```

### Modificar columnas

Los ejemplos siguientes se aplican de forma consecutiva sobre la tabla `producto`.

```sql
-- Añadir columna
ALTER TABLE producto ADD COLUMN cod_barras CHAR(13) NULL;

-- Renombrar columna
ALTER TABLE producto RENAME COLUMN stock TO cantidad;

-- Modificar el tipo de dato
ALTER TABLE producto MODIFY COLUMN cantidad DECIMAL(12,2) NOT NULL;

-- Modificar nombre y tipo a la vez
ALTER TABLE producto CHANGE COLUMN cantidad stock DOUBLE NOT NULL;

-- Eliminar columna
ALTER TABLE producto DROP COLUMN cod_barras;
```

### Renombrar, mover y eliminar tablas

```sql
ALTER TABLE producto RENAME TO productos;

-- Mover una tabla a otra base de datos
ALTER TABLE enciclopedia.productos RENAME TO tienda.producto;

DROP TABLE producto;
```

## Claves y restricciones

### Clave primaria

```sql
ALTER TABLE producto DROP PRIMARY KEY;
ALTER TABLE producto ADD PRIMARY KEY (nombre, precio);
```

Una clave primaria múltiple se define en el `CREATE TABLE` con `PRIMARY KEY (campo1, campo2)`.

### Clave única (UNIQUE)

```sql
ALTER TABLE producto ADD CONSTRAINT u_nombre UNIQUE (nombre);
```

### Clave foránea

La clave foránea se crea en la tabla hija, la que contiene la referencia:

```sql
ALTER TABLE pe_incluye_prod
ADD CONSTRAINT fk_pp_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id);
```

Para eliminarla hay que conocer el nombre del constraint (se ve con `SHOW CREATE TABLE`):

```sql
ALTER TABLE pe_incluye_prod DROP FOREIGN KEY fk_pp_pedido;
```

### Políticas de claves foráneas (Foreign Key Actions)

Definen qué hace el motor en la tabla hija cuando se ejecuta un `DELETE` o `UPDATE` en la tabla padre.

- **NO ACTION**: es la opción por defecto en MariaDB/InnoDB. No permite borrar o modificar la fila padre si existen referencias en la tabla hija. En el estándar SQL pospone la comprobación hasta el final de la transacción.
- **RESTRICT**: rechaza de inmediato la operación sobre la tabla padre. En InnoDB, `RESTRICT` y `NO ACTION` son equivalentes.
- **CASCADE**: propaga el cambio. Si se elimina o actualiza la fila padre, se eliminan o actualizan automáticamente las filas hijas.
- **SET NULL**: pone la clave foránea de la hija a `NULL`. La columna hija debe permitir nulos.
- **SET DEFAULT**: asigna el valor por defecto de la columna hija. InnoDB no lo soporta y devuelve error si se intenta definir.

```sql
FOREIGN KEY (id_pedido) REFERENCES pedido(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
```

## Tipos de datos en MariaDB

### Numéricos

- Enteros, todos con opción `UNSIGNED`: `BIGINT` (64 bits), `INT` / `INTEGER` (32 bits), `SMALLINT` (16 bits), `TINYINT` (8 bits).
- Punto fijo: `DECIMAL(m, n)`. Ejemplo: `DECIMAL(12,3)` admite como máximo 12 dígitos, 3 de ellos decimales.
- Punto flotante: `FLOAT` (32 bits) y `DOUBLE` (64 bits).

### Fecha y hora

- `DATE`: YYYY-MM-DD
- `TIME`: HH:MM:SS.fffff
- `DATETIME`: YYYY-MM-DD HH:MM:SS.fffff

### Texto

- `CHAR(n)`: longitud fija.
- `VARCHAR(n)`: longitud variable, hasta n.
- `TEXT`: hasta 65 535 caracteres.

### Binarios

- `BLOB`: hasta 65 535 bytes.