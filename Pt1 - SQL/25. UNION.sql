/*
El operador UNION permite mostrar los resultados de varias
consultas SELECT en un sola. La regla del uso para este operador
es que ambas tablas deben de tener las mismas columnas o especificarlas
de la misma forma, y que los tipos de datos sean exactamente iguales.

Sitaxis

Consulta1
UNION
Consulta2
*/

-- 1. Implementar un Script que permite mostrar los
-- apellidos paternos de los pasajeros y los nombres de los
-- países en una misma consulta.

select pas.idpasajero as [Código], pas.apaterno as [Nombre]
from pasajero pas
UNION
select pai.idpais, pai.nombre
from pais pai
go

-- 2. Implementar un Script que permitar mostrar el
-- total de registros de las tablas Pasajero, País y pago
-- desde una misma consulta.

select 'Pasajero' as[Tabla],count(idpasajero)
as [Total Regitros] from pasajero
UNION
select 'País' as[Tabla], count(idpais)
as [Total Registros] from pais
UNION
select 'Pago' as[Tabla], count(idpago)
as [Total Registros] from pago
go