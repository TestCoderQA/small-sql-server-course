/*
	Lenguaje de manipulación de Datos (DML)

	COMANDO SELECT (Recuperación de Registros):
	Uno de los propósitos de la Gestión de base de datos es almacenar información 
	lógica y ordernada dentro de tablas, usaremos la sentencia SELECT y sus variadas 
	formas de recuperar información desde una tabla en la base de datos activa.

	Sintaxis:

	COMANDO SELECT (Sintáxis)

	SELECT [ALL - DISTINNCT]
		[TOP número - [PERCENT]]
		[FROM] tabla
		[WHERE <Condición>]`
		[<GROUP BY>]
		[HAVING <Condición>]
		[ORDER BY columna [ASC-DESC]]


	COMANDO SELECT - Clásulas Principales
	
	ALL: Especifica el conjunto de filas devueltas por la consulta

	DISTINCT: Sentencia utilizada para mostrar filas únicas no repetidas.

	TOP: Para mostrar solo número o porcentaje indicado de filas obtenidas.

	FROM: Permite indicar las filas que están involucradas.

	WHERE: Cláusula que permite condicionar el resutlado de una consulta.

	GROUP BY: Permite agrupar un conjunto de regisro en forma de resumen.

	HAVING: Permite condicionar el resultado después de haber agrupado los registros.

	ORDER BY: Permite ordernar los registros de acuerdo a una columna específica.	
*/

-- 1. Mostrar los registros de la tabla PASAJERO,
-- ordernarlos de manera ascendente por su apellido paterno.

select all * from pasajero
order by apaterno asc

select idpasajero, nombre, apaterno, amaterno, num_documento from pasajero

select idpasajero as Codigo, apaterno as ApellidoPaterno, amaterno as ApellidoMaterno
from pasajero

select idpasajero as [Código], nombre as Nombre, (apaterno +' '+ amaterno) as Apellidos
from pasajero


-- 2. Mostrar los 3 primeros registros de la tabla PASAJERO
-- ordenados por su apellido paterno.

select top 3 idpasajero as ID, nombre as Nombre, apaterno as ApellidoP, amaterno as ApellidoM 
from pasajero
order by apaterno asc


-- 3. Mostrar los 3 últimos registros de la tabla PASAJERO
-- ordenados por ambos apellidos.

select top 3 idpasajero as ID, nombre as Nombre, apaterno as ApellidoP, amaterno as ApellidoM 
from pasajero
order by apaterno desc, amaterno desc


-- 4. Mostrar el 30% de los registros de la tabla RESERVA
select top 30 percent * from reserva
go

select * from reserva