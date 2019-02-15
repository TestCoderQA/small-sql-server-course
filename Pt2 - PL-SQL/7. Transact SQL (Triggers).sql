/*
		-- [Triggers] --

Un trigger (disparador) en una base de datos
es un procedimiento que se ejecuta cuando se cumple
una determinada condición al realizar una operación.

Dependiendo la base de Datos, los triggers pueden
ser insercción (INSERT), actualización (UPDATE) o 
borrado (DELETE).

Tipos de Triggers:

* Triggers DML
* Triggers

	-- [Sintáxis Trigger] --

Create Trigger Nombre_Trigger
ON [Table | View]
	FOR | AFTER | INSTEAD OF
	[INSERT][,][UPDATE][,][DELETE]
AS
	Sentencia SQL

*/

-- 1. Implementar un Trigger que permita
-- mostrar un mensaje cada vez que se inserte
-- o actualice un registro en la tabla pasajero.

/*

	create trigger trmensaje_pasajero
	on pasajero
	for insert
	as
		PRINT 'Pasajero Registrado'
	go

	insert into pasajero values (
		'P0000009',
		'Jean Sebastian',
		'Rodriguez',
		'Agredo',
		'CC',
		'1033766679',
		'1994-07-23',
		'0013',
		'3208555688',
		'jean.desarrollo@gmail.com',
		'339978'
	)

	-- Para utiliar update

	alter trigger trmensaje_pasajero
	on pasajero
	for insert,update
	as
		PRINT 'Pasajero Actualizado correctamente'
	go

	update pasajero set nombre = 'Jean The Best'
	where num_documento = '1033766679'

*/


-- 2. Implementar un trigger que permita crear
-- una replica de los registros insertados
-- en la tabla avion para dicho proceso implementar
-- una nueva tabla llamada avionBAK con las mismas columnas
-- de la tabla avion.

create table avionBAK
(
	idavion char(5) not null primary key,
	idaerolinea INT not null,
	fabricante varchar(40) not null,
	tipo varchar (30) not null,
	capacidad INT not null
)

if object_id('replicaAvion') is not null
begin
	drop trigger replicaAvion
end
go

create trigger replicaAvion
on avion
after insert
as
begin
	insert avionBAK select * from inserted
end

insert into avion VALUES('00001','1','CHAirport','Comercial','250')
go

select * from avion
select * from avionBAK




-- 3. Implementar un trigger que permita 
-- controlar el registro de un pago, se
-- deberá evaluar que el monto a registrar
-- sea mayor que cero en la columna 
-- monto de la tabla pago.


if object_id('controlPago') is not null
begin
	drop trigger controlPago
end
go

create trigger controlPago
on pago
for insert
as
	if (select monto from inserted)<=0
	begin
		ROLLBACK TRANSACTION
		PRINT 'No se puede registrar monto cero'
	end
	else
		PRINT 'Pago registrado correctamente'
go

insert into pago (idreserva,fecha,idpasajero,monto,tipo_comprobante,num_comprobante,impuesto) 
VALUES (1,'2015-09-10','P0000007',100,'Factura','001-0004',0.18)