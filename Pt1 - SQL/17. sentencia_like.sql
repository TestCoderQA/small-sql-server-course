/*
	like: Devuelve True si el operando coincide a lo m�s con un patr�n
	especifico. El patr�n es una cadena de caracteres que se buscar� en la
	expresi�n. Los comod�nes a utilizar son:

	%  : Representa a uno o m�s caracteres. Puede ser cualquier tipo de car�cter
	textual o simbolo.

	_  : Representa un solo car�cter de cualquier tipo.

	[] : Representa cualquier car�cter individual, dentro de un conjunto de caracteres.

	[^]: Representa cualquier car�cter individual fuera del intervalo escecificado.
	
	IS NOT NULL: Representa que el contenido de una columna no este vac�a. 
*/

-- 1. Script que permita verificar si un determinado pa�s
-- fue registrado o no en su tabla origen.

declare @pais varchar(40)
set @pais = 'Inglaterra'
if exists (select idpais from pais where nombre = @pais)
	Print 'Pa�s ya se encuentra registrado'
else
	Print 'Pa�s no se encuentra registrado'
go


-- 2. Script que permita mostrar los pasajeros
-- cuyo nombre inicie con la letra A

select * from pasajero
where nombre like 'A%' -- Con el % se indica que puede haber otro cualquier caracter.
go


-- 3. Mostrar los pasajeros que tienen
-- una cuenta de correo GMAIL.

-- Con el % al principo y al final se indica que antes de la palabra gmail puede existir cualquier otro caracter
-- y despues de la palabra gmail tambien puede exitir cualquier otro caracter.
select * from pasajero
where email like '%gmail%' 
go


-- 4. Mostrar los pasajeros cuyo
-- segundo car�cter de su nombre sea la letra A, O � U.

select * from pasajero
where nombre like '_[AOU]%' -- Se utiliza _ para indicar que el primer caracter puede ser cualquiera.
go


-- 5. Mostrar los pasajeros cuyo
-- segundo car�cter de su nombre NO sea la letra A, O � U.

select * from pasajero
where nombre not like '_[AOU]%'
go

select * from pasajero
where nombre like '_[^AOU]%'
go


-- 6. Mostrar los pagos realizados por un determinado pasajero,
-- filtrar a dicho pasajero por su n�mero de documento.
-- usar subconsultas Operadores T-SQL.

declare @documento varchar(50)
set @documento = '47715777'

select * from pago
where idpasajero = (
	select idpasajero from pasajero
	where num_documento = @documento
)
go