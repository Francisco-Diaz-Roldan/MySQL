#Ejercicio 1.- Crea una BD de nombre NOTAS.

create database NOTAS;

use NOTAS;


/*Ejercicio 2.- Crea una tabla ALUMNOS en la BD NOTAS con los siguientes contenidos.
    • DNI: contenido de tipo caracteres
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
    • Apellido: contenido de tipo caracteres (máximo 15 caracteres)
    • Edad: contenido de tipo numérico (máximo 2 dígitos)
    • Fecha_nacimiento: contenido de tipo fecha
    • Genero:  contenido con 3 valores posibles (Masculino, Femenino u Otros)
      *Todos los campos podrán contener valores NULL, a excepción del DNI, Nombre y Apellido*/
      
      create table ALUMNOS(
      
      DNI varchar(9) not null,
      Nombre varchar(15) not null,
      Apellido varchar(15) not null,
      Edad decimal(2,0),
      Fecha_nacimiento date,
      Genero enum("Masculino", "Femenino", "Otros") 
      );
      
      
/*Ejercicio 3.- Crea una tabla ASIGNATURAS en la BD NOTAS con los siguientes contenidos.
    • ID:  contenido de tipo numérico (máximo 1 dígito)
    • Nombre: contenido de tipo caracteres (máximo 15 caracteres)
    • Grado: contenido de tipo caracteres (máximo 6 caracteres)
    • Curso: contenido con 2 valores posibles (1 o 2)
*Todos los campos podrán contener valores NULL, a excepción del ID y Curso*/

create table ASIGNATURAS(

ID decimal(1,0) not null,
Nombre varchar(15),
Grado varchar(6),
Curso enum("1","2") not null
);


/*Ejercicio 4.- Crea una tabla NOTAS en la BD NOTAS con los siguientes contenidos
    • Nota: contenido de tipo decimal (máximo 2 decimales)
    • Profesor: contenido de tipo caracteres (máximo 20 caracteres)
*Todos los campos podrán contener valores NULL. 
*Las notas podrán tener hasta 2 decimales. La nota mínima será de un 0.00 y la nota máxima 9.99.*/

create table NOTAS(
Nota decimal(3,2),
Profesor varchar(20)
);


/*Ejercicio 5.- Realiza las siguientes modificaciones en las tablas creadas.
- Haz que el valor DNI de la tabla ALUMNO sea identificador
- Haz que el valor ID de la tabla ASIGNATURAS sea idetificador*/

alter table ALUMNOS
add primary key (DNI);

alter table ASIGNATURAS
add primary key (ID);


 /*Ejercicio 6.- Realiza las siguientes modificaciones en la tabla NOTAS.
	- Añade una nueva columna ID_Alumno que referencie a al DNI de la tabla ALUMNO
	- Añade una nueva columna ID_Asignaturas que referencie a al ID de la tabla ASIGNATURAS
	- Haz que la nueva columna ID_Alumno sea identificador de la tabla NOTAS*/
    
alter table NOTAS add column ID_Alumno varchar(9),
add constraint fk_ID_Alumno 
foreign key (ID_Alumno)  references ALUMNOS (DNI);

alter table NOTAS  add column ID_Asignaturas decimal(1,0),
add constraint fk_ID_Asignaturas 
foreign key (ID_Asignaturas) references ASIGNATURAS(ID);

alter table NOTAS
add primary key (ID_Alumno);
    
    
    
#Ejercicio 7.- Añade 5 filas de datos diferentes a NULL en las 3 tablas creadas en la base de datos

insert into ALUMNOS(DNI, Nombre, Apellido, Edad, Fecha_nacimiento, Genero) values
("1A", "José Antonio", "Rodríguez", 20, "2002-12-12","Masculino"),
("2B", "Maria", "Jimenez", 25, "1997-01-01","Femenino"),
("3C", "Carlos", "Fuentes", 18, "2004-12-10","Masculino"),
("4D", "Jorge", "Salas", 18, "2004-05-23", "Masculino"),
("5E", "Lucia", "Martinez", 22, "2000-03-05", "Femenino")
;

select * from ALUMNOS;

insert into ASIGNATURAS(ID, Nombre, Grado, Curso) values
(1, "Sistemas Operativos", "DAM", "1"),
(2, "Lenguaje de Marcas", "DAM", "1"),
(3, "FOL", "DAM", "1"),
(4, "Programación 1", "DAM", "1"),
(5, "Programación 2", "DAW", "2");

select * from ASIGNATURAS;


insert into NOTAS(Nota, Profesor, ID_Alumno, ID_Asignaturas) values
(6.6, "Luis", "1A", 1),
(7, "Luis", "2B", 2),
(8, "Luis", "4D", 3),
(9, "Luis", "3C", 4),
(5.2, "Luis", "1A", 5);
 
 select * from NOTAS;


