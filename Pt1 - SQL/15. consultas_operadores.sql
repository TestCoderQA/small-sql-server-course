/*
	Lenguaje de manipulacion de Datos (DML)

	Operadores en SQL Server 2012
	Un operador es un símbolo que específica una acción
	que es realizada por una o más expresiones.

	Categorias de Operadores:

	A) Aritméticos
	B) Asignación
	C) lógicos

	-- Operadores Aritméticos

	+ Sumar: Operador de Suma Númerica y concatenación de Columnas.
	- Restar: Operador de resta Númerica y tambien representa a números negativos.
	* Multiplicar: Operador de Multiplicación
	/ Dividir: Operador de División entera y fraccionaria
	% Módulo: Operador que devuelve el resto de una división

*/

-- 1. Script que permit mostrar el resultado de la expresion:
-- 2*(10+5) - (8/3), utilizar la sentencia SELECT
-- para mostrar el resultado.

SELECT '2*(10+5) - (8/3)' as [Operación],
2*(10+5) - (8/3) as [Resultado]
go

-- 2. Script uqe permita mostrar el resutlado de la expresion:
-- Celsius = (Fharenheit-32)*5/9, usar la sentencia Select.

select '100' as Fahrenheit,
(100-32) * 5/9 as Celsius
go

-- 3. Calcular el área de un Círculo,
-- almacenando el valor del radio y de PI en sus variables respectivas.

declare @pi float
declare @radio float
declare @area float
-- Asignarles valores
set @pi = 3.1415
set @radio = 7
-- Encontrar el área del círculo
set @area = @pi * power(@radio, 2)

select @area as [Área]
go

-- 4. Script que permita capturar en una variable
-- el correo electrónico del pasajero con código "P0000005"
-- usar variables Transact-SQL y sentencia Select para mostrar el email.

use DBRESERVA
declare @correo varchar(70)

select @correo=email from pasajero
where idpasajero = 'P0000005'

select 'P0000005' as [Código],
@correo as Email
go