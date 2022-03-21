/CREANDO LA BASE DE DATOS/
create database apptareasmunicipiolojaprueba;

/Usando la base de datos/
use apptareasmunicipiolojaprueba;

/Creando las tablas respectivas/

/TABLA CUENTA/
CREATE TABLE cuenta (
    id int primary key not null auto_increment,
    nombre varchar(50) not null,
    clave varchar(50) not null,
    url_avatar varchar(200) not null,
    n_strikes int not null,
    estado boolean default true not null
);
SELECT * FROM cuenta;
Insert into cuenta (nombre, clave, url_avatar, n_strikes) values ('vladiceli','jvceliqasdq@','url.image.com/imagen1',0);
Insert into cuenta (nombre, clave, url_avatar, n_strikes) values ('jose14','jvcelidsadaas','url.image.com/imagen2',1);
Insert into cuenta (nombre, clave, url_avatar, n_strikes) values ('cristobalce','vcasdjdas@ssa','url.image.com/imagen3',0);
Insert into cuenta (nombre, clave, url_avatar, n_strikes) values ('estjuan','gvwqqjdas@ssa','url.image.com/imagen4',0);
Insert into cuenta (nombre, clave, url_avatar, n_strikes) values ('estanp','vcassaas@ssa','url.image.com/imagen5',0);

/TABLA ROL/
CREATE TABLE rol (
    id int primary key not null auto_increment,
    nombre enum('Administrador', 'Docente', 'Estudiante') unique
);

SELECT * FROM rol;	
Insert into rol (nombre) values ('Administrador');
Insert into rol (nombre) values ('Docente');
Insert into rol (nombre) values ('Estudiante');

/TABLA PERSONA/
CREATE TABLE persona (
    id int primary key not null auto_increment,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    telefono varchar(15) not null,
    correo varchar(30) not null unique,
    edad varchar(3) not null,
    rol int not null,
    constraint rol foreign key (rol) references rol(id),
    cuenta int not null,
    constraint cuenta foreign key(cuenta) references cuenta(id),
    unique(cuenta)
);
SELECT * FROM persona;
Insert into persona (nombres, apellidos, telefono, correo, edad, rol, cuenta) values ('Vladimir Abelardo','Celi Alvarez','5930981438453','vladimir.celi@unl.edu.ec','21',1,1);
Insert into persona (nombres, apellidos, telefono, correo, edad, rol, cuenta) values ('Jose Andres','Celi Alvarez','5930919173535','jose.celi@gmail.com','30',2,2);
Insert into persona (nombres, apellidos, telefono, correo, edad, rol, cuenta) values ('Cristobal Armando','Calva Andrade','5930925438453','cristocalv54@gmail.com','32',2,3);
Insert into persona (nombres, apellidos, telefono, correo, edad, rol, cuenta) values ('Juan Carlos','Perez Lopez','5930981400113','juanperez@gmail.com','18',3,4);
Insert into persona (nombres, apellidos, telefono, correo, edad, rol, cuenta) values ('Ana Maria','Casas Garza','5930911438400','anamcasas01@gmail.com','22',3,5);

/TABLA ESTUDIANTE Y DOCENTE/
CREATE TABLE docentes(
    id int primary key not null auto_increment,
    area varchar(50),
    asignatura varchar(50),
    persona int not null,
    constraint persona foreign key(persona) references persona(id),
    unique(persona)
);



SELECT * FROM docentes;
insert into docentes (area, asignatura, persona) values ('Area de matemáticas','Matemáticas',2);
insert into docentes (area, asignatura, persona) values ('Area de base de datos','Base de datos',3);

CREATE TABLE estudiantes(
    id int primary key not null auto_increment,
    institucion varchar(50),
    nivelDeEstudios varchar(50),
    personas int not null,
    constraint personas foreign key(personas) references persona(id),
    unique(personas)
);
SELECT * FROM estudiantes;
insert into estudiantes (institucion, nivelDeEstudios, personas) values ('Colegio Fiscomisional la Inmaculada','Secundarios',4);
insert into estudiantes (institucion, nivelDeEstudios, personas) values ('Universidad Nacional de Loja','Superiores',5);

/TABLA ESPECIALIDAD/
CREATE TABLE especialidades(
    id int primary key not null auto_increment,
    nombre varchar(200) not null,
    titulo varchar(200) not null,
    habilidades text not null, 
    docentes int not null,
    constraint docentes foreign key (docentes) references docentes(id)
);

SELECT * FROM especialidades;
insert into especialidades (nombre, titulo, habilidades, docentes) values ('Matemática y Física',' Licenciado/a en Pedagogía de las Matemáticas y la Física','Dominios en la generación aplicación del conocimiento y desarrollo del pensamiento crítico, contribuyendo a desarrollar la investigación científica elevando la calidad de la docencia en las ciencias Físico-Matemáticas.',2);
insert into especialidades (nombre, titulo, habilidades, docentes) values ('Base de datos','Especialista en Base de Datos','Amplios conocimientos de plataformas como UNIX / Linux, experiencia en arquitectura, configuración y administración de redes, modelado de datos, administración de servidores en entornos de gran escala y geográficamente diversos, creación de herramientas de automatización para administrar bases de datos relacionales (auditoría, administración de cuentas,implementación de esquemas).',1);


/TABLA COMENTARIO/
CREATE TABLE comentario(
    id int primary key not null auto_increment,
    calificacion int not null,
    comentario text not null, 
    docentes1 int not null,
    constraint docentes1 foreign key (docentes1) references docentes(id)
    );

