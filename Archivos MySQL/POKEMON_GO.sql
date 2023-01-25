#Ejercicio 1.- Crea una BD de nombre POKEMON_GO

create database POKEMON_GO;

use POKEMON_GO;

#Ejercicio 2.- Crea una tabla POKEMON en la base de datos POKEMON_GO
#Ejercicio 3.- Añade las siguientes columnas en la tabla POKEMON.
create table POKEMON(
Id int not null primary key,
Nombre varchar(15),
Altura decimal(5,2), /*Hay 5 cifras, de las cuales las 2 ultimas son decimales  */
Edad decimal(3,0),/*Para números enteros de 3 dígitos máximo*/
Fecha_nac date
);

#Ejercicio 4.- Crea una tabla ENTRENADOR en la base de datos POKEMON_GO.
#Ejercicio 5.- Añade las siguientes columnas en la tabla ENTRENADOR.
create table ENTRENADOR(
DNI varchar (9) not null primary key,
Nombre varchar(15) not null,
Genero enum('masculino', 'femenino', 'otro')
);

#Ejercicio 6.- Añade valores a las tablas de forma comprobando que se cumplen las restricciones indicadas en el ejercicio anterior.
#AQUÍ MODIFICAMOS LOS DATOS
INSERT INTO POKEMON (Id, Nombre, Altura, Edad, Fecha_nac) VALUES 
 (001, 'Bulbasaur' , 0.7, 1, '2022-12-25'),
 (002, 'Ivysaur' , 1.0, 2, '2021-09-12'),
 (003, 'Venusaur' , 2.0, 3, '2020-04-06'),
 (004, 'Charmander' , 0.6, 1, '2023-05-12'),
 (005, 'Charmeleon' , 1.1, 1, '2023-05-12'),
 (006, 'Charizard' , 1.7, 1, '2023-05-12');
 
 SELECT * FROM POKEMON;

 
 INSERT INTO ENTRENADOR (DNI, Nombre, Genero) VALUES 
 ('1A', 'José Antonio', 'masculino'),
 ('1B', 'José Luis', 'masculino'),
 ('1C', 'María José', 'femenino'),
 ('1D', 'María Luisa', 'femenino'),
 ('1E', 'Galactus, el destructor de mundos', 'otro');

 SELECT AGV(Nombre) FROM ENTRENADOR;
 
 
 #Ejercicios 7.- Inserta 5 filas de datos en cada una de las tablas.
 #AQUÍ USAMOS EL UPDATE CON LAS CONDICIONES 
alter table POKEMON add column NOMBRE_EV varchar (20);

UPDATE POKEMON SET NOMBRE_ev = "MANTEQUILLA" WHERE ID=001;
UPDATE POKEMON SET NOMBRE_ev = "MANTECA" WHERE ID>001 AND NOMBRE = 'Charizard' ;

UPDATE POKEMON SET Nombre = "pika" WHERE ID=001 AND Nombre='Pikachu';

alter table POKEMON ADD COLUMN ID_entrenador varchar (9);

alter table POKEMON
ADD CONSTRAINT 	fk_Id_entrenador
foreign key (Id_entrenador)
references ENTRENADOR;

