/*
	-- [Procedimientos Alamacenados] --

Son un conjunto de instrucciones de
Transact-SQL que pueden aceptar y
devolver parámetros proporcionados
por el usuario.

	-- [Tipos de Procedimientos Almacenados] --

*Procedimientos Almacenados del Sistema.
	
	Generalmente están guardados en la base de datos
	MASTER, son identificados por iniciar es SP, permiten
	realizar una amplia variedad de tareas.

	Sp_columns				Sp_pkey
	Sp_column_privileges	Sp_tables
	Sp_databases			Sp_server_info
	Sp_fkeys				Sp_statistics

*Procedimientos Almacenados definidos por el usuario
*/

-- Procedimiento del sistema que muestra
-- las columnas de la tabla país
--Sp_columns pais

-- Procedimiento del sistema para mostrar los
-- privilegios de las columnas involucradas de la tabla pasajero
--Sp_column_privileges pasajero

-- Procedimiento alamacenado del sistema que muestra
-- las base de datos del servidor activo.
--Sp_databases

-- Procedimiento almacenado que muestra las características
-- de nuestro servidor activo
--Sp_server_info

-- Procedimiento almacenado qeue muestra donde se hacer referencia
-- a la tabla pasajero
Sp_fkeys pasajero