SELECT * FROM comentario;
Insert into comentario (calificacion, comentario, docentes1) values (4,'Excelente, buen trabajo',1);
Insert into comentario (calificacion, comentario, docentes1) values (3,'Me gusto su planificacion de trabajo, pero le falta más especificacion en algunos puntos',2);

/TABLA TAREAS/
CREATE TABLE tareas(
id int primary key not null auto_increment,
titulo varchar(50) not null,
descripcion text not null,
asignatura varchar(50) not null,
fechaEnvio timestamp not null default current_timestamp,
fechalimite varchar(10) not null,
observaciones text,
archivo varchar(200) not null,
archivoDocente varchar(200),
estadoTarea boolean default true not null,
valorMaximo varchar(5) not null,
estudianteId int,
constraint estudianteId foreign key (estudianteId) REFERENCES estudiantes(id) ON UPDATE CASCADE ON DELETE CASCADE,
docenteId int,
constraint docenteId foreign key (docenteId) REFERENCES docentes(id)
);

drop table tareas;
select * from tareas where docenteId is NULL;
SELECT * FROM tareas WHERE estudianteId = NULL;
SELECT * FROM tareas;
insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId, docenteId) 
values ('Deber de derivadas', 'Se requiere realizar las funciones de las siguiente derivadas...','Matemáticas','2021-8-3','2021-8-8','Revisar de forma detallada el pdf','ulr.deber1.com/deber1',30,1,1);
insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId, docenteId) 
values ('Deber de base de datos', 'Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-2-2','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber2',60,2,2);

insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId) 
values ('Deber de base de datos', 'Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-2-2','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',60,2);
insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId) 
values ('Deber de base de datos', 'Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-2-2','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',60,2);

insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId) 
values ('matemática', 'Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-2-2','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',60,2);

insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId) 
values ('matemática', 'Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-2-2','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',60,2);

insert into tareas (titulo, descripcion, asignatura, fechaEnvio, fechalimite, observaciones, archivo, valorMaximo, estudianteId, docenteId) 
values ('Deber de derivadas', 'Se requiere realizar las funciones de las siguiente derivadas...','Matemáticas','2021-8-3','2021-8-8','Revisar de forma detallada el pdf','ulr.deber1.com/deber1',30,1,1);
SELECT * FROM tareas WHERE docenteId = 1;

/TABLA PRESUPUESTO/   
CREATE TABLE presupuesto(
    id int primary key not null auto_increment, 
    valor int not null,
    comision int not null,
    detalle text not null, 
    tareas int not null,
    constraint tareas foreign key (tareas) references tareas(id)
);

drop table presupuesto;
SELECT * FROM presupuesto;
insert into presupuesto (valor, comision, detalle, tareas) values (20,1,'detalle',1); 
insert into presupuesto (valor, comision, detalle, tareas) values (50,5,'detalle',2); 

/TABLA PAGO/
CREATE TABLE pago(
    id int primary key not null auto_increment,
    tipopago varchar(30) not null,
    mediopago varchar(30) not null,
    fechapago date not null, 
    tareas1 int not null,
    constraint tareas1 foreign key (tareas1) references tareas(id)
);
drop table pago;
SELECT * FROM pago;
insert into pago (tipopago, mediopago, fechapago, tareas1) values ('tarjeta de crédito','tranferencia virtual','2021-8-5',1);
insert into pago (tipopago, mediopago, fechapago, tareas1) values ('tarjeta de crédito','tranferencia virtual','2021-2-6',2);

/TABLA RECLAMO/
CREATE TABLE reclamo(
    id int primary key not null auto_increment,
    descripcion text not null,
    estudiante int,
    constraint estudiante foreign key (estudiante) REFERENCES estudiantes(id) ON UPDATE CASCADE ON DELETE CASCADE, 
    tareas2 int not null,
    constraint tareas2 foreign key (tareas2) references tareas(id),
    archivoReclamo varchar(200),
    fechalimiteR varchar(10)
);

SELECT * FROM tareas WHERE docenteId is null AND titulo LIKE 'Deber de base de datos';

drop table reclamo;
SELECT * FROM reclamo;
insert into reclamo (descripcion, estudiante, tareas2) values ('Necesito más especificacion en la tabla de alumnos, segun los requerimientos mencionados',2,2);

******
/TABLA PROPUESTA/
CREATE TABLE propuesta(
    id int primary key not null auto_increment,
    descripcion text not null,
    valor varchar(5) not null,
    docente int,
    constraint docente foreign key (docente) REFERENCES docentes(id) ON UPDATE CASCADE ON DELETE CASCADE,
    tareas3 int not null,
    constraint tareas3 foreign key (tareas3) references tareas(id)
);

SELECT * FROM propuesta;
SELECT * FROM especialidades WHERE docentes IN (SELECT id FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id=3)));
SELECT * FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id=3));
drop table propuesta;
SELECT * FROM propuesta where tareas3 IN (SELECT id From tareas Where id=3);
insert into propuesta (descripcion, valor, docente, tareas3) values ('La tarea se realizará en el lapso de un 1 día','25',1,1);
insert into propuesta (descripcion, valor, docente, tareas3) values ('La tarea se realizará en el lapso de un 2 semanas','60',2,2);
insert into propuesta (descripcion, valor, docente, tareas3) values ('La tarea se realizará en el lapso de un 2 semanas','60',2,3);
insert into propuesta (descripcion, valor, docente, tareas3) values ('La tarea se realizará en el lapso de un 2 semanas','60',1,3);
insert into propuesta (descripcion, valor, docente, tareas3) values ('La tarea se realizará en el lapso de un 3 semanas','50',1,3);
insert into propuesta (descripcion, valor, docente, tareas3) values ('La tarea se realizará en el lapso de un 3 semanas','50',1,4);