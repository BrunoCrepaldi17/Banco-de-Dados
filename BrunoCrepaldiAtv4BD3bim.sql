CREATE SCHEMA dbBrunoCrepaldiATV4;
USE dbBrunoCrepaldiATV4;

/* drop schema dbBrunoCrepaldiATV4; */

CREATE TABLE tbCargo(
codigo INT NOT NULL AUTO_INCREMENT,
CONSTRAINT CodCargo PRIMARY KEY (codigo),
nome VARCHAR(50) NOT NULL
);

alter table tbCargo
add dataCriacao date;
UPDATE tbCargo SET
nome = (70)
WHERE Codigo = 1;

CREATE TABLE tbCidade(
codigo INT NOT NULL AUTO_INCREMENT,
CONSTRAINT CodCidade PRIMARY KEY (codigo),
nome VARCHAR(80) NOT NULL,
UF CHAR(2) NOT NULL DEFAULT 'PR'
);

update tbCidade set UF = 'RJ' where codigo = 1;

CREATE TABLE tbEmpresa(
codigo INT NOT NULL AUTO_INCREMENT,
CONSTRAINT CodEmpresa PRIMARY KEY (codigo),
nome VARCHAR(100) NOT NULL,
CNPJ DOUBLE UNIQUE NOT NULL,
tbCidade_codigo INT NOT NULL, 
FOREIGN KEY(tbCidade_codigo) REFERENCES
tbCidade(codigo)
);

CREATE TABLE tbFuncionario(
codigo INT NOT NULL AUTO_INCREMENT,
CONSTRAINT CodFuncionario PRIMARY KEY (codigo),
nome VARCHAR(80) NOT NULL,
sexo char(1) CHECK (sexo= 'M' or sexo='F'),
salario DECIMAL(10,2) NOT NULL,
tbEmpresa_codigo INT NOT NULL,
tbCidade_codigo INT NOT NULL,
CONSTRAINT tbEmpresa_codigo FOREIGN KEY(tbEmpresa_codigo) REFERENCES
tbEmpresa(codigo),
CONSTRAINT tbCidade_codigo FOREIGN KEY(tbCidade_codigo) REFERENCES
tbCidade(codigo)
);
ALTER TABLE tbFuncionario
ADD celular varchar(20),
ADD dataAdimissão date,
ADD DataHora datetime,
drop sexo;

CREATE TABLE tbCargosOcupados(
tbFuncionario_codigo INT NOT NULL,
tbCargo_codigo INT NOT NULL,
CONSTRAINT CodCargosOcupados PRIMARY KEY (tbFuncionario_codigo, tbCargo_codigo),
dataInicio DATE,
dataFim DATE,
constraint tbFuncionario_codigo FOREIGN KEY(tbFuncionario_codigo) REFERENCES tbFuncionario(codigo),
constraint tbCargo_codigo FOREIGN KEY (tbCargo_codigo) REFERENCES tbCargo(codigo)
);
tbcargotbcargosocupados