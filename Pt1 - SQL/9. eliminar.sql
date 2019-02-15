/*
	Lenguaje de manipulación de Datos (DML)

	SENTENCIA DELETE (Eliminación de Registros de una tabla)

	Permite eliminar todos los registros específicados 
	en una determinada tabla.

	Estrucutura

	DELETE
		[TOP {Expresión}]
		FROM TABLE
		[WHERE <Search_Condition>]

*/

-- 1. Eliminar todos los registros de la tabla AEROLÍNEA.

SELECT * FROM aerolinea
DELETE FROM aerolinea


-- 2. Eliminar el Registro de la tabla PASAJERO cuyo idpasajero sea P0000004.

DELETE FROM pasajero
WHERE idpasajero = 'P0000004'
GO

SELECT * FROM pasajero


-- 3. Eliminar los registros de la tabla PASJAERO
-- cuyo país México, utilizar subconsultas.

SELECT * FROM PAIS
SELECT * FROM pasajero

DELETE FROM pasajero
WHERE idpais = (select idpais from pais where nombre = 'México')
GO 


-- 4. Eliminar los registros de la tabla RESERVA que
-- sean del año 2013 y que no superen los $70.

SELECT * FROM  reserva

DELETE FROM reserva
WHERE year(fecha) = 2013 AND costo < 70
GO


-- 5. Eliminar los registros de la tabla PAGO, 
-- que se han efectuado en el año 2012 ó 2013.

SELECT * FROM pasajero

DELETE FROM pago
WHERE year(fecha)=2012 or year(fecha)=2013
GO
