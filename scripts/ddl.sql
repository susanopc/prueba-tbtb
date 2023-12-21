-- Crear la base de datos
CREATE DATABASE susano_test;

-- Usar la base de datos recién creada
USE susano_test;

-- Crear la tabla cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(255),
    fecha_nacimiento DATE,
    genero CHAR(1) CHECK (genero IN ('M', 'F'))
);

-- Crear la tabla factura
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATE,
    fecha_entrega DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Crear la tabla producto
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(255),
    valor_unitario DECIMAL(10, 2)
);

-- Crear la tabla factura_producto
CREATE TABLE factura_producto (
    id_factura INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_factura, id_producto),
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
