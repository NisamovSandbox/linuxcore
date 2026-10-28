# Creación de Roles y Permisos

En vez de crear y configurar individualmente cada usuario, se crean roles y se gestionan los permisos de cada rol, automatizando y facilitando las tareas.

```sql
CREATE ROLE 'trabajador';
CREATE IF NOT EXISTS 'trabajador';
CREATE 'ministro', 'suplente', 'ejecutivo', 'juez';
-- Asignar permisos a roles
GRANT SELECT, INSERT ON bd_general.* TO 'trabajador'; -- Dar permisos de seleccion e insercion al rol trabajador
GRANT 'trabajador' TO 'usuario1'@'localhost'; -- Asignar un rol a un usuario
```

Activar rol, pues viene desactivado por defecto
```sql
SET ROLE 'trabajador'; -- Activar rol solo para la sesion
SET DEFAULT ROLE 'trabajador' FOR 'usuario1'@'localhost';-- Hacer permanente el rol para el usuario1
```

Eliminar rol
```sql
REVOKE 'trabajador' FROM 'usuario1'@'localhost'; -- Eliminar rol del usuario
DROP ROLE 'trabajador'; -- Borrar roi
```

Alterar rol
```sql
REVOKE INSERT ON bd_general.* FROM 'usuario1'@'localhost';
```

Ver permisos de cada rol
```sql
SHOW GRANTS FOR 'usuario1'@'locahost';
```
