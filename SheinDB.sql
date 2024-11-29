CREATE DATABASE shein;

use shein;

CREATE TABLE clientes(
	id_cliente INT,
    nome_cliente VARCHAR(30),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE pedidos(
	id_pedido INT,
    id_cliente INT,
    data_pedido DATE,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes(id_cliente, nome_cliente) VALUES
(1, 'Zé Tó'),
(2, 'Manel Joel'),
(3, 'Quim Marreiros'),
(4, 'Cristano Rolando');

INSERT INTO pedidos(id_pedido, id_cliente, data_pedido) VALUES
(3, 1, '2024-11-20'),
(1, 2, '2024-11-15'),
(4, 3, '2024-12-03'),
(2, 4, '2024-11-18');

SELECT pedidos.id_pedido, pedidos.id_cliente, pedidos.data_pedido
FROM pedidos
INNER JOIN clientes
ON pedidos.id_cliente = clientes.id_cliente; 