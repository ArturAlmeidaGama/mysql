create database dbControle;
use dbControle;
create table tbOperador
(
matricula int not null,
nome varchar(100) not null,
primary key(matricula),
unique(matricula)
);
create table tbMaquina
(
codigo int not null,
qtdProd int not null,
primary key(codigo),
unique(codigo)
);
create table tbPeca
(
id int,
metaPeca int not null,
primary key(id),
unique(id)
);
create table tbOperacao
(
idOperador int,
idMaquina int,
idPeca int,
horaInicial datetime,
horaFinal datetime,
pecaProduzida int,
foreign key (idOperador) references tbOperador(matricula),
foreign key (idMaquina) references tbMaquina(codigo),
foreign key (idPeca) references tbPeca(id)
);