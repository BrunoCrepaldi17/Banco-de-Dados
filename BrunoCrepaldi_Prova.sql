
create schema dbBrunoCrepaldi_Prova;
use dbBrunoCrepaldi_Prova;

create table tbMedico (
CRM int(11) not null primary key,
nome varchar(80),
especialidade varchar(45),
telefone char(10)
);

create table tbConvenio (
codigo int(11) not null auto_increment primary key,
nome varchar(80),
telefone char(10)
);

create table tbPaciente (
codigo int(11) not null auto_increment primary key,
nome varchar(80),
endereco varchar(80),
cidade varchar(50),
UF char(2),
CEP char(9)
);

create table tbGrupoExame (
codigo int(11) not null auto_increment primary key,
nome varchar(45)
);

create table tbExame(
codigo int(11) not null auto_increment primary key,
nome varchar(45),
valor float,
preparo varchar(80),
codGrupoEx int(11),
foreign key tbExame (codGrupoEx) references tbGrupoExame (codigo)
);

create table tbPedido(
numero int(11) not null auto_increment primary key,
dataPedido date,
localColeta varchar(45),
codConvenio int(11),
CRMMedico int(11),
codPaciente int(11),
constraint codConvenio foreign key tbPedido (codConvenio) references tbConvenio (codigo),
constraint CRMMedico foreign key  tbPedido(CRMMedico) references tbMedico(CRM),
constraint codPaciente foreign key tbPedido(codPaciente) references tbPaciente (codigo)
);

create table tbExamePorPedido(
numPedido int(11),
codExame int(11),
resultado varchar (45),
dataPronto date,
horaPronto time,
primary key (numPedido,codExame),
constraint numPedido foreign key tbExamePorPedido(numPedido) references tbPedido(numero),
constraint codExame foreign key tbExamePorPedido(codExame) references tbExame(codigo)
);

/*INSERTS APARTIR DE AGORA*/
insert INTO tbConvenio (nome, telefone) values 
('Unimed', 3600-0101),('Umuprev ',3031-7575),
('Bradesco Saúde ',3624-9998),('Pax Primavera  ',3037-4741);

insert into tbMedico(CRM, nome, especialidade, telefone )values
(100,'Fabio Borges', 'Oftalmologista', 123 ),(200,'Elizabete Coutinho', 'Dermatologista', 234),
(300, 'Pedro Oliveira', 'Gastroenterologista', 345),(400, 'Augusto Neves' ,'Clínico Geral', 456),
(500,'Francisco Rocha', 'Dermatologista', 854),(600,'Emanuela Pimenta', 'Gastroenterologista', 862),
(700,'Camila Sampaio', 'Dermatologista', 480);

insert into tbPaciente (nome, cidade, UF)values
('Jorge Amado' ,'Rio de Janeiro' ,'RJ' ),('Graciliano Ramos', 'Umuarama', 'PR'),
('Cecília Meireles', 'Petrópolis', 'RJ'),('Monteiro Lobato', 'Umuarama', 'PR'),
('Clarice Lispector', 'Angra dos Reis', 'RJ'),('José de Alencar', 'Rio de Janeiro', 'RJ' ),
('Lygia Fagundes Telles', 'Maringá','PR' ),('Mário Quintana', 'Umuarama', 'PR'),
('Vinicius de Moraes', 'Umuarama', 'PR');

insert into tbGrupoExame(nome)values
('Sangue'),('Urina'),('Fezes'),('Saliva');

insert into tbExame (nome, valor, preparo)values
('Parasitológico', 32.00 ,'fezes'),
( 'Ferritina', 53.00 ,'sangue'),('Hemograma',  24.60 ,'sangue'),
('Glicose',  36.00 ,'sangue'),('Tempo de Coagulação', 21.00 ,'sangue'),
('Urina I', 39.00 ,'urina'),('Parcial de Urina', 27.00 ,'urina'),
('Melatonina',  66.00 ,'saliva');

insert into tbPedido(codPaciente, dataPedido, localColeta, codConvenio, CRMMedico) values
(5, '2022/11/02', 'Laboratório', 3, 200),
(1, '2022/11/05', 'Laboratório', 4, 500),
( 7, '2022/11/05', 'Hospital', 1, 400),
( 4, '2022/11/10',' Residência Paciente', 2, 300);

insert into tbExamePorPedido(numPedido, codExame, dataPronto, horaPronto, resultado)values
(1,7, '2022/11/18', '17:00', 'Negativo para Bactérias'),
(1,1,'','', ''),
(1,4,'','' , ''),
(2,2, '2022/11/10', '09:00', '45 NGM'),
(2,6, '2022/11/10', '09:00', 'Leveduras Ausentes'),
(2,8,'' ,'' , ''),
(2,5,'' ,'' , ''),
(3,3,'' ,'' , ''),
(4,3,'' ,'' , ''),
(4,4,'' ,'' , ''),
(4,2,'' ,'' , ''),
(4,1,'' ,'' , ''),
(4,5,'' ,'' , '2 minutos');