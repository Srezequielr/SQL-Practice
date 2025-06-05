-- Script PostgreSQL para el sistema de Películas

-- Eliminación de tablas si existen
DROP TABLE IF EXISTS Sigue CASCADE;
DROP TABLE IF EXISTS Actua CASCADE;
DROP TABLE IF EXISTS Dirige CASCADE;
DROP TABLE IF EXISTS Pelicula CASCADE;
DROP TABLE IF EXISTS Persona CASCADE;

-- Creación de tablas
CREATE TABLE ejercicio5.Persona (
    idP SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fechaNac DATE NOT NULL,
    paisNac VARCHAR(50) NOT NULL
);

CREATE TABLE ejercicio5.Pelicula (
    idPel SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    fEstreno DATE NOT NULL,
    lema VARCHAR(200),
    genero VARCHAR(50) NOT NULL,
    paisOrigen VARCHAR(50) NOT NULL
);

CREATE TABLE ejercicio5.Dirige (
    idP INTEGER REFERENCES ejercicio5.Persona(idP) ON DELETE CASCADE,
    idPel INTEGER REFERENCES ejercicio5.Pelicula(idPel) ON DELETE CASCADE,
    PRIMARY KEY (idP, idPel)
);

CREATE TABLE ejercicio5.Actua (
    idP INTEGER REFERENCES ejercicio5.Persona(idP) ON DELETE CASCADE,
    idPel INTEGER REFERENCES ejercicio5.Pelicula(idPel) ON DELETE CASCADE,
    PRIMARY KEY (idP, idPel)
);

CREATE TABLE ejercicio5.Sigue (
    idSeguido INTEGER REFERENCES ejercicio5.Persona(idP) ON DELETE CASCADE,
    idSeguidor INTEGER REFERENCES ejercicio5.Persona(idP) ON DELETE CASCADE,
    PRIMARY KEY (idSeguido, idSeguidor),
    CHECK (idSeguido <> idSeguidor)
);

-- Inserción de datos de prueba

-- Inserción de personas (actores y directores)
INSERT INTO ejercicio5.Persona (nombre, fechaNac, paisNac) VALUES
('Keanu Reeves', '1964-09-02', 'Canadá'),
('Carrie-Anne Moss', '1967-08-21', 'Canadá'),
('Laurence Fishburne', '1961-07-30', 'EEUU'),
('Hugo Weaving', '1960-04-04', 'Nigeria'),
('Lana Wachowski', '1965-06-21', 'EEUU'),
('Lilly Wachowski', '1967-12-29', 'EEUU'),
('Steven Spielberg', '1946-12-18', 'EEUU'),
('Harrison Ford', '1942-07-13', 'EEUU'),
('Mark Hamill', '1951-09-25', 'EEUU'),
('Carrie Fisher', '1956-10-21', 'EEUU'),
('George Lucas', '1944-05-14', 'EEUU'),
('Ricardo Darín', '1957-01-16', 'Argentina'),
('Guillermo Francella', '1955-02-14', 'Argentina'),
('Juan José Campanella', '1959-07-19', 'Argentina'),
('Natalia Oreiro', '1977-05-19', 'Uruguay'),
('Leonardo DiCaprio', '1974-11-11', 'EEUU'),
('Christopher Nolan', '1970-07-30', 'Reino Unido'),
('Tom Hanks', '1956-07-09', 'EEUU'),
('Robert Zemeckis', '1952-05-14', 'EEUU'),
('James Cameron', '1954-08-16', 'Canadá'),
('Sam Worthington', '1976-08-02', 'Australia');

