CREATE DATABASE Escola;

USE Escola;

CREATE TABLE Estudantes(
	id INT, 
    Nome VARCHAR(40),
    idade INT,
    data_nascimento DATE,
    PRIMARY KEY(id)
);

INSERT INTO Estudantes VALUES
(1, 'Paulo Brificado', 41, '1983-05-12'),
(2, 'Eduardo Pereira', 15, '2008-12-23'),
(3, 'Martim Bocareste', 16, '2008-10-05');

UPDATE Estudantes
SET idade = 12, data_nascimento = '2012-10-23'
WHERE id = 2;

DELETE FROM Estudantes WHERE idade > 35;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Sum (
	pedidoID INT,
	Empresa VARCHAR(20),
    Quantidade INT
);

INSERT INTO Sum VALUES
(1,'A',20),
(2,'B',50),
(3,'B',50);

SELECT sum(quantidade) AS Sum_total FROM Sum;

SELECT Empresa, SUM(quantidade) AS Sum_total 
FROM Sum
GROUP BY empresa;

INSERT INTO sum VALUES
(4,'B', null),
(5,'C', null); 

SELECT sum(idade) AS Total_idades FROM Estudantes;

SELECT sum(idade) AS Total_idades_Maiores_18 FROM Estudantes
WHERE idade > 18;


SELECT COUNT(*) AS Total_estudantes FROM Estudantes;

SELECT COUNT(*) AS Total_estudantes FROM Estudantes
WHERE idade > 20;

INSERT INTO sum VALUES
(6,'A', 20),
(7,'C', 70);

SELECT AVG(Quantidade) AS Media_Quantidade FROM SUM;

SELECT Empresa, AVG(Quantidade) AS Media_Empresa 
FROM sum
GROUP BY Empresa;


CREATE TABLE MinMax(
	pedidoID INT,
    Cliente VARCHAR(20),
    data_entrega DATE
);

INSERT INTO MinMax VALUES
(1, 'Canilo Popa', '2024-05-12'),
(2, 'Elenga Martinez', '2024-12-23'),
(3, 'Piropu Silva','2024-10-05');

SELECT * FROM MinMax;

SELECT MIN(data_nascimento) FROM minmax;
SELECT max(data_nascimento) FROM minmax;

SELECT * FROM Estudantes;