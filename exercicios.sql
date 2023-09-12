create database meu_primeiroDB;

DROP DATABASE meu_primeiroDB;

USE meu_primeiroDB; -- habilitar o uso do banco de dados

-- Exercício 01
CREATE TABLE paises(
    country_id        varchar(2),
    country_name    varchar(40),
    region_id        decimal(10,0)
);

-- Exercício 02
-- Vai criar a tabela se não houver uma com o
-- mesmo nome
CREATE TABLE IF NOT EXISTS paises(
    country_id         varchar(2),
    country_name    varchar(40),
    region_id        decimal(10,0)
);

 
-- Exercício 03
-- Criar uma cópia idêntica à tabela paises
-- Copiando o tipo de dado e colunas

 
CREATE TABLE IF NOT EXISTS dup_countries
LIKE paises;

-- Exercício 04


-- Exercício 05
-- Restringe para que não receba um valor nulo
CREATE TABLE if not exists countries(
	country_id varchar(2) NOT NULL,
    country_name varchar(40) NOT NULL,
    region_id decimal(10,0)
);


-- Exercício 06
CREATE TABLE jobs(
	job_id varchar(10) NOT NULL,
    job_tittle varchar(35) NOT NULL,
    min_salary decimal(6,0),
    max_salary decimal(6,0),
    CHECK(max_salary <= 25000)
    -- valida se o salário não excede 25,000
);


-- Exercpicio 07
-- verifica se o nome do país é igual a um dos nomes daquela lista
CREATE TABLE paises_2(
	country_id varchar(2),
    country_name varchar(40),
	CHECK(country_name IN("Itália","Índia","China")),
    region_id decimal(10,0)
);

-- Exercício 08
CREATE TABLE IF NOT EXISTS job_history(
	employee_id decimal(6,0) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    CHECK(end_date LIKE "--/--/----"),
    job_id varchar(10) NOT NULL,
    department_id decimal(4,0) NOT NULL
);

-- Exercício 09
CREATE TABLE paises_3(
	country_id varchar(2) NOT NULL,
    country_name varchar(40) NOT NULL,
    region_id decimal(10,0) NOT NULL,
    UNIQUE(country_name)
);

-- Exercício 10
CREATE TABLE jobs_2(
	job_id varchar(10) NOT NULL UNIQUE,
    job_tittle varchar(35) NOT NULL DEFAULT "", -- caso não seja incluído, ele será vazio
    min_salary decimal(6,0) DEFAULT 8000, -- caso não seja incluído, o valor padrão será vazio
    max_salary decimal(6,0) DEFAULT NULL -- caso não seja incluído, o valor padrão será vazio
);

-- Exercício 11
CREATE TABLE paises_4(
	-- define uma have primária e não recebe informação nula nem duplicada
	country_id varchar(2) NOT NULL UNIQUE PRIMARY KEY,
    country_name varchar(40) NOT NULL,
    region_id decimal(10,0) NOT NULL
);

-- Exercício 12
CREATE TABLE paises_5(
	-- define uma have primária e não recebe informação nula nem duplicada
	country_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    country_name varchar(40) NOT NULL,
    region_id decimal(10,0) NOT NULL
);

-- Exercício 13
CREATE TABLE countries(
	country_id   char(4) NOT NULL UNIQUE DEFAULT "",
    country_name varchar(50) DEFAULT NULL,
    region_id    char(10) NOT NULL,
    
    PRIMARY KEY(country_id, region_id)
);

-- Exercício 14
CREATE TABLE job_history(
	employee_id int NOT NULL PRIMARY KEY,
    fk_job_id int NOT NULL,
    FOREIGN KEY(fk_job_id) REFERENCES empregos(job_id),
    department_id int NOT NULL,
    start_date date,
    end_date date
);

CREATE TABLE empregos(
	job_id int NOT NULL PRIMARY KEY
);

-- Exercício 15
CREATE TABLE funcionarios(
	employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(40) NOT NULL,
    email varchar(50) NOT NULL,
    phone_number char(11) NOT NULL,
    hire_date date NOT NULL,
    job_id int NOT NULL,
    salary int NOT NULL,
    commission int NOT NULL,
    fk_manager_id int NOT NULL,
    fk_department_id int NOT NULL,
    FOREIGN KEY(fk_manager_id,fk_department_id) REFERENCES departamentos(manager_id,department_id)
);

CREATE TABLE departamentos(
	manager_id int NOT NULL,
    department_id int NOT NULL,
    PRIMARY KEY(manager_id,department_id)
);

-- Exercício 16
CREATE TABLE funcionarios(
	employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(40) NOT NULL,
    email varchar(50) NOT NULL,
    phone_number char(11) NOT NULL,
    hire_date date NOT NULL,
    job_id int NOT NULL,
    salary int NOT NULL,
    commission int NOT NULL,
    fk_manager_id int NOT NULL,
    FOREIGN KEY(fk_manager_id) REFERENCES departamentos(manager_id),
    fk_job_id int NOT NULL,
    FOREIGN KEY(fk_job_id) REFERENCES empregos(job_id)
);

CREATE TABLE departamentos(
	manager_id int NOT NULL PRIMARY KEY,
    department_id int NOT NULL
);

CREATE TABLE empregos(
	job_id int NOT NULL PRIMARY KEY
);

-- Exercício 17
CREATE TABLE funcionarios(
	employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(40) NOT NULL,
    job_id int NOT NULL,
    salary int NOT NULL,
    fk_job_id int NOT NULL,
    FOREIGN KEY(fk_job_id) REFERENCES empregos(job_id)
);

CREATE TABLE empregos(
	job_id int NOT NULL PRIMARY KEY
);

-- Exercício 18
CREATE TABLE funcionarios(
	employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(40) NOT NULL,
    job_id int NOT NULL,
    salary int NOT NULL,
    fk_job_id int NOT NULL,
    FOREIGN KEY(fk_job_id) REFERENCES empregos(job_id)
);

CREATE TABLE empregos(
	job_id int NOT NULL PRIMARY KEY
);

-- Exercício 19
CREATE TABLE employees(
	employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(40) NOT NULL,
    job_id int NOT NULL,
    salary int NOT NULL,
    fk_job_id int NOT NULL,
    FOREIGN KEY(fk_job_id) REFERENCES empregos(job_id)
);

CREATE TABLE empregos(
	job_id int NOT NULL PRIMARY KEY
);

-- Exercício 20
CREATE TABLE funcionarios(
	employee_id int NOT NULL PRIMARY KEY,
    first_name varchar(20) NOT NULL,
    last_name varchar(40) NOT NULL,
    job_id int NOT NULL,
    salary int NOT NULL,
    fk_job_id int NOT NULL,
    FOREIGN KEY(fk_job_id) REFERENCES empregos(job_id)
);

CREATE TABLE empregos(
	job_id int NOT NULL PRIMARY KEY
);