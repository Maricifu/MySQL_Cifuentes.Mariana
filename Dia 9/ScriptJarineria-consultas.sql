#############################
##### Dia 9 Jaridinería #####
#############################

/* Se agregan las consultas a la DB Jardinerias*/

USE Jardinerias;

-- Consulta para agrupar los clientes de todos los empleados cuyo puesto sea responsable de ventas:
SELECT c.nombre_cliente, c.telefono, c.ciudad, e.nombre AS nombre_responsable, 
    e.apellido AS apellido_responsable, e.email
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE e.cargo = 'Representante ventas';


-- Consulta para obtener los registros de los pedidos entre el 15 de marzo del 2009 y el 15 de julio del 2009, 
-- para todos los clientes que sean de la ciudad de Sotogrande: 


SELECT codigo_pedido, fecha_pedido, fecha_entrega, estado, comentarios, codigo_cliente
FROM pedido
WHERE fecha_pedido BETWEEN '2009-03-15' AND '2009-07-15'
AND codigo_cliente IN (SELECT codigo_cliente FROM cliente WHERE ciudad = 'Sotogrande');



-- Consulta para obtener los productos cuya gama pertenezca a las frutas y que el proveedor sea Frutas Talaveras S.A, 
-- mostrando el código, nombre, descripción, cantidad en stock, precio con un 10% de descuento, y la cantidad en 
-- los distintos pedidos que se han hecho:


SELECT p.codigo_producto, p.nombre, p.descripcion, p.cantidad_en_stock, 
    ROUND(p.precio_venta * 0.9, 2) AS precio_con_descuento,
    SUM(d.cantidad) AS cantidad_en_pedidos
FROM producto p
JOIN detalle_pedido d ON p.codigo_producto = d.codigo_producto
JOIN pedido pe ON d.codigo_pedido = pe.codigo_pedido
JOIN cliente c ON pe.codigo_cliente = c.codigo_cliente
WHERE p.gama = 'Frutales' AND p.proveedor = 'Frutales Talavera S.A'
GROUP BY p.codigo_producto, p.nombre, p.descripcion, p.cantidad_en_stock, p.precio_venta;

