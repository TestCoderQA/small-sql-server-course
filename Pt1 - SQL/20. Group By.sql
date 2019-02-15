/*
-- *********** Datos agrupados ********* --

GROUP BY
Agrupa un conjunto de registros de acuerdo a 
los valores de una  o m�s columnas de una tabla.

GROUP BY
	[ROLLUP]
	[CUBE]
	<Lista de columnas>

ROLLUP: Genera filas de agregado a la
cl�usula Group by m�s filas de subtotal y
tambi�n una fila con un total general.

CUBE: Genera filas de agregado a la cl�usula
Group By m�s una fila de superagregado y 
filas de tabulaci�n Cruzada.
*/

-- 1. Implementar un Script que permita mostrar las claves
-- primarias de la tabla pa�s agrupadas desde la tabla pasajero
-- usar la cl�usula Group By.

select idpais from PASAJERO
group by idpais
go

-- 2. Implementar un Script que permita determinar el total de Aviones
-- que tiene cada aerol�nea, y filtrar solo las aerol�neas que tienen m�s
--- de un avi�n. Usar la cl�usula Group By y Having.

select aer.nombre, count(avi.idavion) as Total_Aviones
from aerolinea aer inner join avion avi
on aer.idaerolinea = avi.idaerolinea
group by aer.nombre
having count(avi.idavion)>1
go