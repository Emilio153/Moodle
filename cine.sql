drop database if exists cine;
create database cine;
use cine;

create table espectador(
	cod_espectador int primary key auto_increment,
    dni char(9) not null unique,
    nombre varchar(100),
    direccion varchar(100),
    telefono int
);
describe espectador;

create table entrada(
	identificador int primary key auto_increment,
    fecha date,
    asiento char(1),
    fila varchar(1),
    precio decimal(4,2),
    cod_espectador int,
    constraint fk_entrada_espectador foreign key (cod_espectador) references espectador(cod_espectador)
);
describe entrada;

create table pelicula(
	cod_pelicula char(7) primary key,
    nombre varchar(50),
    anyo_estreno year,
    director varchar(60),
    constraint chk_anyo check (anyo_estreno between 1900 and 2090)
);
describe pelicula;

create table sesion(
	identificador int auto_increment,
    cod_pelicula char(7),
    pase_premium boolean default false,
    constraint pk_sesion primary key(identificador,cod_pelicula),
    constraint fk_sesion_entrada foreign key (identificador) references entrada(identificador),
    constraint fk_sesion_pelicula foreign key (cod_pelicula) references pelicula(cod_pelicula) 
);
describe sesion;

alter table espectador add column email varchar(100) default "sin determinar";

alter table espectador drop column email;

alter table entrada modify column precio decimal(4,2) check (precio >=0);

insert into  pelicula(cod_pelicula,nombre,anyo_estreno,director) values
	('1a2b3c4','El Hobbit 1-Un viaje inesperado','2012','Peter Jackson');
    
insert into espectador(dni,nombre,direccion,telefono) values
	('11111111A','Jose','Calle Uno','666777888'),
    ('22222222B','Sandra','Calle Dos','666999000');
    
insert into entrada(fecha,asiento,fila,precio,cod_espectador) values
	('2012-01-01','A','1','05.00','1'),
    ('2012-01-01','A','2','05.00','2');
    
alter table entrada drop foreign key fk_entrada_espectador;
alter table entrada add constraint fk_entrada_espectador foreign key(cod_espectador) references espectador(cod_espectador) on update cascade on delete cascade;
update espectador set cod_espectador ='7' where cod_espectador='2';

alter table sesion drop foreign key fk_sesion_entrada;
alter table sesion add constraint fk_sesion_entrada foreign key(identificador) references entrada(identificador) on update cascade on delete cascade;
delete from espectador where cod_espectador ='1';

-- Ejercicio 1
show grants;

-- Ejercio 2

create user administrador identified by 'pass_admin';
grant all privileges on *.* to 'administrador'@'%' with grant option;
flush privileges;
-- Ejercicio 3
select current_user();

-- Ejercicio 4
select * from mysql.user;
select * from mysql.user where user='root';

-- Ejercicio 5 
show grants for 'root'@'localhost';
show grants for 'administrador'@'localhost';





