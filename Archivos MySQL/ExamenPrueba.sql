create database ExamenPrueba;

use ExamenPrueba;

create table Alumnos(
DNI varchar(10),
Nombre varchar(15),
Apellido varchar(15),
Edad int,
Ciudad varchar(15)
);

create table Productos(
DNI varchar(10),
Nproductos int
);


insert into Alumnos values
("47657450-L", "Jon", "Zamora", 29, "Irun"),
("47657450-L", "Jon", "Zamora", 29, "Madrid"),
("42000201-T", "Daniel", "Garcia", 31, "Cancun"),
("32120101-F", "Fernando", "Lopez", 19, "Madrid"),
("10000000-R", "Ramiro", "Ramiro", 21, "Bilbao"),
("10000000-R", "Ramiro", "Ramiro", 21, "Barcelona"),
("44566812-M", "Marius", "Mario", 20, "Irun");

insert into Productos values
("47657450-L", 4),
("44566812-M", 1),
("42000201-T", 0),
("32120101-F", 0),
("44566812-M", 2);

#Ejercicio 1.- Realiza una consulta que devuelva todos los datos ordenados alfabéticamente por el nombre del alumno.

select * from Alumnos order by Nombre asc;

#Ejercicio 2.- Realiza una consulta que devuelva la media de edad de los alumnos, en una columna que se denomine “MediaEdad”.

SELECT AVG(Edad) AS EdadMedia FROM Alumnos;

#Ejercicio 3.- Realiza una consulta que devuelva los datos de todos los alumnos que tengan un nombre que comience por la letra “J” y tengan un apellido que contenga la letra “a”.

SELECT * FROM Alumnos where Nombre like "J%" and Apellido like "%a%";

#Ejercicio 4.- Realiza una consulta que devuelva los alumnos que vivan en la ciudad Irun, Madrid o Bilbao.

Select * from Alumnos where Ciudad in ("Irun","Madrid", "Bilbao");

#Ejercicio 5.- Realiza una consulta que devuelva el nombre, apellido y edad de los 3 alumnos con mayor edad, ordenados de mayor a menor edad.

Select Nombre, Apellido, Edad from Alumnos order by Edad desc limit 3;

#Ejercicio 6.- Realiza una consulta que devuelva el número de alumnos integrados en la base de datos, en una columna que se denomine “NºAlumnos”.

SELECT COUNT(*) AS "NºAlumnos" FROM Alumnos;

/*Ejercicio 7.- Realiza una consulta que devuelva el número de productos comprados por cada alumno, siempre que el alumno haya realizado alguna compra.
La consulta debe devolver el nombre del alumno junto al número de compras realizadas por este.*/

Select A.Nombre, P.Nproductos from Alumnos as A inner join Productos as P where A.DNI= P.DNI;

#Ejercicio 8.- Realiza una consulta que devuelva los alumnos que tengan entre 22 y 29 años (ambos NO incluidos).

select * from Alumnos where Edad>22 and Edad<29; #edad between 23 and 28

#Ejercicio 9.- Realiza una consulta que devuelva el DNI de los alumnos con el mismo nombre y apellido.

select DNI from Alumnos WHERE Nombre = Apellido ;

#Ejercicio 10.- Realiza una consulta que devuelva el número máximo y el número mínimo de productos de la tabla Pedidos, en dos columnas correspondientes denominadas “NºMáximo” y “Nºmínimo”.


SELECT max(NProductos) AS NºMáximo, min(Nproductos) AS Nºmínimo FROM Productos;














