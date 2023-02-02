/*Examen Modificación MySQL
Ejercicio 1.- Crea la BD MUNDIAL con las siguientes tablas especificadas. (2,5 puntos)
- Crea una BD de nombre MUNDIAL
- Crea una tabla EQUIPO y añade las siguientes columnas:
 Id: identificador de tipo decimal (máximo 1 decimal) PK
 Nombre: contenido de tipo caracteres (máximo 12 caracteres)
 Edad_media: contenido de tipo numérico (máximo 2 dígitos y mínimo1)
 Color: contenido con 2 valores posibles (Unicolor y Multicolor)*/

create database MUNDIAL;

use MUNDIAL;

create table EQUIPO (
Id decimal(3,1) primary key,
Nombre varchar (12),
Edad_media decimal (2,0) constraint check_Edad_media check ((length(Edad_media))>=1), #Edad_media int constraint chk_edad check(Edad_media>=0 and Edad_media<=99),
Color enum("Unicolor", "Multicolor")
);

/*- Crea una tabla JUGADOR y añade las siguientes columnas:
 DNI: identificador de tipo caracteres (máximo 9 caracteres) PK
 Nombre: contenido de tipo caracteres (máximo 15 caracteres)
 Apellido: contenido de tipo caracteres (máximo 6 caracteres) que no contengan la letra “s” y
no pueda ser nula
 Altura: contenido de tipo decimal (2 decimales) entre 0.50 y 1.50 (ambos incluidos)
 Fecha_nac: contenido de tipo FECHA
*/

create table JUGADOR (
DNI varchar(9) primary key,
Nombre varchar(15),
Apellido varchar(6) not null constraint check_Apellido check (Apellido like Apellido!="%s%"), #Apellido varchar(6) not null constraint check_Apellido check (Apellido not like Apellido"%s%"),
Altura decimal(3,2) constraint check_Altura check (0.5>=Altura and Altura<=1.5),#check(altura between 0.50 and1.50)
Fecha_nac date
);

#- Relaciona las tablas añadiendo el identificador de la tabla EQUIPO como FK de la tabla JUGADOR

alter table JUGADOR add column Id_equipo decimal(3,1),
add constraint fk_Id_equipo 
foreign key (Id_equipo) references EQUIPO (Id);

/*Ejercicio 2.- Aplica 10 modificaciones para que las tablas resultantes sean tal y como se muestran a
continuación. (5 puntos)*/

alter table JUGADOR drop constraint fk_Id_equipo;
alter table EQUIPO modify  Id decimal(3,0);
alter table EQUIPO modify  Color enum ("Unico", "Multicolor");
Alter table EQUIPO drop constraint check_Edad_media;
ALTER TABLE EQUIPO RENAME COLUMN Edad_media TO Edad;


insert into EQUIPO (Id, Nombre, Edad, Color) values
(101, "España", 23, "Multicolor"),
(102, "Camerun", 22, "Multicolor"),
(103, "Marruecos", 21, "Unico"),
(104, "Brasil", 28, "Unico"),
(105, "Argentina", 25, "Multicolor");

RENAME TABLE JUGADOR TO JUGADORES;
alter table JUGADORES modify DNI varchar(15);
alter table JUGADORES drop primary key;
alter table JUGADORES drop check check_Apellido;
alter table JUGADORES modify Apellido varchar(15);
alter table JUGADORES drop check check_Altura; 
alter table JUGADORES modify Altura decimal(2,1);
alter table JUGADORES modify Id_equipo decimal(3,0);


insert into JUGADORES (DNI, Nombre, Apellido, Altura, Fecha_nac, Id_equipo) values
("445668820R", "Leo","Messi", 1.7, "1989-10-22", 105),
("445668120R", "Neymar"," ", 1.8, "1990-12-12", 104),
("445652820R", "Carlos","Casemiro", 1.9, "1992-03-23", 104),
("445668820R", "Álvaro","Morata", 1.9, "1987-07-14", 101);

select * from EQUIPO;
select * from JUGADORES;

#Ejercicio 3.- Aplica las siguientes modificaciones a las tablas resultantes (2,5 puntos).

#- Elimina los jugadores nacidos en el mes de diciembre y contengan una letra “y” en su nombre.

DELETE FROM JUGADORES WHERE Fecha_nac like "%-12-%" and Nombre like "%y%";#delete from JUGADORES where month(fecha_nac)=12 and nombre like"%y%";


#- Elimina los jugadores con altura superior o igual a 1.9 y su DNI no comience por el número 4.

delete from JUGADORES where Altura>=1.9 and DNI not like "4%";

#- Elimina los jugadores que tengan el mismo número de caracteres en su nombre y en su apellido.

delete from JUGADORES where CHAR_LENGTH(Nombre)=CHAR_LENGTH(Apellido);

#- Elimina los equipos que tengan Color único o que su edad sea mayor que 27.

delete from EQUIPO where Color="Unico" or Edad>27;

#- Elimina los equipos que comiencen por la letra “E” y terminen por la letra “a”

delete from EQUIPO where Nombre like "E%" and Nombre like "%a";#delete from EQUIPO where Nombre like "E%A""
