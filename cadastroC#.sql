create database dbCadastro;
use dbCadastro;
create table tbCliente
(
nome varchar(100) not null,
id int auto_increment,
cpf char(11) not null,
email varchar(256) not null,
primary key(id),
unique key unCliente(cpf)
);
insert into tbcliente(nome,cpf,email) values('artur','12345678901','qwertyuiop@gama');
select * from tbCliente;