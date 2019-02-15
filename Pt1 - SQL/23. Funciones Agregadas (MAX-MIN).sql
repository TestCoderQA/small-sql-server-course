/*
MAX
Función que permite determinar el valor máximo de una expresión
propuesta por el usuario.
Solo puede ser usado en columnas o expresiones que tenga como
tipo de dato un entero.

MAX(ALL ó Columna ó Expresión)

MIN
Función que permite determinar el valor mínimo de una expresión
propuesta por el usuario.
Solo puede ser usado en columnas o expresiones que tenga como
tipo de dato un entero

MIN(All ó Columna ó Expresión)

All: Especifica que todos los valores son evaluados.
Columna: Se puede especificar el nombre de una columna de la tabla a evaluar.
Expresión: Representa una función SQL o a un juego de operadores aritméticos.

*/

-- 1. Implementar un Script que permita mostrar
-- el monto más alto y más bajo registrado
-- en la tabla PAGO (Función MAX y MIN).

select max(monto) as [Monto Mayor],
min(monto) as [Monto Menor]
from pago
go

-- 2.Implementar un Script que permita mostrar
-- Los montos más altos y más bajos por año de la tabla pago,
-- ordenados de forma descendente.

select year(fecha) as[Año], min(monto) as [Monto Menor], max(monto) as [Monto Mayor]
from pago
group by year(fecha)
order by year(fecha) desc
go

-- 3.Implementar un Script que permita mostrar
-- los datos del pasajero que registra el mayor monto desde la tabla PAGO.

declare @maxPago money

select @maxPago = max(monto) from pago

select pas.*
from pasajero pas
where pas.idpasajero = (select idpasajero from pago
where monto = @maxPago)
go