CREATE DATABASE eleicao;

USE eleicao;

CREATE TABLE eleitor(
	titulo_eleitor varchar(30) PRIMARY KEY NOT NULL,
    zona_eleitoral char(5) NOT NULL,
    sessao_eleitoral char(5) NOT NULL,
    nome varchar(40) NOT NULL,
    fk_titulo_eleitor varchar(30) NOT NULL,
    FOREIGN KEY(fk_titulo_eleitor) REFERENCES voto(titulo_eleitor)
);

CREATE TABLE voto(
	titulo_eleitor varchar(30) PRIMARY KEY NOT NULL,
    numero_candidato int NOT NULL,
    fk_numero_candidato int NOT NULL,
	FOREIGN KEY(numero_candidato) REFERENCES candidato(numero_candidato)
);

CREATE TABLE candidato(
	numero_candidato int PRIMARY KEY NOT NULL,
    nome varchar(40) UNIQUE NOT NULL,
    fk_codigo_cargo int NOT NULL,
    FOREIGN KEY(fk_codigo_cargo) REFERENCES cargo(codigo_cargo),
    fk_codigo_partido int NOT NULL,
    FOREIGN KEY(fk_codigo_partido) REFERENCES partido(codigo_partido)
);

CREATE TABLE partido(
	codigo_partido int PRIMARY KEY NOT NULL,
    sigla char(5) UNIQUE NOT NULL,
    nome varchar(40) UNIQUE NOT NULL,
    numero int UNIQUE NOT NULL
);

CREATE TABLE cargo(
	codigo_cargo int PRIMARY KEY NOT NULL,
    nome_cargo varchar(30) UNIQUE NOT NULL,
    CHECK(nome_cargo != "Vereador" and nome_cargo != "Prefeito"),
    salario decimal NOT NULL DEFAULT 17000.00,
    numero_vagas int NOT NULL
);