-- Inserción de películas
INSERT INTO ejercicio5.Pelicula (titulo, fEstreno, lema, genero, paisOrigen) VALUES
('The Matrix', '1999-03-31', 'Welcome to the Real World', 'Ciencia Ficción', 'EEUU'),
('The Matrix Reloaded', '2003-05-15', 'Free your mind', 'Ciencia Ficción', 'EEUU'),
('The Matrix Revolutions', '2003-11-05', 'Everything that has a beginning has an end', 'Ciencia Ficción', 'EEUU'),
('Star Wars: Episode IV', '1977-05-25', 'May the Force be with you', 'Ciencia Ficción', 'EEUU'),
('Star Wars: Episode V', '1980-05-21', 'The Empire Strikes Back', 'Ciencia Ficción', 'EEUU'),
('El secreto de sus ojos', '2009-08-13', 'Un crimen sin castigo, un amor sin olvido', 'Drama', 'Argentina'),
('El hijo de la novia', '2001-08-16', 'Volver a empezar', 'Drama', 'Argentina'),
('El robo del siglo', '1990-05-17', 'Robar no es un crimen, el verdadero crimen es que te roben', 'Comedia', 'Argentina'),
('Titanic', '1997-12-19', 'Nothing on Earth could come between them', 'Romance', 'EEUU'),
('Avatar', '2009-12-18', 'Enter the World', 'Ciencia Ficción', 'EEUU'),
('Inception', '2010-07-16', 'Your mind is the scene of the crime', 'Ciencia Ficción', 'EEUU'),
('Forrest Gump', '1994-07-06', 'The world will never be the same once you have seen it through the eyes of Forrest Gump', 'Drama', 'EEUU'),
('John Wick', '2014-10-24', 'Dont set him off', 'Acción', 'EEUU'),
('Constantine', '2005-02-18', 'Hell wants him, Heaven wont take him, Earth needs him', 'Acción', 'EEUU'),
('Speed', '1990-06-10', 'Get ready for rush hour', 'Acción', 'EEUU'),
('Point Break', '1990-07-12', 'Veinte segundos para cambiar tu vida para siempre', 'Acción', 'EEUU'),
('Moon', '2009-07-10', 'El último lugar donde esperarías encontrarte a ti mismo', 'Ciencia Ficción', 'Reino Unido'),
('Memento', '2000-09-05', 'Some memories are best forgotten', 'Thriller', 'EEUU'),
('Interstellar', '2014-11-07', 'Mankind was born on Earth. It was never meant to die here', 'Ciencia Ficción', 'EEUU'),
('Avatar 2', '2022-12-16', 'Return to Pandora', 'Ciencia Ficción', 'EEUU');

-- Inserción de relaciones dirige (director-película)
INSERT INTO ejercicio5.Dirige (idP, idPel) VALUES
(5, 1), -- Lana Wachowski - The Matrix
(6, 1), -- Lilly Wachowski - The Matrix
(5, 2), -- Lana Wachowski - The Matrix Reloaded
(6, 2), -- Lilly Wachowski - The Matrix Reloaded
(5, 3), -- Lana Wachowski - The Matrix Revolutions
(6, 3), -- Lilly Wachowski - The Matrix Revolutions
(11, 4), -- George Lucas - Star Wars: Episode IV
(11, 5), -- George Lucas - Star Wars: Episode V
(14, 6), -- Juan José Campanella - El secreto de sus ojos
(14, 7), -- Juan José Campanella - El hijo de la novia
(14, 8), -- Juan José Campanella - El robo del siglo
(20, 9), -- James Cameron - Titanic
(20, 10), -- James Cameron - Avatar
(17, 11), -- Christopher Nolan - Inception
(19, 12), -- Robert Zemeckis - Forrest Gump
(1, 13), -- Keanu Reeves - John Wick (director ficticio para el ejercicio)
(20, 20), -- James Cameron - Avatar 2
(17, 18), -- Christopher Nolan - Memento
(17, 19), -- Christopher Nolan - Interstellar
(7, 17); -- Steven Spielberg - Moon (ficticio para el ejercicio)

-- Inserción de relaciones actua (actor-película)
INSERT INTO ejercicio5.Actua (idP, idPel) VALUES
(1, 1), -- Keanu Reeves - The Matrix
(2, 1), -- Carrie-Anne Moss - The Matrix
(3, 1), -- Laurence Fishburne - The Matrix
(4, 1), -- Hugo Weaving - The Matrix
(1, 2), -- Keanu Reeves - The Matrix Reloaded
(2, 2), -- Carrie-Anne Moss - The Matrix Reloaded
(3, 2), -- Laurence Fishburne - The Matrix Reloaded
(4, 2), -- Hugo Weaving - The Matrix Reloaded
(1, 3), -- Keanu Reeves - The Matrix Revolutions
(2, 3), -- Carrie-Anne Moss - The Matrix Revolutions
(3, 3), -- Laurence Fishburne - The Matrix Revolutions
(4, 3), -- Hugo Weaving - The Matrix Revolutions
(8, 4), -- Harrison Ford - Star Wars: Episode IV
(9, 4), -- Mark Hamill - Star Wars: Episode IV
(10, 4), -- Carrie Fisher - Star Wars: Episode IV
(8, 5), -- Harrison Ford - Star Wars: Episode V
(9, 5), -- Mark Hamill - Star Wars: Episode V
(10, 5), -- Carrie Fisher - Star Wars: Episode V
(12, 6), -- Ricardo Darín - El secreto de sus ojos
(13, 6), -- Guillermo Francella - El secreto de sus ojos
(15, 6), -- Natalia Oreiro - El secreto de sus ojos
(12, 7), -- Ricardo Darín - El hijo de la novia
(13, 7), -- Guillermo Francella - El hijo de la novia
(12, 8), -- Ricardo Darín - El robo del siglo
(13, 8), -- Guillermo Francella - El robo del siglo
(16, 9), -- Leonardo DiCaprio - Titanic
(16, 11), -- Leonardo DiCaprio - Inception
(18, 12), -- Tom Hanks - Forrest Gump
(1, 13), -- Keanu Reeves - John Wick
(1, 14), -- Keanu Reeves - Constantine
(1, 15), -- Keanu Reeves - Speed
(1, 16), -- Keanu Reeves - Point Break
(21, 10), -- Sam Worthington - Avatar
(21, 20), -- Sam Worthington - Avatar 2
(16, 19), -- Leonardo DiCaprio - Interstellar (ficticio para el ejercicio)
(18, 18); -- Tom Hanks - Memento (ficticio para el ejercicio)

