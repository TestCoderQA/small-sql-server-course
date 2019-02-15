/*
	Los tipos de datos en sql_Server son:

						TIPO CARACTER
	Char: los datos deben de tener una longitud fija hasta 8kb.
	Ejemplo Si queremos almacenar categorías por ejemplo A,B,C...
	Utilizaremos Char(1) CARACTERES FIJOS

	Varchar: Puede variar en el número de carácteres, es decir
	el valor asignado no es fijo, aquí SQL administra los espacios
	en blanco y los optimiza.
	CARACTERES VARIABLES
	Ejemplo en un Varchar(15) ocupará menos el dato 'Ana' que 'Jean Sebastian'.

						TIPO NÚMERICO
	Int: Números enteros desde
	-2^31(-2 147 483 648) a 2^31 -1(2 147 483 647).

						TIPO FECHA
	Date: Tipo de dato que muestra la fecha en el siguiente
	formato 07-07-2014

						TIPO DECIMAL
	Decimal: Tipo de datos que se utiliza para almacenar números decimales
	que pueden tener hasta 38 dígitos.

						TIPO MONETARIO
	Money: Cantidad monetaria positiva o negativa.

	PROPIEDADES

	Propiedad NULL: Hay dos fromas de experesar el término NULL,
	al implementarlo como NULL estamos indicando que el contenido de dicha
	columna no es obligatorio, si se necesita especificar que el campo es
	obligatorio se implementará con NOT NULL,
		NO ES OBLIGATORIO = NULL
		SI ES OBLIGATORIO = NOT NULL

	Propiedad Identity: Propiedad sólo aplicada a campos númericos, ya que 
	define un autoincremento automático de valores.
*/