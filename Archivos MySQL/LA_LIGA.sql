create database LA_LIGA;

use LA_LIGA;

create table EQUIPO(
		ID int not null,
		Nombre varchar(25), 
		Edad_media decimal(2,0),
    		Color enum ('Unicolor','Multicolor'), 
		primary key(ID)
	);
    
create table JUGADOR(
		DNI varchar(9) not null,
		Nombre varchar(25), 
		Altura decimal(3,2),
        		Fecha_nac DATE,
        		Hora_nac TIME,
		primary key(DNI)
     ); 
     
     
  #Ejercicio 1.- Añade una nueva columna “Equipo” en la tabla JUGADOR
  
  alter table JUGADOR add column Equipo int;
  
  #Ejercicio 2.- Haz que la columna Equipo sea FK referenciando al ID de la tabla equipo.
  
  
  
  
#Ejercicio 3.- Añade 5 filas de contenido a cada una de las tablas creadas.
INSERT INTO EQUIPO (ID, Nombre, Edad_media, Color) VALUES
(01, 'Atlethic Bilbao', 32, 'Multicolor'), 
(02, 'Málaga', 19, 'Unicolor'),
(03, 'Betis', 25, 'Multicolor'),
(04, 'Orlando pirates', 69, 'Unicolor'),
(05, 'Recreativo Huelva', 41, 'Multicolor');

 SELECT * FROM EQUIPO;

alter table JUGADOR
  ADD CONSTRAINT fk_equipo
  foreign key (Equipo) references EQUIPO (ID);#Lo que hay entre parentesis es lo que va a reflejarse en la siguiente tabla (se pasa el Id de EQUIPO)

INSERT INTO JUGADOR (DNI, Nombre, Altura, Fecha_nac,Hora_nac, Equipo) VALUES
('1A', 'Iraizoz', 1.91, 20000907,'23:40:20', 01), 
('2B', 'Toquero', 1.87, 19981205, '12:32:12', 02),
('3C', 'García Escudero', 1.55, 19770505, '17:04:00',03),
('4D', 'Williams', 2.05, 19890609,'12:00:05',04),
('5E', 'Messi', 1.69, 19870607, '19:56:12',05);


 SELECT * FROM JUGADOR;

#Ejercicio 4.- Añade una nueva columna (no nula) “Numero” de tipo numérico en la tabla JUGADOR que por defecto contenga el valor 1.

alter table JUGADOR add column Numero int not null default "1";

#Ejercicio 5.- Modifica la tabla JUGADOR para que el contenido del jugador con nombre Messi tenga el número 10.

UPDATE JUGADOR SET Numero = "10" WHERE Nombre="Messi";

#Ejercicio 6.- Elimina las filas de la tabla EQUIPO con edad media superior a 26.

alter table JUGADOR
drop foreign key fk_equipo; #Aquí meto la constraint

DELETE FROM EQUIPO WHERE Edad_media>26;

#Ejercicio 7.- Elimina la columna Hora_nac de la tabla JUGADOR.

ALTER TABLE JUGADOR
DROP COLUMN Hora_nac;

#Ejercicio 8.- Elimina una fila de contenido de la tabla JUGADOR de nombre Messi.

DELETE FROM JUGADOR WHERE Nombre="Messi";

#Ejercicio 9.- Elimina la tabla JUGADOR.

DROP TABLE JUGADOR;

#Ejercicio 10.- Elimina la base de datos LA_LIGA.

#DROP DATABASE LA_LIGA;

