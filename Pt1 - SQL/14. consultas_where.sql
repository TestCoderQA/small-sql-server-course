-- 1. Script que permita mostrar los PASAJEROS
-- cuyo tipo de documento sea "DNI".

select * from pasajero
where tipo_documento = 'DNI'
go


-- 2. Mostrar los pagos que se han realizado la fecha "27-01-2013"

select * from pago
where fecha = '2013-01-27'
go


-- 3. Mostrar los pagos realizados en el mes de mayo del año 2014.

select * from pago
where YEAR(fecha) = '2014'and MONTH(fecha)='05'
go


-- 4. Mostrar los Pasajeros que no tienen asignado un teléfono.

select * from pasajero
where telefono is null
go


-- 5. Implementar un Script que permita mostrar los pasajeros
-- con su correspondiente país de residencia

select * from pasajero
select * from pais

select pas.*, pai.*
from pasajero pas, pais pai
where pas.idpais = pai.idpais
go

select pas.nombre as Nombre, pas.Apaterno as ApellidoP, pas.amaterno as ApellidoM,
pai.nombre as Pais
from pasajero pas, pais pai
where pas.idpais = pai.idpais
go