#########################
#### EJERCICIO DIA 4 ####
#########################


-- creación de la base de datos
CREATE DATABASE PaisCiudadIdioma;
USE PaisCiudadIdioma;

-- creación de la tabla pais
CREATE TABLE pais (
id 			INT(10) 	PRIMARY KEY AUTO_INCREMENT UNIQUE,
nombre 		VARCHAR(20)	NOT NULL,
continente	VARCHAR(50)	NOT NULL,
poblacion 	INT			NOT NULL
);

-- creación de la tabla ciudad
CREATE TABLE ciudad (
id 			INT(10) 	PRIMARY KEY AUTO_INCREMENT UNIQUE,
nombre 		VARCHAR(20)	NOT NULL,
id_pais		INT			NOT NULL,
FOREIGN KEY (id_pais) REFERENCES pais(id)
);

-- creación de la tabla idioma 
CREATE TABLE idioma (
id 			INT(10)		PRIMARY KEY AUTO_INCREMENT UNIQUE,
idioma		VARCHAR(50)	NOT NULL
);

-- creación de la tabla idioma_pais
CREATE TABLE idioma_pais (
id_idioma	INT(10) 	NOT NULL,
id_pais 	INT(10)		NOT NULL,
es_oficial	TINYINT(1)	NOT NULL,
FOREIGN KEY (id_idioma) REFERENCES idioma(id),
FOREIGN KEY (id_pais) REFERENCES pais(id)
);

-- inserciones de datos a las tablas 

-- inseción en la tabla pais
INSERT INTO pais (id, nombre, continente, poblacion) VALUES
('101', 'Colombia', 'Latinoamerica', '51870000'),
('102', 'Argentina', 'latinoamerica', '46230000'),
('103', 'Chile', 'latinoamerica', '19600000'),
('104', 'Bolivia', 'latinoamerica', '12200000'),
('105', 'Perú', 'latinoamerica', '34005000'),
('201', 'México', 'centroamerica', '127500000'),
('202', 'Costa Rica', 'centroamerica', '5181000'),
('203', 'Guatemala', 'centroamerica', '17360000'),
('401', 'Estados Unidos', 'norteamerica', '333300000'),
('402', 'Canada', 'norteamerica', '38930000');

-- inserción en la tabla ciudad
INSERT INTO ciudad (nombre, id_pais) VALUES
('Bogotá', 101),
('Buenos Aires', 102),
('Santiago', 103),
('La Paz', 104),
('Lima', 105),
('Ciudad de México', 201),
('San José', 202),
('Guatemala City', 203),
('New York City', 401),
('Toronto', 402);

-- inserción en la tabla idioma 
INSERT INTO idioma (idioma) VALUES
('Español'),
('Inglés'),
('Francés'),
('Portugués'),
('Mandarín');

-- inserción en la tabla idioma_pais
INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES
('1', '101', '0'),
('1', '102', '0'),
('1', '103', '0'),
('2', '201', '0'),
('2', '401', '0'),
('2', '402', '0'),
('3', '202', '0'),
('4', '203', '0'),
('5', '104', '0'),
('1', '105', '0');


