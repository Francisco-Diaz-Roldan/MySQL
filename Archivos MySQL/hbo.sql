CREATE DATABASE IF NOT EXISTS HBO;
USE HBO;

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

#Modifica el protagonista de la pelicula que tenga una duracion entre 90 y 110 minutos y con menos caracteres en el nombre que "El Hoyo", al protagonista "1002".
alter table Peliculas drop constraint `FK_PROTAGONISTA`;

update Peliculas set Protagonista ="1002" where ((Duracion between 90 and 110) and (char_length(Nombre) < char_length("El Hoyo")));



#Modifica el genero de las peliculas que tengan un nombre de mas de 15 caracteres a "Tragicomedia"

alter table Peliculas modify Genero ENUM ('acción', 'drama', 'comedia', 'Tragicomedia');
update Peliculas set Genero = "Tragicomedia" where (char_length(Nombre)>15);



#Modifica la duracion de las peliculas añadiendoles 5 minutos, excepto las peliculas que tengan un identificador menor que 5.
update Peliculas set Duracion = Duracion + 5 where (ID >= 5);
select * from Peliculas;



#Modifica la tabla reparto añadiendo una nueva columna Sueldo de tipo entero.Asigna por defecto  un sueldo de 5000

alter table Reparto add column Sueldo int default 5000;
select * from Reparto;



#Duplica el sueldo de los actores que contengan mas de una letra "o" en su apellido, o más de una letra "a" en su nombre.

update Reparto set Sueldo = Sueldo * 2  where (Apellido like "%o%o%" or Nombre like "%a%a%");

select * from Reparto;


#Elimina todas las peliculas que tengan una nota entre 3 y 5, y no hayan sido dirigidas por Nuria, Fernando o Daniel.

#delete from Peliculas where ((Nota>= 3 and Nota<5) and (Director not like "Nuria" or Director not like "Fernando" or Director not like "Daniel"));
delete from Peliculas where ((Nota>= 3 and Nota<5) and Director not  in ("Nuria", "Fernando", "Daniel"));
select * from Peliculas;
