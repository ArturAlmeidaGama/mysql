create database dbGerencia;
use dbGerencia;
create table tbMontadora
(
id int auto_increment,
nome varchar(100) not null,
primary key(id)
);
create table tbVeiculo
(
id int auto_increment,
nome varchar(100) not null,
idMontadora int,
primary key (id),
foreign key(idMontadora)references tbMontadora(id)
);
create table tbProduto
(
id int auto_increment,
nome varchar(100) not null,
primary key (id)
);
create table tbveiculoProduto
(
idVeiculo int,
idProduto int,
primary key(idVeiculo, idProduto),
foreign key (idVeiculo) references tbVeiculo (id),
foreign key (idProduto) references tbProduto (id)
);

INSERT INTO `dbgerencia`.`tbMontadora` (`nome`) VALUES ('aron');
INSERT INTO `dbgerencia`.`tbMontadora` (`nome`) VALUES ('bill');
INSERT INTO `dbgerencia`.`tbMontadora` (`nome`) VALUES ('chevro');
INSERT INTO `dbgerencia`.`tbMontadora` (`nome`) VALUES ('dolima');
INSERT INTO `dbgerencia`.`tbVeiculo` (`nome`, `idMontadora`) VALUES ('elio', '1');
INSERT INTO `dbgerencia`.`tbVeiculo` (`nome`, `idMontadora`) VALUES ('forza', '2');
INSERT INTO `dbgerencia`.`tbVeiculo` (`nome`, `idMontadora`) VALUES ('ion', '3');
INSERT INTO `dbgerencia`.`tbVeiculo` (`nome`, `idMontadora`) VALUES ('jotav', '4');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('a');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('b');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('c');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('d');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('e');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('f');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('g');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('h');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('i');
INSERT INTO `dbgerencia`.`tbProduto` (`nome`) VALUES ('j');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('1', '1');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('1', '2');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('1', '3');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('2', '4');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('2', '5');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('2', '6');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('3', '7');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('3', '8');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('3', '9');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('4', '10');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('4', '1');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('4', '2');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('3', '3');
INSERT INTO `dbgerencia`.`tbveiculoProduto` (`idVeiculo`, `idProduto`) VALUES ('3', '6');

select v.id as tbVeiculo, v.nome as tbVeiculo, m.nome as tbMontadora, p.id as tbProduto, p.nome as tbProduto
from tbveiculoProduto vp
inner join tbVeiculo v on vp.idVeiculo = v.id
inner join tbMontadora m on v.idMontadora = m.id
inner join tbProduto p on vp.idProduto = p.id

update tbVeiculo
set nome='vloks TEMPORARIO'
where idMontadora=2

select m.nome as tbMontadora, v.nome as tbVeiculo
from tbVeiculo tv
inner join tbVeiculo v on tv.id = v.id
inner join tbMontadora m on tv.idMontadora = m.id