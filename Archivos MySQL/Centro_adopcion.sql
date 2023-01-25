create database Centro_adopcion;

use Centro_adopcion;

/*Ejercicio 1.- Crea las siguientes tablas en la base de datos “Centro_adopción”.
Perros (ID, nombre, edad, altura, raza, color, fecha_nac)
 Humanos(DNI, nombre, apellido, n_cuenta, edad, sexo)
- El número de cuenta estará formado por 8 números
- El valor del atributo “color” deberá ser marrón, gris o blanco
- El valor del atributo “sexo” deberá ser F o M*/

Create table Perros(
ID int not null,
nombre varchar (15),
edad int,
altura decimal(3,2),
raza varchar(15),
color enum("marron", "gris",  "blanco"),
fecha_nac date
);

create table Humanos(
DNI varchar(9) not null,
nombre varchar (15),
apellido varchar (15),
n_cuenta decimal(8,0),
edad int,
sexo enum("F", "M")
);

#Ejercicio 2.- Añade una clave primaria a cada una de las tablas creadas.

alter table Perros add primary key (ID);

alter table Humanos add primary key (DNI);

#Ejercicio 3.- Añade la clave de la tabla ‘Perros’ en la tabla ‘Humanos’ como clave foránea.

alter table Humanos add column ID_perro int,
add constraint fk_ID_perro 
foreign key (ID_perro)  references Perros (ID);


#Ejercicio 4.- Añade los siguientes contenidos a las tablas creadas.

insert into Perros(ID, nombre, edad, altura, raza, color, fecha_nac) values
(1, "Toby" , 1, 0.65, "Bulldog", "marron", "2018-10-10"), 
(2, "Taco" , 5, 1.2, "Pastor alemán", "gris", "2015-01-12"), 
(3, "Mambo", 12, 2.05, "Galgo", "blanco", "2007-03-03"), 
(4, "Rulo" , 3, 0.85, "Labrador", "gris", "2016-12-25"), 
(5, "Gordo", 6, 1.6, "Chihuahua", "marron", "2014-05-05");

insert into Humanos(DNI, nombre, apellido, n_cuenta, edad, sexo) values
("44566880R", "Jon", "Zamora", 12345678, 22, "M"), 
("12300200M", "Nuria", "Lester", 49213572, 35, "F"), 
("42424242P", "Aitor", "Ramiro", 67356870 , 43, "M"), 
("12345678L", "Maria", "Jimenez", 68806005 , 19, "F"); 


/*Ejercicio 5.- Inserta los siguientes datos en las tablas creadas.
- Inserta un nuevo perro con los siguientes datos:
- ID: 25
- Nombre: Timmy
- Edad: 3 años
- Altura: 1,85
- Raza: Shar Pei
- Color: Marrón
- Fecha_nac: 12 de octubre de 2016
- Añade en la tabla “Perros” una nueva columna “Estado” (Adiestrado o salvaje)
- Inserta valores para que el valor “Estado” no sea nulo*/

insert into Perros(ID, nombre, edad, altura, raza, color, fecha_nac) values
(25, "Timmy", 3, 1.85, "Shar Pei", "marron", "2016-10-12");

Alter table Perros add column Estado enum("adiestrado", "salvaje");

update Perros set Estado="adiestrado" where ID>3;
update Perros set Estado="salvaje" where ID<=3;


/*Ejercicio 6.- Realiza las siguientes modificaciones de contenidos en las tablas creadas.
- Modifica la altura de los perros para que los datos se muestren en centímetros en vez de en metros
- Modifica la edad de los perros para que los datos se muestren en meses en vez de en años
- Añade en los nombres de los humanos el prefijo Sr o Sra dependiendo de su sexo
- Modifica el atributo “sexo” para que aparezca Femenino o Masculino en vez de F o M
* Los datos de la edad se actualizan una sola vez al año*/

alter table Perros modify column  altura decimal(3,0); #Esto lo he puesto para que al pasar luego a cm me lo coja
update Perros set altura=altura*100; 
update Perros set edad=edad*12;
update Humanos set nombre = CONCAT("Sr", nombre) where sexo='M';
update Humanos set nombre = CONCAT("Sra", nombre) where sexo='F';

#Actualizar sexo para que incluya "Masculino" y "Femenino" y luego borrar F y M
alter table Humanos modify column sexo enum("F", "M", "Masculino", "Femenino");
update Humanos set sexo="Masculino" where sexo='M';
update Humanos set sexo="Femenino" where sexo='F';
alter table Humanos modify column sexo enum("Masculino", "Femenino");

/*Ejercicio 7.- Realiza las siguientes modificaciones de contenidos en las tablas creadas.
- Modifica la columna Edad de la tabla Humanos para que se llame ‘Años’
- Modifica la columna N_cuenta para que los números de cuenta puedan contener 12 cifras más
- Modifica las claves primarias para que no puedan ser NULL*/



