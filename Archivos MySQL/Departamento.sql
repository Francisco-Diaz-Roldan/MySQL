create database empresa;

use empresa;

CREATE TABLE Departamento (
codDepto varchar (4) PRIMARY KEY,
 nombreDpto varchar (20) NOT NULL,
 ciudad varchar (15),
codDirector varchar (12)

);

CREATE TABLE Empleado (

nDIEmp VARCHAR( 12 ) NOT NULL PRIMARY KEY,
nomEmp VARCHAR( 30 ) NOT NULL ,
sexEmp CHAR( 1 ) NOT NULL CHECK (sexEmp IN ('F', 'M') ),
fecNac DATE NOT NULL ,
fecIncorporacion DATE NOT NULL, salEmp FLOAT NOT NULL,
comisionE FLOAT NOT NULL,
cargoE VARCHAR( 15 ) NOT NULL,
jefeID VARCHAR( 12 ),
codDepto VARCHAR( 4 ) NOT NULL

);

INSERT INTO Departamento (codDepto, nombreDpto, ciudad, coddirector) VALUES
('1000', 'GERENCIA', 'CALI', '31.840.269'),
('1500', 'PRODUCCIÓN', 'CALI', '16.211.383'),
('2000', 'VENTAS', 'CALI', '31.178.144'),
('3000', 'INVESTIGACIÓN', 'CALI', '16.759.060'),
('3500', 'MERCADEO', 'CALI', '22.222.222'),
('2100', 'VENTAS', 'POPAYAN', '31.751.219'),
('2200', 'VENTAS', 'BUGA', '768.782'),
('2300', 'VENTAS', 'CARTAGO', '737.689'),
('4000', 'MANTENIMIENTO', 'CALI', '333.333.333'),
('4100', 'MANTENIMIENTO', 'POPAYAN', '888.888'),
('4200', 'MANTENIMIENTO', 'BUGA', '11.111.111'),
('4300', 'MANTENIMIENTO', 'CARTAGO', '444.444');

