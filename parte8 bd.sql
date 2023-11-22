use db_contas_a_pagar;

select monthname(data_pagamento) as mes_pagamento,max(valor_pago) as maior_valor_pago
from tb_pedido_quitacao