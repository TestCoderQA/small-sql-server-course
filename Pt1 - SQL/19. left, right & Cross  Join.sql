/*
LEFT JOIN
La sentencia LEFT JOIN retorna la pareja de todos 
los valores de la izquierda con los valores
de la tabla derecha correspondientes, o retorna un 
valor nulo NULL en caso de no correspondencia.

El operador de combinación LEFT JOIN, indica que
todas las filas de la primera tabla se deben incluir
en los resultados, con independencia si hay datos
coincidentes de la segunda tabla.


RIGHT JOIN
Se devuelven todas las filas de la tabla de la
derecha. Cada vez que una fila de la tabla de la derecha
no tenga correspondencia en la tabla de la izquierda,
se devuelven valores NULL para la tabla izquierda.

El operador de combinacion RIGHT JOIN, indica
que todas las filas de la segunda tabla se deben
incluir en los resultados, con independeica si 
hay datos coincidentes en la primera tabla.


FULL JOIN
Una combinación externa completa devulve todas las filas
de las tablas de la izquierda y la derecha. Cada vez que
una fila no tenga coincidencia en la otra tabla, las columnas
de la lista de selección de la otra tabla contendrán
valores NULL. Cuando haya una coincidencia entre las tablas,
la fila completa del conjunto de resultados contredrá los valores de datos
de las tablas base.


CROSS JOIN
Las combinaciones cruzadas presentan el
producto cartesiano de todos los registros
de las dos tablas. se emplea el CROSS JOIN 
Cuando se quiere combinar todos los registros
de una tabla con cada registro de otra tabla.
*/

-- 1. Implementar un Script que permita mostrar los pasajeros
-- que no han realizado ningún pago (left Join).

select pas.*
from pasajero pas left join pago pag
on pas.idpasajero = pag.idpasajero
where pag.idpasajero is null
go

-- 2. Implementar un Script que permitar mostrar
-- todos los registros de la tabla pasajero y país(Right Join).

select pai.nombre as [País], pas.*
from pasajero pas right join pais pai
on pas.idpais = pai.idpais
go

-- 3. Implementar un Script que permita mostrar los registros
-- de la tabla pasajero y pago de tal forma que se aplique 
-- un producto cartesiano entre sus filas (Cross Join).

select pas.*, pag.*
from pasajero pas cross join pago pag
go