INSERT INTO Empleado (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp,comisionE, cargoE, jefeID, codDepto) VALUES
('31.840.269', 'María Rojas', 'F', '1959-01-15', '1990-05-16', 6250000, 1500000, 'Gerente', NULL, '1000'),
('16.211.383', 'Luis Pérez', 'M', '1956-02-25', '2000-01-01', 5050000, 0, 'Director', '31.840.269', '1500'),
('31.178.144', 'Rosa Angulo', 'F', '1957-03-15', '1998-08-16', 3250000, 3500000, 'Jefe Ventas', '31.840.269', '2000'),
('16.759.060', 'Darío Casas', 'M', '1960-04-05', '1992-11-01', 4500000, 500000, 'Investigador', '31.840.269', '3000'),
('22.222.222', 'Carla López', 'F', '1975-05-11', '2005-07-16', 4500000, 500000, 'Jefe Mercadeo', '31.840.269', '3500'),
('22.222.333', 'Carlos Rozo', 'M', '1975-05-11', '2001-09-16', 750000, 500000, 'Vigilante', '31.840.269', '3500') ,
('1.751.219', 'Melissa Roa', 'F', '1960-06-19', '2001-03-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2100'),
('768.782', 'Joaquín Rosas', 'M', '1947-07-07', '1990-05-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2200'),
('737.689', 'Mario Llano', 'M', '1945-08-30', '1990-05-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2300'),
('333.333.333', 'Elisa Rojas', 'F', '1979-09-28', '2004-06-01', 3000000, 1000000, 'Jefe Mecánicos', '31.840.269', '4000'),
('888.888', 'Iván Duarte', 'M', '1955-08-12', '1998-05-16', 1050000, 200000, 'Mecánico', '333.333.333', '4100'),
('11.111.111', 'Irene Díaz', 'F', '1979-09-28', '2004-06-01', 1050000, 200000, 'Mecánico', '333.333.333', '4200'),
('444.444', 'Abel Gómez', 'M', '1939-12-24', '2000-10-01', 1050000, 200000, 'Mecánico', '333.333.333', '4300'),
('1.130.222', 'José Giraldo', 'M', '1985-01-20', '2000-11-01', 1200000, 400000, 'Asesor', '22.222.222', '3500'),
('19.709.802', 'William Daza', 'M', '1982-10-09', '1999-12-16', 2250000, 1000000,'Investigador', '16.759.060', '3000'),
('31.174.099', 'Diana Solarte', 'F', '1957-11-19', '1990-05-16', 1250000, 500000, 'Secretaria', '31.840.269', '1000'),
('1.130.777', 'Marcos Cortez', 'M', '1986-06-23', '2000-04-16', 2550000, 500000, 'Mecánico', '333.333.333', '4000'),
('1.130.782', 'Antonio Gil', 'M', '1980-01-23', '2010-04-16', 850000, 1500000, 'Técnico', '16.211.383', '1500'),
('333.333.334', 'Marisol Pulido', 'F', '1979-10-01', '1990-05-16', 3250000, 1000000, 'Investigador', '16.759.060', '3000'),
('333.333.335', 'Ana Moreno', 'F', '1992-01-05', '2004-06-01', 1200000, 400000, 'Secretaria', '16.759.060', '3000'),
('1.130.333', 'Pedro Blanco', 'M', '1987-10-28', '2000-10-01', 800000, 3000000, 'Vendedor', '31.178.144', '2000'),
('1.130.444', 'Jesús Alfonso', 'M', '1988-03-14', '2000-10-01', 800000, 3500000, 'Vendedor', '31.178.144', '2000'),
('333.333.336', 'Carolina Ríos', 'F', '1992-02-15', '2000-10-01', 1250000, 500000, 'Secretaria', '16.211.383', '1500'),
('333.333.337', 'Edith Muñoz', 'F', '1992-03-31', '2000-10-01', 800000, 3600000, 'Vendedor', '31.178.144', '2100'),
('1.130.555', 'Julián Mora', 'M', '1989-07-03', '2000-10-01', 800000, 3100000, 'Vendedor', '31.178.144', '2200'),
('1.130.666', 'Manuel Millán', 'M', '1990-12-08', '2004-06-01', 800000, 3700000, 'Vendedor', '31.178.144', '2300');

#Realiza las siguientes consultas SQL propuestas a las tablas Departamento y Empleado.

#1. Obtener los datos completos de los empleados.

select * from Empleado;


#2. Obtener los datos completos de los departamentos.

select * from Departamento;


#3. Obtener los datos de los empleados con cargo 'Secretaria'.

select * from Empleado where cargoE = 'Secretaria';


#4. Obtener el nombre y salario de los empleados.

select nomEmp, salEmp from Empleado;


#5. Obtener los datos de los empleados vendedores, ordenado por nombre.

select * from empleado where cargoE ='Vendedor' order by nomEmp;


#6. Listar el nombre de los departamentos.

select distinct nombreDpto from Departamento;


#7. Listar el nombre de los departamentos, ordenado por nombre.

select distinct nombreDpto from Departamento order by nombreDpto;


#8. Listar el nombre de los departamentos, ordenado por ciudad.

select ciudad, nombreDpto from Departamento order by ciudad;

#9. Listar el nombre de los departamentos, ordenado por ciudad, en orden inverso.

select ciudad, nombreDpto from Departamento order by ciudad desc;


#10. Obtener el nombre y cargo de todos los empleados, ordenado por salario.

select nomEmp, cargoE, salEmp from empleado order by salEmp;


#11. Obtener el nombre y cargo de todos los empleados, ordenado por cargo y por salario.

select nomEmp, cargoE, salEmp from Empleado order by cargoE, salEmp ;


#12. Obtener el nombre y cargo de todos los empleados, en orden inverso por cargo.

select nomEmp, cargoE from Empleado order by cargoE desc;


#13. Listar los salarios y comisiones de los empleados del departamento 2000.

select salEmp, comisionE, codDepto from Empleado where codDepto= '2000';


