/*
	FUNCIONES AGREGADAS

las funciones de agregado realizan un c�lculo sobre un conjunto
de valores y devuelven un solo valor. Se suelen utilizar con la
cl�usua GROUP BY de la instruccion SELECT.

SUM
COUNT
MAS
MIN
AVG

SUM
Permite devolver la suma de todos los valores distinguidos
de una determinada expresi�n. Esta funci�n solo puede utilizarse
con columnas de tipo num�rico.

SUM(Columna o Expresi�n)

*/

-- 1. Implementar un Script que permita mostrar
-- el acumulado de los montos registrados
-- en la tabla pago (Funci�n SUM).

select SUM(monto) as [Total acumulado] from pago

-- 2. Implementar un Script que permita mostrar el acumulado
-- de los montos registrados en la tabla pago por cada a�o,
-- considere el a�o de la columna fecha.
-- Use la Funci�n SUM y la cl�usula Group By.

select year(fecha) as [A�o], sum(monto) as [Total Acumulado]
from pago
group by year(fecha)
go

-- 3. Implementar un Script que permitar mostrar el acumulado
-- de los montos registrados en la tabla pago por cada a�o,
-- y mes, considere el a�o de la columna fecha.
-- Use la funci�n SUM y la cl�usula Group By

select year(fecha) as [A�o], month(fecha) as [Mes], sum(monto) as [Total Acumulado]
from pago
group by year(fecha), month(fecha)
go