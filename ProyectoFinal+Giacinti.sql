-- Creación de la base de datos
CREATE DATABASE CoworkingDB;
USE CoworkingDB;

-- Creación de tablas clientes 
CREATE TABLE Clientes (
cliente_id INT auto_increment PRIMARY KEY, -- Identificador único de cliente
nombre VARCHAR(50) NOT NULL, -- Nombre del cliente
apellido VARCHAR(50) NOT NULL, -- Apellido del cliente
email VARCHAR(100) UNIQUE NOT NULL, -- Correo electrónico del cliente
telefono VARCHAR(15), -- Número de teléfono del cliente
tipo_cliente ENUM('individual', 'empresa') NOT NULL DEFAULT 'individual' -- Tipo de cliente
);

-- Creación de planes
CREATE TABLE Planes (
plan_id INT auto_increment PRIMARY KEY,  -- Identificador único del plan
nombre_plan VARCHAR(50) NOT NULL,  -- Nombre del plan
precio_mensual DECIMAL(10,2) NOT NULL,  -- Precio mensual del plan
descripcion TEXT  -- Descripción del plan
);


-- Creación de planes activos
CREATE TABLE Planes_activos (
pago_id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único de pago
cliente_id INT NOT NULL, -- Referencia al cliente 
plan_id INT NOT NULL, -- Referencia al plan
status BOOLEAN DEFAULT TRUE, -- Indica si el plan esta activo 
fecha_alta DATE NOT NULL, -- Fecha de pago del plan
fecha_baja DATE NOT NULL, -- Fecha de vencimiento del plan
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
FOREIGN KEY (plan_id) REFERENCES Planes(plan_id)
);



