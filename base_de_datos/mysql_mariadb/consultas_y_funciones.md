# Consultas, funciones y agrupaciones

## Funciones

Una función también puede recibir una columna como parámetro.

```sql
-- Longitud de una cadena
SELECT LENGTH('hola');                       -- 4
SELECT nombre, LENGTH(nombre) FROM plataforma;   -- nombre y longitud (en caracteres) de cada plataforma

-- Valor absoluto: pasa los negativos a positivos y deja los positivos como están
SELECT ABS(-5), ABS(3);                      -- 5 y 3

-- Raíz cuadrada
SELECT SQRT(4);                              -- 2

-- Diferencia entre fechas, en días
SELECT DATEDIFF('2025-01-12', '2020-05-25');
```

## Consultas anidadas

```sql
-- Libro más reciente
SELECT * FROM libro WHERE anyo = (SELECT MAX(anyo) FROM libro);

-- Libro más barato
SELECT * FROM libro WHERE precio = (SELECT MIN(precio) FROM libro);
```

## Alias

Los alias solo se pueden usar dentro de la misma sentencia en la que se definen.

```sql
-- Opción 1: con alias y NOT EXISTS
SELECT * FROM persona p
WHERE NOT EXISTS (SELECT * FROM dirige d WHERE p.id_persona = d.id_persona);

-- Opción 2: equivalente con NOT IN
SELECT * FROM persona
WHERE id_persona NOT IN (SELECT id_persona FROM dirige);
```

## Contar y agrupar

```sql
-- Número de películas por país
SELECT pais, COUNT(*) FROM pelicula GROUP BY pais;

-- Películas por país posteriores al año 2000, ordenadas de forma descendente por país
SELECT pais, COUNT(*)
FROM pelicula
WHERE anyo > 2000
GROUP BY pais
ORDER BY pais DESC;
```