CREATE  DATABASE joins_pii_ex6;

use joins_pii_ex6;

CREATE TABLE modelo(
	codMod INT,
	Nome VARCHAR(10),
    Marca VARCHAR(10),
    PRIMARY KEY(codMod) 
);

CREATE TABLE veiculo(
	Matricula VARCHAR(8),
    cor VARCHAR(15),
    codMod int,
    NIF int,
    PRIMARY KEY(Matricula),
    FOREIGN KEY(codMod) REFERENCES modelo(codMod),
    FOREIGN KEY(NIF) REFERENCES cliente(NIF)
);

CREATE TABLE cliente(
	NIF INT,
    Nome VARCHAR(30),
    dtNasc DATE,
    PRIMARY KEY(NIF)
);

CREATE TABLE estacionamento(
	Num INT,
    Piso INT,
    Capacidade INT,
    PRIMARY KEY(Num)
);

CREATE TABLE estaciona(
	cod INT,
    dataEntrada DATE,
    dataSaida DATE,
    horaEntrada TIME,
    horaSaida TIME,
    Matricula VARCHAR(9),
    Num INT,
    PRIMARY KEY(cod),
    FOREIGN KEY(Matricula) REFERENCES veiculo(Matricula),
    FOREIGN KEY(Num) REFERENCES estacionamento(Num)
);

INSERT INTO modelo VALUES
(1,"Serie A","BMW"),
(2,"Corolla","Toyota"),
(3,"208","Peugeot");


INSERT INTO cliente VALUES
(123456789,"Paulo Brificado","2000-10-28"),
(987654321,"Jalam Bipau","2000-05-15"),
(265128257,"Jacinto Pinto","2000-12-02");

INSERT INTO veiculo VALUES
("BRA-4567", "amarelo",1,123456789),
("XYZ-8293", "cinzento",2,987654321),
("QKL-3048", "cinzento",3,265128257);

INSERT INTO estacionamento VALUES
(20,1,30),
(21,1,30),
(40,2,25);

INSERT INTO estaciona VALUES
(1,"2024-11-05","2024-11-26","03:09:04","15:30:17","BRA-4567",20),
(2,"2024-11-19","2024-11-22","18:00:00","15:23:09","XYZ-8293",21),
(3,"2024-09-27","2024-10-20","05:00:56","14:50:36","QKL-3048",40);

#exA
SELECT veiculo.Matricula, cliente.Nome
FROM veiculo
INNER JOIN cliente
ON  veiculo.NIF = cliente.NIF;

#exB "21-FC-41" = "XYZ-8293"
SELECT cliente.NIF, cliente.Nome
FROM cliente
LEFT OUTER JOIN veiculo
ON veiculo.NIF = cliente.NIF
WHERE Matricula = "XYZ-8293";

#exC
ALTER TABLE estacionamento
ADD COLUMN Matricula VARCHAR(8);

ALTER TABLE estacionamento
ADD CONSTRAINT Matricula
FOREIGN KEY(Matricula) REFERENCES veiculo(Matricula);

UPDATE estacionamento 
SET matricula = "BRA-4567";

SELECT veiculo.Matricula, veiculo.cor
FROM veiculo
RIGHT OUTER JOIN estacionamento 
ON veiculo.Matricula = estacionamento.Matricula
WHERE estacionamento.Num = 20;

#exD
ALTER TABLE veiculo
ADD COLUMN ano DATE;

ALTER TABLE estacionamento
ADD COLUMN ano DATE;

ALTER TABLE veiculo
ADD CONSTRAINT ano
FOREIGN KEY(ano) REFERENCES veiculo(ano);

UPDATE veiculo 
SET ano = "BRA-4567";

SET sql_safe_updates = 0;