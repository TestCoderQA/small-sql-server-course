/*
MAX
Funci�n que permite determinar el valor m�ximo de una expresi�n
propuesta por el usuario.
Solo puede ser usado en columnas o expresiones que tenga como
tipo de dato un entero.

MAX(ALL � Columna � Expresi�n)

MIN
Funci�n que permite determinar el valor m�nimo de una expresi�n
propuesta por el usuario.
Solo puede ser usado en columnas o expresiones que tenga como
tipo de dato un entero

MIN(All � Columna � Expresi�n)

All: Especifica que todos los valores son evaluados.
Columna: Se puede especificar el nombre de una columna de la tabla a evaluar.
Expresi�n: Representa una funci�n SQL o a un juego de operadores aritm�ticos.

*/

-- 1. Implementar un Script que permita mostrar
-- el monto m�s alto y m�s bajo registrado
-- en la tabla PAGO (Funci�n MAX y MIN).

select max(monto) as [Monto Mayor],
min(monto) as [Monto Menor]
from pago
go

-- 2.Implementar un Script que permita mostrar
-- Los montos m�s altos y m�s bajos por a�o de la tabla pago,
-- ordenados de forma descendente.

select year(fecha) as[A�o], min(monto) as [Monto Menor], max(monto) as [Monto Mayor]
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