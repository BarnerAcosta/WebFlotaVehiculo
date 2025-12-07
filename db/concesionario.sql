-- Script de inicialización para Docker - WebFlotaVehiculo
-- Este script se ejecuta automáticamente cuando se crea el contenedor MySQL

-- Crear tabla de tipos de vehículo
CREATE TABLE
IF NOT EXISTS tipovehi
(
    IdTv INT PRIMARY KEY AUTO_INCREMENT,
    nomTv VARCHAR
(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear tabla de vehículos
CREATE TABLE
IF NOT EXISTS vehiculo
(
    placa VARCHAR
(10) PRIMARY KEY,
    marca VARCHAR
(50) NOT NULL,
    referencia VARCHAR
(50) NOT NULL,
    modelo VARCHAR
(50) NOT NULL,
    id_tv INT NOT NULL,
    FOREIGN KEY
(id_tv) REFERENCES tipovehi
(IdTv) ON
DELETE RESTRICT ON
UPDATE CASCADE
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4;

-- Insertar tipos de vehículo
INSERT INTO tipovehi
    (IdTv, nomTv)
VALUES
    (1, 'Automóvil'),
    (2, 'Motocicleta'),
    (3, 'Camión'),
    (4, 'Bus'),
    (5, 'Camioneta');

-- Insertar vehículos de ejemplo
INSERT INTO vehiculo
    (placa, marca, referencia, modelo, id_tv)
VALUES
    ('ABC123', 'Toyota', 'Corolla', '2023', 1),
    ('XYZ789', 'Honda', 'Civic', '2022', 1),
    ('DEF456', 'Yamaha', 'MT-03', '2021', 2),
    ('GHI789', 'Ford', 'F-150', '2023', 5),
    ('JKL012', 'Chevrolet', 'NPR', '2020', 3);
