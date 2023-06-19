create schema BrunoCrepaldiAtv5BD3Bim;
use BrunoCrepaldiAtv5BD3Bim;

create table tbArea(
codigo int not null auto_increment primary key,
descricao varchar(50) not null
);

create table tbCidade(
codigo int not null auto_increment primary key,
nome varchar(90) not null,
UF char(2) not null,
DDD char(2) not null
);

create table tbProfessor(
matricula int not null primary key auto_increment,
nome varchar(100) not null,
endereco varchar(100),
CEP char(9),
foneCelular char(10) not null,
dataNasc date,
codCidade int not null,
foreign key(codCidade) references tbCidade(codigo)
);

create table tbCurso(
codigo int not null primary key auto_increment,
nome varchar(60) not null,
cargaHoraria int not null,
codArea int not null,
foreign key(codArea) references tbArea(codigo)
);

create table tbAluno(
codigo int not null auto_increment primary key,
nome varchar(100) not null,
endereco varchar(100) not null ,
CEP char(9),
foneCelular char(10),
codCidade int not null,
foreign key(codCidade) references tbCidade(codigo),
statusAluno char(1) not null check(statusAluno = 'A' or statusAluno = 'I')
);

create table tbCursoProf(
codCurso int not null,
matriculaProf int not null,
primary key(codCurso, matriculaProf),
foreign key(codCurso) references tbCurso(codigo),
foreign key(matriculaProf) references tbProfessor(matricula),
diaSemana int not null,
horarioIni time not null,
horarioFim time not null
);

create table tbMatricula(
numero int not null primary key auto_increment,
dataMatric date not null,
statusMatric char(1) not null check(statusMatric = 'A' or statusMatric= 'S' or statusMatric= 'C'),
notaCurso decimal(5,2),
frequeciaCurso int,
codCursoMatric int not null,
foreign key(codCursoMatric) references tbCursoProf(codCurso),
matriculaProfMatric int not null,
foreign key(matriculaProfMatric) references tbCursoProf(matriculaProf),
codAlunoMatric int not null,
foreign key(codAlunoMatric) references tbAluno(codigo)
);

/* INSERTS APARTIR DE AGORA */

insert into tbArea(descricao) values
('filosofia'), 
('geografia'),
 ('artes');
insert into tbCidade(nome, UF, DDD) values 
('Nova Olímpia', 'PR', '44'),
('São Paulo', 'SP', '11'),
('Londrina', 'PR', '43');
insert into tbProfessor(nome, endereco, CEP, foneCelular, dataNasc, codCidade) values
('joão', 'Rua ABC', '87490000', '989888786', '1987/06/25','1' ),
('karla', 'rua DEF','87543210', '985848382', '2000/12/31','2' ),
('Paula', 'rua GHI', '87550000','981586717', '1945/01/22','3' );
insert into tbCurso(nome, cargaHoraria, codArea) values
('Socrates', '100', '1'),
('Latitude e Longitude', '80', '2'),
('Pontilismo', '70', '3'),
('Politica', '60', '1'),
('Paises e suas Capitais', '50', '2'),
('Pinturas rupestres', '40', '3');
insert into tbCursoProf(codCurso, matriculaProf, diaSemana, horarioIni, horarioFim) values
('1', '1', '1', '13:00', '15:00'),
('2', '1', '2', '16:30', '18:30'),
('3', '2', '3', '18:00', '19:00'),
('4', '2', '4', '19:00', '20:30'),
('5', '3', '5', '07:40', '11:40'),
('6', '3', '6', '12:00', '16:00');
insert into tbAluno(nome, endereco, CEP, foneCelular, codCidade, statusAluno) values
('João Pedro', 'Rua A', '87550000', '88990077','3', 'A' ),
('Eduardo', 'Rua B', '87543210', '88084422','2', 'A' ),
('Bruno', 'Rua C', '87543210', '88912304', '1', 'A' ),
('Marcelo', 'Rua D', '87574560', '88996655', '2', 'A' );
insert into tbMatricula(dataMatric, statusMatric, notaCurso, frequeciaCurso, codCursoMatric, matriculaProfMatric, codAlunoMatric) values
('2021/02/10', 'A', '5', '60', '1','1','1'),
('2019/02/19', 'A', '6', '70', '2','1','1'),
('2022/01/29', 'A', '7', '70', '3','2','2'),
('2018/02/02', 'A', '8', '80', '4','2','2'),
('2015/08/12', 'A', '10','90', '5','3','3'),
('2022/11/17', 'A', '9', '80', '6','3','3'),
('2021/04/04', 'A', '2', '30', '1','1','4'),
('2020/03/23', 'A', '1', '20', '3','2','4');