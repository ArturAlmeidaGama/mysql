/*
Este banco de dados, tem como objetivo permitir o gerencimento de pagamentos realizados ou a realizar conforme o pedidos feitos aos fornecedores.
*/

create database db_contas_a_pagar;
use db_contas_a_pagar;

create table tb_tipo_contato
(
id int auto_increment,
descricao varchar(15),
constraint pk_tipo_contato primary key(id)
);

create table tb_fornecedor
(
id int auto_increment,
cnpj char(14),
razao_social varchar(50),
constraint pk_fornecedor primary key (id),
constraint un_fornecedor unique (cnpj)
);

create table tb_fornecedor_contato
(
id int auto_increment,
id_fornecedor int,
email varchar(70),
telefone varchar(12),
id_tipo_contato int,
constraint pk_forn_contato primary key(id),
constraint fk_forncontato_tipo_contato foreign key(id_tipo_contato)
references tb_tipo_contato (id),
constraint fk_forncontato_fornecedor foreign key (id_fornecedor)
references tb_fornecedor (id)
);

create table tb_pedido
(
id int auto_increment,
numero_pedido int,
id_fornecedor int,
data_pedido date,
data_vencimento date,
valor_pedido numeric(10,2),
constraint pk_pedido primary key(id),
constraint un_pedido unique (numero_pedido,id_fornecedor),
constraint fk_pedido_fornecedor foreign key (id_fornecedor)
references tb_fornecedor (id)
);

create table tb_pedido_quitacao
(
id_pedido int,
valor_pago numeric(10,2),
data_pagamento date,
constraint pk_pedidquitacao primary key (id_pedido),
constraint fk_pedidoquitacao_pedido foreign key (id_pedido)
references tb_pedido (id)
);

create table tb_log_pedido
(
id int auto_increment,
id_pedido int,
data_registro datetime default now(),
id_fornecedor_old int,
valor_pedido_old numeric(12 , 2 ),
id_fornecedor_new int,
valor_pedido_new numeric(12 , 2 ),
constraint pk_logpedido primary key (id)
);

delimiter //
create trigger tgr_logpedido before update on tb_pedido
  for each row
  begin
	insert into tb_log_pedido(id_pedido,id_fornecedor_old,valor_pedido_old,id_fornecedor_new,valor_pedido_new)
    values(OLD.id,old.id_fornecedor,old.valor_pedido,NEW.id_fornecedor,NEW.valor_pedido);
  end;
//

#inserts --------------------------------------------------------------------------------------------------------------------------------------------

#tipo contato
insert into tb_tipo_contato(descricao)values('comercial'),('financeiro'),('outros');

#fornecedor
INSERT INTO tb_fornecedor(razao_social,cnpj)values('GERDAU','17941044861');
INSERT INTO tb_fornecedor(razao_social,cnpj)values('ABC SERVICOS ESPECIALIZADOS','37150079130');
INSERT INTO tb_fornecedor(razao_social,cnpj)values('X-PORTARIAS','38819416161');
INSERT INTO tb_fornecedor(razao_social,cnpj)values('JOCA PAISAGISMO','14372324522');
INSERT INTO tb_fornecedor(razao_social,cnpj)values('DEV SOFTWARES','2640700710');

#contatos
insert into tb_fornecedor_contato(id_fornecedor,email,telefone,id_tipo_contato)values(1,'comercial1@gerdau.com.br','11958823869',1);
insert into tb_fornecedor_contato(id_fornecedor,email,telefone,id_tipo_contato)values(3,'comercialsp@xportarias.com.br','11998809985',1);
insert into tb_fornecedor_contato(id_fornecedor,email,telefone,id_tipo_contato)values(4,'comercial@jocap.com.br','11943483983',1);
insert into tb_fornecedor_contato(id_fornecedor,email,telefone,id_tipo_contato)values(1,'cobranca@gerdau.com.br','1143996530',2);
insert into tb_fornecedor_contato(id_fornecedor,email,telefone,id_tipo_contato)values(2,'cobranca@abcservices.com','1149162730',2);
insert into tb_fornecedor_contato(id_fornecedor,email,telefone,id_tipo_contato)values(4,'cobranca@jocap.com.br','1146651403',2);

