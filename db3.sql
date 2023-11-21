select
id, nome, cpf, dt_nasc, comissao
from tb_vendedor
where nome = 'artur'

update tb_vendedor
set nome='artur', comissao=8
where id=3

delete
from tb_vendedor
where id in(3,4,8)