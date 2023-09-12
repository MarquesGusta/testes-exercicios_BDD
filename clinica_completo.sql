DROP DATABASE clinica;

CREATE DATABASE clinica;

USE clinica;

CREATE TABLE sala(
	numero_sala int PRIMARY KEY NOT NULL,
    CHECK( numero_sala > 1 AND numero_sala < 50),
    andar       int,
    CHECK( andar < 12),
    fk_codigo_consulta int NOT NULL,
    FOREIGN KEY (fk_codigo_consulta) REFERENCES consultas(codigo_consulta)
);

CREATE TABLE medicos(
	crm           varchar(15) PRIMARY KEY NOT NULL,
    nome          varchar(40) NOT NULL,
    idade         int(2),
    CHECK( idade > 23),
    especialidade char(20) NOT NULL DEFAULT "Ortopedia",
    cpf           varchar(15) UNIQUE NOT NULL,
    data_admissao date
);

CREATE TABLE pacientes(
	rg              varchar(15) PRIMARY KEY NOT NULL,
    nome            varchar(40) NOT NULL,
    data_nascimento date,
    cidade          char(30) DEFAULT "Itabuna",
    doenca          varchar(40) NOT NULL,
    plano_saude     varchar(40) NOT NULL DEFAULT "SUS"
);

CREATE TABLE funcionarios(
	matricula       varchar(15) PRIMARY KEY NOT NULL,
    nome            varchar(40) NOT NULL,
    data_nascimento date NOT NULL,
    data_admissao   date NOT NULL,
    cargo           varchar(40) NOT NULL DEFAULT "Assistente médico",
    salario         decimal NOT NULL DEFAULT 510.00
);

CREATE TABLE consultas(
	codigo_consulta int PRIMARY KEY NOT NULL,
    data_horario datetime,
    fk_medico_crm varchar(15) NOT NULL,
    FOREIGN KEY(fk_medico_crm) REFERENCES medicos(crm),
    fk_pacientes varchar(15) NOT NULL,
    FOREIGN KEY(fk_pacientes) REFERENCES pacientes(rg)
);

CREATE TABLE ala(
	codigo_ala char(3) PRIMARY KEY NOT NULL,
    nome_ala varchar(40) NOT NULL,
    fk_numero_sala int NOT NULL,
    FOREIGN KEY(fk_numero_sala) REFERENCES sala(numero_sala),
    fk_funcionarios varchar(15) NOT NULL,
    FOREIGN KEY(fk_funcionarios) REFERENCES funcionarios(matricula)
);