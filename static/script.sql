CREATE TABLE Recinto
  (
    id_recinto INT NOT NULL AUTO_INCREMENT,
	nombre_recinto VARCHAR(128) NOT NULL,
	ubicacion_recinto VARCHAR(64) NOT NULL,
	PRIMARY KEY (id_recinto)
  );

CREATE TABLE Facultad
  (
    id_facultad INT NOT NULL AUTO_INCREMENT,
	nombre_facultad VARCHAR(128) NOT NULL,
	PRIMARY KEY (id_facultad)
  );

CREATE TABLE Escuela
  (
    id_escuela INT NOT NULL AUTO_INCREMENT,
	nombre_escuela VARCHAR(128) NOT NULL,
	id_facultad INT,
	PRIMARY KEY (id_escuela),
	FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
  );

CREATE TABLE Carrera
  (
    id_carrera INT NOT NULL AUTO_INCREMENT,
	nombre_carrera VARCHAR(128) NOT NULL,
	id_escuela INT,
	PRIMARY KEY (id_carrera),
	FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela)
  );

CREATE TABLE Tipo_Trabajo
  (
    id_tipo_trabajo INT NOT NULL AUTO_INCREMENT,
	descripcion_tipo VARCHAR(128) NOT NULL,
	PRIMARY KEY (id_tipo_trabajo)
  );

CREATE TABLE Nivel_Trabajo
  (
    id_nivel_trabajo INT NOT NULL AUTO_INCREMENT,
	descripcion_nivel VARCHAR(128) NOT NULL,
	PRIMARY KEY (id_nivel_trabajo)
  );


CREATE TABLE Cuenta_Usuario
  (
    id_usuario INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(64) NOT NULL,
	apellidos VARCHAR(64) NOT NULL,
	username VARCHAR(64) NOT NULL,
	password VARCHAR(64) NOT NULL,
	fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_recinto INT,
	PRIMARY KEY (id_usuario),
	FOREIGN KEY (id_recinto) REFERENCES Recinto(id_recinto)
  );

CREATE TABLE Trabajo_Academico
  (
    id_trabajo INT NOT NULL AUTO_INCREMENT,
    titulo_trabajo VARCHAR(512) NOT NULL,
    extracto TEXT COLLATE utf8_unicode_ci,
	fecha_publicacion date NOT NULL,
	id_nivel_trabajo INT,
	id_tipo_trabajo INT,
	id_recinto INT,
	id_facultad INT,
	id_escuela INT,
	id_carrera INT,
	archivo_adjunto varchar(64) DEFAULT NULL,
	registrado_por INT,
	fecha_registro_sistema DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id_trabajo),
	FOREIGN KEY (id_tipo_trabajo) REFERENCES Tipo_Trabajo(id_tipo_trabajo),
	FOREIGN KEY (id_nivel_trabajo) REFERENCES Nivel_Trabajo(id_nivel_trabajo),
	FOREIGN KEY (id_recinto) REFERENCES Recinto(id_recinto),
	FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad),
	FOREIGN KEY (id_escuela) REFERENCES Escuela(id_escuela),
	FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera),
	FOREIGN KEY (registrado_por) REFERENCES Cuenta_Usuario(id_usuario)
  );

  CREATE TABLE Asesor
  (
    id_asesor INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(64) NOT NULL,
	apellidos VARCHAR(64) NOT NULL,
	id_trabajo INT,
	PRIMARY KEY (id_asesor),
	FOREIGN KEY (id_trabajo) REFERENCES Trabajo_Academico(id_trabajo)
  );


  CREATE TABLE Estudiante
  (
    id_estudiante INT NOT NULL AUTO_INCREMENT,
	matricula VARCHAR(64) NOT NULL,
	nombres VARCHAR(64) NOT NULL,
	apellidos VARCHAR(64) NOT NULL,
	id_trabajo INT,
	PRIMARY KEY (id_estudiante),
	FOREIGN KEY (id_trabajo) REFERENCES Trabajo_Academico(id_trabajo)
  );
