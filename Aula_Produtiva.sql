CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Estudantes(
	id_estudantes INT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    data_nascimento DATE
);

INSERT INTO Estudantes (id_estudantes, nome, idade, data_nascimento) VALUES
(1, 'Eduardo Quaresma', 16, '2008-10-10'),
(2, 'Carl Jhonson', 16, '2008-05-28'),
(3, 'Ronald McDonald', 18, '2006-09-16'),
(4, 'Donaldson Trumpet', 24, '2000-03-30'),
(5, 'Ben Dover', 17, '2007-01-01');

SELECT * FROM Estudantes;

SELECT * FROM Estudantes WHERE idade > 18;

SELECT * FROM Estudantes ORDER BY idade DESC;

SELECT * FROM Estudantes ORDER BY idade DESC LIMIT 3;

SELECT COUNT(id_estudantes) AS TotalEstudantse FROM Estudantes;

SELECT AVG(idade) AS MediaIdades FROM Estudantes;

SELECT min(idade) AS idade_minima, max(idade) AS idade_maxima FROM Estudantes;