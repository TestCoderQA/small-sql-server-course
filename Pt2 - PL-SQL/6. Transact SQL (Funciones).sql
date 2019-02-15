/*
		-- [Funciones] --

Rutina almacenada que recibe unos 
parámetro escalares de entrada, luego los
procesa según el cuerpo definido de la función
y por último retorna un resultado de un tipo
especifico que permitirá cumplir un objetivo.

SQL Server proporciona numerosas funciones
integradas y permite crear funciones definidas
por el usuario.

		-- [Tipos de Funciones] --

*Funciones del sistema.

SQL Server cuenta con una gran variedad
de funciones dependiendo de los valores
o configuraciones que deseamos realizar.

Funciones de Agregado: SUM, AVG, COUNT, MAX, MIN

Funciones de fecha y Hora:	GETDATE, DAY, MONTH, YEAR, DATEADD
DATEIF, ISDATE

Funciones Matemáticas: ABS, RAND, LOG10, SQRT, POWER, TAN, PI, RADIANS


*Funciones definidas por el usuario.

Las funciones definidas por el usuario de SQL Server
son rutinas que aceptan parámetros, realizan una acción
como un cálculo complejo, y devuelven el resultado de esa
acción como un valor (único o conjunto de valores).


-- [Sintaxis funciones Definidos por el usuario] --

create Function Nombre_Función
(@parámetro1 as [Tipo Dato] = [ValorxDefecto],
@parámetroN as [Tipo Dato] = [ValorxDector])
RETURNS TipoDato_Returnado
AS
	BEGIN
		<Instrucciones>
		RETURN Expresión_salida
	END
*/

-- 1. Implementar una función que devuelva el promedio
-- de dos números ingresados por el usuario.

/*

	create function calcularPromedio
	(@valor1 as decimal(10,2), @valor2 as decimal (10,2))
	RETURNS decimal(10,2)
	as
	begin
		declare @resultado decimal(10,2)
		set @resultado = (@valor1+@valor2)/2
		RETURN @resultado
	end

	-- Llamar a la función
	select dbo.calcularPromedio(12,13) as promedio -- Estilo 1
	go

	print 'Promedio: ' +cast(dbo.calcularPromedio(12,13) as char(12)) -- Estilo 2

*/

-- 2. Implementar una función que devuelva 
-- una fecha ingresada en letras 15-08-2015 = 15 de Agosto del 2015.

/*

	if object_id ('fechaLetras') is not null
	begin
		drop function fechaLetras
	end
	go

	alter function fechaLetras (@fecha as date)
	returns varchar(30)
	as
	begin
		declare @resultado varchar(30)
		set @resultado=concat(day(@fecha), ' de ',
		datename(month,@fecha),' del ',year(@fecha))
		return @resultado
	end

	select dbo.fechaLetras('2017-06-14') as [Fecha Actual]
	go

	select nombre,apaterno,
	dbo.fechaLetras(fecha_nacimiento) as [Fecha] 
	from pasajero

*/

-- 3. Implementar una función de tabla
-- en línea que muestre los registros de la tabla
-- pasajero dependiendo del país de proveniencia.

CREATE FUNCTION pasajeroPais
(@pais as varchar(30))
	RETURNS TABLE
AS
	RETURN(select pas.idpasajero,(pas.nombre+''+
	pas.apaterno) as Pasjaero, pai.nombre as Pais
	from pasajero pas inner join pais pai
	on pas.idpais = pai.idpais
	where pai.nombre = @pais
	)

select * from dbo.pasajeroPais('Perú')

