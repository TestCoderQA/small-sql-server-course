/*
	---*** COUNT ***---
Funci�n que permite devolver el n�mero de elementos de un grupo.
Count siempre devolver� un valor num�rico.

COUNT(All � Distinct � Columna � *)

All: Al escificarlo todos los valores son contabilizados.

Distinct: Permite definir la no repitencia de valores 
condicioandos de la consulta.

Columna: Se puede especificar el nombre de una columna
de la tabla a contar.

Asterisco(*): Representa a todas las filas de la tabla.
*/

-- 1. Implementar un Script que permita determinar
-- el total de pasajeros registrados (Funci�n COUNT).

select count(idpasajero) as [Total pasajeros]
from pasajero
go

-- 2. Implementar un Script que permita determinar
-- el total de pasajeros registrados agrupados por su pa�s,
-- tener en cuenta las columnas a mostrar Nombre del pa�s,
-- Total Pasajeros.
-- Use la funci�n agregada COUNT y
-- la cl�sula Group by e Inner Join

select pai.nombre as [Pa�s], count(pas.idpasajero) as [Total Pasajeros]
from pasajero pas inner join pais pai
on pas.idpais = pai.idpais
group by pai.nombre
go

-- 3. Implementar un Script que permita mostrar
-- el total de pasajeros y el monto acumulado
-- de pagos de sus viajes realizando por un determinado pa�s.

select pai.nombre as [Pa�s], count(pas.num_documento) 
as [Total Pasajeros], sum(pag.monto) as [Monto Acumulado]
from pasajero pas inner join pais pai
on pas.idpais = pai.idpais inner join pago pag
on pas.idpasajero = pag.idpasajero
group by pai.nombre
go