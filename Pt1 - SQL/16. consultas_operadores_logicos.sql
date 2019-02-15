/*
	Lenguaje de Manipulación de Datos (DML)

	C) Operadores lógicos

	Los operadors lógicos tienen por misión comprobar la veracidad
	de alguna condición, estos como los operadores de comparación,
	devuelven el tipo de datos BOOLEAN (True, False, Unknown).

	AND: Representa la Lógica Y, dos expresiones deben ser TRUE
	para poder devolver TRUE.

	ANY: Devuelven TRUE si alguna expresión del cojunto de
	expresiones es TRUE.

	BETWEEN: Devuelve TRUE si el valor se encuentra dentro
	de un rango númerico o cadena.

	EXISTS: Devuelve TRUE si una determinada subconsulta
	devuelve por lo menos una fila de registros.

	IN: Devuelve TRUE si el operando se encuentra dentro de una
	lista de valores específicos.

	NOT: Invierte el valor booleano de una expresión.

	OR: Devuelve FALSE cuando ambas expresiones sean FALSE.

	SOME: Devuelve TRUE si de un conjunto de comparaciones
	alguna es TRUE.

					---------*******---------
	Simbolos que representan a los operadores lógicos:

	= 		Igualdad de expresiones
	<>	!=	Diferencia de expresiones
	>	>=	Mayor/ Mayor o Igual
	<	<=	Menor/ Menor o Igual
*/

-- 1. Script para Mostrar las reservas que sean del año 2014
-- y no superen los $ 500.

select * from reserva
where year(fecha) = '2014'and costo < 500
go


-- 2. Script que permita mostrar las reservas
-- cuyo costo se encuentre desde $400 hasta $700.

select * from reserva
where costo between 400 and 700
go

select * from reserva
where costo >=400 and costo<=700
go


-- 3. Script que permite mostrar los pasajeros
-- cuya letra inicial de su apellido paterno se encuentre entre A y C

select * from pasajero
where left(apaterno,1) between 'A' and 'C'
order by apaterno asc, amaterno asc, nombre asc
go


-- 4. Script que permita mostrar los pasajeros
-- cuya letra inicial de su apellido paterno NO se encuentre entre A y C

select * from pasajero
where not left(apaterno, 1) between 'A' and 'C'
order by apaterno asc, amaterno asc, nombre asc
go


-- 5. Script que permita mostrar las reservas
-- cuya fecha se encuentra en el año 2013

select * from reserva
where fecha between '2013-01-01' and '2013-12-31'
go

select * from reserva
where fecha>='2013-01-01' and fecha <='2013-12-31'
go

select * from reserva
where YEAR(fecha) = 2013
go