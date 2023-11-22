use db_contas_a_pagar;

select tb_fornecedor_contato.id_fornecedor,tb_fornecedor_contato.email,tb_fornecedor_contato.telefone,tb_fornecedor.cnpj,tb_fornecedor.razao_social
from tb_fornecedor_contato
inner join tb_fornecedor on tb_fornecedor_contato.id_fornecedor=tb_fornecedor.id
inner join tb_tipo_contato on tb_fornecedor_contato.id_tipo_contato=tb_tipo_contato.id
where tb_tipo_contato.descricao='comercial'