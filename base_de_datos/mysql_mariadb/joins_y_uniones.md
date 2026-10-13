# Joins y uniones entre tablas

## Dos formas de combinar

- **JOIN**: combina columnas de varias tablas relacionando sus filas (une horizontalmente).
- **UNION**: une los resultados de varias consultas `SELECT` una debajo de otra. Las consultas deben tener el mismo número de columnas y tipos compatibles. `UNION` elimina duplicados; `UNION ALL` los conserva.

## Tipos de JOIN

- **INNER JOIN**: solo las filas que coinciden en ambas tablas.
- **LEFT JOIN**: todas las filas de la tabla izquierda, y de la derecha solo las que coinciden (el resto, `NULL`). Da prioridad a la izquierda.
- **RIGHT JOIN**: todas las filas de la tabla derecha, y de la izquierda solo las que coinciden. Da prioridad a la derecha.
- **FULL OUTER JOIN**: todas las filas de ambas tablas. MariaDB no lo implementa; se emula uniendo un `LEFT JOIN` y un `RIGHT JOIN` con `UNION`.
- **CROSS JOIN**: producto cartesiano, todas las combinaciones entre filas de ambas tablas.
- **SELF JOIN**: una tabla se une consigo misma (usando alias distintos) para consultar relaciones internas.
- **ON**: define la condición de unión, normalmente clave primaria de una tabla igual a clave foránea de la otra.

## Ejemplos

```sql
-- INNER JOIN
SELECT d.dep_no, d.dnombre, e.emp_no, e.apellido
FROM departamentos d
INNER JOIN empleados e ON d.dep_no = e.dep_no;

-- LEFT JOIN: todos los departamentos, tengan o no empleados
SELECT d.dnombre, e.apellido
FROM departamentos d
LEFT JOIN empleados e ON d.dep_no = e.dep_no;

-- FULL OUTER JOIN emulado
SELECT d.dnombre, e.apellido
FROM departamentos d LEFT JOIN empleados e ON d.dep_no = e.dep_no
UNION
SELECT d.dnombre, e.apellido
FROM departamentos d RIGHT JOIN empleados e ON d.dep_no = e.dep_no;

-- CROSS JOIN (ejemplo de práctica; en MariaDB admite ON y entonces se comporta como INNER JOIN)
SELECT d.dep_no, d.dnombre, e.emp_no, e.apellido
FROM departamentos d CROSS JOIN empleados e ON d.dep_no = e.dep_no;
```