##########################
##### Dia 10 Indexes #####
##########################

-- consultas guardadas en funciones, procedimientos y optimizadas.

/* 
Creacion de la base de datos del ejercicio
 */
CREATE DATABASE producto_fabricante;
USE producto_fabricante;

CREATE TABLE fabricante (
  id INT(10) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  INDEX (id)
);

CREATE TABLE producto (
  id INT(10) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT(10) NOT NULL,
  INDEX (id_fabricante)
);

/* Inserciones de datos: */

INSERT INTO fabricante (id, nombre) VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

INSERT INTO producto (id, nombre, precio, id_fabricante) VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapd 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

