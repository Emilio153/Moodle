use Seneca;

-- ALUMNOS
INSERT INTO alumno (nombre, apellido1, apellido2, email, telefono, fecha_nacimiento) VALUES
('Laura', 'Gómez', 'Ruiz', 'laura.gomez@email.com', 612345678, '2003-04-12'),
('Carlos', 'Martín', 'López', 'carlos.martin@email.com', 634567891, '2002-11-25'),
('Elena', 'Sánchez', 'Pérez', 'elena.sanchez@email.com', 698765432, '2004-01-15'),
('Laura', 'Serrano', 'Torres', 'laura.serrano@example.com', 600111333, '2004-07-19'),
('Alejandro', 'Morales', 'Castillo', 'alejandro.morales@example.com', 600222444, '2003-12-22'),
('María', 'Jiménez', 'Navarro', 'maria.jimenez@example.com', 600333555, '2004-03-10'),
('Javier', 'Ortega', 'Vargas', 'javier.ortega@example.com', 600444666, '2003-08-29'),
('Sofía', 'Ramos', 'Luna', 'sofia.ramos@example.com', 600555777, '2004-11-11'),
('Daniel', 'Ruiz', 'Flores', 'daniel.ruiz@example.com', 600666888, '2003-09-14'),
('Elena', 'Molina', 'Suárez', 'elena.molina@example.com', 600777999, '2004-06-05');

-- PROFESORES
INSERT INTO profesor (nombre, apellido1, apellido2, email, telefono, fecha_nacimiento, especialidad, fecha_contratacion) VALUES
('Miguel', 'Fernández', 'Romero', 'miguel.fernandez@email.com', 654321987, '1980-06-15', 'Programación', '2010-09-01'),
('Ana', 'Navarro', 'Díaz', 'ana.navarro@email.com', 689123456, '1975-03-22', 'Bases de datos', '2005-09-01'),
('Isabel', 'Castro', 'Marín', 'isabel.castro@iesalcores.edu', 600123789, '1985-02-18', 'Entornos de Desarrollo', '2012-09-01'),
('Luis', 'Domínguez', 'Alonso', 'luis.dominguez@iesalcores.edu', 600456123, '1978-07-30', 'Sistemas Informáticos', '2008-09-01'),
('Clara', 'Nieto', 'Aguilar', 'clara.nieto@iesalcores.edu', 600321654, '1982-01-14', 'Lenguajes de marcas', '2011-09-01');

-- CENTROS
INSERT INTO centro (nombre) VALUES
('IES Maria Inmaculada'),
('IES Los Alcores');

-- CICLOS
INSERT INTO ciclo (nombre, descripcion, centro) VALUES
('DAM', 'Desarrollo de Aplicaciones Multiplataforma', 1),
('DAW', 'Desarrollo de Aplicaciones Web', 2);

-- CURSOS
INSERT INTO curso (nombre, anyo_academico, ciclo) VALUES
('1º DAM', 2024, 1),
('2º DAM', 2025, 1),
('1º DAW', 2024, 2);

-- MÓDULOS
INSERT INTO modulo_profesional (nombre, horas, curso) VALUES
('Programación', 256, 1),
('Bases de Datos', 192, 1),
('Entornos de Desarrollo', 96, 1),
('Lenguajes de Marcas', 128, 1),
('Sistemas Informáticos', 192, 1);

-- RESULTADOS DE APRENDIZAJE (RA)
INSERT INTO ra (num_criterios, modulo) VALUES
(3, 1),
(2, 2),
(1, 3),
(2, 4),
(3, 5);

-- CRITERIOS DE EVALUACIÓN
INSERT INTO criterio (nombre, porcentaje, ra) VALUES
('Diseña algoritmos correctamente', 40, 1),
('Utiliza estructuras de control', 30, 1),
('Resuelve problemas con arrays', 30, 1),
('Modela bases de datos', 50, 2),
('Utiliza sentencias SQL', 50, 2),
('Identifica herramientas de desarrollo', 100, 3),
('Crea documentos XML', 60, 4),
('Valida estructuras XML con DTD y XML Schema', 40, 4),
('Configura redes básicas', 50, 5),
('Instala sistemas operativos', 30, 5),
('Gestiona usuarios y permisos', 20, 5);

-- TAREAS
INSERT INTO tarea (nombre, descripcion) VALUES
('Tarea 1: Algoritmos', 'Crear varios algoritmos para resolver problemas básicos'),
('Tarea 2: SQL Básico', 'Ejercicios sobre consultas SQL'),
('Tarea 3: IDEs', 'Informe sobre herramientas de desarrollo'),
('Tarea 4: XML', 'Elaborar un documento XML válido para un catálogo de productos'),
('Tarea 5: Redes', 'Configurar una red básica con direcciones IP'),
('Tarea 6: Usuarios y permisos', 'Crear y gestionar usuarios en Linux');

-- CALIFICACIONES
INSERT INTO calificacion (nota, fecha, alumno, tarea, criterio) VALUES
(8.50, '2024-11-20', 1, 1, 1),
(7.00, '2024-11-21', 2, 2, 4),
(9.25, '2024-11-22', 3, 3, 6),
(9.00, '2024-11-23', 4, 1, 1),
(6.75, '2024-11-24', 5, 2, 4),
(5.50, '2024-11-25', 6, 3, 6),
(4.00, '2024-11-26', 7, 4, 7),
(7.25, '2024-11-27', 8, 5, 8),
(8.00, '2024-11-28', 9, 6, 9),
(3.50, '2024-11-29', 10, 1, 1),
(4.90, '2024-11-30', 2, 2, 5),
(6.80, '2024-12-01', 3, 5, 8),
(9.50, '2024-12-02', 1, 4, 7);

-- MATRÍCULAS
INSERT INTO matricula (estado, fecha, alumno, modulo) VALUES
('Activa', '2024-09-10', 1, 1),
('Activa', '2024-09-10', 2, 2),
('Activa', '2024-09-10', 3, 3),
('Activa', '2024-09-10', 4, 1),
('Activa', '2024-09-10', 5, 2),
('Activa', '2024-09-10', 6, 3),
('Activa', '2024-09-10', 7, 4),
('Activa', '2024-09-10', 8, 5),
('Activa', '2024-09-10', 9, 2),
('Activa', '2024-09-10', 10, 1);

-- IMPARTE
INSERT INTO imparte (fecha_inicio, fecha_fin, profesor, modulo) VALUES
('2024-09-15', '2025-06-20', 1, 1),
('2024-09-15', '2025-06-20', 2, 2),
('2024-09-15', '2025-06-20', 2, 3),
('2024-09-15', '2025-06-20', 3, 4),
('2024-09-15', '2025-06-20', 4, 5),
('2024-09-15', '2025-06-20', 5, 2);