#pedido
#region
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-01-05','2023-02-05',2002.77,3919);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-01-20','2023-02-20',3772.02,3614);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-02-04','2023-03-07',5773.2,1769);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-02-19','2023-03-22',3404.7,6025);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-03-06','2023-04-06',2182.4,8261);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-03-21','2023-04-21',2621.84,5062);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-04-05','2023-05-06',3578.74,5480);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-04-20','2023-05-21',2566.8,2423);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-05-05','2023-06-05',3824.01,6430);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-05-20','2023-06-20',4526.86,7736);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-06-04','2023-07-05',3440.88,5428);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-06-19','2023-07-20',1755,3888);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-07-04','2023-08-04',2258.11,3050);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-07-19','2023-08-19',2587.65,1125);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-08-03','2023-09-03',4101.13,3810);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-08-18','2023-09-18',4126.85,6297);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-09-02','2023-10-03',3837.96,3990);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-09-17','2023-10-18',3954.51,8053);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-10-02','2023-11-02',4176.94,2383);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(1,'2023-10-17','2023-11-17',1962.4,4514);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-01-10','2023-02-10',1341.98,8730);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-02-10','2023-03-13',706.56,8968);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-03-13','2023-04-13',1362.3,6020);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-04-13','2023-05-14',756.56,6752);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-05-14','2023-06-14',858.78,5173);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-06-14','2023-07-15',1028.4,6199);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-07-15','2023-08-15',1809.36,4608);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-08-15','2023-09-15',2330.64,6617);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-09-15','2023-10-16',1595.58,1422);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(2,'2023-10-16','2023-11-16',1945.82,8564);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-01-10','2023-01-16',5288.4,8724);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-02-10','2023-02-16',4947.48,7912);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-03-13','2023-03-19',7092.59,6486);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-04-13','2023-04-19',6723.64,3720);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-05-14','2023-05-19',3864.6,5412);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-06-14','2023-06-20',4914.72,5315);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-07-15','2023-07-20',5650.32,6884);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-08-15','2023-08-21',4239.48,5146);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-09-15','2023-09-21',3521.29,1443);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(3,'2023-10-16','2023-10-22',5857.46,7041);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-01-05','2023-01-11',6860.7,6480);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-02-19','2023-02-24',3325.76,1600);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-04-05','2023-04-11',5880.03,7947);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-05-20','2023-05-25',5089.28,8583);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-07-04','2023-07-10',3669.96,5443);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-08-18','2023-08-24',2624.16,2659);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(4,'2023-10-02','2023-10-08',8172.2,3495);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-01-20','2023-01-31',2268.42,1299);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-02-20','2023-03-04',836.19,4104);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-03-23','2023-04-04',744.94,8247);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-04-23','2023-05-04',500,3749);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-05-24','2023-06-05',500,6098);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-06-24','2023-07-04',500,6787);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-07-25','2023-08-06',1049.16,5832);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-08-25','2023-09-05',1094.3,6365);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-09-25','2023-10-07',1314.04,6516);
insert into tb_pedido(id_fornecedor,data_pedido,data_vencimento,valor_pedido,numero_pedido)values(5,'2023-10-20','2023-11-04',500,4850);

