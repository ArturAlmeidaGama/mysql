use db_contas_a_pagar;

select f.id,f.cnpj,f.razao_social,fc.email,fc.telefone,tc.descricao
from tb_fornecedor f
left join tb_fornecedor_contato fc on f.id=fc.id_fornecedor
left join tb_tipo_contato tc on fc.id_tipo_contato=tc.id
where fc.id_fornecedor is null