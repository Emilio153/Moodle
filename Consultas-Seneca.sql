use Seneca;

-- 1. Nota media del RA1 de la asignatura “Bases de datos” por cada alumno
select a.nombre, a.apellido1, a.apellido2, round(avg(c.nota), 2) as nota_media from alumno a
join calificacion c on a.id_alumno = c.alumno
where c.criterio in (
    select cr.id_criterio from criterio cr
    join ra r on cr.ra = r.id_ra
    where r.id_ra = (
        select min(r2.id_ra) from ra r2
        join modulo_profesional m on r2.modulo = m.id_modulo
        where m.nombre = 'Bases de Datos'
    )
)
group by a.id_alumno;

-- 2. Nombre y apellidos del alumno que ha obtenido mayor nota en cualquier criterio de evaluación de cualquier módulo profesional (o asignatura)
select nombre, apellido1, apellido2 from alumno
where id_alumno = (
    select c.alumno from calificacion c
    order by c.nota desc limit 1
);

-- 3. Nota media de una asignatura cualquiera
select round(avg(c.nota), 2) as nota_media from calificacion c
join criterio cr on c.criterio = cr.id_criterio
join ra r on cr.ra = r.id_ra
join modulo_profesional m on r.modulo = m.id_modulo
where m.nombre = 'Programación';

-- 4. Nota media de expediente académico para cada alumno
select a.nombre, a.apellido1, a.apellido2, round(avg(c.nota), 2) as nota_media from alumno a
join calificacion c on a.id_alumno = c.alumno
group by a.id_alumno;

-- 5. Muestra el/los RA con mayor número de criterios
select r.id_ra as ra_id, count(cr.id_criterio) as total_criterios from ra r
join criterio cr on cr.ra = r.id_ra
group by r.id_ra
having count(cr.id_criterio) = (
    select max(num_criterios) from (
        select count(*) as num_criterios from criterio
        group by ra
    ) as conteo
);

-- 6. Para el alumno cuyo primer ID es 1 muestra la nota final por cada módulo profesional
select m.nombre as modulo, round(avg(c.nota), 2) as nota_final from calificacion c
join criterio cr on c.criterio = cr.id_criterio
join ra r on cr.ra = r.id_ra
join modulo_profesional m on r.modulo = m.id_modulo
where c.alumno = 1 group by m.id_modulo;

-- 7. Muestra todos los RA suspensos para cada alumno. El listado debe incluir nombre completo del alumno, nombre del módulo y descripción del RA
select a.nombre, a.apellido1, a.apellido2, m.nombre as modulo, r.id_ra as ra_id from alumno a
join calificacion c on a.id_alumno = c.alumno
join criterio cr on c.criterio = cr.id_criterio
join ra r on cr.ra = r.id_ra
join modulo_profesional m on r.modulo = m.id_modulo
where r.id_ra in (
    select distinct cr2.ra from calificacion c2
    join criterio cr2 on c2.criterio = cr2.id_criterio
    where c2.nota < 5
)
group by a.id_alumno, r.id_ra, m.id_modulo;

-- 8. Muestra el nombre del profesor que tiene la asignatura con mayor número de suspensos
select p.nombre, p.apellido1, p.apellido2 from profesor p
where p.id_profesor = ( 
	select i.profesor from imparte i
    join modulo_profesional m on i.modulo = m.id_modulo
    join ra r on r.modulo = m.id_modulo
    join criterio cr on cr.ra = r.id_ra
    join calificacion c on c.criterio = cr.id_criterio
    where c.nota < 5 group by i.profesor
    order by count(c.id_calificacion) desc limit 1
);


-- 9. Muestra los alumnos matriculados en el IES Los Alcores
select a.nombre, a.apellido1, a.apellido2 from alumno a
where a.id_alumno in ( 
	select ma.alumno from matricula ma
    join modulo_profesional m on ma.modulo = m.id_modulo
    join curso cu on m.curso = cu.id_curso
    join ciclo ci on cu.ciclo = ci.id_ciclo
    where ci.centro = (
        select ce.id_centro from centro ce
        where ce.nombre = 'IES Los Alcores' limit 1
    )
);
