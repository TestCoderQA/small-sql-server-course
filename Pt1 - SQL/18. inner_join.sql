/*
	Combinación de tablas JOIN

	En determinada ocasión se tendrá que unir más tablas para
	combinar valores y poder mostrarlos juntos en una consulta
	para esto utilizamos la cláusula.

	--** DIFERENCIAS ENTRE DOS TIPOS DE COMBINACIONES **--

	Internas: Devuelven todas las filas que cumplen con la condición de las tablas,
		en caso de no encontrarse coincidencia de valores no muestra nada.
	Externas: Las filas resultantes no son directamente de la tabla origen,
		podría ser de la izquierda, derecha o completa.

	--** Tipos de JOIN **--

	INNER JOIN
	JOIN
	LEFT JOIN
	RIGHT JOIN
	FULL JOIN
	CROSS JOIN

	INNER JOIN:
		EL INNER JOIN es otro tipo de composición de tablas, 
		permite emparejar filas de distintas tablas 
		de forma más eficiente que con el producto cartesiano 
		cuando una de las columnas de emparejamiento está indexada.
*/

-- 1. Implementar un Script que permita mostrar los pasajeros
-- con su correspondiente país de residencia (Inner Join). 2 Tablas

use dbreserva
go

select pas.nombre, pas.apaterno, pas.amaterno, pai.nombre as [País]
from pasajero pas, pais pai
where pas.idpais = pai.idpais
go

select * from pasajero
go
select * from pais
go

select pas.nombre, pas.apaterno, pas.amaterno, pai.nombre as [País]
from pasajero pas inner join pais pai
on pas.idpais = pai.idpais
go


-- 2. Implementar un Script que permita mostrar los pasajeros
-- con las siguientes columnas idpasajero, nombre, apaterno,
-- amaterno, país, fecha de pago, monto de pago (Inner Join).3 Tablas

select	pas.idpasajero, pas.nombre, pas.apaterno, pas.amaterno,
		pai.nombre as [País], pag.fecha, pag.monto
from pasajero pas inner join pais pai
on pas.idpais = pai.idpais
inner join pago pag
on pas.idpasajero = pag.idpasajero
go


-- 3. Implementar un Script que permita mostra las reservas
-- de un determinado PASAJERO especificando por su Número de Documento.
-- Finalmente, debe ordernad la fecha de reserva de forma desecendete.

declare @num_documento varchar(12) = '47715777' -- Varchar(12) porqué en la tabla pasajero, en la columna num_documento tiene varchar(12).
select res.*
from pago pag inner join pasajero pas
on pag.idpasajero = pas.idpasajero
inner join reserva res
on pag.idreserva = res.idreserva
where pas.num_documento = @num_documento
order by res.fecha desc
go