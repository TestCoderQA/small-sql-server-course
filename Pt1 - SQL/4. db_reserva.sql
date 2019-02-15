/*
	Implementando Base de datos dbreserva
	Verificar que la base de datos no este creada.
*/

IF DB_ID('DBRESERVA') IS NOT NULL
BEGIN
	USE MASTER
	DROP DATABASE DBRESERVA
END

-- CREAR LA BASE DE DATOS EN BLANCO
CREATE DATABASE dbreserva

/*
	Nota importante:
	Al momento de crear la base de datos, crean dos archivos.
	 1. Datos Primarios Archivo (.MDF)
	 2. Datos Log Transacciones (.ldf)

	 Guardar estos archivos manualmente, para tener mas control
	 sobre la base de datos.

	 Abrir una carpeta en el disco local C, despues ejecutar
	 los siguientes comandos.
*/

ON PRIMARY (
	NAME='DBRESERVA_MDF',
	FILENAME='C:\dbreserva\DBRESERVA.MDF',
	SIZE=15MB,
	MAXSIZE=250MB,
	FILEGROWTH=10MB
),(
	NAME='DBRESERVA_NDF',
	FILENAME='C:\dbreserva\DBRESERVA.NDF',
	SIZE=15MB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=10MB
)

LOG ON (
	NAME='DBRESERVA_LDF',
	FILENAME='C:\dbreserva\DBRESERVA.LDF',
	SIZE=15MB,
	MAXSIZE=500MB,
	FILEGROWTH=10%
)
GO

-- Activar la base de Datos
USE dbreserva

/* Implementar las tablas de la base de datos.*/

-- Tabla pais
CREATE TABLE pais(
	idpais	CHAR(4)		NOT NULL PRIMARY KEY,
	nombre	VARCHAR(30) NOT NULL UNIQUE
)


-- Tabla pasajero
CREATE TABLE pasajero (
	idpasajero			CHAR(8)		NOT NULL PRIMARY KEY,
	nombre				VARCHAR(20) NOT NULL,
	apaterno			VARCHAR(20) NOT NULL,
	amaterno			VARCHAR(20) NOT NULL,
	tipo_documento		VARCHAR(30) NOT NULL,
	num_documento		VARCHAR(12) NOT NULL,
	fecha_nacimiento	DATE 		NOT NULL,
	idpais				CHAR(4) 	NOT NULL,
	telefono			VARCHAR(15)	NOT NULL,
	email				VARCHAR(50) NOT NULL UNIQUE,
	clave 				VARCHAR(20) NOT NULL	
)
GO


-- Tabla aeropuerto
CREATE TABLE aeropuerto(
	idaeropuerto	CHAR(5) 	NOT NULL,
	nombre 			VARCHAR(50) NOT NULL,
	idpais			CHAR(4)		NOT NULL
)
GO
-- Modificando la tabla Aeropuerto,Agregar Primary Key
ALTER TABLE aeropuerto
ADD CONSTRAINT PK_AEROPUERTO_PAIS
PRIMARY KEY NONCLUSTERED (idaeropuerto)
GO
-- Modificando la tabla Aeropuerto, Agregar Unique
ALTER TABLE aeropuerto
ADD CONSTRAINT UQ_AEROPUERTO_NOMBRE
UNIQUE (nombre)
GO


-- Tabla aerolinea
CREATE TABLE aerolinea(
	idaerolinea	INT 		NOT NULL PRIMARY KEY,
	ruc			CHAR(11)	NOT NULL,
	nombre 		VARCHAR(40)	NOT NULL	
)
GO


-- Tabla avion
CREATE TABLE avion (
	idavion		CHAR(5) 	NOT NULL PRIMARY KEY,
	idaerolinea INT 		NOT NULL,
	fabricante	VARCHAR(40)	NULL,
	tipo 		VARCHAR(3)	NOT NULL
)
GO
-- Modificando la tabla Avión
-- Agregando el campo capacidad
ALTER TABLE avion 
ADD capacidad INT NOT NULL
GO
/* Eliminar una columna de la tabla
ALTER TABLE avion
DROP COLUMN capacidad
GO*/
--Modificando el campo tipo
ALTER TABLE avion
ALTER COLUMN tipo VARCHAR(30) NOT NULL
GO


-- Tabla asiento
CREATE TABLE asiento(
	idasiento 	INT 	NOT NULL PRIMARY KEY,
	letra		CHAR(2)	NOT NULL,
	fila 		INT 	NOT NULL
)
GO


-- Tabla tarifa
CREATE TABLE tarifa (
	idtarifa	INT 		NOT NULL PRIMARY KEY,
	clase		VARCHAR(20)	NOT NULL UNIQUE,
	precio		MONEY		NOT NULL,
	impuesto	MONEY		NOT NULL
)
GO


