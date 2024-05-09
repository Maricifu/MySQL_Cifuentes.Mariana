##########################################
##### Dia 5, Aplicación de consultas #####
##########################################


-- Se llama la DB 
USE diagramaJardineria;


/*Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.*/
SELECT codigo_oficina, ciudad FROM oficina;


/*Devuelve un listado con la ciudad y el teléfono de las oficinas de España.*/
SELECT ciudad, telefono FROM oficina WHERE pais = 'España';


-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre, apellido1, apellido2, email 
FROM empleado 
WHERE codigo_jefe = 7;


-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT e.puesto, e.nombre, e.apellido1, e.apellido2, e.email
FROM empleado e
WHERE e.codigo_empleado = (
    SELECT codigo_jefe FROM empleado WHERE codigo_jefe IS NULL
);


-- Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente FROM cliente WHERE pais = 'España';


-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado FROM pedido;


-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
SELECT DISTINCT codigo_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;


-- Utilizando la función DATE_FORMAT de MySQL.
SELECT DISTINCT codigo_cliente
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';


-- sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT codigo_cliente
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';


-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega > fecha_esperada;


/* Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
Utilizando la función ADDDATE de MySQL.
Utilizando la función DATEDIFF de MySQL.
¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?*/
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega  from pedido WHERE fecha_entrega < fecha_esperada - INTERVAL 2 DAY;


-- Devuelve un listado de todos los pedidos que fueron en 2009.
select * from pedido where  year(fecha_pedido) = '2009';


-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.
select * from pedido where MONTH(fecha_pedido) = 1;


-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT * FROM pago WHERE forma_pago = 'Paypal' and year(fecha_pago) = '2008' ORDER BY forma_pago;


-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago, asegurándote de que no aparezcan formas de pago repetidas:
SELECT DISTINCT forma_pago FROM pago;


-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock, ordenados por precio de venta de mayor a menor:
SELECT producto.nombre, producto.precio_venta
FROM producto
INNER JOIN gama_producto ON producto.gama = gama_producto.gama
WHERE gama_producto.gama = 'Ornamentales' AND producto.cantidad_en_stock > 100
ORDER BY producto.precio_venta DESC;


-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad
FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.ciudad = 'Madrid' AND (empleado.codigo_empleado = 11 OR empleado.codigo_empleado = 30);


-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1
FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;


-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1
FROM cliente
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;


-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad
FROM cliente
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;


-- Devuelve el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas y la ciudad de la oficina a la que pertenece el representante. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad, oficina.linea_direccion1
FROM cliente
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE oficina.ciudad = 'Fuenlabrada';


-- Devuelve un listado con el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante:
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad
FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;


-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes:
SELECT empleado.nombre AS nombre_empleado, jefe.nombre AS nombre_jefe
FROM empleado
LEFT JOIN empleado AS jefe ON empleado.codigo_jefe = jefe.codigo_empleado;


-- Devuelve un listado que muestre el nombre de cada empleado, el nombre de su jefe y el nombre del jefe de su jefe:
SELECT empleado.nombre AS nombre_empleado, jefe.nombre AS nombre_jefe, jefe_de_jefe.nombre AS nombre_jefe_de_jefe
FROM empleado
LEFT JOIN empleado AS jefe ON empleado.codigo_jefe = jefe.codigo_empleado
LEFT JOIN empleado AS jefe_de_jefe ON jefe.codigo_jefe = jefe_de_jefe.codigo_empleado;


-- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido:
SELECT cliente.nombre_cliente
FROM cliente
INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE pedido.fecha_entrega > pedido.fecha_esperada;


-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente:
SELECT cliente.nombre_cliente, GROUP_CONCAT(DISTINCT producto.gama SEPARATOR ', ') AS gamas_compradas
FROM cliente
INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
INNER JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
GROUP BY cliente.nombre_cliente;
