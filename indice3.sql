-- 1. Crear la base de datos
DROP DATABASE empresa_facturas;
CREATE DATABASE IF NOT EXISTS empresa_facturas;
USE empresa_facturas;

-- 2. Crear la tabla factura
CREATE TABLE IF NOT EXISTS factura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- 3. Crear el índice `idx_nombre_categoria`
-- ALTER TABLE factura DROP INDEX idx_nombre_categoria;
CREATE INDEX idx_nombre_categoria ON factura (nombre, categoria);

-- 4. Insertar 100,000 registros con una variedad de nombres y categorías
-- Vamos a generar una gran cantidad de datos utilizando un ciclo
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertarRegistros;
CREATE PROCEDURE InsertarRegistros()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE nombre VARCHAR(100);
    DECLARE categoria VARCHAR(100);
    DECLARE precio DECIMAL(10,2);

    WHILE contador <= 100 DO
        -- Selección aleatoria para nombre y categoría
        SET nombre = ELT(FLOOR(1 + (RAND() * 5)), 'Octavio', 'Carlos', 'Juan', 'José', 'Raúl');
        SET categoria = ELT(FLOOR(1 + (RAND() * 4)), 'Fontanero', 'Electricista', 'Albañil', 'Pintor');
        SET precio = ROUND(RAND() * 100 + 50, 2);  -- Genera precios entre 50 y 150

        -- Insertar el registro
        INSERT INTO factura (nombre, categoria, precio) VALUES (nombre, categoria, precio);

        -- Incrementar el contador
        SET contador = contador + 1;
    END WHILE;
END$$

DELIMITER ;

-- 5. Llamar al procedimiento para insertar los 100,000 registros
CALL InsertarRegistros();

-- 6. Verificar que se han insertado los registros correctamente
SELECT COUNT(*) FROM factura;  -- Debería devolver 100000

-- 7. Verificar que el índice está en uso en una consulta con EXPLAIN ANALYZE

EXPLAIN ANALYZE 
SELECT * FROM factura 
FORCE INDEX (idx_nombre_categoria)
WHERE nombre = 'Octavio' AND categoria = 'Fontanero';


CREATE INDEX idx_nombre ON factura (nombre);

EXPLAIN ANALYZE 
SELECT * FROM factura 
FORCE INDEX (idx_nombre)
WHERE nombre = 'Octavio' AND categoria = 'Fontanero';
create index idx_nombre_categorias on factura

drop index idx_nombre_categoria on factura;