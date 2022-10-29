-- banco de dados para cenário E-commerce
create database ecommerce;
use ecommerce;

create table Cliente(
	idCliente int auto_increment primary key,
    nomeCliente varchar(50) not null,
    cpfCliente char(11) unique,
    enderecoCliente varchar(50) not null,
	nascimentoCliente date not null,
    constraint unique_cpf_cliente unique (cpfCliente)
);

create table Produto(
	idProduto int auto_increment primary key,
    nomeProduto varchar(10) not null,
    classificacaoProduto boolean not null,
    categoriaProduto enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') not null,
    valorProduto float not null,
    avaliacaoProduto float default 0,
    dimencoesProduto varchar(10)
);

create table Pedido(
	idPedido int auto_increment primary key,
    idPedidoCliente int,
    statusPedido enum('Cancelado', 'Confirmado', 'Em processamento') not null,
    descricaoPedido varchar(255) not null,
    fretePedido float default 10,
    valorPedido float not null,
    pagamentoPedido enum('Dinheiro', 'Débito', 'Crédito', 'Pix', 'Boleto') not null,
    constraint fk_pedido_cliente foreign key (idPedidoCliente) references Cliente(idCliente)
);

create table Estoque(
	idEstoque int auto_increment primary key,
	localEstoque varchar(255) not null,
    quantidadeEstoque int not null
);

create table Fornecedor(
	idFornecedor int auto_increment primary key,
    nomeSocialFornecedor varchar(50) not null,
    cnpjFornecedor char(14) not null,
    contatoFornecedor char(11) not null,
    constraint unique_cnpj_fornecedor unique (cnpjFornecedor)
);

create table Vendedor(
	idVendedor int auto_increment primary key,
    nomeSocialVendedor varchar(50) not null,
    nomeFantasiaVendedor varchar(50) not null,
    cnpjVendedor char(14) unique,
    cpfVendedor char(11) unique,
    contatoVendedor char(11) not null,
    constraint unique_cnpj_vendedor unique (cnpjvendedor)
);

create table ProdutoPorVendedor(
	idVendedorPPV int,
    idProdutoPPV int,
    quantidadePPV int not null,
    primary key(idVendedorPPV, idProdutoPPV),
    constraint fk_vendedorPPV foreign key (idVendedorPPV) references Vendedor(idVendedor),
    constraint fk_produtoPPV foreign key (idProdutoPPV) references Produto(idProduto)
);

create table ProdutoPorFornecedor(
	idFornecedorPPF int,
    idProdutoPPF int,
    quantidadePPF int not null,
    primary key(idFornecedorPPF, idProdutoPPF),
    constraint fk_fornecedorPPF foreign key (idFornecedorPPF) references Fornecedor(idFornecedor),
    constraint fk_produtoPPF foreign key (idProdutoPPF) references Produto(idProduto)
);

create table ProdutoPorPedido(
	idPedidoPPP int,
    idProdutoPPP int,
    quantidadePPP int not null,
    statusPPP enum('Disponível','Indisponível') not null,
    primary key(idPedidoPPP, idProdutoPPP),
    constraint fk_pedidoPPP foreign key (idPedidoPPP) references Pedido(idPedido),
    constraint fk_produtoPPP foreign key (idProdutoPPP) references Produto(idProduto)
);

create table ProdutoEmEstoque(
	idEstoquePEE int,
    idProdutoPEE int,
    quantidadePEE int not null,
    primary key(idEstoquePEE, idProdutoPEE),
    constraint fk_estoquePEE foreign key (idEstoquePEE) references Estoque(idEstoque),
    constraint fk_pedidoPEE foreign key (idProdutoPEE) references Produto(idProduto)
);