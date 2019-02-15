/*
		-- [Programación Transact SQL] --

Transact SQL es el lengujae de programación que proporciona
Microsoft SQL Server para extender el SQL estándar con otro tipo
de instrucciones y de elementos propios de los lenguajes de programación
ya que esta parte está limitada en SQL.

Lo que podemos encontrar en este apartado son:
Scripts
Procedimientos Almacendos
Funciones
Triggers

		-- [Estructuras de Control] --

Estructuras Secuenciales: Las instrucciones se
ejecutan una a continuación de otra.

Estructuras Selectivas: Las instrucciones se
ejecutan según el valor lógico de una variable.

Estructuras Repetitivas: Las instrucciones se
ejecutan en forma repetida según una
condición lógica llamada ciclo ó bucle.

Estrucutra Selectiva IF

La estructura IF evalúa una condición lógica
y en función del resultado booleano (true o false)
se realiza una u otra expression.

	-- [Sintáxis] --

IF<Condición_lógica>
<BEGIN>
	<Expresiones_CondiciónTrue>
<END>
ELSE
<BEGIN>
	<Expresiones_CondiciónFalse>
<END>

*/

-- 1. Implementar un Script que permitar insertar
-- un nuevo registro en la tabla país, en caso se
-- registre duplicidad en el nombre de un país
-- mostrar un mensaje de "país ya registrado",
-- caso contrario insertar dicho registro y
-- mostrar un mensaje de "País registrado Correctamente".

select * from pais
order by idpais asc
go

-- Declarar las variables según la tabla 
-- con los mismos nombres y tipo de datos
declare @idpais char(4) = '0011',
		@nombre varchar(30) = 'China'

if exists(select * from pais where nombre=@nombre)
begin
	print 'País ya registrado'
end
else
begin
	insert into pais (idpais,nombre)
	values (@idpais,@nombre)
	print 'País registrado correctamente'
end
go


-- 2. Implementar un Script que permita Mostrar el mensaje de
-- No hay Pasajeros en este país, solo cuando el total de
-- pasajeros asignados a un determinado País no tenga
-- registros en la tabla Pasajero. Caso contrarios determinar
-- cuántos pasajeros tiene dicho país.

declare @nombre char(40)='Perú'
if(select count(*) from pasajero pas
	left join pais pai 
	on pas.idpais = pai.idpais
	group by pai.nombre
	having pai.nombre = @nombre) is null
begin
	print 'No hay pasajeros en este País'
end
else
begin
	declare @total int
	select @total = count(*)
	from pasajero pas 
	left join pais pai
	on pas.idpais = pai.idpais
	group by pai.nombre
	having pai.nombre = @nombre

	print 'El País ' + @nombre + 'Tiene ' +
	cast(@total as char(2)) + 'Pasajeros'

	-- Cast para hacer un casteo de Entero a Chart
end
go