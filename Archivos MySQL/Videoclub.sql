CREATE DATABASE VIDEOCLUB;

USE VIDEOCLUB;

#JOAQUIN TRUCO: NO PONER ACENTOS EN EL NOMBRE DE LAS VARIABLES

CREATE TABLE PELICULAS(

ID int not null primary key auto_increment, 
Nombre varchar(15),
Duracion int constraint `chk_duracion` check(Duracion between 50 and 200), #Añadimos una restricción (constraint) y después la quitamos
Director varchar(20),
Genero enum("Accion", "Terror", "Aventura", "Comedia"),
Puntuacion decimal(2,1),
Fecha date
);

INSERT INTO PELICULAS(Nombre, Duracion, Director, Genero, Puntuacion, Fecha) VALUES #NO SE PONE EL ID PORQUE ES AUTOINCREMENTADO

 ("A todo gas", 120, "Rob Cohen", "Acción", 6.3, "2001-10-12"), 
 ("Hereditary", 137, "Ary Aster", "Terror", 9.1, "2018-02-22"),
 ("Avatar", 154, "James Cameron", "Aventura", 7.8, "2010-12-04"), 
 ("Silent Hill", 180, "Christophe Gans", "Terror", 4.4, "2003-01-01"),
 ("Project X", 98, "Nima Nourizadeh", "Comedia", 5.8, "2012-06-16"),
 ("Anabelle", 105, "John R. Leonetti", "Terror", 7.1, "2006-09-10")
 ;

SELECT * FROM PELICULAS;

#Ejercicio 1 Modifica la duracion de las peliculas para que se muestre el contenido en horas en vez de en minutos.

#ELIMINAMOS LA RESTRICCIÓN
ALTER TABLE PELICULAS DROP check `chk_duracion`;#También vale drop constraint `chk_duracion`

#MODIFICAMOS VALORES DE LA DURACION A DECIMAL
ALTER TABLE PELICULAS modify column Duracion decimal(5,2);

#MODIFICAMS VALORES DE DURACION PARA QUE APARZCAN EN HORAS
Update PELICULAS set Duracion=Duracion/60;


#Ejercicio 2 Modifica la Puntuación para que se muestren 2 decimales en lugar de 1.

ALTER TABLE PELICULAS MODIFY Puntuacion decimal(3,2);


#Ejercicio 3 Modifica el número de caracteres permitidos en Nombre para que admitan 25 caracteres.

ALTER TABLE PELICULAS MODIFY Nombre varchar(25);

#Ejercicio 4 Añade una nueva fila a la tabla con los datos de la película "La cabaña en el bosque"

INSERT INTO PELICULAS(Nombre, Duracion, Director, Genero, Puntuacion, Fecha)  VALUES
( "La cabaña en el bosque", 120, "Rob Cohen", "Acción", 6.3, "2001-10-12"); 


#Ejercicio 5 Modifica la columna puntuación para que se llame Puntos

# ALTER TABLE PELICULAS CHANGE Puntuacion  Puntos decimal(3,2); es igual que abajo pero de otra manera
ALTER TABLE PELICULAS RENAME COLUMN Puntuacion to Puntos;


#Ejercicio 6 Añade una nueva columna Critica que admita los valores(MALA, REGULAR, BUENA, MUY BUENA).

ALTER TABLE PELICULAS ADD COLUMN Critica enum("MALA", "REGULAR", "BUENA", "MUY BUENA");


/*Ejercicio 7 Añade valores a la columna Critica siguiendo los siguientes criterios:
		- Si la película tiene menos o igual a un 5 en la puntuación añade el valor MALA.
		- Si la película tiene más de un 5 y menos de un 6.5 en la puntuación añade el valor REGULAR.
        - Si la película tiene más o igual a un 6.5 y menos de un 8.5 en la puntuación añade el valor BUENA.
         - Si la película tiene más o igual a un 8.5 en la puntuación añade el valor MUY BUENA.*/

UPDATE PELICULAS SET Critica = "MALA" WHERE Puntos<=5;

UPDATE PELICULAS SET Critica = "REGULAR" WHERE Puntos>5 AND Puntos<6.5;

UPDATE PELICULAS SET Critica = "BUENA" WHERE Puntos>6.5 AND Puntos<8.5;

UPDATE PELICULAS SET Critica = "MUY BUENA" WHERE Puntos>8.5;


#Ejercicio 8.- Elimina las filas de las películas con ID superior a 6.


DELETE FROM PELICULAS WHERE ID>6;

#Ejercicio 9.- Elimina las filas que sean del año 2010.

DELETE FROM PELICULAS WHERE Fecha like "2010%"; #Que contenga 2010

#Ejercicio 10.- Elimina las filas de las películas dirigidas por Ary Aster y tengan una duración menor a 3 horas.

DELETE FROM PELICULAS WHERE Director="Ary Aster" and Duracion<3;


#Ejercicio 11.- Elimina las filas de las películas que contengan una X en su nombre.

DELETE FROM PELICULAS WHERE Nombre like"%x%";

#Ejercicio 12.- Elimina las filas de las películas del mes de enero, y que la crítica sea distina a BUENA o MUY BUENA.

DELETE FROM PELICULAS WHERE month(Fecha)=01 AND (Critica!="BUENA" OR  Critica!=" MUY BUENA");
#Hace lo mismo que arriba
DELETE FROM PELICULAS WHERE Fecha like "%-01-%" AND (Critica<>"BUENA" OR  Critica!=" MUY BUENA");


#Para añadir el constraint del check y eliminarlo
/*ALTER TABLE PELICULAS
ADD CONSTRAINT chk_duracion
CHECK (Duración BETWEEN 50 and 200);

ALTER TABLE PELICULAS
DROP CONSTRAINT chk_duracion;*/
#Duración=Duración/60;