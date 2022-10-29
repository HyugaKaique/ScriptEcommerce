-- Populando ecommerce tables
use ecommerce;

insert into Cliente(nomeCliente, cpfCliente, enderecoCliente, nascimentoCliente) 
	values ('Kaique Lima de Souza', 48983847924, 'Rua João Amado Countinho, 884', '2000-02-02'), 
		   ('Kauã Lima de Souza', 39983844486, 'Rua das Pedras, 4', '2004-11-08'),
           ('Mônica Cristina Ferreira de Lima', 29089205810, 'Rua Monte Azul Paulista, 2', '1976-10-30'),
           ('Alessandro Marques de Souza', 12547262800, 'Rua das Crianças, 88', '1974-03-13');
select * from Cliente;
           
insert into Produto (nomeProduto, classificacaoProduto, categoriaProduto, valorProduto, avaliacaoProduto, dimencoesProduto) 
    values ('Sofa', false, 'Móveis', 1200.00, 9, '3x57x80'), 
		   ('Chocolate', true, 'Alimentos', 10.00, 9, null),
           ('Vestido', true, 'Vestimenta', 100.00, 9, null),
           ('Televisão', false, 'Eletrônico', 1000.00, 9, '80x80'),
           ('Boneca', true, 'Brinquedos', 12.0, 9, null);
select * from Produto;

insert into Pedido (idPedidoCliente, statusPedido, descricaoPedido, fretePedido, valorPedido, pagamentoPedido)
	values (1, 'Confirmado', 'Chocolate', 10, 10, 'Débito'),
		   (2, 'Em processamento', 'Televisão', 100, 1000, 'Crédito'),
           (3, 'Confirmado', 'Vestido', 19, 100, 'Débito'),
           (4, 'Em processamento', 'Sofa', 150, 1200, 'Pix'),
           (2, 'Cancelado', 'Boneca', 10, 12, 'Boleto'),
           (3, 'Em processamento', 'Chocolate', 10, 10, 'Dinheiro');
select * from Pedido;

insert into Estoque (localEstoque, quantidadeEstoque) 
	values ('São Paulo', 1000), ('Campinas', 550), ('Guarulhos', 1200), ('Mauá', 800);
select * from Estoque;

insert into Fornecedor (nomeSocialFornecedor, cnpjFornecedor, contatoFornecedor)
	values ('Cacau Show ltda', 12345678901234, 11912345678),
		   ('Nike ltda', 21436576879801, 11912367812),
           ('Móveis ltda', 09876543210987, 11912344378),
           ('LG ltda', 43218765900912, 11912345643),
           ('Rihappy ltda', 12678901234326, 11916545678);
select * from Fornecedor;

insert into Vendedor (nomeSocialVendedor, nomeFantasiaVendedor, cnpjVendedor, cpfVendedor, contatoVendedor)
	values ('Chocolates ltda', 'Chocouau', 21212121212121, null, 11909090909),
		   ('Roupas ltda', 'Close', null, 11122233344, 11909090909),
           ('Móveis1 ltda', 'Organizado', null, 44455566677, 11909090909),
           ('Eletro ltda', 'Leandro Cell', null, 77788899900, 11909090909),
           ('Nico ltda', 'Nico Eletronicos', null, 23019283746, 11909090909),
           ('Brinquedos ltda', 'Brincadeira', 21212187212121, null, 11909090909);
select * from Vendedor;

insert into ProdutoPorVendedor (idVendedorPPV, idProdutoPPV, quantidadePPV)
	values (1, 2, 2134), (2, 3, 323), (3, 1, 425), (4, 4, 325), (5, 4, 645), (6, 5, 4323);
select * from ProdutoPorVendedor;

insert into ProdutoPorFornecedor(idFornecedorPPF, idProdutoPPF, quantidadePPF)
	values (1, 1, 1234), (2,2, 5321), (3, 3, 1000), (4, 4, 1234), (5, 5, 2333); 
select * from ProdutoPorFornecedor;
select * from Pedido, Produto;
insert into ProdutoPorPedido(idPedidoPPP, idProdutoPPP, quantidadePPP, statusPPP)
	values(1, 2, 1, 'Disponível'), 
		  (2, 4, 1, 'Disponível'),
          (3, 3, 1, 'Disponível'),
          (4, 1, 1, 'Disponível'),
          (5, 5, 1, 'Indisponível'),
          (6, 2, 1, 'Disponível');
select * from ProdutoPorPedido;
    
insert into ProdutoEmEstoque(idEstoquePEE, idProdutoPEE, quantidadePEE) 
	values (1,1,200), (1,2,200), (1,3,200), (1,4,200), (1,5,200),
		   (2,1,110), (2,2,110), (2,3,110), (2,4,110), (2,5,110),
           (3,1,240), (3,2,240), (3,3,240), (3,4,240), (3,5,240),
           (4,1,160), (4,2,160), (4,3,160), (4,4,160), (4,5,160);