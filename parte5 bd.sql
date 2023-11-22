use db_contas_a_pagar;

select tb_fornecedor.cnpj,tb_fornecedor.razao_social,sum(valor_pago) as valor_pago_total,avg(valor_pago) as valor_pago_media
from tb_pedido_quitacao
left join tb_pedido on tb_pedido_quitacao.id_pedido=tb_pedido.id
left join tb_fornecedor on tb_pedido.id_fornecedor=tb_fornecedor.id
where data_pagamento like '2023%'