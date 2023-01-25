#Crear BD ejercicio
create database ejercicio;

#posicionamiento
use ejercicio;

#creacion de tabla ALUMNO
create table ALUMNO(
	ID int not null primary key, 
	nombre varchar(12),
	edad int 
);

#creacion de tabla PROFESOR
create table PROFESOR(
	DNI varchar (9) not null primary key,
    nom varchar (12),
    apell varchar (12)
);

#añadir FK de PROFESOR EN ALUMNO
alter table ALUMNO
	add column DNI varchar (9),
    add constraint fk_dni
    foreign key (DNI) references PROFESOR(DNI);