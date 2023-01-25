#Creamos la BD
create database AfueraBD;

#Elegimos la Base de Datos “AfueraBD” para poder realizar modificaciones o consultas
use AfueraBD;

#Creamos la tabla Alumnos con los atributos que nos pide el enunciado
create table Alumnos (
id_alumno int not null,
nombre varchar(30),
edad int,
dirección varchar (50),
fecha_nacimiento date
);

#Asignamos  la clave primaria (id_alumno) en la tabla Alumnos
alter table Alumnos
add primary key (id_alumno);

#Creamos la tabla Profesores con los atributos que nos pide el enunciado
create table Profesores(
id_profesor int not null,
nombre varchar (30),
fecha_nacimiento date
);

#Asignamos  la clave primaria (id_profesor) en la tabla Profesores
alter table Profesores
add primary key(id_profesor);

#Asignamos la clave foránea (id_profesor) en la tabla Alumnos

alter table Alumnos
add column id_profesor int not null,
add constraint fk_id
foreign key (id_profesor) references Profesores (id_profesor);

#Para insertar los datos
#Insertamos primero los datos de los Profesores para que exista el id_profesor, que vamos a usar en la tabla alumnos
 INSERT INTO Profesores (id_profesor, nombre,fecha_nacimiento) VALUES 
 (11111, 'José Luis', '1989-01-01'),
 (22222, 'Mariano', '1990-02-02'),
 (33333, 'Antonio', '1991-03-03');

#Insertamos los datos de los Alumnos de modo que ya existe el id_profesor
INSERT INTO Alumnos (id_alumno, nombre, edad, dirección,fecha_nacimiento, id_profesor) VALUES 
 (123455, 'Alumno' , 25,  'CESUR Málaga-Este', '1996-12-25', 11111), 
 (123456, 'Alumno2', 26, 'CESUR Málaga-Este', '1995-04-03', 11111),  
 (123457, 'Alumno3', 22, 'CESUR Málaga-Este', '1998-09-04', 22222),  
 (123458, 'Alumno4', 18, 'CESUR Málaga-Este', '2004-05-13', 33333);  
 
#Para acceder a las tablas
SELECT * FROM Alumnos;
SELECT * FROM Profesores;

#Si seleccionamos con el ratón y después le damos al rayo se ejecuta esa parte del código, si no se ejecuta todo en cascada



 

 

