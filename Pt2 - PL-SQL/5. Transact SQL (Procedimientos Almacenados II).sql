/*
	-- [Procedimientos Alamacenados] --

Son un conjunto de instrucciones de
Transact-SQL que pueden aceptar y
devolver parámetros proporcionados
por el usuario.

	-- [Tipos de Procedimientos Almacenados] --

*Procedimientos Almacenados del Sistema.
*Procedimientos Almacenados definidos por el usuario

	-- [Sintaxis Procedimientos Almacenados
			Definidos por el usuario] --

create procedure Nombre_Procedimiento
@parámetro1 [tipo dato],
@parámetroN [tipo dato]
AS
	<Instrucciones>

*/

-- 1. Implementar un procedimiento almacenado que muestre
-- el listado de los países y su total de pasajeros.

if object_id('pasajeroxpais') is not null
begin
	drop procedure pasajeroxpais
end
go

create procedure pasajeroxpais
as
	select pai.nombre, count(*) as [Total Registros]
	from pasajero pas inner join pais pai
	on pas.idpais = pai.idpais
	group by pai.nombre
go

exec pasajeroxpais

-- 2. Implementar un procedimiento almacenado
-- que permita mostrar los pagos de un determinado
-- pasajero, considerar para este caso como parámetro
-- búsqueda el número de documento del pasajero.

if object_id('pagoxpasajero') is not null
begin
	drop procedure pagoxpasajero
end
go

create procedure pagoxpasajero
@num_documento varchar(12)
as
	select fecha,monto,tipo_comprobante,num_comprobante
	from pago where idpasajero =(
	select idpasajero from pasajero 
	where num_documento = @num_documento)
go

exec pagoxpasajero '47715777' -- Entre comillas sencilas se agrega el parametro


-- 3. Implementar un procedimiento almacenado
-- que permita registrar un Nuevo país, para este
-- caso definir como parámetr de entrada todos los campos
-- referente a la tabla país.

if object_id('nuevoxpais') is not null
begin
	drop procedure nuevoxpais
end
go

create procedure nuevoxpais
@id_pais char(4),
@nombre varchar(30)
as
	insert into pais (idpais,nombre) 
	VALUES (@id_pais,@nombre)
go

exec nuevoxpais '0012','Australia'
exec nuevoxpais '0013','Colombia'

select * from pais order by idpais desc

-- 4. Implementar un procedimiento alamacenado
-- que retorne el total de pagos recibidos
-- en una determinada fecha.


if object_id('totalpagos') is not null
begin
	drop procedure totalpagos
end
go

create procedure totalpagos
@fecha date,
@total money output
as
	select @total = sum(monto) from pago
	where fecha = @fecha
go

-- Ejecutamos
declare @t money
exec totalpagos '2014-05-05',@total=@t output -- output, es un tipo de dato de salida
print 'Total: ' +cast(@t as char(10)) -- Casteo de Int a String
go