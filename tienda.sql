CREATE DATABASE tienda;

USE tiendita;

CREATE TABLE Productos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    color VARCHAR(15),
    cantidadStock INT
);

CREATE TABLE Ventas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    -- La fecha de la venta se guardará automaticamente con la fecha y hora actual --
    -- CURRENT_TIMESTAMP es una funcion de MySQL que guarda la fecha y hora actual --
    fecha DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
);