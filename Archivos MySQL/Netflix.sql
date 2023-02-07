CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;

CREATE TABLE IF NOT EXISTS Peliculas(
	ID int primary key,
    Nombre VARCHAR(30),
    Duracion INT,
    Director VARCHAR(20),
    Genero ENUM ('acción', 'drama', 'comedia'),
    Nota FLOAT
);

CREATE TABLE IF NOT EXISTS Reparto(
	DNI VARCHAR(9) primary key,
    Nombre VARCHAR(30),
    Apellido VARCHAR(30),
    Fecha_nac DATE
);

ALTER TABLE Peliculas ADD COLUMN Protagonista VARCHAR(9), 
ADD CONSTRAINT `FK_PROTAGONISTA` 
FOREIGN KEY (Protagonista) 
REFERENCES Reparto(DNI);

INSERT INTO Reparto (DNI, Nombre, Apellido, Fecha_nac) VALUES
("1234", "Will", "Smith", "1985-12-13"),
("1357", "Salma", "Hayek", "1976-02-11"),
("1222", "George", "Clooney", "2000-02-23"),
("1265", "Adam", "Sandler", "1980-12-13"),
("1212", "Nemo", " ", "1985-01-07");


INSERT INTO Peliculas (ID, Nombre, Duracion, Director, Genero, Nota, Protagonista) VALUES
(1, 'Bright', 120, 'Fernando', 'acción', 3.1, "1234"),
(2, 'Frida', 100, 'Daniel', 'drama', 7.6, "1357"),
(3, 'Los dos papas', 160, 'Adrián', 'comedia', 8.3, "1222"),
(4, 'Animales nocturnos', 185, 'Tomás', 'drama', 9.5, "1357"),
(5, 'Oceans Eleven', 150, 'Nuria', 'acción', 3.5, "1222"),
(6, 'Buscando a Nemo', 120, 'Jon', 'comedia', 2.1, "1212"),
(7, 'El Hoyo', 110, 'Ivan', 'acción', 9.9, "1265"),
(8, 'Diamante en bruto', 140, 'Paola', 'acción', 8.1, "1265");


#Ejercicio 1.- Muestra los DNI y nombres de los actores de reparto junto con el tiempo total de duración de sus peliculas. Utiliza la función GROUP BY para agrupar los resultados.

Select R.DNI, R.Nombre, sum(P.Duracion) from Reparto as R inner join Peliculas as P where R.DNI=P.Protagonista group by R.DNI;


#Ejercicio 2.- Muestra los DNIs de los actores de reparto junto con las peliculas que hayan rodado.

Select R.DNI, P.Nombre from Reparto as R inner join Peliculas as P where R.DNI=P.Protagonista; 


#Ejercicio 3.- Muestra el nombre de las peliculas junto con el apellido de su protagonista que hayan realizado películas de acción y hayan nacido más tarde de 1984.

Select P.Nombre, R.Apellido from Reparto as R inner join Peliculas as P where R.DNI=P.Protagonista and  P.Genero="acción" and year(R.Fecha_nac)>1984;


#Ejercicio 4.- Muestra los nombres de las 3 peliculas con mayor puntuación junto con nombre y apellido del protagonista.

Select P.Nombre, R.Nombre, R.Apellido from Reparto as R inner join Peliculas as P  where R.DNI= P.Protagonista order by P.Nota desc limit 3;


#Ejercicio 5.- Muestra la fecha de nacimiento del actor más joven de la tabla, y la media de las notas de las películas en una tabla que nombre las columnas como JOVEN y MEDIA. 

Select R.Fecha_nac as JOVEN, avg(P.Nota) as MEDIA from Reparto as R inner join Peliculas as P where R.DNI = P.Protagonista group by R.DNI order by R.Fecha_nac desc limit 1;

/*Ejercicio 6.- Muestra todos los datos de las películas que coincida que el nombre de la pelicula y el apellido su protagonista tengan el mismo número de caracteres. 
Haz que en el resultado no se repitan los resultados y muestra todos los datos sin especificar las columnas que se quieren mostrar.*/

select * from Peliculas as P inner join Reparto as R where P.Protagonista=R.DNI and char_length(P.Nombre)=char_length(R.Apellido) group by P.ID;

/*Ejercicio 7.- Muestra los nombres y apellidos de todos los actores de la tabla reparto junto al nombre y nota de las peliculas en las que han trabajado.
 Ordena el resultado en orden alfabético por el nombre de los actores y por la nota de las películas que han rodado (de mayor a menor).*/
 
 select R.Nombre, R.Apellido, P.Nombre, P.Nota from Reparto as R inner join Peliculas as P where R.DNI=P.Protagonista order by R.Nombre, P.Nota desc;

#Ejercicio 8.- Muestra los nombres de los actores junto con mayor la nota máxima. Utiliza la función GROUP BY para agrupar los resultados.

SELECT R.NOMBRE, MAX(P.NOTA) AS MAXIMO FROM REPARTO AS R INNER JOIN PELICULAS AS P WHERE P.PROTAGONISTA=R.DNI GROUP BY R.NOMBRE;


#EJERCICIO A CORREGIR JUSTO A CONTINUACION
#Ejercicio 8.- Muestra los nombres de los actores junto con el nombre de la pelicula con mayor puntuación que hayan rodado. Utiliza la función GROUP BY para agrupar los resultados.
SET sql_mode = ''
select R.Nombre, P.Nombre from Reparto as R inner joy Peliculas as P where R.DNI = P.ID group by R.DNI order by P.Nota; 


