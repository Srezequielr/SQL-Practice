CREATE TABLE ejercicio1.pers1(
	cuil VARCHAR(30) PRIMARY KEY NOT NULL,
	nom VARCHAR(30) NOT NULL,
	idCiu INTEGER REFERENCES ejercicio1.ciu1(idCiu),
	edad INTEGER NOT NULL,
	trabaja VARCHAR NOT NULL
)

DROP TABLE ejercicio1.pers1 RESTRICT
ALTER TABLE ejercicio1.pers1 CASCADE

CREATE TABLE ejercicio1.ciu1(
	idCiu INTEGER PRIMARY KEY NOT NULL,
	nomCiu VARCHAR(30) NOT NULL,
	cantHab INTEGER DEFAULT 0
)

INSERT INTO ejercicio1.pers1  VALUES 
('20-11111111-1', 'Juan Perez', 1, 35, 'si'), 
('27-22222222-2', 'Ana Gomez', 2, 28, 'no'), 
('23-33333333-3', 'Carlos Diaz', 1, 40, 'si'), 
('25-44444444-4', 'María Lopez', 3, 22, 'no'); 

INSERT INTO ejercicio1.ciu1 VALUES (1, 'Buenos Aires', 3000000); 
INSERT INTO ejercicio1.ciu1 VALUES (2, 'Rosario', null); 
INSERT INTO ejercicio1.ciu1 VALUES (3, 'San Juan', 822853); 
INSERT INTO ejercicio1.ciu1 VALUES (4, 'Mendoza',  2043540); 

INSERT INTO ejercicio1.pers1  VALUES ('20-55555555-1', 'Juan Sanchez', 10, 35, 'si'); 

DELETE FROM ejercicio1.ciu1 WHERE idCiu = 1 
UPDATE ejercicio1.ciu1 SET idCiu = (SELECT idCiu FROM ejercicio1.ciu1 WHERE idCiu = 1) = 10


SELECT * FROM ejercicio1.pers1
SELECT * FROM ejercicio1.ciu1
