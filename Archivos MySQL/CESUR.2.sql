create database cesur2;
use cesur2;

CREATE TABLE ALUMNO(
	DNI  varchar(9),
	nombre varchar(15), 
	apellido varchar(20), 
	edad INT,
	PRIMARY KEY(DNI)
	);
    
CREATE TABLE GRADO(
	ID INT,
	nombre varchar(15), 
	horas INT,
	PRIMARY KEY(ID)
	);
    
INSERT INTO ALUMNO (DNI, nombre, apellido, edad)
		values ('44566835T', 'jon', 'zamora', 32),
				('44576835T', 'manuel', 'fernandez', 22),
        		('43466835T', 'lorena', 'aleman', 20),
       			('42166835T', 'pepe', 'gavilan', 18),
       			('41166835T', 'celia', 'flores', 40)
		;
        
INSERT INTO GRADO (ID, nombre, horas)
		values (001, 'DAM1', 430),
				(002, 'DAW2',  300),
        		(003, 'ASIR1',  500),
       			(004, 'SMR1', 300),
       			(005, 'SMR2', 270)
		;
        
        
ALTER TABLE ALUMNO
    		ADD COLUMN grado int,
    		ADD CONSTRAINT `fk_id_grado` FOREIGN KEY (grado)
        		REFERENCES GRADO (id);  

/*Ejercicio 1.- Añade una nueva columna (no nula) “Ciudad” a la tabla ALUMNO de tipo caracteres (máximo 15 caractéres)
*Asigna por defecto la ciudad Malaga como contenido de dicha columna*/

ALTER TABLE ALUMNO ADD COLUMN Ciudad varchar(15) not null DEFAULT "Málaga";
#UPDATE ALUMNO SET Ciudad = "Málaga";



#Ejercicio 2.- Modifica la columna “Ciudad” para que acepte valores nulos.

ALTER TABLE ALUMNO modify Ciudad varchar(15);

#ALTER TABLE ALUMNO modify Ciudad varchar(15) null; Es lo mismo que arriba se puede o no poner lo de null


#Ejercicio 3.- Modifica la columna “Ciudad” para que acepte valores de hasta 25 caracteres.

ALTER TABLE ALUMNO modify Ciudad varchar(25); 


#Ejercicio 4.- Modifica el nombre de la columna “Ciudad” a “Localidad”.

ALTER TABLE ALUMNO  RENAME column Ciudad to Localidad;

#ALTER TABLE ALUMNO CHANGE Ciudad Localidad varchar(15); Es lo mismo que arriba


#Ejercicio 5.- Añade una nueva columna “Media” en la tabla ALUMNO que sea de tipo decimal (con un decimal máximo) y pueda tener una nota máxima de 9,9.

ALTER TABLE ALUMNO ADD COLUMN Media decimal(2,1);

#6.- Modifica la columna “Media” para que acepte valores con 2 decimales.

ALTER TABLE ALUMNO modify Media decimal(3,2);

#Ejercicio 7.- Modifica el nombre de la tabla GRADO a MODULO y el nombre de la tabla ALUMNO a ALUMNOS_CESUR en la misma linea de código.

/*ALTER TABLE GRADO RENAME MODULO;
ALTER TABLE ALUMNO RENAME ALUMNOS_CESUR;*/

RENAME TABLE GRADO TO MODULO, ALUMNO TO ALUMNOS_CESUR;

#Ejercicio 8.- Elimina la columna “grado” de la tabla ALUMNOS_CESUR.

ALTER TABLE ALUMNOS_CESUR DROP CONSTRAINT fk_id_grado;
ALTER TABLE ALUMNOS_CESUR DROP grado;


#Ejercicio 9.- Modifica la tabla ALUMNOS_CESUR para que DNI deje de ser la clave primaria.

ALTER TABLE ALUMNOS_CESUR DROP PRIMARY KEY;

#Ejercicio 10.- Añade una clave primaria a la tabla ALUMNOS_CESUR que sea un entero y se incremente de forma automática.
ALTER TABLE ALUMNOS_CESUR
ADD COLUMN ID  int not null PRIMARY KEY auto_increment;
