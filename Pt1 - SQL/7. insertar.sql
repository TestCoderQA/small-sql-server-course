/*
	Lenguaje de manipulación de Datos (DML)

	SENTENCIA INSERT(Insentar Registros): Permite
	agregar una nueva fila a una tabla o vista.

	Estrucutura

	INSERT[INTO]
		[ESQUEMA] TABLA O VISTA [(Lista de columnas)]
		VALUES('Lista de valores')
*/

-- Insertar registros en la tabla reserva.
/* Metodo 1
INSERT INTO reserva (idreserva, costo, fecha, observacion)
VALUES ('x', 'x', 'x', 'x')
GO

INSERT INTO reserva (idreserva, costo, fecha, observacion)
VALUES ('x', 'x', 'x', 'x')
GO
*/
-- Metodo 2, más efectivo
INSERT INTO reserva (idreserva, costo, fecha, observacion)
VALUES	('1', '140', '2013-01-27', ''),
		('2', '100', '2013-01-01', ''),
		('3', '300', '2014-03-04', ''),
		('4', '800', '2013-04-05', ''),
		('5' ,'250', getdate(), ''),
		('6' ,'1150', getdate(), ''),
		('7', '700', getdate(), '')
GO


-- Insertar registros en la tabla pago.
/*Recordar que cuando se creo la tabla pago, el campo idpago
  Se genera automaticamente y no hay necesidad de agregarlo.*/
INSERT INTO pago (idreserva, fecha, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto)
VALUES	('1', '2013-01-27', 'P0000001', 40 ,'Ticket', '0010007', 0.18),
		('5', '2014-05-05', 'P0000002', 250 ,'Factura', '001-0002', 0.18)	
GO


INSERT INTO pago (idreserva, fecha, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto)
VALUES ('7', getdate(), 'P0000007', 700 ,'Factura', '001-0003', 0.18)
GO


-- Insertar tarifa, Este es otro metodo abreviado de insertar en sql server 2012
INSERT INTO tarifa
VALUES	('1','Supervip',1200,12), 
		('2','Vip',1000,12),
		('3','Nacional',800,12),
		('4','Económica',500,0)
GO


-- Insertar registros en la tabla aeropuerto, para este caso el orden no importa
INSERT INTO aeropuerto (idaeropuerto, idpais, nombre)
VALUES  ('AE01','0003','Bariloche'),
		('AE02','0003','Mar del Plata'),
		('AE03','0001','Jorge Chávez')
GO
