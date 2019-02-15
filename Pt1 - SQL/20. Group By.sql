/*
-- *********** Datos agrupados ********* --

GROUP BY
Agrupa un conjunto de registros de acuerdo a 
los valores de una  o más columnas de una tabla.

GROUP BY
	[ROLLUP]
	[CUBE]
	<Lista de columnas>

ROLLUP: Genera filas de agregado a la
cláusula Group by más filas de subtotal y
también una fila con un total general.

CUBE: Genera filas de agregado a la cláusula
Group By más una fila de superagregado y 
filas de tabulación Cruzada.
*/

-- 1. Implementar un Script que permita mostrar las claves
-- primarias de la tabla país agrupadas desde la tabla pasajero
-- usar la cláusula Group By.

select idpais from PASAJERO
group by idpais
go

-- 2. Implementar un Script que permita determinar el total de Aviones
-- que tiene cada aerolínea, y filtrar solo las aerolíneas que tienen más
--- de un avión. Usar la cláusula Group By y Having.

select aer.nombre, count(avi.idavion) as Total_Aviones
from aerolinea aer inner join avion avi
on aer.idaerolinea = avi.idaerolinea
group by aer.nombre
having count(avi.idavion)>1
go