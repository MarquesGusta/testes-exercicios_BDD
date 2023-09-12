CREATE DATABASE revendedora;

drop database revendedora;

USE revendedora;

CREATE TABLE compra(
	código_da_compra int PRIMARY KEY NOT NULL,
	data_da_compra date NOT NULL,
    valor int NOT NULL,
    fk_automovel char(11) NOT NULL,
    FOREIGN KEY(fk_automovel) REFERENCES automovel(renavam),
    fk_codigo_cliente int NOT NULL,
    FOREIGN KEY(fk_codigo_cliente) REFERENCES cliente(codigo_cliente),
    fk_codigo_vendedor int NOT NULL,
    FOREIGN KEY(fk_codigo_vendedor) REFERENCES vendedor(codigo_vendedor)
);

CREATE TABLE automovel(
	renavam char(11) PRIMARY KEY NOT NULL,
    placa char(7) UNIQUE NOT NULL,
    marca varchar(40) NOT NULL,
    modelo varchar(40) NOT NULL,
    ano_fabricacao int NOT NULL,
    ano_modelo int NOT NULL,
    cor varchar(40) NOT NULL,
    n_portas int NOT NULL,
    tipo_combustivel varchar(20) NOT NULL,
    preco int NOT NULL
);

CREATE TABLE cliente(
	codigo_cliente int PRIMARY KEY NOT NULL,
    nome varchar(20) NOT NULL,
    sobrenome varchar(40) NOT NULL,
    telefone char(9) UNIQUE NOT NULL,
    fk_endereco_cliente char(8) NOT NULL,
    FOREIGN KEY(fk_endereco_cliente) REFERENCES endereco_cliente(cep)
);

CREATE TABLE endereco_cliente(
	cep char(8) PRIMARY KEY NOT NULL,
    rua varchar(40) NOT NULL,
    numero int NOT NULL,
    complemento varchar(20) NOT NULL,
    bairro varchar(40) NOT NULL,
    cidade varchar(40) NOT NULL,
    estado varchar(40) NOT NULL
);

CREATE TABLE vendedor(
	codigo_vendedor int PRIMARY KEY NOT NULL,
    nome varchar(20) NOT NULL,
    sobrenome varchar(40) NOT NULL,
    telefone char(9) UNIQUE NOT NULL,
    fk_endereco_vendedor char(8) NOT NULL,
    FOREIGN KEY(fk_endereco_vendedor) REFERENCES endereco_vendedor(cep),
    data_admissao date NOT NULL,
    salario int NOT NULL DEFAULT 1500.00
);

CREATE TABLE endereco_vendedor(
	cep char(8) PRIMARY KEY NOT NULL,
    rua varchar(40) NOT NULL,
    numero int NOT NULL,
    complemento varchar(20) NOT NULL,
    bairro varchar(40) NOT NULL,
    cidade varchar(40) NOT NULL,
    estado varchar(40) NOT NULL
);