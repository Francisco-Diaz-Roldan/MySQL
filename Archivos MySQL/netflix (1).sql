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

/*Muestra el ID y nombre de las peliculas que no hayan sido rodadas por Paola, Jon o Nuria, tengan el 
mismo genero que la pelicula Buscando a Nemo y una nota mayor que la nota media de todas las peliculas.
Ordena el resultado por la nota de las peliculas de mayor a menor.*/

#alter table Peliculas drop constraint `FK_PROTAGONISTA`;
select P.ID, P.Nombre from Peliculas as P where Genero = (select Genero from Peliculas where Nombre = 'Buscando a Nemo')
and Nota > (select avg(Nota) from  Peliculas)and Protagonista not in (select DNI from Reparto where Nombre in ('Paola', 'Jon', 'Nuria'))order by Nota desc;


/*Muestra los datos de las dos peliculas con mejor puntuacion que tengan un protagonista que NO haya nacido
entre los años 1985 y 1990.Ordena los datos por la puntuacion de las peliculas de mayor a menor.*/

select *from Peliculas where Protagonista not in (select DNI from Reparto where Fecha_nac between '1985-01-01' and '1990-12-31' ) order by Nota desc limit 2;


/*Muestra el nombre de la pelicula junto al nombre de su protagonista de las peliculas con una duracion menor
 que la pelicula dirigida por Paola. Ordena los datos por la longitud del nombre de la pelicula de mayor a menor),
 y muestralos en dos columnas llamadas PELI y PROTA.*/

select P.Nombre as PELI, R.Nombre as PROTA from Peliculas as P inner join Reparto as R on P.Protagonista = R.DNI
where P.Duracion < (select Duracion from Peliculas where Director = 'Paola' order by Duracion limit 1) order by char_length(P.Nombre) desc;

/*Muestra los nombres de los actres que hayan protagonizado una pelicula con un nombre que contenga la letra "m" y una 
letra "b" o que hayan nacido antes que el tercer actor más joven de la tabla. Muestra el resultado ordenado alfabeticamente y sin que se repitan datos*/
select distinct Nombre from Reparto where Nombre in  (select distinct Nombre from Peliculas where Nombre like '%m%' and Nombre like '%b%' union select distinct R.Nombre from Reparto as R
inner join Peliculas as P on R.DNI = P.Protagonista where R.Fecha_nac < (select Fecha_nac from  Reparto order by Fecha_nac limit 2,1 )) order by Nombre;

