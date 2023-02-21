drop DATABASE Netflix3;
CREATE DATABASE IF NOT EXISTS Netflix3;
USE Netflix3;

CREATE TABLE IF NOT EXISTS Peliculas(
	id_peli int,
    	nombre_peli VARCHAR(30),
    	duracion INT,
   	director_peli VARCHAR(20),
    	genero_peli ENUM ('acción', 'drama', 'comedia'),
    	nota_peli FLOAT,
	protagonista int,
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

INSERT INTO Peliculas (nombre_peli, duracion, director_peli, genero_peli, nota_peli, id_peli, protagonista) VALUES
('Bright', 120, 'Fernando', 'acción', 3.1, 1, 103),
('Frida', 100, 'Daniel', 'drama', 7.6, 2, 107),
('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 103),
('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 101),
('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 102),
('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 102),
('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 108);




select nombre, fecha_nac from Actores  where sueldo<1000000 and (nombre  like "%e%" or nombre  like "%n%" or char_length(nombre)<4) order by fecha_nac desc;

SELECT a.nombre AS NOM_ACTOR, COUNT(*) AS PELIS
FROM Actores a
JOIN Peliculas p ON a.id_actor = p.protagonista
WHERE a.sexo != 'masculino'
GROUP BY a.id_actor
ORDER BY PELIS DESC
LIMIT 1;

SELECT nombre AS NOM_ACTOR, sueldo AS SUELDO_ACTOR
FROM Actores
WHERE sueldo > (SELECT sueldo * 2 FROM Actores WHERE nombre = 'Noa')
ORDER BY sueldo DESC;

SELECT DISTINCT Actores.nombre AS act
FROM Actores
JOIN Peliculas ON Actores.id_actor = Peliculas.protagonista
WHERE MONTH(Actores.fecha_nac) = MONTH('1981-06-06')
AND DAY(Actores.fecha_nac) = DAY('1981-06-06')
AND Peliculas.director_peli IN ('Jon', 'Adrian', 'Nuria', 'Ivan');

SELECT *
FROM Peliculas
WHERE nombre_peli REGEXP '[a-zA-Z]{2,}' AND duracion < (SELECT duracion FROM Peliculas WHERE nombre_peli = 'Animales nocturnos')
AND nota_peli > (SELECT nota_peli FROM Peliculas WHERE protagonista = 104)
ORDER BY nota_peli;

select nombre from Actores as A where 

#Ejercicio 1.- Obtén todos los datos de los actores con un sueldo menor que el sueldo de Penelope, y que hayan rodado una película de acción.

select a.* from actores as a inner join peliculas as p on a.id_actor=p.protagonista where a.sueldo <
(select a.sueldo from actores as a where a.nombre="Penelope")
and p.genero_peli='acción';


#Ejercicio 2.- Obtén el id y nombre del actor que haya rodado una película del mismo género que la película rodada por Jon, y en la columna sexo tenga el valor Femenino. 
 
select a.id_actor, a.nombre from actores as a inner join peliculas as p on a.id_actor=p.protagonista where p.genero_peli=
(select p.genero_peli from actores as a inner join peliculas as p on a.id_actor=p.protagonista where p.director_peli = "Jon") and a.sexo='femenino' group by a.id_actor;

#Ejercicio 3.- Obtén el nombre de los actores que tengan menos caracteres que el actor con id 104, ordenador por la fecha de nacimiento de menor a mayor.
select a.id_actor, a.nombre from actores as a inner join peliculas as p on a.id_actor=p.protagonista where char_length(a.nombre)<
(select char_length(a.nombre) from actores as a where a.id_actor="104") group by a.id_actor order by a.fecha_nac desc;


#Ejercicio 4.- Obtén el número total de películas rodadas por cada actor, siempre y cuando no hayan nacido en el mes defebrero o marzo. Muestra los datos en dos columnas de nombre ACTOR y TOTAL.

select a.nombre, count(p.id_peli)
from actores as a inner join peliculas as p on a.id_actor=p.protagonista 
where month(a.fecha_nac) not in (2,3) 
group by a.nombre;

 
 #Ejercicio 5.- Obtén el nombre de las películas con menor duración que la tercera película con mayor duración de la tabla.
 
select p.nombre_peli from peliculas as p where p.duracion <
(select p.duracion from peliculas as p order by p.duracion desc limit 2,1);

select nombre_peli from peliculas where duracion < 
(select duracion from peliculas order by duracion desc limit 2,1);


#Ejercicio 6.- Obtén el nombre de las películas que contengan más de un letra "a" en su nombre y no hayan sido protagonizadas por el actor con sexo masculino y el máximo id. 

select nombre_peli from peliculas where protagonista <>
(select max(id_actor) from actores where sexo="masculino") and nombre_peli like"%a%a%";

#Ejercicio 7.- Obtén los datos del actor con el mismo nombre que el director de la película con menor puntuación de la tabla Películas. 

select a.* from actores as a inner join peliculas as p on a.id_actor=p.protagonista where a.nombre =(select p.director_peli from peliculas as p order by p.nota_peli limit 1);















