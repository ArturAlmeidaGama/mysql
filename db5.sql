create database dbBanco;
use dbBanco;
create table tbFornecedor
(
idF int auto_increment,
nomeF varchar(100) not null,
cnpj char(14) not null,
dataCF datetime default now(),
constraint unF unique(cnpj),
constraint pkF primary key(idF)
);
create table tbAdmin
(
idA int auto_increment,
nomeA varchar(100) not null,
cpfA char(11) not null,
dataCA datetime default now(),
comissao numeric(11,2) not null,
nascA date not null,
constraint unA unique(cpfA),
constraint pkA primary key(idA)
);
create table tbCliente
(
idC int auto_increment,
nomeC varchar(100) not null,
cpfC char(11) not null,
dataCC datetime default now(),
nascC date not null,
endereco varchar(100) not null,
idCA int,
constraint unC unique(cpfC),
constraint pkC primary key(idC),
constraint fkC foreign key(idCA) references tbFornecedor(idF)
);
create table tbProduto
(
idP int auto_increment,
nomeP varchar(100) not null,
dataCP datetime default now(),
dataV date not null,
idPF int,
constraint pkP primary key(idP),
constraint fkP foreign key(idPF) references tbFornecedor(idF)
);
create table tbClienteProduto
(
idCPC int,
idCPP int,
constraint pkCP primary key(idCPC, idCPP),
constraint fkCPC foreign key(idCPC) references tbCliente(idC),
constraint fkCPP foreign key(idCPP) references tbFornecedor(idF)
);