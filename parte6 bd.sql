use db_contas_a_pagar;

select tb_fornecedor.cnpj,tb_fornecedor.razao_social,sum(tb_pedido.valor_pedido) as valor_a_pagar
from tb_fornecedor
left join tb_pedido on tb_fornecedor.id=tb_pedido.id_fornecedor
left join tb_pedido_quitacao on tb_pedido.id=tb_pedido_quitacao.id_pedido
where year(tb_pedido.data_vencimento)=2023
and tb_pedido_quitacao.valor_pago is null
group by tb_fornecedor.cnpj,tb_fornecedor.razao_social;
