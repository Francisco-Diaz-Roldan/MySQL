create database Caso_opcional;

use Caso_opcional;

/*Añade las siguientes restricciónes en la creación de la base de datos:
• Los identificadores ID deberán ser enteros que se autoincrementen automáticamente.//////////////////////////////////////
• El atributo ID de la tabla Programa deberá comenzar por el número 100./////////////////////////////////////////////////
• El atributo ID de la tabla Tiempo deberá comenzar por el número 50.///////////////////////////////////////////////////
• El atributo Login de la tabla Usuario deberá tener un mínimo de 8 caracteres y un máximo de 15.//////////////////////
• El atributo Password de la tabla Usuario deberá guardarse de forma encriptada en la BD.
• El atributo Tarea de la tabla Tiempo deberá ser de tipo decimal (máximo 2 decimales) y distinto de 0.///////////////
• El atributo Email de la tabla Usuario deberá contener el carácter “@”.*/

create table USUARIO (
login varchar (15) not null primary key constraint check_login check ((length(login)>=8)),
pass varchar (40), 
Nombre varchar (15), 
email varchar (15) constraint check_email check (email like "%@%")
);

insert into USUARIO values
("dddddddda", sha("Toby") , "palabra", "palabra@");
update usuario set password_encriptada = sha(pass);

select * from usuario;

create table PROGRAMA(
id int unsigned not null primary key,
nombre varchar (15)
);

create table TIEMPO(
id int not null primary key,
tarea decimal (5,2) constraint check_tarea check(tiempo<>0), 
fecha date,
hora_inicio time
);

alter table PROGRAMA auto_increment=100;

alter table TIEMPO auto_increment=50;

