use db_contas_a_pagar;

select tb_fornecedor.cnpj,tb_fornecedor.razao_social,tb_pedido_quitacao.valor_pago,tb_pedido.valor_pedido
from tb_fornecedor
left join tb_pedido on tb_fornecedor.id=tb_pedido.id_fornecedor
left join tb_pedido_quitacao on tb_pedido.id=tb_pedido_quitacao.id_pedido
where valor_pago is null