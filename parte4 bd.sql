use db_contas_a_pagar;

select tb_pedido.id,tb_pedido.numero_pedido,tb_fornecedor.cnpj,tb_fornecedor.razao_social,tb_pedido.data_pedido,tb_pedido.data_vencimento,tb_pedido.valor_pedido,tb_pedido_quitacao.valor_pago
from tb_pedido
left join tb_pedido_quitacao on tb_pedido.id=tb_pedido_quitacao.id_pedido
left join tb_fornecedor on tb_pedido.id_fornecedor=tb_fornecedor.id
where year(tb_pedido.data_vencimento)=2023
and tb_pedido_quitacao.id_pedido is null