/*
	-- [While] --

La esctrucurta WHILE hace repetir
un conjutno de instrucciones en
secuencia de un n�mero determinado de
veces a esto se le denomina bucle o ciclo

	-- [Sintaxis] --

WHILE condici�n
BEGIN
	<expresi�n repetida>
	[BREAK]
	<express�n repetida>
	[CONTINUE]
	<expressi�n repetida>
END
*/

-- 1. Implementar un Script que permita mostrar
-- los n�meros pares consecutivos del 1 al 100.
declare @n int = 0
while (@n < 100)
begin
	set @n = @n +1
	if(@n %2 = 0)
		print 'Valor N: ' + cast(@n as char(3))
end

-- 2. Implementar un Script que permita aumentar en 10%
-- el costo de las tarifas solo si el promedio de estas
-- no supera los 2000, cuando se termine de actualizar
-- dichos valores mostrar
-- el mensaje "Ya no hay m�s que actualizar"

while (select avg(precio) from tarifa) < 2000
begin 
	update tarifa set precio = precio *1.10
	if(select max(precio) from tarifa) > 2000
		break
	else
		continue
end
print 'Ya no hay m�s que actualizar'
go

select * from tarifa