-- Tabla reserva
CREATE TABLE reserva (
	idreserva 	 	INT 			NOT NULL PRIMARY KEY,
	costo 		 	MONEY			NOT NULL,
	fecha 		 	DATE 			NULL,
	obeservacion	VARCHAR(200) 	NULL
)
GO
/* Restricciones UNIQUE, CHECK & DEFAULT.
	leer primero el archivo restricciones.sql */
-- Resticción Default
ALTER TABLE reserva
ADD CONSTRAINT DFL_RESERVA_FECHA
DEFAULT GETDATE() FOR fecha
GO


-- Tabla vuelo
CREATE TABLE vuelo (
	idasiento 		INT 	NOT NULL,
	idaeropuerto 	CHAR(5)	NOT NULL,
	idreserva		INT 	NOT NULL,
	idavion 		CHAR(5) NOT NULL,
	idtarifa 		INT 	NOT NULL
)
GO
-- Implementar las llaves primarias de la tabla vuelo
ALTER TABLE vuelo
ADD PRIMARY KEY (idasiento, idaeropuerto, idreserva, idavion)
GO


-- Tabla pago
CREATE TABLE pago (
	idpago				INT 			NOT NULL PRIMARY KEY IDENTITY,
	idreserva			INT 			NOT NULL,
	fecha 				DATE 			DEFAULT GETDATE(),
	idpasajero			CHAR(8)			NOT NULL,
	monto 				MONEY			NOT NULL,
	tipo_comprobante 	VARCHAR(20)		NOT NULL,
	num_comprobante		VARCHAR(15)		NOT NULL,
	impuesto 			DECIMAL(5,2) 	NOT NULL
)
GO
/* Agregar una restriccion check, controloar que no se ingresen 
 	fechas mayores a la fecha */
ALTER TABLE pago
ADD CONSTRAINT CHK_PAGO_FECHA
CHECK (fecha<=GETDATE())
GO

-- *********************************************************************************** --

/*
	Implementar las relaciones entre las tablas de la base de datos.
*/

-- Relación entre las tablas (pasajero & pais)
ALTER TABLE pasajero 
ADD CONSTRAINT FK_PASAJERO_PAIS
FOREIGN KEY (idpais) REFERENCES pais(idpais)
GO

-- Relación entre las tablas (aeropuerto & pais)
ALTER TABLE aeropuerto
ADD CONSTRAINT FK_AEROPUERTO_PAIS
FOREIGN KEY (idpais) REFERENCES pais(idpais)
GO

-- Relación entre las tablas (pago & pasajero)
ALTER TABLE pago
ADD CONSTRAINT FK_PAGO_PASAJERO
FOREIGN KEY (idpasajero) REFERENCES pasajero (idpasajero)
GO

-- Relación entre las tablas (pago & reserva)
ALTER TABLE pago
ADD CONSTRAINT FK_PAGO_RESERVA
FOREIGN KEY (idreserva) REFERENCES reserva(idreserva)
GO

-- Relación entre las tablas (avion & aerolinea)
ALTER TABLE avion
ADD CONSTRAINT FK_AVION_AEROLINEA
FOREIGN KEY (idaerolinea) REFERENCES aerolinea (idaerolinea)
GO
-- Eliminar la relación entre las tablas (avion & aerolinea)
/*
	ALTER TABLE avion
	DROP CONSTRAINT FK_AVION_AEROLINEA
*/

-- Relacion entre las tablas (vuelo & asiento)
ALTER TABLE vuelo
ADD CONSTRAINT FK_VUELO_ASIENTO
FOREIGN KEY (idasiento) REFERENCES asiento (idasiento)
GO

-- Relación entre las tablas (vuelo & avion)
ALTER TABLE vuelo
ADD CONSTRAINT FK_VUELO_AVION
FOREIGN KEY (idavion) REFERENCES avion (idavion)
GO

-- Relación entre las tablas (vuelo & reserva)
ALTER TABLE vuelo
ADD CONSTRAINT FK_VUELO_RESERVA
FOREIGN KEY (idreserva) REFERENCES reserva (idreserva)
GO

-- Relación entre las tablas (vuelo & tarifa)
ALTER TABLE vuelo
ADD CONSTRAINT FK_VUELO_TARIFA
FOREIGN KEY (idtarifa) REFERENCES tarifa (idtarifa)
GO

-- Relación entre las tablas (vuelo & aeropuerto)
ALTER TABLE vuelo
ADD CONSTRAINT FK_VUELO_AEROPUERTO
FOREIGN KEY (idaeropuerto) REFERENCES aeropuerto (idaeropuerto)
GO