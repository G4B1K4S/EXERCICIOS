create database joins_pii_ex6;

use joins_pii_ex6;

create table modelo(
codMod int,
Nome varchar(10),
Marca varchar(10),
primary key (codMod)
);

create table cliente(
NIF int,
Nome Varchar(20),
dtNasc date,
primary key (NIF)
);

create table estacionamento(
Num int,
Piso int,
Capacidade int,
primary key (Num)
);

create table veiculo(
Matricula varchar(8),
Modelo_codMod int,
Cliente_NIF int,
cor varchar(10),
primary key (Matricula),
foreign key (Modelo_codMod) references modelo(codMod),
foreign key (Cliente_NIF) references cliente(NIF)
);

create table estaciona(
cod int,
estacionamento_num int,
veiculo_Matricula varchar(8),
dataEntrada date,
dataSaida date,
horaEntrada Time,
horaSaida time,
primary key (cod),
foreign key (estacionamento_num) references estacionamento(Num),
foreign key (veiculo_Matricula) references veiculo(Matricula)
);

insert into modelo values
(1,'911 gt3rs','porsche'),
(2,'206','peugeot'),
(3,'clio','renault');

insert into cliente values
(524,'Jalam Bipau','1997-02-10'),
(900,'Jacinto Pinto','2001-09-15'),
(128,'Paulo Brificado','1995-12-25');

insert into estacionamento values
(1,1,50),
(2,1,50),
(3,2,75);

insert into veiculo values
('BRA-4567',1,524,'Branco'),
('XYZ-8293',2,900,'Azul'),
('QKL-3048',3,128,'Preto');

insert into estaciona values
(48572913,1,'BRA-4567','2024-11-12','2024-11-12','06:00:00','10:05:00'),
(67218354,2,'XYZ-8293','2024-11-13','2024-11-14','10:30:00','16:30:00'),
(92356187,3,'QKL-3048','2024-11-13','2024-11-13','09:45:00','11:00:00');

#ex A
select Matricula,Nome 
from veiculo n
join cliente d
on n.Cliente_NIF=d.NIF;

#ex B
select NIF,Nome 
from cliente n 
join veiculo d 
on n.NIF=d.Cliente_NIF 
where Matricula='XYZ-8293';

#ex C
select Matricula,Cor 
from Veiculo d 
join estaciona n 
on d.Matricula=n.veiculo_matricula 
where estacionamento_num=1;

#ex D
alter table veiculo 
add column ano_lancamento int;

update veiculo 
set ano_lancamento = 1964
where Matricula = 'BRA-4567';

update veiculo 
set ano_lancamento = 1972 
where Matricula = 'XYZ-8293';

update veiculo 
set ano_lancamento = 1974 
where Matricula = 'QKL-3048';

select matricula,ano_lancamento 
from veiculo I 
join estaciona II 
on I.Matricula=II.veiculo_matricula 
where estacionamento_num=2;

#ex E
select dataEntrada,dataSaida 
from estaciona I 
join veiculo II 
on I.veiculo_matricula=II.Matricula 
where Matricula='XYZ-8293';

#ex F
select nome 
from cliente I 
join veiculo II 
on I.NIF=II.Cliente_NIF 
where II.Modelo_CodMod in (1);

#ex G
select Matricula,horaEntrada,horaSaida 
from veiculo I 
join estaciona II 
on I.Matricula=II.veiculo_matricula 
where Cor='preto' and matricula like '%s%';

#ex H
select nome 
from cliente I 
join veiculo II on I.NIF=II.Cliente_NIF 
join estaciona III on II.Matricula=III.veiculo_matricula 
where estacionamento_num=2;

#ex I
select Cliente_NIF 
from veiculo I 
join estaciona II 
on I.Matricula=II.veiculo_matricula 
where estacionamento_num=3;