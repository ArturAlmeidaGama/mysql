create database dbMacDonalds;
use dbMacDonalds;
create table tbProduto
(
idProduto int not null,
nmProduto varchar(100) not null,
vlProduto decimal(5,2) not null,
primary key(idProduto)
);
create table tbPedido
(
idPedido int not null,
vlTotal decimal(8,2) not null,
vlTotalPago decimal(8,2) not null,
formaPag varchar(50) not null,
primary key(idPedido)
);
create table tbPedidoItem
(
idProdutoItem int not null,
idPedidoItem int not null,
vlProdutoItem decimal(5,2) not null,
qtde int not null,
primary key(idProdutoItem,idPedidoItem),
foreign key(idProdutoItem)references tbProduto(idProduto),
foreign key(idPedidoItem)references tbPedido(idPedido)
);
INSERT INTO `dbmacdonalds`.`tbProduto` (`idProduto`, `nmProduto`, `vlProduto`) VALUES ('1', 'big mac', '14.00');
INSERT INTO `dbmacdonalds`.`tbProduto` (`idProduto`, `nmProduto`, `vlProduto`) VALUES ('2', 'batata', '8.00');
INSERT INTO `dbmacdonalds`.`tbProduto` (`idProduto`, `nmProduto`, `vlProduto`) VALUES ('3', 'coca', '5.00');
INSERT INTO `dbmacdonalds`.`tbProduto` (`idProduto`, `nmProduto`, `vlProduto`) VALUES ('4', 'big tasty', '34.00');
select * from tbProduto