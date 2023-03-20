create database Protectora;
use protectora;

Create table ANIMALES (
Id int auto_increment primary key,
Nombre varchar(12) constraint chk_Nombre check(char_length(Nombre)>=4) not null,
Tipo enum("Perro", "Gato") default "Perro",
Edad int constraint chk_Edad check (Edad> 0 and Edad <=999),
Fecha_nac date constraint chk_Fecha check ((year(Fecha_nac)>=2000 and year(Fecha_nac)<=2020) or (month(Fecha_nac)>3 and month(Fecha_nac)<6)) not null, #(month(Fecha_nac) BETWEEN 3 AND 6)
Peso decimal(5,2) not null
);

select * from ANIMALES;

Create table HUMANOS (
DNI varchar(8) constraint chk_DNI check(char_length(DNI)=8) primary key,
Nombre varchar(15) not null,
Apellido varchar(15) constraint chk_Apellido check((char_length(Apellido)>=5) and (Apellido like "%s" or Apellido like "%p")),
Altura decimal(3,2) constraint chk_Altura check ((Altura>=1.00 and Altura<=1.70) or Altura<0.5),
Fecha_nac date default (current_date())
);


insert into ANIMALES (Nombre, Fecha_nac, Peso) values
("Bobby","2001-09-11", 13.75),
("Brian","2019-03-12", 7.45);

select * from ANIMALES;

insert into HUMANOS (DNI, Nombre) values
("1234567A", "Jose Luis"),
("9876543C", "Pedro");

select * from HUMANOS;