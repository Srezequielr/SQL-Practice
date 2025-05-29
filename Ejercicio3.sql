-- Script PostgreSQL para el Instituto Superior del Sur - Cursos de Verano

-- Eliminación de tablas si existen
DROP TABLE IF EXISTS temas CASCADE;
DROP TABLE IF EXISTS insc CASCADE;
DROP TABLE IF EXISTS dicta CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS pers CASCADE;

-- Creación de tablas
CREATE TABLE ejercicio3.pers (
    correo VARCHAR(50) PRIMARY KEY,
    nomU VARCHAR(30) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE ejercicio3.curso (
    nom VARCHAR(30) PRIMARY KEY,
    cH INTEGER NOT NULL CHECK (cH > 0)
);

CREATE TABLE ejercicio3.dicta (
    correo VARCHAR(50) REFERENCES pers(correo),
    nom VARCHAR(30) REFERENCES curso(nom),
    PRIMARY KEY (correo, nom)
);

CREATE TABLE ejercicio3.insc (
    correo VARCHAR(50) REFERENCES pers(correo),
    nom VARCHAR(30) REFERENCES curso(nom),
    correoD VARCHAR(50) REFERENCES pers(correo),
    nota NUMERIC(4,2) CHECK (nota >= 0 AND nota <= 10),
    PRIMARY KEY (correo, nom),
    FOREIGN KEY (correoD, nom) REFERENCES dicta(correo, nom)
);

CREATE TABLE ejercicio3.temas (
    nom VARCHAR(30) REFERENCES curso(nom),
    tema VARCHAR(100) NOT NULL,
    PRIMARY KEY (nom, tema)
);

-- Inserción de datos de prueba

-- Inserción de personas (docentes y alumnos)
INSERT INTO ejercicio3.pers VALUES ('pedroibañez@yahoo.com.ar', 'pedro_i', 'Pedro Ibañez');
INSERT INTO ejercicio3.pers VALUES ('mlopez@gmail.com', 'mlopez', 'María López');
INSERT INTO ejercicio3.pers VALUES ('rperez@hotmail.com', 'rperez', 'Roberto Pérez');
INSERT INTO ejercicio3.pers VALUES ('anagarcia@gmail.com', 'anagarcia', 'Ana García');
INSERT INTO ejercicio3.pers VALUES ('jgomez@outlook.com', 'jgomez', 'Juan Gómez');
INSERT INTO ejercicio3.pers VALUES ('carmenv@gmail.com', 'carmenv', 'Carmen Vázquez');
INSERT INTO ejercicio3.pers VALUES ('luisf@yahoo.com', 'luisf', 'Luis Fernández');
INSERT INTO ejercicio3.pers VALUES ('rosam@gmail.com', 'rosam', 'Rosa Martínez');
INSERT INTO ejercicio3.pers VALUES ('rosap@yahoo.com.ar', 'rosap', 'Rosa Paredes');
INSERT INTO ejercicio3.pers VALUES ('carlosr@gmail.com', 'carlosr', 'Carlos Rodríguez');
INSERT INTO ejercicio3.pers VALUES ('mariaf@hotmail.com', 'mariaf', 'María Fernández');
INSERT INTO ejercicio3.pers VALUES ('davidm@yahoo.com', 'davidm', 'David Martínez');

-- Inserción de cursos
INSERT INTO ejercicio3.curso VALUES ('Python I', 30);
INSERT INTO ejercicio3.curso VALUES ('Python II', 45);
INSERT INTO ejercicio3.curso VALUES ('Java I', 40);
INSERT INTO ejercicio3.curso VALUES ('Java II', 50);
INSERT INTO ejercicio3.curso VALUES ('Ruby', 40);
INSERT INTO ejercicio3.curso VALUES ('Ruby I', 25);
INSERT INTO ejercicio3.curso VALUES ('Kotlin I', 35);
INSERT INTO ejercicio3.curso VALUES ('JavaScript', 30);
INSERT INTO ejercicio3.curso VALUES ('PHP', 25);
INSERT INTO ejercicio3.curso VALUES ('C++', 55);

-- Inserción de relaciones dicta (profesor-curso)
INSERT INTO ejercicio3.dicta VALUES ('pedroibañez@yahoo.com.ar', 'Python I');
INSERT INTO ejercicio3.dicta VALUES ('pedroibañez@yahoo.com.ar', 'Python II');
INSERT INTO ejercicio3.dicta VALUES ('mlopez@gmail.com', 'Java I');
INSERT INTO ejercicio3.dicta VALUES ('mlopez@gmail.com', 'Java II');
INSERT INTO ejercicio3.dicta VALUES ('rperez@hotmail.com', 'Ruby');
INSERT INTO ejercicio3.dicta VALUES ('rperez@hotmail.com', 'Ruby I');
INSERT INTO ejercicio3.dicta VALUES ('anagarcia@gmail.com', 'Kotlin I');
INSERT INTO ejercicio3.dicta VALUES ('jgomez@outlook.com', 'JavaScript');
INSERT INTO ejercicio3.dicta VALUES ('carmenv@gmail.com', 'PHP');
INSERT INTO ejercicio3.dicta VALUES ('luisf@yahoo.com', 'C++');

-- Inserción de inscripciones (alumno-curso-profesor-nota)
INSERT INTO ejercicio3.insc VALUES ('rosam@gmail.com', 'Python I', 'pedroibañez@yahoo.com.ar', 8.5);
INSERT INTO ejercicio3.insc VALUES ('rosam@gmail.com', 'Python II', 'pedroibañez@yahoo.com.ar', 7.8);
INSERT INTO ejercicio3.insc VALUES ('rosap@yahoo.com.ar', 'Python I', 'pedroibañez@yahoo.com.ar', 9.0);
INSERT INTO ejercicio3.insc VALUES ('carlosr@gmail.com', 'Python I', 'pedroibañez@yahoo.com.ar', 7.0);
INSERT INTO ejercicio3.insc VALUES ('carlosr@gmail.com', 'Java I', 'mlopez@gmail.com', 8.2);
INSERT INTO ejercicio3.insc VALUES ('mariaf@hotmail.com', 'Java I', 'mlopez@gmail.com', 9.5);
INSERT INTO ejercicio3.insc VALUES ('mariaf@hotmail.com', 'Java II', 'mlopez@gmail.com', 8.7);
INSERT INTO ejercicio3.insc VALUES ('davidm@yahoo.com', 'Ruby', 'rperez@hotmail.com', 7.5);
INSERT INTO ejercicio3.insc VALUES ('pedroibañez@yahoo.com.ar', 'Java I', 'mlopez@gmail.com', 9.2);
INSERT INTO ejercicio3.insc VALUES ('mlopez@gmail.com', 'Python I', 'pedroibañez@yahoo.com.ar', 8.9);

-- Inserción de temas por curso
INSERT INTO ejercicio3.temas VALUES ('Python I', 'Introducción a Python');
INSERT INTO ejercicio3.temas VALUES ('Python I', 'Estructuras de datos básicas');
INSERT INTO ejercicio3.temas VALUES ('Python II', 'Programación orientada a objetos');
INSERT INTO ejercicio3.temas VALUES ('Python II', 'Módulos y paquetes');
INSERT INTO ejercicio3.temas VALUES ('Java I', 'Fundamentos de Java');
INSERT INTO ejercicio3.temas VALUES ('Java II', 'Interfaces gráficas con Swing');
INSERT INTO ejercicio3.temas VALUES ('Ruby', 'Sintaxis básica');
INSERT INTO ejercicio3.temas VALUES ('Ruby I', 'Introducción a Ruby');
INSERT INTO ejercicio3.temas VALUES ('Kotlin I', 'Fundamentos de Kotlin');
INSERT INTO ejercicio3.temas VALUES ('JavaScript', 'DOM y eventos');
INSERT INTO ejercicio3.temas VALUES ('PHP', 'Conexión a bases de datos');
INSERT INTO ejercicio3.temas VALUES ('C++', 'Punteros y memoria dinámica');


--Guia de Ejercicios


--Ejercicio 1
SELECT * FROM ejercicio3.curso

--Ejercicio 3
SELECT correo, nombre 
FROM ejercicio3.pers

--Ejercicio 4
SELECT COUNT (*) AS cant
FROM ejercicio3.curso


-- Ejercicio 5
SELECT COUNT(DISTINCT nom) AS cant 
FROM ejercicio3.insc

-- Ejericicio 6
SELECT nota 
FROM ejercicio3.insc
WHERE nom = 'Python I'
ORDER BY nota desc
LIMIT 1

SELECT MAX(nota) 
FROM ejercicio3.insc
WHERE nom = 'Python I'

-- 7
SELECT nom 
FROM ejercicio3.curso
ORDER BY nom ASC

-- 8
SELECT nombre 
FROM ejercicio3.pers P 
JOIN ejercicio3.insc I ON P.correo = I.correo
ORDER BY nombre DESC

SELECT nombre 
FROM ejercicio3.pers
JOIN ejercicio3.insc ON ejercicio3.pers.correo = ejercicio3.insc.correo
ORDER BY nombre DESC

-- 9
SELECT * 
FROM ejercicio3.curso
WHERE cH > 40

-- 10
SELECT * 
FROM ejercicio3.curso
WHERE cH >= 40 AND cH <= 45

-- 11
SELECT * 
FROM ejercicio3.curso
WHERE cH < (
	SELECT cH 
	FROM ejercicio3.curso
	WHERE nom = 'Kotlin I'
)
ORDER BY cH DESC

-- 12
SELECT *
FROM ejercicio3.curso
WHERE cH > (
	SELECT cH
	FROM ejercicio3.curso c
	JOIN ejercicio3.dicta d ON c.nom = d.nom
	WHERE d.correo = 'pedroibañez@yahoo.com.ar'
	ORDER BY cH DESC
	LIMIT 1
)

-- 13
SELECT * 
FROM ejercicio3.pers
WHERE nombre LIKE 'Rosa %'

-- 14
SELECT c.nom, nomU, p.correo, nombre
FROM ejercicio3.curso c
JOIN ejercicio3.dicta d ON c.nom = d.nom
JOIN ejercicio3.pers p ON p.correo = d.correo

-- 15
SELECT * 
FROM ejercicio3.curso c LEFT JOIN ejercicio3.insc i ON c.nom = i.nom

-- 16
SELECT * FROM ejercicio3.dicta 
SELECT correo
FROM ejercicio3.dicta 
WHERE nom = 'Python I' OR nom = 'Python II'

