/*
	FUNCIONES AGREGADAS

las funciones de agregado realizan un cálculo sobre un conjunto
de valores y devuelven un solo valor. Se suelen utilizar con la
cláusua GROUP BY de la instruccion SELECT.

SUM
COUNT
MAS
MIN
AVG

SUM
Permite devolver la suma de todos los valores distinguidos
de una determinada expresión. Esta función solo puede utilizarse
con columnas de tipo numérico.

SUM(Columna o Expresión)

*/

-- 1. Implementar un Script que permita mostrar
-- el acumulado de los montos registrados
-- en la tabla pago (Función SUM).

select SUM(monto) as [Total acumulado] from pago

-- 2. Implementar un Script que permita mostrar el acumulado
-- de los montos registrados en la tabla pago por cada año,
-- considere el año de la columna fecha.
-- Use la Función SUM y la cláusula Group By.

select year(fecha) as [Año], sum(monto) as [Total Acumulado]
from pago
group by year(fecha)
go

-- 3. Implementar un Script que permitar mostrar el acumulado
-- de los montos registrados en la tabla pago por cada año,
-- y mes, considere el año de la columna fecha.
-- Use la función SUM y la cláusula Group By

select year(fecha) as [Año], month(fecha) as [Mes], sum(monto) as [Total Acumulado]
from pago
group by year(fecha), month(fecha)
go