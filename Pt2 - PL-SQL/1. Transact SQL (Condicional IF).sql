/*
		-- [Programaci�n Transact SQL] --

Transact SQL es el lengujae de programaci�n que proporciona
Microsoft SQL Server para extender el SQL est�ndar con otro tipo
de instrucciones y de elementos propios de los lenguajes de programaci�n
ya que esta parte est� limitada en SQL.

Lo que podemos encontrar en este apartado son:
Scripts
Procedimientos Almacendos
Funciones
Triggers

		-- [Estructuras de Control] --

Estructuras Secuenciales: Las instrucciones se
ejecutan una a continuaci�n de otra.

Estructuras Selectivas: Las instrucciones se
ejecutan seg�n el valor l�gico de una variable.

Estructuras Repetitivas: Las instrucciones se
ejecutan en forma repetida seg�n una
condici�n l�gica llamada ciclo � bucle.

Estrucutra Selectiva IF

La estructura IF eval�a una condici�n l�gica
y en funci�n del resultado booleano (true o false)
se realiza una u otra expression.

	-- [Sint�xis] --

IF<Condici�n_l�gica>
<BEGIN>
	<Expresiones_Condici�nTrue>
<END>
ELSE
<BEGIN>
	<Expresiones_Condici�nFalse>
<END>

*/

-- 1. Implementar un Script que permitar insertar
-- un nuevo registro en la tabla pa�s, en caso se
-- registre duplicidad en el nombre de un pa�s
-- mostrar un mensaje de "pa�s ya registrado",
-- caso contrario insertar dicho registro y
-- mostrar un mensaje de "Pa�s registrado Correctamente".

select * from pais
order by idpais asc
go

-- Declarar las variables seg�n la tabla 
-- con los mismos nombres y tipo de datos
declare @idpais char(4) = '0011',
		@nombre varchar(30) = 'China'

if exists(select * from pais where nombre=@nombre)
begin
	print 'Pa�s ya registrado'
end
else
begin
	insert into pais (idpais,nombre)
	values (@idpais,@nombre)
	print 'Pa�s registrado correctamente'
end
go


-- 2. Implementar un Script que permita Mostrar el mensaje de
-- No hay Pasajeros en este pa�s, solo cuando el total de
-- pasajeros asignados a un determinado Pa�s no tenga
-- registros en la tabla Pasajero. Caso contrarios determinar
-- cu�ntos pasajeros tiene dicho pa�s.

declare @nombre char(40)='Per�'
if(select count(*) from pasajero pas
	left join pais pai 
	on pas.idpais = pai.idpais
	group by pai.nombre
	having pai.nombre = @nombre) is null
begin
	print 'No hay pasajeros en este Pa�s'
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

	print 'El Pa�s ' + @nombre + 'Tiene ' +
	cast(@total as char(2)) + 'Pasajeros'

	-- Cast para hacer un casteo de Entero a Chart
end
go