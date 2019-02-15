/*
AVG
Función que devuelve el promedio de los valores de un determinado grupo,
consideremos que dicha columna debe ser numérica.

AVG(Columna ó Expresión)

Columna: Se puede especificar el nombre de una columna de la tabla para
especificar el promedio.

Expresión: Representa a una función SQL o a un juego de operadores aritméticos.
No se permite las funciones de agrengado ni subconsultas.

*/

-- 1. Implementar un Script que permita mostrar
-- el precio promedio de las tarifas asignadas
-- a los diferentes vuelos. (Función AVG).

select avg(precio) as [Promedio tarifa]
from tarifa
go

-- 2. Implementar un Script que permita mostrar
-- el monto promedio de pagos agrupados por paises
-- (Función AVG).

select pai.nombre as [País], avg(pag.monto) as [Promedio pago]
from pago pag inner join pasajero pas
on pas.idpasajero = pag.idpasajero
inner join pais pai
on pas.idpais = pai.idpais
group by pai.nombre
go