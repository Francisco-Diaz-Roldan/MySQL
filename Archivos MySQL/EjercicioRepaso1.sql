/*Ejercicio 1.- Crea una Tabla en MySQL con las siguientes columnas y sus correspondientes restricciones:
• ID: identificador de tipo entero que se incremente automáticamente y comience por el número 50. PK
• Nombre: contenido de tipo carácter (máximo 10 caracteres, mínimo 5). No puede ser nulo.
• Apellido: contenido de tipo carácter (máximo 10 caracteres) que no contenga más de 2 letras “s”
• Altura: contenido de tipo decimal con 2 decimales y un entero. No puede ser nulo.
• Edad: contenido de tipo entero (mayores de edad y menores de 64 años)
• Dirección: contenido de tipo carácter que contenga la palabra “calle” o “avenida” y los caracteres “n.º” o
“Bloque”. Máximo 50 caracteres, mínimo 10. No puede ser nulo.
• Genero: contenido con 3 valores posibles (Masculino, Femenino u Otros), por defecto “Otros”
• Fecha: contenido de tipo fecha (fechas que no estén contenidas en los meses de verano). No puede ser nulo.
• Email: contenido de tipo carácter que contenga el carácter “@” y ser de tipo “gmail” o “hotmail”
*Añade 3 filas de valores a las tablas anteriormente creadas. Añade solo los valores estrictamente necesarios para
que el programa no muestre ningún error*/

create database correos;
use correos;

create table datos (
ID  int auto_increment primary key,
Nombre varchar (10) constraint chk_nombre check(char_length(nombre)>=5) not null,
Apellido varchar (10) constraint chk_apellido check(Apellido not like "%s%s%s%"),
Altura decimal(3,2) not null, 
Edad int constraint chk_edad check(Edad between 18 and 64),
Direccion varchar(50) constraint chk_direccion 
check(((Direccion like "%calle%" or Direccion like "%avenida%")and(Direccion like "%n.º%" or Direccion like "%Bloque%")) and char_length(Direccion)>=10) not null,
Genero enum("Masculino", "Femenino", "Otros") default "Otros",
Fecha date constraint  chk_fecha check(Fecha not like "%-06-%"or Fecha not like "%-07-%"or Fecha not like "%-08-%") not null,
Email varchar(20) constraint chk_email check(Email like "@gmail" or Email like "@hotmail")
);

alter table datos auto_increment=50;
#alter table datos drop constraint chk_nombre;
insert into datos (Nombre, Altura, Direccion, Fecha) values
("Joaquin", 1.87, "Calle Marqués de Larios n.º8", "2001-09-11"),
("Fernando", 1.7, "Avenida de la luz n.º7", "2010-10-11"),
("Antonio", 1.8, "Avenida de la luz n.º2", "2011-11-11");

#Ejercicio 2.- Realiza las siguientes modificaciones en la tabla del ejercicio 1.
#- Modifica el nombre de la tabla
ALTER TABLE datos RENAME JOAQUIN;


#- Modifica del nombre de la columna “email” a “correo”
alter table JOAQUIN drop constraint chk_email;
ALTER TABLE JOAQUIN
CHANGE Email Correo varchar(20);

#- Modifica la restricción de la fecha para que permita valores de fechas contenidos en verano e invierno.
alter table JOAQUIN drop constraint chk_fecha;


#- Modifica el atributo “altura” para que permita dos enteros con dos decimales
alter table JOAQUIN modify Altura decimal(4,2);


#- Modifica el atributo apellido para que añada un valor por defecto
insert into JOAQUIN (Nombre, Altura, Direccion, Fecha) values
("Joaquin", 1.87, "Calle Marqués de Larios n.º8", "2001-09-11"),
("Fernando", 1.7, "Avenida de la luz n.º7", "2010-10-11"),
("Antonio", 1.8, "Avenida de la luz n.º2", "2011-11-11");

alter table JOAQUIN modify Apellido varchar (10) default "Garcia";

#- Añade el carácter “m” en el contenido de la altura (ejemplo, 1.90m)
alter table JOAQUIN modify Altura varchar(5);
update JOAQUIN set Altura=CONCAT (Altura, 'm');

#- Modifica el atributo Edad para que permita valores mayores de 65
alter table JOAQUIN drop constraint chk_edad;
Alter table JOAQUIN ADD CONSTRAINT chk_edad check(Edad > 18);

#- Modifica el valor de género para que aparezca Femenino por defecto
alter table JOAQUIN modify Genero enum("Masculino", "Femenino", "Otros") default "Femenino";


#- Elimina todos los registros que contengan un email de tipo “hotmail”
DELETE FROM JOAQUIN WHERE Correo like "@hotmail";


#- Elimina todos los registros que contengan género Masculino
DELETE FROM JOAQUIN WHERE Genero like "@Masculino";


#- Elimina la columna ID
Alter table JOAQUIN DROP ID;


#- Elimina la tabla del ejercicio 1
Drop table JOAQUIN;


select * from JOAQUIN;

