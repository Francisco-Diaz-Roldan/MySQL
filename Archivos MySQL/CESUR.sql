#Ejercicio 1.- Crea una base de datos de nombre CESUR.
create database CESUR;
use CESUR;

#Ejercicio 2.- Crea una tabla de nombre ALUMNO dentro la base de datos CESUR con sus diferentes campos.
create table ALUMNO (
DNI varchar(9) not null primary key, 
Nombre varchar(15), 
Apellido varchar(20), 
Edad int
);

# Para poner la clave primaria en caso de no haberlo puesto antes -> alter table ALUMNO add primary key (DNI);

SELECT * FROM ALUMNO;


#Ejercicio 3.- Crea una tabla de nombre GRADO dentro la base de datos CESUR con sus diferentes campos. 
create table GRADO (
ID int not null primary key, 
Nombre varchar(15), 
Horas int
);


#Ejercicio 4.- Añade 5 filas de datos a la tabla ALUMNO y otras 5 filas de datos a la tabla GRADO.
INSERT INTO ALUMNO (DNI, Nombre, Apellido, Edad) VALUES 
('21110', 'Jorge', 'Degradado', 24);

INSERT INTO ALUMNO (DNI, Nombre, Apellido) VALUES 
('21125', 'Gabriel', 'Rincon');

INSERT INTO GRADO (ID, nombre, Horas) VALUES 
('1', 'DAM', '290'),
('2', 'DAW', '300');


#Ejercicio 5.- Añade una nueva columna de datos a la tabla ALUMNO de nombre Grado.
alter table ALUMNO add column grado int;

alter table ALUMNO
ADD CONSTRAINT 	fk_grado
foreign key (grado) references GRADO (ID);

INSERT INTO ALUMNO (DNI, Nombre, Apellido, Edad, grado) VALUES 
('2155', 'Jorge', 'Degradado', 24, 1);

#Modificamos la tabla alumno cuando el DNI sea igual a 21110
update ALUMNO set grado = 1 where DNI= '21110';


SELECT * FROM ALUMNO;
SELECT * FROM GRADO;