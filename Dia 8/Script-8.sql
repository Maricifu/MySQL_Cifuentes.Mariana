#######################################
###### Dia 8 Ejercicio en clase #######
#######################################


-- Creación de la base de datos
CREATE DATABASE empresaD;
USE empresaD;

-- Creación de las tablas
CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DECIMAL(10, 2) NOT NULL,
  gastos DECIMAL(10, 2) NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id),
  INDEX idx_empleado_id_departamento (id_departamento)
);

-- Inserción de datos del ejercicio (tabla departamentos)
INSERT INTO departamento (nombre, presupuesto, gastos) VALUES
  ('Desarrollo', 120000.00, 6000.00),
  ('Sistemas', 150000.00, 21000.00),
  ('Recursos Humanos', 280000.00, 25000.00),
  ('Contabilidad', 110000.00, 3000.00),
  ('I+D', 375000.00, 380000.00),
  ('Proyectos', 0.00, 0.00),
  ('Publicidad', 0.00, 1000.00);

-- Inserción de datos del ejercicio (tabla empleados)
INSERT INTO empleado (nif, nombre, apellido1, apellido2, id_departamento) VALUES
  ('32481596F', 'Aarón', 'Rivero', 'Gómez', 1),
  ('Y5575632D', 'Adela', 'Salas', 'Díaz', 2),
  ('R6970642B', 'Adolfo', 'Rubio', 'Flores', 3),
  ('77705545E', 'Adrián', 'Suárez', NULL, 4),
  ('17087203C', 'Marcos', 'Loyola', 'Méndez', 5),
  ('38382980M', 'María', 'Santana', 'Moreno', 1),
  ('80576669X', 'Pilar', 'Ruiz', NULL, 2),
  ('71651431Z', 'Pepe', 'Ruiz', 'Santana', 3),
  ('56399183D', 'Juan', 'Gómez', 'López', 2),
  ('46384486H', 'Diego', 'Flores', 'Salas', 5),
  ('67389283A', 'Marta', 'Herrera', 'Gil', 1),
  ('41234836R', 'Irene', 'Salas', 'Flores', NULL),
  ('82635162B', 'Juan Antonio', 'Sáez', 'Guerrero', NULL);
  
 