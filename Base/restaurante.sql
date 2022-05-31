-- comentário de linha
/*
Comentário de várias linhas
*/
-- usando a base de dados MASTER do próprio SQL Server para poder criar uma nova base de dados
use master
go

-- drop database restaurante_LPV_2019 -- para apagar base de dados

-- criando uma base de dados
create database restaurante_LPV_2019
go
-- usando uma base de dados 
use restaurante_LPV_2019
go
-- tabela Cidades : Opção 1
/*
create table cidades (
	cod_cidade int not null identity(1,1) primary key,
	nome varchar(100) not null,
	uf char(2) not null default 'SP',
	cep_padrao char(8)
);
*/
-- tabela Cidades : Opção 2 (constraint na chave primária)
create table cidades (
	cod_cidade int not null identity(1,1),
	nome varchar(100) not null,
	uf char(2) not null default 'SP',
	cep_padrao char(8),
	constraint pk_cidades primary key (cod_cidade)
);

-- tabela Clientes : Opção 1
/*
create table clientes (
	cod_cliente	int not null identity(1,1) primary key,
	nome varchar(100) not null,
	cpf char(11),
	rg varchar(18),
	endereco varchar(100),
	bairro varchar(100),
	cod_cidade	int foreign key references cidades (cod_cidade), 
	cep char(8),
	telefone varchar(15),
	celular varchar(15),
	email varchar(150)
);
*/
-- tabela Clientes : Opção 2 (constraint na chave estrangeira)
/*
create table clientes (
	cod_cliente	int not null identity(1,1) primary key,
	nome varchar(100) not null,
	cpf char(11),
	rg varchar(18),
	endereco varchar(100),
	bairro varchar(100),
	cod_cidade	int, 
	cep char(8),
	telefone varchar(15),
	celular varchar(15),
	email varchar(150),
	constraint fk_cidades foreign key (cod_cidade) references cidades (cod_cidade)
);
*/

create table clientes (
	
	cod_cliente	int not null identity(1,1) primary key,

	nome varchar(100) not null,
	cpf char(11),
	rg varchar(18),
	data_nascimento datetime,
	sexo char(1),	
	
	endereco varchar(100),
	bairro varchar(100),
	cod_cidade	int, 
	cep char(8),	
	telefone varchar(15),
	celular varchar(15),
	email varchar(150),

	-- CheckBox 
	conheceu_por_jornais char(1),
	conheceu_por_internet char(1),
	conheceu_por_outro char(1),
	renda_familiar float,

	constraint fk_cidades foreign key (cod_cidade) references cidades (cod_cidade)
);




-- Alterações a realizar na tabela clientes ------------
/*
alter table clientes add data_nascimento datetime;
alter table clientes add sexo char(1);
alter table clientes add conheceu_por_jornais char(1);
alter table clientes add conheceu_por_internet char(1);
alter table clientes add conheceu_por_outro char(1);
alter table clientes add renda_familiar float;
*/




create table encomendas (
	num_encomenda int not null identity(1,1) primary key,
	cod_cliente int not null foreign key references clientes (cod_cliente),
	data datetime not null,
	valor_total float
);

create table pratos (
	cod_prato int not null identity(1,1) primary key,
	nome varchar(100) not null,
	descricao_detalhada text,
	valor float
); 



create table itens_encomenda (
	cod_item_encomenda int not null identity(1,1) primary key,
	num_encomenda int not null references encomendas (num_encomenda),
	cod_prato int not null references pratos (cod_prato),
	quantidade float not null,
	valor_unitario float not null
);

create table unidades (
	cod_unidade	int not null identity(1,1) primary key,
	descricao	varchar(100) not null
);	
	
	
create table ingredientes (
	cod_ingrediente	int not null identity(1,1) primary key,
	descricao	varchar(100) not null,
	valor_unitario	float,
	cod_unidade	int not null foreign key references unidades (cod_unidade)
);



create table composicao (
	cod_prato int not null foreign key references pratos (cod_prato),
	cod_ingrediente int not null foreign key references ingredientes (cod_ingrediente),
	quantidade float not null,
	constraint pk_comp primary key (cod_prato, cod_ingrediente)
);


create table fornecedores (
	cod_fornecedor int not null identity(1,1) primary key,
	razao_social varchar(100) not null,
	nome_fantasia varchar(100) not null,
	cnpj char(16),
	inscricao_estadual varchar(18),
	endereco varchar(100),
	bairro varchar(100),
	cod_cidade int foreign key references cidades (cod_cidade),
	cep char(8),
	telefone varchar(15),
	celular varchar(15),
	email varchar(150)
);

create table compras (
	cod_compra int not null identity(1,1) primary key,
	nota_fiscal int not null,
	data datetime not null,
	cod_fornecedor int not null references fornecedores (cod_fornecedor),
	valor_total float
);

create table itens_compra (
	cod_item_compra int not null identity(1,1) primary key,
	cod_compra int not null foreign key references compras (cod_compra),
	cod_ingrediente int not null foreign key references ingredientes (cod_ingrediente),
	quantidade float not null default 0,
	valor_unitario float not null default 0
);

insert into cidades (nome, uf, cep_padrao) values 
('Adamantina','SP','17800000'),
('Panorama','SP',null),
('Curitiba','PR',null),
('Belo Horizonte','MG',null),
('Natal','RN',null);

insert into unidades (descricao) values
('Kg'),
('Litro'),
('Unidade'),
('Peça'),
('Lata');

create table usuarios (
	cod_usuario int not null identity(1,1) primary key,
	nome_completo varchar(150) not null,
	login varchar(50) not null,
	senha varchar(20),
	ativo smallint not null default 1, -- 0 = usuario inativo; 1 = usuario ativo
	administrador smallint not null default 0 -- 0 = usuario comum; 1 = administrador do sistema, acesso completo 
);

create table usuario_permissao(
	cod_usuario int not null foreign key references usuarios (cod_usuario),
	modulo varchar(100) not null,
	-- 0 = consulta; 1 = completo
	nivel smallint not null default 0,
	constraint pk_up primary key (cod_usuario, modulo) 
);

insert into ingredientes values('Feijão','5','1')
insert into pratos values('Feijoada','Tem feijão', 200)
insert into clientes (nome,cpf,cod_cidade) values('Evandro','47519080811','1')
insert into usuarios (nome_completo,login,senha) values('Evandro Sanches','Evandro','123')

update usuarios set
	administrador = 1
	where cod_usuario = 1
insert into usuarios (nome_completo,login,senha, ativo) values('Andre Mendes','andre','123', '0')
select * from usuarios