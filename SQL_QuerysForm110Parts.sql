/**
PARTE A DEL FORMULARIO 110
**/

SELECT concat_ws (' ', c.nombre,c.apellido_paterno,c.apellido_materno, c.apellido_casada)as "NOMBRES Y APELLIDOS",
c.domicilio as "DOMICILIO",
td.denominacion_documento as "TIPO DE DOCUMENTO DE IDENTIDAD",
c.numero_documento as "NUMERO DE DOCUMENTO",
le.denominacion_lugar_expedicion as "LUGAR DE EXPEDICION"
FROM formulario f 
INNER JOIN contribuyente c ON f.id_contribuyente = c.id_contribuyente
INNER JOIN tipo_documento td ON c.id_tipo_documento = td.id_tipo_documento
INNER JOIN lugar_expedicion le ON c.id_lugar_expedicion = le.id_lugar_expedicion
WHERE id_formulario = 1
/
/**
PARTE B DEL FORMULARIO 110
**/

SELECT e.nit_empleador as "NIT DEL EMPLEADOR",
e.razon_social as "NOMBRES Y APELLIDOS O RAZON SOCIAL",
e.domicilio_empleador as "DOMICILIO DEL EMPLEADOR"
FROM formulario f 
INNER JOIN empleador e ON f.id_empleador = e.id_empleador
WHERE id_formulario = 1

/
/**
PARTE C DEL FORMULARIO 110
**/

SELECT (ROW_NUMBER() OVER (ORDER BY fd.id_formulario_detalle)) as "NRO.",
fd.nit_factura as "NIT",
fd.numero_factura as "NUMERO DE FACTURA",
fd.numero_autorizacion as "NUMERO DE AUTORIZACION",
fd.fecha_factura as "FECHA DIA/MES/AÑO",
fd.importe_factura as "IMPORTE DE LA COMPRA",
fd.codigo_control as "CODIGO DE CONTROL",
fd.factura_electronica as "FACTURA ELECTRONICA"
FROM formulario f 
INNER JOIN formulario_detalle fd ON f.id_formulario = fd.id_formulario
WHERE f.id_formulario = 1
/
/**
PARTE D DEL FORMULARIO 110
**/

SELECT 
'026' as "CODIGO TOTAL",
SUM(fd.importe_factura) as "TOTAL DETALLE DE FACTURAS",
'693'as "CODIGO PAGO",
ROUND((SUM(fd.importe_factura) * 0.13),0) as "DETERMINACION DEL PAGO A CUENTA"
FROM formulario f 
INNER JOIN formulario_detalle fd ON f.id_formulario = fd.id_formulario
WHERE f.id_formulario = 1