-- Creación de asistencias
CREATE TABLE Asistencias (
asistencias_id INT auto_increment PRIMARY KEY, -- Identificador único de asistencia
cliente_id INT NOT NULL, -- Referencia al cliente 
fecha_asistencia DATE NOT NULL, -- Fecha de asistencia
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


-- Creación de salas de reuniones
CREATE TABLE Salas_de_reuniones (
sala_id INT auto_increment PRIMARY KEY, -- Identificador único de la sala 
nombre_sala VARCHAR(100) NOT NULL, -- Nombre de la sala
capacidad INT NOT NULL, -- Capacidad máxima de la sala 
precio_sala_hora DECIMAL(10,2) NOT NULL, -- Precio por hora de la sala 
piso VARCHAR(50) NOT NULL -- Unicación de la sala por piso 
);


-- Creación de reserva de las salas
CREATE TABLE Reserva_de_las_salas (
consumo_id INT auto_increment PRIMARY KEY, -- Identificador único del consumo
cliente_id INT NOT NULL, -- Referencia al cliente
sala_id INT NOT NULL, -- Referencia a la sala 
reserva_horas INT NOT NULL, -- Cantidad de horas reservadas 
reserva_fecha DATE, -- Fecha de la reserva 
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
FOREIGN KEY (sala_id) REFERENCES Salas_de_reuniones(sala_id)
);



-- Carga de datos a las tablas
INSERT INTO Clientes (nombre, apellido, email, telefono, tipo_cliente) VALUES
('Juan', 'Perez', 'juan.perez@gmail.com', '+549111234567', 'individual'),
('Maria', 'Gomez', 'maria.gomez@gmail.com', '+5491198765432', 'empresa'),
('Carlos', 'Lopez', 'carlos.lopez@gmail.com', '+5491155512345', 'individual'),
('Ana', 'Martinez', 'ana.martinez@gmail.com', '+5491144498765', 'empresa'),
('Luis', 'Rodriguez', 'luis.rodriguez@gmail.com', '+5491133355777', 'individual'),
('Sofia', 'Fernandez', 'sofia.fernandez@gmail.com', '+5491166688999', 'empresa'),
('Pedro', 'Garcia', 'pedro.garcia@gmail.com', '+5491122244666', 'individual'),
('Laura', 'Sanchez', 'laura.sanchez@gmail.com', '+5491111133555', 'empresa'),
('Martin', 'Diaz', 'martin.diaz@gmail.com', '+5491199977555', 'individual'),
('Paula', 'Torres', 'paula.torres@gmail.com', '+5491188866444', 'empresa');


INSERT INTO Planes (nombre_plan, precio_mensual, descripcion) VALUES
('Básico', 50.00, 'Acceso a espacios compartidos durante horario laboral.'),
('Premium', 120.00, 'Acceso a oficinas privadas y salas de reuniones.'),
('Empresarial', 200.00, 'Acceso 24/7 a todas las instalaciones con beneficios adicionales.');


INSERT INTO Planes_activos (cliente_id, plan_id, status, fecha_alta, fecha_baja) VALUES
(1, 1, TRUE, '2025-02-01', '2025-03-01'), (2, 2, TRUE, '2025-02-05', '2025-03-05'),
(3, 3, TRUE, '2025-02-10', '2025-03-10'), (4, 1, TRUE, '2025-02-15', '2025-03-15'),
(5, 2, TRUE, '2025-02-20', '2025-03-20'), (6, 3, TRUE, '2025-02-22', '2025-03-22'),
(7, 1, TRUE, '2025-02-25', '2025-03-25'), (8, 2, TRUE, '2025-02-27', '2025-03-27'),
(9, 3, TRUE, '2025-03-01', '2025-04-01'), (10, 1, TRUE, '2025-03-03', '2025-04-03'),
(1, 2, TRUE, '2025-03-05', '2025-04-05'), (2, 3, TRUE, '2025-03-07', '2025-04-07'),
(3, 1, TRUE, '2025-03-09', '2025-04-09'), (4, 2, TRUE, '2025-03-11', '2025-04-11'),
(5, 3, TRUE, '2025-03-13', '2025-04-13'), (6, 1, TRUE, '2025-03-15', '2025-04-15'),
(7, 2, TRUE, '2025-03-17', '2025-04-17'), (8, 3, TRUE, '2025-03-19', '2025-04-19');



INSERT INTO Asistencias (cliente_id, fecha_asistencia) VALUES
(1, '2025-02-01'), (2, '2025-02-02'), (3, '2025-02-03'), (4, '2025-02-04'),
(5, '2025-02-05'), (6, '2025-02-06'), (7, '2025-02-07'), (8, '2025-02-08'),
(9, '2025-02-09'), (10, '2025-02-10'), (1, '2025-02-11'), (2, '2025-02-12'),
(3, '2025-02-13'), (4, '2025-02-14'), (5, '2025-02-15'), (6, '2025-02-16'),
(7, '2025-02-17'), (8, '2025-02-18'), (9, '2025-02-19'), (10, '2025-02-20');



INSERT INTO Salas_de_reuniones (nombre_sala, capacidad, precio_sala_hora, piso) VALUES
('Sala A', 10, 25.00, 'Piso 1'), ('Sala B', 8, 20.00, 'Piso 2'), ('Sala C', 12, 30.00, 'Piso 3');


INSERT INTO Reserva_de_las_salas (cliente_id, sala_id, reserva_horas, reserva_fecha) VALUES
(1, 1, 2, '2025-02-01'), (2, 2, 3, '2025-02-02'), (3, 3, 1, '2025-02-03'), (4, 1, 4, '2025-02-04'),
(5, 2, 2, '2025-02-05'), (6, 3, 3, '2025-02-06'), (7, 1, 1, '2025-02-07'), (8, 2, 2, '2025-02-08'),
(9, 3, 3, '2025-02-09'), (10, 1, 4, '2025-02-10'), (1, 2, 2, '2025-02-11'), (2, 3, 1, '2025-02-12'),
(3, 1, 3, '2025-02-13'), (4, 2, 2, '2025-02-14'), (5, 3, 4, '2025-02-15'), (6, 1, 3, '2025-02-16'),
(7, 2, 2, '2025-02-17'), (8, 3, 1, '2025-02-18'), (9, 1, 4, '2025-02-19'), (10, 2, 3, '2025-02-20');





-- Creación de vistas
-- Vista 1: Clientes activos y planes
CREATE VIEW Vista_clientes_activos AS
SELECT 
    c.cliente_id,
    c.nombre,
    c.apellido,
    c.email,
    p.nombre_plan,
    p.precio_mensual,
    pa.fecha_alta,
    pa.fecha_baja
FROM 
    Clientes c
JOIN 
    Planes_activos pa ON c.cliente_id = pa.cliente_id
JOIN 
    Planes p ON pa.plan_id = p.plan_id
WHERE 
    pa.status = TRUE;
    


SELECT * FROM Vista_clientes_activos;



-- Vista 2: Reserva de salas por hora y cliente
CREATE VIEW Vista_reservas_salas AS
SELECT 
    r.cliente_id,
    c.nombre AS cliente_nombre,
    c.apellido AS cliente_apellido,
    s.nombre_sala,
    s.capacidad,
    r.reserva_horas,
    r.reserva_fecha
FROM 
    Reserva_de_las_salas r
JOIN 
    Clientes c ON r.cliente_id = c.cliente_id
JOIN 
    Salas_de_reuniones s ON r.sala_id = s.sala_id;


SELECT * FROM Vista_reservas_salas;




-- Vista 3: Monto facturado por plan
CREATE VIEW Vista_facturacion_total AS
SELECT 
    YEAR(pa.fecha_alta) AS anio,
    MONTH(pa.fecha_alta) AS mes,
    'Planes' AS tipo_servicio,
    SUM(p.precio_mensual) AS total_facturado
FROM Planes_activos pa
JOIN Planes p ON pa.plan_id = p.plan_id
GROUP BY anio, mes

UNION ALL

SELECT 
    YEAR(r.reserva_fecha) AS anio,
    MONTH(r.reserva_fecha) AS mes,
    'Salas de Reuniones' AS tipo_servicio,
    SUM(r.reserva_horas * s.precio_sala_hora) AS total_facturado
FROM Reserva_de_las_salas r
JOIN Salas_de_reuniones s ON r.sala_id = s.sala_id
GROUP BY anio, mes

ORDER BY anio DESC, mes DESC, tipo_servicio;


SELECT * FROM Vista_facturacion_total;





-- Creación de funciones
-- Función 1: Verifica la capacidad del día del espacio
DELIMITER // 
CREATE FUNCTION `Verificar_capacidad`(fecha_consulta DATE) RETURNS varchar(50)
    DETERMINISTIC
BEGIN
    DECLARE total_asistencias INT;
    DECLARE resultado VARCHAR(50);

    -- Contar el número de asistencias en la fecha ingresada
    SELECT COUNT(*) INTO total_asistencias
    FROM Asistencias
    WHERE fecha_asistencia = fecha_consulta;

    -- Verificar si se supera la capacidad máxima
    IF total_asistencias > 150 THEN
        SET resultado = 'Capacidad superada';
    ELSE
        SET resultado = 'Dentro de la capacidad';
    END IF;

    RETURN resultado;
END
//

SELECT Verificar_capacidad('2025-03-01') AS estado;




-- Función 2: Devuelve el estado de seguimiento del id del cliente ingresado, asistencias y consumo de salas
DELIMITER // 
CREATE FUNCTION `Seguimiento_cliente`(cliente_id INT, fecha_inicio DATE, fecha_fin DATE) RETURNS varchar(250)
DETERMINISTIC
BEGIN
    DECLARE total_asistencias INT;
    DECLARE total_consumo_salas DECIMAL(10,2);
    DECLARE mensaje VARCHAR(255);

    -- Contar las asistencias del cliente en el rango de fecha ingresado
    SELECT COUNT(DISTINCT a.fecha_asistencia)
    INTO total_asistencias
    FROM Asistencias a
    WHERE a.cliente_id = cliente_id
    AND a.fecha_asistencia BETWEEN fecha_inicio AND fecha_fin;

    -- Calcular el consumo de salas del cliente en el rango de fecha ingresado
    SELECT IFNULL(SUM(r.reserva_horas * s.precio_sala_hora), 0)
    INTO total_consumo_salas
    FROM Reserva_de_las_salas r
    JOIN Salas_de_reuniones s ON r.sala_id = s.sala_id
    WHERE r.cliente_id = cliente_id
    AND r.reserva_fecha BETWEEN fecha_inicio AND fecha_fin;

    -- Generar el mensaje de salida con los datos
    SET mensaje = CONCAT('El cliente con ID ', cliente_id, ' tuvo ', 
                          total_asistencias, ' asistencias entre ', 
                          fecha_inicio, ' y ', fecha_fin, '.\n', 
                          'El consumo total en salas de reuniones fue de: $', total_consumo_salas, '.\n');

    RETURN mensaje;
END
//

SELECT Seguimiento_cliente(4,'2025-02-01', '2025-02-28');





-- Función 3: Devuelve los ingresos totales por planes y salas
DELIMITER // 
CREATE FUNCTION `Ingresos_totales_periodo`(fecha_inicio DATE, fecha_fin DATE) RETURNS varchar(255)
DETERMINISTIC
BEGIN
    DECLARE ingresos_planes DECIMAL(10,2) DEFAULT 0;
    DECLARE ingresos_salas DECIMAL(10,2) DEFAULT 0;
    DECLARE mensaje VARCHAR(255);

    -- Calcular los ingresos totales por planes activos en el rango de fechas
    SELECT IFNULL(SUM(p.precio_mensual), 0)
    INTO ingresos_planes
    FROM Planes_activos pa
    JOIN Planes p ON pa.plan_id = p.plan_id
    WHERE pa.fecha_alta BETWEEN fecha_inicio AND fecha_fin
    AND pa.status = TRUE;

    -- Calcular los ingresos totales por salas reservadas en el rango de fechas
    SELECT IFNULL(SUM(r.reserva_horas * s.precio_sala_hora), 0)
    INTO ingresos_salas
    FROM Reserva_de_las_salas r
    JOIN Salas_de_reuniones s ON r.sala_id = s.sala_id
    WHERE r.reserva_fecha BETWEEN fecha_inicio AND fecha_fin;

    -- Generar el mensaje con los ingresos totales
    SET mensaje = CONCAT('Los ingresos por planes en el periodo desde ', fecha_inicio, ' hasta ', fecha_fin, ' fueron: $', ingresos_planes, '.\n', 
                          'Los ingresos por salas reservadas en el mismo periodo fueron: $', ingresos_salas, '.\n');

    RETURN mensaje;
END
//

SELECT Ingresos_totales_periodo('2025-02-01', '2025-02-28');







-- Creación de Stored Procedure

-- Stored Procedure 1: ingresos totales por salas
DELIMITER // 
CREATE PROCEDURE Ingresos_por_salas(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT s.nombre_sala AS 'Sala',
           COUNT(r.cliente_id) AS 'Reservas',
           SUM(r.reserva_horas * s.precio_sala_hora) AS 'Ingresos por Sala'
    FROM Reserva_de_las_salas r
    JOIN Salas_de_reuniones s ON r.sala_id = s.sala_id
    WHERE r.reserva_fecha BETWEEN fecha_inicio AND fecha_fin
    GROUP BY s.sala_id;
END

//


-- Test
INSERT INTO Reserva_de_las_salas (cliente_id, sala_id, reserva_horas, reserva_fecha) 
VALUES (1, 1, 2, '2025-02-10'),
       (1, 2, 3, '2025-02-15'),
       (2, 1, 1, '2025-02-20');

CALL Ingresos_por_salas('2025-02-01', '2025-02-28');



-- Stored Procedure 2: ingresos totales por planes
DELIMITER //
CREATE PROCEDURE Ingresos_por_plan(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT p.nombre_plan AS 'Plan',
           COUNT(pa.cliente_id) AS 'Clientes Activos',
           SUM(p.precio_mensual) AS 'Ingresos por Plan'
    FROM Planes_activos pa
    JOIN Planes p ON pa.plan_id = p.plan_id
    WHERE pa.fecha_alta BETWEEN fecha_inicio AND fecha_fin
    AND pa.status = TRUE
    GROUP BY p.plan_id;
END

//


-- Test
INSERT INTO Planes_activos (cliente_id, plan_id, status, fecha_alta, fecha_baja) 
VALUES (1, 1, TRUE, '2025-02-05', '2025-03-05'),
       (2, 2, TRUE, '2025-02-10', '2025-03-10');

CALL Ingresos_por_plan('2025-02-01', '2025-02-28');



-- Stored Procedure 3: Número de asistencias por cliente
DELIMITER //
CREATE PROCEDURE Asistencias_por_cliente(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT a.cliente_id, 
           c.nombre, 
           c.apellido, 
           COUNT(a.asistencias_id) AS Total_Asistencias
    FROM Asistencias a
    JOIN Clientes c ON a.cliente_id = c.cliente_id
    WHERE a.fecha_asistencia BETWEEN fecha_inicio AND fecha_fin
    GROUP BY a.cliente_id
    ORDER BY Total_asistencias DESC;
END 

//

-- Test
INSERT INTO Asistencias (cliente_id, fecha_asistencia) 
VALUES (1, '2025-02-01'),
       (1, '2025-02-10'),
       (2, '2025-02-15');

CALL Asistencias_por_cliente('2025-02-01', '2025-02-28');



    
-- Creación de Triggers

-- Trigger 1: Evitar que un usuario tenga más de un plan al mismo tiempo
DELIMITER //
CREATE TRIGGER tr_insert_planes_activos
BEFORE INSERT ON Planes_activos
FOR EACH ROW
BEGIN
    DECLARE plan_existente INT;

    SELECT COUNT(*) INTO plan_existente 
    FROM Planes_activos 
    WHERE cliente_id = NEW.cliente_id AND status = TRUE;

    IF plan_existente > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El cliente ya tiene un plan activo.';
    END IF;
END
//

SHOW TRIGGERS LIKE 'Planes_activos';

INSERT INTO Planes_activos (cliente_id, plan_id, status, fecha_alta, fecha_baja) VALUES
(7, 2, TRUE, '2025-03-17', '2025-04-17'), (8, 3, TRUE, '2025-03-19', '2025-04-19');





-- Trigger 2: auditoria de clientes

CREATE TABLE Auditoria_clientes (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(15),
    tipo_cliente ENUM('individual', 'empresa'),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    accion ENUM('INSERT', 'UPDATE', 'DELETE')   
);

DELIMITER //
CREATE TRIGGER tr_clientes_insert_update
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_clientes (cliente_id, nombre, apellido, email, telefono, tipo_cliente, accion)
    VALUES (NEW.cliente_id, NEW.nombre, NEW.apellido, NEW.email, NEW.telefono, NEW.tipo_cliente, 'INSERT');
END
//


DELIMITER //
CREATE TRIGGER tr_clientes_update
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_clientes (cliente_id, nombre, apellido, email, telefono, tipo_cliente, accion)
    VALUES (NEW.cliente_id, NEW.nombre, NEW.apellido, NEW.email, NEW.telefono, NEW.tipo_cliente, 'UPDATE');
END
//


DELIMITER //
CREATE TRIGGER tr_clientes_delete
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_clientes (cliente_id, nombre, apellido, email, telefono, tipo_cliente, accion)
    VALUES (OLD.cliente_id, OLD.nombre, OLD.apellido, OLD.email, OLD.telefono, OLD.tipo_cliente, 'DELETE');
END
//


INSERT INTO Clientes (nombre, apellido, email, telefono, tipo_cliente) VALUES
('Martina', 'Gomez', 'martina.gomez@gmail.com', '+549111255567', 'individual');

SELECT * FROM Clientes;
SELECT * FROM Auditoria_clientes;





-- Trigger 3: auditoria de asistencias
CREATE TABLE Auditoria_asistencias (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    asistencias_id INT,
    cliente_id INT,
    fecha_asistencia DATE,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    accion ENUM('INSERT', 'DELETE')
);

DELIMITER //
CREATE TRIGGER tr_asistencias_insert
AFTER INSERT ON Asistencias
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_asistencias (asistencias_id, cliente_id, fecha_asistencia, accion)
    VALUES (NEW.asistencias_id, NEW.cliente_id, NEW.fecha_asistencia, 'INSERT');
END
//


DELIMITER //
CREATE TRIGGER tr_asistencias_delete
AFTER DELETE ON Asistencias
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Asistencias (asistencias_id, cliente_id, fecha_asistencia, accion)
    VALUES (OLD.asistencias_id, OLD.cliente_id, OLD.fecha_asistencia, 'DELETE');
END
//


INSERT INTO Asistencias (cliente_id, fecha_asistencia) VALUES
(10, '2025-03-03');


SELECT * FROM Asistencias;
SELECT * FROM Auditoria_asistencias;