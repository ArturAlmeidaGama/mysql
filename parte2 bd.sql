use db_contas_a_pagar;

select tb_fornecedor.id,tb_fornecedor.cnpj,tb_fornecedor.razao_social,tb_fornecedor_contato.email,tb_fornecedor_contato.telefone,tb_tipo_contato.descricao
from tb_fornecedor
left join tb_fornecedor_contato on tb_fornecedor.id=tb_fornecedor_contato.id_fornecedor
left join tb_tipo_contato on tb_fornecedor_contato.id_tipo_contato=tb_tipo_contato.id
where tb_fornecedor_contato.id_fornecedor is null
