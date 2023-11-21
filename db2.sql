create database db_vendas;
use db_vendas;
CREATE TABLE tb_vendedor (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(40) NOT NULL,
  cpf char(11) NOT NULL,
  dt_nasc date NOT NULL,
  dt_cadastro datetime DEFAULT CURRENT_TIMESTAMP,
  telefone varchar(11) DEFAULT NULL,
  comissao decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY un_vendedor (cpf)
);
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR1','13769655107',7,'2018-06-28','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR2','10467905411',3,'2006-07-06','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR3','18910395496',3,'2011-03-04','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR4','12821252437',7,'1998-09-28','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR5','14109978678',4,'2011-03-30','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR6','16043236991',5,'2018-05-12','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR7','14206237112',6,'1991-01-16','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR8','19296066733',6,'2016-06-28','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR9','16481710082',8,'1999-12-16','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR10','14764586562',5,'2018-08-25','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR11','11849021269',7,'2022-09-12','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR12','19613011594',5,'2012-07-10','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR13','19078535071',8,'2002-10-30','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR14','11392403281',4,'2004-11-03','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR15','11014097229',4,'1995-02-28','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR16','15590788473',4,'2010-05-19','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR17','16003957556',3,'1992-12-25','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR18','14849831655',5,'1994-06-08','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR19','15909505889',4,'2019-12-03','');
insert into tb_vendedor(nome,cpf,comissao,dt_nasc,telefone)values('VENDEDOR20','18329393612',8,'2023-07-03','');