#quitacao de pedido
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(1,'2023-02-05',2002.77);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(2,'2023-02-23',4224.6624);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(3,'2023-03-07',5773.2);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(4,'2023-03-23',3540.888);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(5,'2023-04-06',2182.4);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(6,'2023-04-21',2621.84);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(7,'2023-05-06',3578.74);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(8,'2023-05-21',2566.8);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(9,'2023-06-05',3824.01);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(10,'2023-06-20',4526.86);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(11,'2023-07-05',3440.88);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(12,'2023-07-20',1755);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(13,'2023-08-05',2348.4344);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(14,'2023-08-21',2794.662);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(15,'2023-09-03',4101.13);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(16,'2023-09-18',4126.85);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(17,'2023-10-03',3837.96);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(18,'2023-10-18',3954.51);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(21,'2023-02-10',1341.98);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(22,'2023-03-13',706.56);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(23,'2023-04-13',1362.3);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(24,'2023-05-14',756.56);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(25,'2023-06-14',858.78);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(26,'2023-07-15',1028.4);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(27,'2023-08-15',1809.36);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(28,'2023-09-15',2330.64);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(29,'2023-10-16',1595.58);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(31,'2023-01-16',5288.4);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(32,'2023-02-16',4947.48);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(33,'2023-03-19',7092.59);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(34,'2023-04-19',6723.64);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(35,'2023-05-21',4173.768);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(36,'2023-06-20',4914.72);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(37,'2023-07-20',5650.32);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(38,'2023-08-21',4239.48);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(39,'2023-09-21',3521.29);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(41,'2023-01-11',6860.7);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(42,'2023-02-24',3325.76);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(43,'2023-04-11',5880.03);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(44,'2023-05-25',5089.28);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(45,'2023-07-10',3669.96);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(46,'2023-08-24',2624.16);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(47,'2023-10-08',8172.2);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(48,'2023-01-31',2268.42);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(49,'2023-03-04',836.19);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(50,'2023-04-04',744.94);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(51,'2023-05-04',500);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(52,'2023-06-05',500);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(53,'2023-07-04',500);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(54,'2023-08-06',1049.16);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(55,'2023-09-05',1094.3);
insert into tb_pedido_quitacao(id_pedido,data_pagamento,valor_pago)values(56,'2023-10-07',1314.04);

#1 - criar um relatorio onde seja exibido o id, nome, cnpj, telefone e email (comercial) de todos os fornecedores.
#2 - crie um relatório para que seja possivel visualizar todos os fornecedores que nao possuem contatos cadastrado
#3 - crie um relatorio analitico dos pedidos. nesse relatorio deve exibir o id do pedido(numero de controle), numero do pedido, cnpj e nome do fornecedor,data do pedido,data de vencimento,valor do pedido,data do pagamento e valor pago de todas as contas com vencimento nos dois ultimos meses
#4 - crie um relatorio analitico dos pedidos que ainda nao foram pagos ao longo do ano de 2023 (considere a data de vencimento). nesse relatorio deve exibir o id do pedido(numero de controle), numero do pedido, cnpj e nome do fornecedor,data do pedido,data de vencimento,valor do pedido
#5 - Crie um relatório sintetico para totalizar o valor pago, alem de calcular o valor gasto em media por fornecedor ao longo de 2023. Nesse relatório deverá ser exibido o cnpj, razao social e o valor pago.
#6 - Crie um relatório sintetico que exiba o valor a pagar por fornecedor ao longo de 2023. Nesse relatório deverá ser exibido o cnpj, razao social e o valor a pagar.
#7 - Crie um relatório sintetico para totalizar o valor pago, alem de calcular o valor gasto em media por mes ao longo de 2023. Nesse relatório deverá ser exibido o mes e o valor pago.
#8 - Crie um relatório que exiba o mes de pagamento e o maior valor pago ao longo de 2023
#9 - crie um relatorio analitico dos pedidos. nesse relatorio deve exibir o id do pedido(numero de controle), numero do pedido, cnpj e nome do fornecedor,data do pedido,data de vencimento,valor do pedido,data do pagamento e valor pago,pgto com atraso,valor de juros de todas as contas com vencimento nos dois ultimos meses.
#10 - crie um relatório sintetico totalizando o valor total de juros por mes. Considere o ano de 2023.