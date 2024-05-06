CREATE database ER_colegio;
USE ER_colegio;

CREATE TABLE departamento(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE profesor(
  id_profesor INT PRIMARY KEY,
  id_departamento INT NOT NULL,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE persona(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(25) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) NOT NULL,
  ciudad VARCHAR(25) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(9) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  sexo ENUM('H', 'M') NOT NULL,
  tipo ENUM('1','2') NOT NULL
);

CREATE TABLE grado(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignatura(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  creditos FLOAT NOT NULL,
  tipo ENUM('V','P') NOT NULL,
  curso TINYINT(3) NOT NULL,
  cuatrimestre TINYINT(3) NOT NULL,
  id_profesor INT NOT NULL,
  id_grado INT NOT NULL,
  FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
  FOREIGN KEY (id_grado) REFERENCES grado(id)
);

CREATE TABLE alumno_se_matricula_asignatura(
  id_alumno INT NOT NULL,
  id_asignatura INT NOT NULL,
  id_curso_escolar INT NOT NULL,
  PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
  FOREIGN KEY (id_alumno) REFERENCES persona(id),
  FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
  FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);

CREATE TABLE curso_escolar(
  id INT PRIMARY KEY AUTO_INCREMENT,
  anyo_inicio YEAR(4) NOT NULL,
  anyo_fin YEAR(4) NOT NULL,
  id_grado INT NOT NULL,
  FOREIGN KEY (id_grado) REFERENCES grado(id)
);