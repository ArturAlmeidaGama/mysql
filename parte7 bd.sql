use db_contas_a_pagar;

select monthname(tb_pedido_quitacao.data_pagamento) as mes,sum(tb_pedido_quitacao.valor_pago) as total_pago,avg(tb_pedido_quitacao.valor_pago) as media
from tb_pedido_quitacao
inner join tb_pedido on tb_pedido_quitacao.id_pedido=tb_pedido.id
where year(tb_pedido.data_vencimento)=2023
group by monthname(tb_pedido_quitacao.data_pagamento)
