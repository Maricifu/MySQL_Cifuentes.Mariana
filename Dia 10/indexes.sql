
-- Se usa la DB
USE producto_fabricante;

--- Consultas del ejercicio propuesto ---

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio * 1.20 AS dollars FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS product_nombre, precio AS euros, precio * 1.20 AS dollars FROM producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS first_two_letters FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) AS rounded_precio FROM producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE (precio, 0) AS truncated_precio FROM producto;

-- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT id_fabricante FROM producto;

-- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT id_fabricante FROM producto;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante LIMIT 4 OFFSET 3;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. ListaSELECT nombre FROM producto WHERE id_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto WHERE precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio >= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio < 400;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre FROM producto WHERE precio > 80 AND precio < 300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre FROM producto WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT nombre FROM producto WHERE precio > 200 AND id_fabricante = 6;

-- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT nombre FROM producto WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

-- 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT nombre FROM producto WHERE id_fabricante IN (1, 3, 5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 AS céntimos FROM producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;



--- CONSULTAS MULTITABLA DEL EJERCICIO ---

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY nombre_fabricante ASC;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.id, producto.nombre, producto.id_fabricante, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT MIN(precio) FROM producto);

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT MAX(precio) FROM producto);

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productosSELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT fabricante.id, fabricante.nombre
FROM fabricante
JOIN producto ON fabricante.id = producto.id_fabricante;
