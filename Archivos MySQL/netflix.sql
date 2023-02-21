CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;


CREATE TABLE IF NOT EXISTS Peliculas(
	id_peli int,
    nombre_peli VARCHAR(30),
    duracion INT,
    director_peli VARCHAR(20),
    género_peli ENUM ('acción', 'drama', 'comedia'),
    nota_peli FLOAT,
    actor INT,
    primary key (id_peli)
);


CREATE TABLE IF NOT EXISTS Actores(
	id_actor INT,
    nombre VARCHAR(30),
    fecha_nac DATE,
    sueldo INT,
    sexo ENUM ('femenino', 'masculino', 'otros'),
    primary key (id_actor)
);

INSERT INTO Actores(id_actor, nombre, fecha_nac, sueldo, sexo) VALUES
(101, 'Leonardo', '1980-12-01' , 3000000, 'masculino'),
(102, 'Julia', '1997-09-09' , 1000000, 'femenino'),
(103, 'Brad', '1983-02-02' , 700000, 'masculino'),
(104, 'Carlos', '1986-03-03' , 250000, 'masculino'),
(105, 'Santiago', '1970-04-04' , 4000000, 'masculino'),
(106, 'Penelope', '1976-05-05' , 23000, 'femenino'),
(107, 'Noa', '1981-06-06' , 770000, 'otros'),
(108, 'Jon', '1996-07-07' , 6000, 'otros');

INSERT INTO Peliculas (nombre_peli, duracion, director_peli, género_peli, nota_peli, id_peli, actor) VALUES
('Bright', 120, 'Fernando', 'acción', 3.1, 1, 101),
('Frida', 100, 'Daniel', 'drama', 7.6, 2, 101),
('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 102),
('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 107),
('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 104),
('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 103),
('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 101);


/*1.Obtén el nombre y la fecha de nacimiento de los actores con un sueldo menor que 1000000 y que su nombre contenga una letra "e" o una letra "n" o tenga menos de 4 caracteres.
Ordena el resultado por la fecha de nacimiento de los actores, de menor a mayor.*/

SELECT nombre, fecha_nac, SUELDO FROM Actores WHERE sueldo<1000000 AND nombre LIKE "%e%n%" OR char_length(nombre)<4 ORDER BY fecha_nac DESC;


/*2.Obtén el nombre del actor que más películas haya rodado junto con el número de películas que haya rodado y que su sexo sea distinto a "Masculino".
 Muestra el resultado en dos columnas de nombre ACTOR y PELIS.*/
 

SELECT A.nombre AS ACTOR, COUNT(*) AS PELIS FROM Actores AS A INNER JOIN Peliculas AS P ON A.id_actor = P.actor
WHERE A.sexo != 'Masculino' GROUP BY A.id_actor ORDER BY PELIS DESC LIMIT 1;


/*3.Obtén los nombres y sueldos de los actores que cobren más del doble de sueldo que "Noa". Muestra los resultados en columnas llamadas NOM_ACTOR y SUELDO_ACTOR, ordenados por el 
sueldo de menor a mayor.*/

SELECT nombre AS NOM_ACTOR, sueldo AS SUELDO_ACTOR FROM Actores WHERE sueldo>(SELECT sueldo*2 FROM Actores WHERE nombre LIKE "Noa") ORDER BY sueldo;
 

/*4.Obtén el nombre de los actores nacidos en un mismo día y mes, y hayan trabajado en una película dirigida por "Jon","Adrián", "Nuria" o "Ivan". Muestra el resultado en una columna ACT
ordenados por orden alfabético.*/

SELECT DISTINCT A.nombre AS ACT FROM Actores AS A JOIN Peliculas AS P ON A.id_actor = P.Actor 
WHERE ((MONTH(A.fecha_nac) =  DAY (A.fecha_nac)) AND (P.director_peli = "Jon" OR P.director_peli = "Adrián" OR P.director_peli = "Nuria" OR P.director_peli = "Ivan"))
ORDER BY A.nombre;


/*5.Obtén todos los datos de las películas que contengan más de una letra "o" en su nombre, su duración sea menor que la duración de "Animales nocturnos" y su puntuación sea mayor que la película del actor Carlos.
Ordena los resultados por la nota de la película, de mayor a menor. */

SELECT * FROM Peliculas WHERE nombre_peli LIKE "%o%o%" AND duracion<(SELECT duracion FROM Peliculas WHERE nombre_peli = 'Animales nocturnos')
AND nota_peli>(SELECT nota_peli FROM Peliculas WHERE actor = 104) ORDER BY nota_peli DESC;