#14. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión.

select salEmp, comisionE, codDepto from Empleado where codDepto= '2000' order by comisionE;


#15. Listar todas las comisiones.

select nomEmp, comisionE from Empleado;


#16. Listar las comisiones que sean diferentes, ordenada por valor.

select distinct nomEmp, comisionE from Empleado order by comisionE;


#17. Listar los diferentes salarios.

select nomEmp, salEmp from Empleado;

#18. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento
# 3000 una bonificación de $500.000, en orden alfabético del empleado.

select nomEmp, salEmp+ 500.000 as TotalAPagar from Empleado where codDepto= '3000' order by nomEmp;


#19. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.

select nomEmp, comisionE, salEmp from Empleado where comisionE>salEmp;


#20. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.

select nomEmp, comisionE, salEmp from Empleado where comisionE<=(0.3*salEmp);


#21. Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado.

select nomEmp as Nombre, cargoE as Cargo from Empleado;


SELECT 'Nombre', 'Cargo', nomEmp, cargoE, salEmp FROM empleado ORDER BY nomEmp;


#22. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad es superior al '19.709.802'.

select nomEmp, nDIEmp, salEmp, comisionE from Empleado where nDIEmp>'19.709.802';


#23. Listar los empleados cuyo salario es menor o igual que el 40% de su comisión.

select nomEmp, salEmp, comisionE from Empleado where salEmp<=(0.4*comisionE);


/*24. Divida los empleados, generando un grupo cuyo nombre inicie por la letra J y termine en la letra Z.
 Liste estos empleados y su cargo por orden alfabético.*/
 
 select nomEmp, cargoE from Empleado where nomEmp like 'J%z' order by nomEmp;
 

/*25. Listar el salario, la comisión, el salario total (salario + comisión),
documento de identidad del empleado y nombre, de aquellos empleados que tienen comisión superior a $1.000.000,
ordenar el informe por el número del documento de identidad.*/

select nomEmp, salEmp, comisionE, (salEmp+comisionE) as Total from Empleado where comisionE>1000000 order by nDIEmp;


#26. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.

select nomEmp, salEmp, comisionE, (salEmp+comisionE) as Total from Empleado where comisionE=0 order by nDIEmp;


/*27. Hallar el nombre de los empleados que tienen un salario superior a $1.000.000,
y tienen como jefe al empleado con documento de identidad '31.840.269'.*/

select nomEmp, salEmp from Empleado where salEmp>1000000 and jefeID='31.840.269';


#28. Hallar el conjunto complementario del resultado del ejercicio anterior.

select nomEmp, salEmp from Empleado where salEmp<=1000000 and jefeID not like '31.840.269';


#29. Hallar los empleados cuyo nombre no contiene la cadena “MA”.

select nomEmp from Empleado where nomEmp not like '%MA%';


/*30. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI ‘MANTENIMIENTO’,
 ordenados por ciudad.*/

select nombreDpto, ciudad from Departamento where nombreDpto not like ('Ventas' or'Investigación' or 'MANTENIMIENTO') order by ciudad;


/*31. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' o 'Vendedor',
que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000,
ordenados por fecha de incorporación.*/

select E.nomEmp, D.nombreDpto, E.salEmp, E.fecIncorporacion from Departamento as D inner join Empleado as E on E.codDepto=D.codDepto where
(E.cargoE not like ('Secretaria' or 'Vendedor') and D.nombreDpto not like 'PRODUCCION') and E.salEmp >1000000 order by
E.fecIncorporacion;


#32. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres.

select * from Empleado where char_length(nomEmp)=11;


#33. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres.

select * from Empleado where char_length(nomEmp)>=11;


/*34. Listar los datos de los empleados cuyo nombre inicia por la letra 'M',
su salario es mayor a $800.000 o reciben comisión y trabajan para el departamento de 'VENTAS'.*/

select E.* from Empleado as E inner join Departamento as D on E.codDepto=D.codDepto where
 E.nomEmp like "M%" and (E.salEmp>800000 or E.comisionE>0) or D.nombreDpto like "VENTAS";


