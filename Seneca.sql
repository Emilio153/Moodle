drop database if exists Seneca;
create database Seneca;
use Seneca;

create table alumno (
	id_alumno int auto_increment primary key,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50), 
    email varchar(50) unique,
    telefono int,
    fecha_nacimiento date
);

create table profesor (
	id_profesor int auto_increment primary key,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50), 
    email varchar(50),
    telefono int,
    fecha_nacimiento date,
    especialidad varchar(50),
    fecha_contratacion date
);

create table centro(
	id_centro int auto_increment primary key,
    nombre varchar(50)
);

create table ciclo (
	id_ciclo int auto_increment primary key,
    nombre varchar(50),
    descripcion text,
    centro int,
    constraint fk_ciclo_centro foreign key (centro) references centro(id_centro)
);

create table curso (
	id_curso int auto_increment primary key,
    nombre varchar(50),
    anyo_academico year,
    ciclo int,
    constraint fk_curso_ciclo foreign key (ciclo) references ciclo(id_ciclo)
);

create table modulo_profesional (
	id_modulo int auto_increment primary key,
    nombre varchar(50),
    horas int,
    curso int,
    constraint fk_modulo_curso foreign key (curso) references curso(id_curso)
);

create table ra (
	id_ra int auto_increment primary key,
    num_criterios int,
    modulo int,
    constraint fk_ra_modulo foreign key (modulo) references modulo_profesional(id_modulo)
);

create table criterio (
	id_criterio int auto_increment primary key,
    nombre varchar(50),
    porcentaje decimal(5, 2),
    ra int,
    constraint fk_criterio_ra foreign key (ra) references ra(id_ra),
    constraint condicion_porcentaje check (porcentaje between 0 and 100)
);

create table tarea (
	id_tarea int auto_increment primary key,
    nombre varchar(50),
    descripcion text
);

create table calificacion (
	id_calificacion int auto_increment primary key,
    nota decimal(4,2),
    fecha date,
    alumno int,
    tarea int,
    criterio int,
    constraint fk_calificacion_alumno foreign key (alumno) references alumno(id_alumno),
    constraint fk_calificacion_tarea foreign key (tarea) references tarea(id_tarea),
    constraint fk_calificacion_criterio foreign key (criterio) references criterio(id_criterio),
    constraint condicion_nota check (nota between 0 and 10)
);

create table matricula (
	id_matricula int auto_increment primary key,
    estado varchar(50),
    fecha date,
    alumno int,
    modulo int,
    constraint fk_matricula_alumno foreign key (alumno) references alumno(id_alumno),
    constraint fk_matricula_modulo foreign key (modulo) references modulo_profesional(id_modulo)
);

create table imparte (
	id_impartir int auto_increment primary key,
    fecha_inicio date,
    fecha_fin date,
    profesor int,
    modulo int,
    constraint fk_imparte_profesor foreign key (profesor) references profesor(id_profesor),
	constraint fk_imparte_modulo foreign key (modulo) references modulo_profesional(id_modulo)
);