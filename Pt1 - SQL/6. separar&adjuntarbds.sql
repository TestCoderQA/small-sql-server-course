/*
	Cuando creamos una base de datos el servidor la
	protege de gestiones desde el exterior, eso quiere
	decir que desde el explorar de windows no se podrá
	eliminar ni cambiar de nombre a la BD.

	Para poder cambiar de ubicación física o modificar el
	nombre de la Base de Datos, el Motor propone algunas
	políticas de gestión proporcionando funciones, sentencias
	e intrucciones para dicho control.

		Separar base de Datos (DETACH)

	Procedimiento Almacenado SP_DETACH_DB
	(Permite separar una base de Datos del Servidor Actual):
		
		Separar la base de datos desde el asistente de microsoft

			-Click derecho sobre la base de datos
			-Escoger la opcion tareas
			-Escoger la opcion separar o DETACH
			-Cick en OK

		Adjuntar la base de datos (ATTACH)

		Primero utilizaremos el asistente de microsoft
		SQL Server Managament Studio.

			-Click derecho sobre Bases de datos
			-Adjuntar
			-Agregar el archivo de configuracion .MDF En donde se halla credado
			-Este a su vez traera los otros dos archivos. En total 3 archivos 
			para sus restauracion completa.

*/

-- Separar Base de Datos, tener activada la base de datos master.
SP_DETACH_DB @DBNAME = 'dbreserva'
GO