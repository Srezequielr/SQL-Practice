--1
CREATE TABLE ejercicio1.pers1(
	cuil VARCHAR(30) PRIMARY KEY NOT NULL,
	nom VARCHAR(30) NOT NULL,
	idCiu INTEGER REFERENCES ejercicio1.ciu1(idCiu) ON DELETE RESTRICT ON UPDATE CASCADE,
	edad INTEGER NOT NULL,
	trabaja VARCHAR NOT NULL
)

CREATE TABLE ejercicio1.ciu1(
	idCiu INTEGER PRIMARY KEY NOT NULL,
	nomCiu VARCHAR(30) NOT NULL,
	cantHab INTEGER DEFAULT 0
)

--2
INSERT INTO ejercicio1.pers1  VALUES 
('20-11111111-1', 'Juan Perez', 1, 35, 'si'), 
('27-22222222-2', 'Ana Gomez', 2, 28, 'no'), 
('23-33333333-3', 'Carlos Diaz', 1, 40, 'si'), 
('25-44444444-4', 'María Lopez', 3, 22, 'no'); 

INSERT INTO ejercicio1.pers1  VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si'); 

INSERT INTO ejercicio1.ciu1 VALUES (1, 'Buenos Aires', 3000000); 
INSERT INTO ejercicio1.ciu1 VALUES (2, 'Rosario', null); 
INSERT INTO ejercicio1.ciu1 VALUES (3, 'San Juan', 822853); 
INSERT INTO ejercicio1.ciu1 VALUES (4, 'Mendoza',  2043540);  

--3
DELETE FROM ejercicio1.ciu1 WHERE idCiu = 1 
-- Observacion: Las tuplas no se eliminan debido a la restriccion referencial 

--4
UPDATE ejercicio1.ciu1 
SET idCiu = 10 
WHERE idCiu = 1

SELECT * FROM ejercicio1.pers1
SELECT * FROM ejercicio1.ciu1


--5
CREATE TABLE ejercicio1.pers2(
	cuil VARCHAR(30) PRIMARY KEY NOT NULL,
	nom VARCHAR(30) NOT NULL,
	idCiu INTEGER REFERENCES ejercicio1.ciu1(idCiu) ON DELETE SET NULL ON UPDATE RESTRICT,
	edad INTEGER NOT NULL,
	trabaja VARCHAR NOT NULL
)

CREATE TABLE ejercicio1.ciu2(
	idCiu INTEGER PRIMARY KEY NOT NULL,
	nomCiu VARCHAR(30) NOT NULL,
	cantHab INTEGER DEFAULT 0
)

INSERT INTO ejercicio1.pers2  VALUES 
('20-11111111-1', 'Juan Perez', 1, 35, 'si'), 
('27-22222222-2', 'Ana Gomez', 2, 28, 'no'), 
('23-33333333-3', 'Carlos Diaz', 1, 40, 'si'), 
('25-44444444-4', 'María Lopez', 3, 22, 'no'); 

INSERT INTO ejercicio1.pers2  VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si'); 

INSERT INTO ejercicio1.ciu2 VALUES (1, 'Buenos Aires', 3000000); 
INSERT INTO ejercicio1.ciu2 VALUES (2, 'Rosario', null); 
INSERT INTO ejercicio1.ciu2 VALUES (3, 'San Juan', 822853); 
INSERT INTO ejercicio1.ciu2 VALUES (4, 'Mendoza',  2043540);  

DELETE FROM ejercicio1.ciu2 WHERE idCiu = 1 

UPDATE ejercicio1.ciu1 
SET idCiu = 10 
WHERE idCiu = 1

SELECT * FROM ejercicio1.pers2
SELECT * FROM ejercicio1.ciu2
