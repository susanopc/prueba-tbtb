
-- Inserciones

-- Insertar 5 clientes
INSERT INTO cliente (nombre_completo, fecha_nacimiento, genero) VALUES
    ('Cliente 1', '1990-01-01', 'M'),
    ('Cliente 2', '1985-05-15', 'F'),
    ('Cliente 3', '1992-08-20', 'M'),
    ('Cliente 4', '1980-12-10', 'F'),
    ('Cliente 5', '1995-03-25', 'M');

-- Insertar 10 productos
INSERT INTO producto (nombre_producto, valor_unitario) VALUES
    ('Producto 1', 10.00),
    ('Producto 2', 15.00),
    ('Producto 3', 20.00),
    ('Producto 4', 8.00),
    ('Producto 5', 12.30),
    ('Producto 6', 25.00),
    ('Producto 7', 18.50),
    ('Producto 8', 30.75),
    ('Producto 9', 22.20),
    ('Producto 10', 5.50);

-- Insertar 5 facturas asociadas a tres clientes con entre 2 y 5 productos
INSERT INTO factura (id_cliente, fecha_venta, fecha_entrega, total) VALUES
    (1, '2023-01-01', '2023-01-10', 60.00),
    (1, '2023-02-05', '2023-02-15', 76.60),
    (2, '2023-03-10', '2023-03-20', 62.00),
    (3, '2023-04-15', '2023-04-25', 92.25),
    (3, '2023-05-20', '2023-05-30', 66.40);

-- Asociar productos a las facturas
INSERT INTO factura_producto (id_factura, id_producto, cantidad) VALUES
    (1, 1, 3),
    (1, 2, 2),
    (2, 3, 1),
    (2, 4, 4),
    (2, 5, 2),
    (3, 6, 1),
    (3, 7, 2),
    (4, 8, 3),
    (5, 9, 2),
    (5, 10, 4);
    
   
   
-- Consultas
-- Consulta con JOIN Inner: Obtiene información sobre las facturas, incluyendo el cliente asociado y los productos asociados.
 SELECT 
    f.id_factura,
    f.fecha_venta,
    c.nombre_completo AS nombre_cliente,
    p.nombre_producto,
    fp.cantidad,
    p.valor_unitario,
    (fp.cantidad * p.valor_unitario) AS subtotal
FROM factura f
INNER JOIN cliente c ON f.id_cliente = c.id_cliente
INNER JOIN factura_producto fp ON f.id_factura = fp.id_factura
INNER JOIN producto p ON fp.id_producto = p.id_producto;
-- Consulta con JOIN Left: Obtiene información sobre todos los clientes y las facturas asociadas (si las hay).
SELECT 
    c.nombre_completo,
    f.id_factura,
    f.fecha_venta,
    f.fecha_entrega,
    f.total
FROM cliente c
LEFT JOIN factura f ON c.id_cliente = f.id_cliente;
-- Consulta con UNION: Combina las facturas de dos clientes diferentes en una lista.
SELECT id_factura, fecha_venta, fecha_entrega, total FROM factura WHERE id_cliente = 1
UNION
SELECT id_factura, fecha_venta, fecha_entrega, total FROM factura WHERE id_cliente = 2;
-- Consulta con CASE: Utiliza la cláusula CASE para clasificar a los clientes según la cantidad total gastada en facturas.
SELECT 
    c.nombre_completo,
    SUM(f.total) AS total_gastado,
    CASE 
        WHEN SUM(f.total) < 50 THEN 'Cliente Económico'
        WHEN SUM(f.total) >= 50 AND SUM(f.total) < 100 THEN 'Cliente Regular'
        WHEN SUM(f.total) >= 100 THEN 'Cliente Premium'
    END AS categoria_cliente
FROM cliente c
LEFT JOIN factura f ON c.id_cliente = f.id_cliente
GROUP BY c.nombre_completo;

-- Actualizaciones y eliminaciones:

-- Tabla cliente
-- Actualizar el nombre completo del cliente con id 1
UPDATE cliente SET nombre_completo = 'Nuevo Nombre' WHERE id_cliente = 1;

-- Actualizar la fecha de nacimiento del cliente con id 2
UPDATE cliente SET fecha_nacimiento = '1990-05-20' WHERE id_cliente = 2;

-- Actualizar el género del cliente con id 3
UPDATE cliente SET genero = 'F' WHERE id_cliente = 3;

-- Eliminar el cliente con id 4
DELETE FROM cliente WHERE id_cliente = 4;

-- Eliminar todos los clientes que tienen género 'M'
DELETE FROM cliente WHERE genero = 'M';

-- Tabla factura
-- Actualizar la fecha de entrega de la factura con id 1
UPDATE factura SET fecha_entrega = '2023-01-15' WHERE id_factura = 1;

-- Actualizar el total de la factura con id 2
UPDATE factura SET total = 90.00 WHERE id_factura = 2;

-- Eliminar la factura con id 3
DELETE FROM factura WHERE id_factura = 3;

-- Eliminar todas las facturas asociadas al cliente con id 5
DELETE FROM factura WHERE id_cliente = 5;

-- Tabla producto
-- Actualizar el nombre del producto con id 1
UPDATE producto SET nombre_producto = 'Nuevo Producto' WHERE id_producto = 1;

-- Actualizar el valor unitario del producto con id 2
UPDATE producto SET valor_unitario = 18.00 WHERE id_producto = 2;

-- Eliminar el producto con id 3
DELETE FROM producto WHERE id_producto = 3;

-- Eliminar todos los productos con valor unitario menor a 10.00
DELETE FROM producto WHERE valor_unitario < 10.00;

-- Tabla factura_producto
-- Actualizar la cantidad de productos en la factura con id 1 y producto id 4
UPDATE factura_producto SET cantidad = 5 WHERE id_factura = 1 AND id_producto = 4;

-- Eliminar todas las asociaciones de productos a la factura con id 2
DELETE FROM factura_producto WHERE id_factura = 2;

-- Eliminar todas las asociaciones de productos al producto con id 7
DELETE FROM factura_producto WHERE id_producto = 7;
