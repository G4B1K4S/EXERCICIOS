CREATE DATABASE Empresa;
USE Empresa;

CREATE TABLE funcionarios(
	id_funcionario INT AUTO_INCREMENT,
    nome VARCHAR(40),
    morada VARCHAR(40),
    contacto INT,
    PRIMARY KEY(id_funcionario)
);

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(40),
    morada VARCHAR(40),
    contacto INT,
    id_funcionario INT,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(id_funcionario) references funcionarios(id_funcionario)
);

SELECT * FROM clientes, funcionarios;

INSERT INTO funcionarios(id_funcionario, nome, morada, contacto) VALUES
(1, 'Powêr Guido', 'Rua das bananas', 911112567),
(2, 'Aldolfo Hinter', 'Estrada do Olocausto', 1943194523),
(3, 'Rei mamaco', 'Camaroeiro', 821379123),
(4, 'Paulo Flácido', 'Liquidificador da Temu', 657835490),
(5, 'Pintorest da Silva', 'Rua do Pombo', 696969696),
(6, 'Thony Tins', 'CornPub Street', 123456789);

INSERT INTO clientes(id_cliente, nome, morada, contacto, id_funcionario) VALUES
(1, 'António Pau', 'Rua do Dragão', 911112567, 1),
(2, 'Jão Santanás', 'The way to hell', 1943194523, 4),
(3, 'Sérgio Tartaruga', 'Oceano Antlântico', 821379123, 6),
(4, 'Diego Cério', 'Rua das bananas', 657835490, 2),
(5, 'Jay Z', 'Prisão com P.Diddy', 696969696, 3),
(6, 'Gabriel Wagon', 'Rua da moca', 123456789, 5);

SELECT * FROM clientes;
SELECT * FROM funcionarios;

SELECT funcionarios.nome
FROM funcionarios 
CROSS JOIN clientes
ON funcionarios.id_funcionario = clientes.id_funcionario;

SELECT funcionarios.nome
FROM funcionarios
INNER JOIN clientes 
ON funcionarios.id_funcionario = clientes.id_funcionario;	

SELECT funcionarios.nome
FROM funcionarios
LEFT OUTER JOIN clientes
ON funcionarios.id_funcionario = clientes.id_funcionario;

SELECT funcionarios.nome
FROM funcionarios
RIGHT OUTER JOIN clientes
ON funcionarios.id_funcionario = clientes.id_funcionario;
