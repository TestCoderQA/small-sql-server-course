/*

		-- [Cursores] --

Los cursores son una herramienta de SQL
que nos permite recorrer el resultado de
una consulta SQL y realizar operaciones en
cada paso de esta. Es así como nos ayuda a
realizar operaciones que de otro modo serían
más complejas o imposibles.

		-- [Sintáxis Cursor] --

Declare Nombre_Cursor
[INSENSITIVE][SCROLL] CURSOR
FOR EXPRESSION_SELECT
[FOR READ ONLY | UPDATE[OF column_name[,...b]]]

*/

	-- 1. Implementar un cursor básico donde
	-- se imprima el primer registro de la tabla PASAJERO.

	/*DECLARE MICURSORPAS CURSOR  -- Se declara el cursor.
		FOR select * from PASAJERO

	OPEN MICURSORPAS -- Se abre el cursor

	FETCH NEXT FROM MICURSORPAS -- Mostrar registros de 1 en 1

	CLOSE MICURSORPAS -- Cerrar el cursor

	DEALLOCATE MICURSORPAS -- Liberar el Cursor

*/


-- 2. Implementar un cursor donde se imprima
-- en forma de reporte a los registros de la tabla PASAJERO.

create proc reportePasajeros
as

declare @idpasajero char(8), @pasajero char(25), 
@pais char(10), @documento char(12)

declare micursor cursor
	for select pas.idpasajero,
	(pas.nombre+''+pas.apaterno) as Pasajero,
	pai.nombre as Pais, pas.num_documento
	from pasajero pas inner join pais pai
	on pas.idpais = pai.idpais

open micursor

fetch micursor into @idpasajero,@pasajero,@pais,@documento
-- Imprimir la cabecera del reporte
print 'CÓDIGO		PASAJERO				PAÍS		DOCUMENTO'
print '------------------------------------------------------'
-- Agregar los detalles
while @@FETCH_STATUS=0
begin
	print @idpasajero+space(5)+
		  @pasajero+space(5)+
		  @pais+space(5)+
		  @documento
	fetch micursor into @idpasajero,@pasajero,@pais,@documento
end

close micursor

deallocate micursor

-- Llamar al reporte.

reportePasajeros