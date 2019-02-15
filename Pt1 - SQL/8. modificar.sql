/*
	Lenguaje de Manipulación de Datos (DML)

	SENTENCIA UPDATE (Modificación y acutalizacion de Datos)

	Permite modificar o actualizar un conjunto de registros 
	de una Tabla o vista dependiendo de una condición.

	Estrucutura

	UPDATE TABLA O VISTA
		[SET] {column name = expresión}
		[WHERE <Search_Condition>]

*/

-- 1. Actualizar los valores de la columna impuesto
-- por el valor 11 a todos los registros de la tabla TARIFA.

SELECT * FROM tarifa

UPDATE tarifa
SET impuesto = 11
GO

-- 2. Actualizar los valores de la columna impuesto
-- aumentado en 2 a todos los registros de la tabla TARIFA.

SELECT * FROM tarifa

UPDATE tarifa
SET impuesto = impuesto + 2
GO

-- 3. Asignar el impuesto a cero, sólo a los
-- registros cuya clase sea Económico de la tabla TARIFA.

SELECT * FROM tarifa

UPDATE tarifa
SET impuesto = 0
WHERE clase = 'Económica'
GO

-- 4. Actualizar los costos de la tabla RESERVA
-- disminuyendo en $50 a los registros cuyo ingreso
-- se realizo en el año 2013, utilizar variables.

/*	Para utilizar variables, se necesita la palabra DECLARE seguido con un @ 
	el nombre de la variable, y el tipo de dato y su valor
		DECLARE @name_var tipo_dato = valor
*/

SELECT * FROM reserva

DECLARE @monto money=50
UPDATE reserva
SET costo=costo - @monto
WHERE year(fecha) = 2013
GO

-- 5. Asignar el texto 'SIN FONO' en el campo teléfono
-- de los pasajeros que sean de Perú
-- Todo esto deberá ser realizando en la tabla Pasajero.

SELECT * FROM pais
SELECT * FROM pasajero

-- Versión 1
UPDATE pasajero
SET telefono = 'Sin Fono'
WHERE idpais = 0001
GO

-- Versión 2
UPDATE pasajero
SET telefono = 'Sin Fono'
WHERE idpais = (select idpais from pais where nombre = 'Perú')
GO