CREATE TABLE ejercicio4.obras (
	co 	VARCHAR(20) PRIMARY KEY,
	descr VARCHAR(50) NOT NULL,
	dir VARCHAR(50) NOT NULL,
	zona VARCHAR(20) NOT NULL,
	empcon VARCHAR(50) NOT NULL
)

CREATE TABLE ejercicio4.materiales (
	cm 	VARCHAR(20) PRIMARY KEY,
	descrM VARCHAR(50) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0)
)

CREATE TABLE ejercicio4.ferreterias (
	cuit VARCHAR(25) PRIMARY KEY,
	nom VARCHAR(50) NOT NULL,
	dir VARCHAR(50) NOT NULL,
	zonaF VARCHAR(20) NOT NULL,
	tel VARCHAR(30) NOT NULL
)

CREATE TABLE ejercicio4.pedidos (
	co VARCHAR(25) REFERENCES ejercicio4.obras(co),
	cm VARCHAR(25) REFERENCES ejercicio4.materiales(cm),
	cuit VARCHAR(25) REFERENCES ejercicio4.ferreterias(cuit),
	fecha DATE NOT NULL,
	cant INTEGER NOT NULL CHECK(cant > 0),
	PRIMARY KEY(co,cm,cuit,fecha)
)

COPY ejercicio4.obras (co, descr, dir, zona, empcon)
FROM 'D:\Documents\SANTI\PROGRAMACION WEB\Base de Datos\Unidad 6\EJERCICIO 4'
WITH (FORMAT csv, HEADER true);	

COPY ejercicio4.materiales (cm, descrM, precio)
FROM 'D:\Documents\SANTI\PROGRAMACION WEB\Base de Datos\Unidad 6\EJERCICIO 4'
WITH (FORMAT csv, HEADER true);	

COPY ejercicio4.ferreterias (cuit,nom,dir,zonaF,tel)
FROM 'D:\Documents\SANTI\PROGRAMACION WEB\Base de Datos\Unidad 6\EJERCICIO 4'
WITH (FORMAT csv, HEADER true);	

COPY ejercicio4.pedidos (co,cm,cuit,fecha,cant)
FROM 'D:\Documents\SANTI\PROGRAMACION WEB\Base de Datos\Unidad 6\EJERCICIO 4'
WITH (FORMAT csv, HEADER true);

-- Ejercicio 1
SELECT descrM 
FROM ejercicio4.materiales m
JOIN ejercicio4.pedidos p ON p.cm = m.cm
WHERE p.fecha = '2020-06-06';

-- Ejercicio 2
SELECT o.descripcion AS descripcion_obra,
m.descripcion AS descripcion_material
FROM ejercicio4.obra o
JOIN ejercicio4.pedidos p ON o.co=p.co
JOIN ejercicio4.material m on p.cm=m.cm;

-- Ejercicio 3
SELECT obras.desc, materiales.desc
FROM obras
LEFT JOIN pedidos ON obras.co = pedidos.co
LEFT JOIN materiales ON pedidos.cm = materiales.cm;

-- Ejercicio 4
SET search_path TO obras_civiles;

SELECT
SUM(p.cant) AS cantidad_total_bolsas_cal
FROM
pedidos as p
JOIN
materiales as m ON p.cm = m.cm
JOIN
ferreterias as f ON p.cuit = f.cuit
WHERE
m.desc_material = 'Bolsas de Cal' AND f.nom = 'MR S.A.';

-- Ejercicio 5
SELECT COUNT(DISTINCT p.co) AS cantObras
FROM oc.pedidos p
JOIN oc.ferreterias f ON p.cuit = f.cuit
WHERE f.nom = 'MR S.A.';

-- Ejercicio 6
SELECT p.cm, p.co, SUM(p.cant) as Cantotal
FROM pedidos p
GROUP BY p.cm, p.co

-- Ejercicio 7
SELECT m.desc AS descripcion_material
FROM pedidos p
JOIN materiales m ON p.cm = m.cm
GROUP BY p.desc, p.co
HAVING AVG(p.cant) > 320;