/*35. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre
la mitad de la comisión y la propia comisión.*/

select  nomEmp, salEmp, comisionE from Empleado where salEmp between comisionE/2 and comisionE;


/*36. Suponga que la empresa va a aplicar un reajuste salarial del 7%. Listar los nombres de los empleados,
 su salario actual y su nuevo salario, indicando para cada uno de ellos si tiene o no comisión.*/

SELECT nomEmp, salEmp, salEmp*1.07 as NuevoSalario, comisionE as Comision, IF(comisionE > 0, 'Si', 'No') as TieneComision
FROM Empleado;


#37. Obtener la información disponible del empleado cuyo número de documento de identidad sea: '31.178.144', '16.759.060', '1.751.219', '768.782', '737.689', '19.709.802', '31.174.099', '1.130.782'.

select * from Empleado where nDIEmp in ('31.178.144', '16.759.060', '1.751.219', '768.782',
 '737.689', '19.709.802', '31.174.099', '1.130.782');


#38. Entregar un listado de todos los empleados ordenado por su departamento, y alfabético dentro del departamento.

select E.nomEmp,  D.nombreDpto from Empleado as E inner join Departamento as D on E.codDepto=D.codDepto
order by D.nombreDpto, E.nomEmp;

#39. Entregar el salario más alto de la empresa.

select max(salEmp) from empleado;
select salEmp from Empleado order by salEmp desc limit 1;


#40. Entregar el total a pagar por comisiones, y el número de empleados que las reciben.

SELECT SUM(comisionE) AS Total, COUNT(*) AS Empleados_con_comision FROM Empleado WHERE comisionE > 0;


#41. Entregar el nombre del último empleado de la lista por orden alfabético.

select nomEmp from Empleado order by nomEmp desc limit 1;


#42. Hallar el salario más alto, el más bajo y la diferencia entre ellos.

select max(salEmp) as Salario_mas_alto, min(salEmp) as Salario_mas_bajo, max(salEmp)- min(salEmp) as Diferencia from Empleado;


/*43. Conocido el resultado anterior, entregar el nombre de los empleados que reciben el salario más alto y más bajo.
 ¿Cuanto suman estos salarios?*/

select nomEmp, salEmp from Empleado where salEmp=
(select max(salEmp) as maximo from Empleado) or salEmp=
(select min(salEmp) as minimo from Empleado);

#44. Entregar el número de empleados de sexo femenino y de sexo masculino, por departamento.

select * from (select count(nDIEmp) as Total_hombres from Empleado as E where  sexEmp='M') as Total_hombres
inner join (select count(nDIEmp) as Total_mujeres from Empleado as E where  sexEmp='F') as Total_mujeres;


#45. Hallar el salario promedio por departamento.

select D.nombreDpto, avg(E.salEmp) from Empleado as E inner join Departamento as D on D.codDepto=E.codDepto group by D.nombreDpto;

/*46. Hallar el salario promedio por departamento, considerando aquellos empleados cuyo salario supera $900.000,
 y aquellos con salarios inferiores a $575.000. Entregar el código y el nombre del departamento.*/

select avg(salEmp) as Sal_promedio from Empleado where salEmp>900000;
select avg(salEmp) as Sal_promedio from Empleado where salEmp<575000;




47. Entregar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.

48. Hallar los departamentos que tienen más de tres (3) empleados. Entregar el número de empleados de esos departamentos.

49. Obtener la lista de empleados jefes, que tienen al menos un empleado a su cargo. Ordene el informe inversamente por el nombre.

50. Hallar los departamentos que no tienen empleados.

51. Entregar un reporte con el numero de cargos en cada departamento y cual es el promedio de salario de cada uno. Indique el nombre del departamento en el resultado.

52. Entregar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la suma.

53. Entregar un reporte con el código y nombre de cada jefe, junto al número de empleados que dirige. Puede haber empleados que no tengan supervisores, para esto se indicará solamente el numero de ellos dejando los valores restantes en NULL.
