CREATE DATABASE dbAulaSelect;
USE dbAulaSelect;

CREATE TABLE tbcargo (
codigo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(40)
);

CREATE TABLE tbcidade (
codigo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(40)
);

CREATE TABLE tbempresa (
codigo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(40)
);

CREATE TABLE tbfuncionario (
codigo INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(40),
sexo CHAR(1),
codigoCargo INT,
codigoEmpresa INT,
codigoCidade INT,
salario INT,
FOREIGN KEY (codigoCargo) REFERENCES tbcargo(codigo),
FOREIGN KEY (codigoEmpresa) REFERENCES tbempresa(codigo),
FOREIGN KEY (codigoCidade) REFERENCES tbcidade(codigo)
);

INSERT INTO tbcargo (nome) VALUES 
('Analista de Logística'), 
('Analista de Infraestrutura'),
('Gerente Comercial'), 
('Analista de Customer Service'), 
('Auxiliar de Produção');

INSERT INTO tbempresa (nome) VALUES 
('Nestlé S.A.'), 
('Nestlé Purina'),
('Nestlé Nespresso');

INSERT INTO tbcidade (nome) VALUES 
('Araras'),
('Ribeirão Preto'),
('Três Rios'),
('Umuarama'),
('Maringá');

INSERT INTO tbFuncionario (nome, sexo, codigoCargo, codigoEmpresa, codigoCidade, salario) VALUES
('Valentina', 'F', 5, 1,1,2000),
('Renan', 'M', 3, 2,5,7000),
('Miguel', 'M', 1, 1,1,5000),
('Andre', 'M', 1, 3,2,5000),
('Alice', 'F', 5, 2,1,2000);

-- mostrar nome do funcionario e do cargo

select fu.nome 'nome funcionario', ca.nome 'nome cargo', 
ci.nome 'nome cidade', tbEmpresa.nome 'nome empresa'
 from tbFuncionario fu
 inner join tbCargo ca on codigoCargo = ca.codigo
 inner join tbCidade ci on fu.codigoCidade = ci.codigo
 inner join tbEmpresa on fu.codigoEmpresa = tbEmpresa.codigo
 where ci.nome = 'araras'order by fu.nome desc;
 
 
 select *from tbFuncionario;
 
 select nome, salario, salario*1.10 from tbFuncionario;

-- Agora vamos ver como usar a cláusula FROM.
-- Para isso , vamos criar as tabelas tbCidade e tbCliente.
-- Porém, como já usamos esses mesmos nomes em tabelas anteriores, vamos chamar de
-- tbCidade1 e tbCliente1

CREATE TABLE tbCidade1 (
codigoCidade INT AUTO_INCREMENT PRIMARY KEY,
nomeCidade VARCHAR(40) NOT NULL,
ufCidade CHAR(2) NOT NULL
);

CREATE TABLE tbCliente1 (
codigoCli INT AUTO_INCREMENT PRIMARY KEY,
nomeCli VARCHAR(50) NOT NULL,
codCidadeCli INT NOT NULL,
cpfCli INT NOT NULL,
sexoCli CHAR(1),
FOREIGN KEY (codCidadeCli) REFERENCES tbCidade1(codigoCidade)
);

INSERT INTO tbCidade1 (nomeCidade, ufCidade) VALUES
('Umuarama', 'PR'), 
('Maringá', 'PR'), 
('Florianópolis', 'SC');

INSERT INTO tbCliente1 (nomeCli, codCidadeCli, cpfCli, sexoCli) VALUES
('Cecília', 1, 11111, 'F'),
('Augusto', 3, 22222, 'M'),
('Raul', 1, 3333, 'M'),
('Catarina', 2, 4444, 'F');