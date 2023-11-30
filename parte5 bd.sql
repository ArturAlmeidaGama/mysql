use db_contas_a_pagar;

select tb_fornecedor.cnpj,tb_fornecedor.razao_social,sum(tb_pedido_quitacao.valor_pago) as total_pago,avg(tb_pedido_quitacao.valor_pago) as media
from tb_pedido
inner join tb_pedido_quitacao on tb_pedido.id=tb_pedido_quitacao.id_pedido
inner join tb_fornecedor on tb_pedido.id_fornecedor=tb_fornecedor.id
where year(tb_pedido.data_vencimento)=2023
group by tb_fornecedor.cnpj,tb_fornecedor.razao_social;