-- Inserción de relaciones sigue (seguidor-seguido)
INSERT INTO ejercicio5.Sigue (idSeguido, idSeguidor) VALUES
(1, 2), -- Carrie-Anne Moss sigue a Keanu Reeves
(1, 3), -- Laurence Fishburne sigue a Keanu Reeves
(1, 4), -- Hugo Weaving sigue a Keanu Reeves
(1, 5), -- Lana Wachowski sigue a Keanu Reeves
(5, 6), -- Lilly Wachowski sigue a Lana Wachowski
(6, 5), -- Lana Wachowski sigue a Lilly Wachowski
(11, 7), -- Steven Spielberg sigue a George Lucas
(7, 11), -- George Lucas sigue a Steven Spielberg
(12, 14), -- Juan José Campanella sigue a Ricardo Darín
(14, 12), -- Ricardo Darín sigue a Juan José Campanella
(13, 12), -- Ricardo Darín sigue a Guillermo Francella
(15, 12), -- Ricardo Darín sigue a Natalia Oreiro
(16, 20), -- James Cameron sigue a Leonardo DiCaprio
(20, 21), -- Sam Worthington sigue a James Cameron
(17, 16), -- Leonardo DiCaprio sigue a Christopher Nolan
(18, 19), -- Robert Zemeckis sigue a Tom Hanks
(19, 18), -- Tom Hanks sigue a Robert Zemeckis
(20, 16), -- Leonardo DiCaprio sigue a James Cameron
(1, 16), -- Leonardo DiCaprio sigue a Keanu Reeves
(16, 1); -- Keanu Reeves sigue a Leonardo DiCaprio

-- ejericico 1
SELECT nombre, COUNT(*) AS cant -- cuenta la cantidad de nombres agrupados 
FROM ejercicio5.Persona p
NATURAL JOIN ejercicio5.Dirige d 
NATURAL JOIN ejercicio5.Pelicula peli -- el join entre pelis dirige y persona 
WHERE genero = 'Ciencia Ficción' -- filtra las pelis de cf
GROUP BY p.nombre --Agrupa nombres

-- ejercicio 2
SELECT nombre-- cuenta la cantidad de nombres agrupados 
FROM ejercicio5.Persona p
NATURAL JOIN ejercicio5.Dirige d 
NATURAL JOIN ejercicio5.Pelicula peli -- el join entre pelis dirige y persona 
WHERE genero = 'Ciencia Ficción' -- filtra las pelis de cf
GROUP BY p.nombre
HAVING COUNT(*) >= 3;

-- ejercicio 3
SELECT nombre
FROM ejercicio5.Persona p
NATURAL JOIN ejercicio5.Actua a
NATURAL JOIN ejercicio5.Pelicula peli
WHERE fEstreno > '1990-01-01' AND fEstreno < '1990-12-31'
GROUP BY p.nombre
HAVING COUNT(*) > 1

-- ejercicio 4
SELECT titulo, lema
FROM ejercicio5.Pelicula p
NATURAL JOIN ejercicio5.Persona i
NATURAL JOIN ejercicio5.Actua a
WHERE paisnac = 'Argentina'
GROUP BY p.titulo, p.lema

-- ejercicio 5
SELECT titulo, festreno
FROM ejercicio5.Pelicula p
NATURAL JOIN ejercicio5.Persona 
NATURAL JOIN ejercicio5.Dirige
WHERE nombre = 'Keanu Reeves'

-- ejercicio 6 
SELECT DISTINCT p.*
FROM ejercicio5.Persona p
JOIN ejercicio5.Actua a ON p.idp = a.idp 
JOIN ejercicio5.Dirige d ON p.idp = d.idp

-- ejercicio 7
SELECT DISTINCT p.*
FROM ejercicio5.Persona p
WHERE NOT EXISTS (
	SELECT 1
	FROM ejercicio5.Pelicula peli
	WHERE NOT EXISTS (
		SELECT 1
		FROM ejercicio5.Actua a
		WHERE a.idp = p.idp AND a.idpel = peli.idpel
	)
)

-- ejercicio 8
SELECT DISTINCT p.*
FROM ejercicio5.Persona p
WHERE NOT EXISTS (
	SELECT 1
	FROM ejercicio5.Pelicula peli
	WHERE NOT EXISTS (
		SELECT 1
		FROM ejercicio5.Actua a
		WHERE a.idp = p.idp AND a.idpel = peli.idpel AND paisorigen = 'EEUU'
	)
)