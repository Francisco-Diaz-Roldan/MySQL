/*Ejercicio 1.- Crea una función que a partir de dos números, calcule y muestre el resultado de la multiplicación entre ambos.*/

use netflix;
drop function ejercicio1;

delimiter //
create function ejercicio1() returns int deterministic
begin
declare resultado int;
declare num1 int;
declare num2 int;

set num1=9;
set num2=10;
set resultado=num1*num2;

return resultado;
end //

select ejercicio1();

/*Ejercicio 2.- Crea una función que a partir de un número y una palabra, calcule y muestre el resultado de la suma del número y el número de caracteres de la palabra.*/


drop function ejercicio2;

delimiter //
create function ejercicio2() returns int deterministic
begin
declare resultado int;
declare num int;
declare palabra varchar(10);

set num = 10;
set palabra="Pokémon";
set resultado = num + char_length(palabra);

return resultado;
end //

select ejercicio2();

/*Ejercicio 3.- Crea una función que a partir de dos palabras muestre como resultado las dos palabras separadas por el conector “y”.
  Ejemplo) Palabra1: hola;  Palabra2: adios;  Resultado: hola y adios*/

drop function ejercicio3;

delimiter //
create function ejercicio3(palabra1 varchar(10) , palabra2 varchar(10)) returns varchar(20) deterministic
begin
declare resultado varchar(20);

return resultado;
end //

select ejercicio3("arriba", "españa"); 


/*Ejercicio 4.- Crea una función que calcule la división entre dos números insertados por el usuario a través de la función Select.  
Ejemplo)  select division(21, 3);   Resultado: 7*/



/*Ejercicio 5.- Crea una función dados dos números, uno insertado por el usuario, y otro dentro de la función, muestre una frase indicando
si el número insertado por el usuario es mayor, menor o igual al otro.*/

