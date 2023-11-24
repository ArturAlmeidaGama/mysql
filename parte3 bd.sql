use db_contas_a_pagar;

select tb_pedido_quitacao.id_pedido,tb_pedido.numero_pedido,tb_fornecedor.cnpj,tb_fornecedor.razao_social,tb_pedido.data_pedido,tb_pedido.data_vencimento,tb_pedido.valor_pedido,tb_pedido_quitacao.data_pagamento,tb_pedido_quitacao.valor_pago
from tb_pedido
inner join tb_pedido_quitacao on tb_pedido.id=tb_pedido_quitacao.id_pedido
inner join tb_fornecedor on tb_pedido.id_fornecedor=tb_fornecedor.id
where data_vencimento>='2023-09-23'