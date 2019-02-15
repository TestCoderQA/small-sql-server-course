/*
AVG
Funci�n que devuelve el promedio de los valores de un determinado grupo,
consideremos que dicha columna debe ser num�rica.

AVG(Columna � Expresi�n)

Columna: Se puede especificar el nombre de una columna de la tabla para
especificar el promedio.

Expresi�n: Representa a una funci�n SQL o a un juego de operadores aritm�ticos.
No se permite las funciones de agrengado ni subconsultas.

*/

-- 1. Implementar un Script que permita mostrar
-- el precio promedio de las tarifas asignadas
-- a los diferentes vuelos. (Funci�n AVG).

select avg(precio) as [Promedio tarifa]
from tarifa
go

-- 2. Implementar un Script que permita mostrar
-- el monto promedio de pagos agrupados por paises
-- (Funci�n AVG).

select pai.nombre as [Pa�s], avg(pag.monto) as [Promedio pago]
from pago pag inner join pasajero pas
on pas.idpasajero = pag.idpasajero
inner join pais pai
on pas.idpais = pai.idpais
group by pai.nombre
go