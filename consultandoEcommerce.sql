-- consultas do Ecommerce
use ecommerce;

-- consultando cliente
select * from Cliente;

-- consultando pedidos confirmados
select * from Pedido where statusPedido = 'Confirmado';

-- consultando pedidos organizados por cliente
select * from Pedido order by idPedidoCliente;

-- consultando valores dos pedidos
select count(idPedido) as 'Número de Pedidos', sum(valorPedido)as 'Soma dos Pedidos', max(valorPedido) as 'Valor máxima pedido',
min(valorPedido) as 'Valor mínimo pedido', avg(valorPedido) as 'Valor médio pedido'  from Pedido ;

-- consultando os produtos que os fornecederoes tem mais de 1000 unidades. 
select idProdutoPPF, sum(quantidadePPF) from ProdutoPorFornecedor
group by idProdutoPPF having sum(quantidadePPF) > 1000;

-- consultando Clientes com pedidos em processo
select nomeCliente as Cliente, statusPedido as 'Status', descricaoPedido as Pedido 
from Cliente join Pedido on idCliente = idPedidoCliente where statusPedido = 'Em processamento';