use BrunoCrepaldiAtv3_4Bim;
/*1. Elabore uma consulta que retorne o código do exemplar, o código do livro, o título do livro,
a editora do livro e o status de todos os exemplares que possuem status = A. A coluna do
código do exemplar deve aparecer na consulta como ‘Exemplar’, a coluna nome da
editora como ‘Editora’. Usar ALIASES (apelidos) para as tabelas nesta consulta.*/

select ex.codigo 'exemplar', ex.codLivro 'livro', li.titulo, ed.nome, ex.statusEx, ed.nome 'editora'
from tbExemplar ex
inner join tbLivro li on ex.codLivro = li.codigo
inner join tbEditora ed on li.codEditora = ed.codigo
where ex.statusEx = 'A';

/*2. Elabore uma consulta que retorne o código do empréstimo, a data de empréstimo, o código
do leitor, o nome do leitor, o código da categoria e a descrição da categoria de todos os
empréstimos efetuados no mês de janeiro de 2022. Usar ALIASES (apelidos) para as
tabelas nesta consulta.*/

select em.codigo, em.dataEmprestimo, em.codLeitorEmp, le.nome, le.codCategoria, ca.descricao
from tbEmprestimo em
inner join tbLeitor le on em.codLeitorEmp = le.codigo
inner join tbCategoria ca on le.codCategoria = ca.codigo
where em.dataEmprestimo between ('2022-01-01') AND ('2022-01-31');

/*3. Elabore uma consulta que retorne o código do livro, título do livro, descrição do assunto e
nome da editora de todos os livros que tenham codigo do assunto entre 1 e 3. A coluna
da descrição do assunto deve aparecer na consulta como ‘Descrição do Assunto’ e a
coluna do nome da editora como ‘Nome da Editora’. Usar INNER JOIN nesta consulta.*/

SELECT li.codigo, li.titulo, asu.descricao 'Descrição do Assunto', ed.nome 'Nome da Editora'
FROM tbLivro li
inner join tbAssunto asu on li.codAssunto = asu.codigo
inner join tbEditora ed on li.codEditora = ed.codigo
WHERE asu.codigo between 1 and 3;

/*4. Elabore uma consulta que retorne o código do leitor, nome do leitor, nome da cidade onde
o leitor mora e a descrição da categoria do leitor. Esta consulta deve ser ordenada pelo
nome do leitor, em ordem ascendente. Usar INNER JOIN e ALIASES para as tabelas
nesta consulta.*/

select le.codigo, le.nome, ci.nome, ca.descricao
from tbLeitor le
inner join tbCidade ci on le.codCidade = ci.codigo
inner join tbCategoria ca on le.codCategoria = ca.codigo
order by le.nome asc ;


/*5. Elabore uma consulta que retorne o código do exemplar, o código do livro, o nome do
livro, o nome da editora do livro, a descrição do assunto do livro e o status do exemplar
de todos os livros que possuam a palavra banco em qualquer posição do seu título. Esta
consulta deve ser ordenada em ordem descendente de título do livro. A coluna do código
do exemplar deve aparecer na consulta como ‘Código Exemplar’, a coluna código do
livro como ‘Código Livro’, a coluna nome da editora como ‘Nome Editora’ e a coluna
descrição do assunto como ‘Descrição Assunto’. Usar PRODUTO CARTESIANO e
ALIASES para as tabelas nesta consulta.*/

select ex.codigo 'Código Exemplar', ex.codLivro 'Código Livro',
li.titulo, ed.nome 'Nome Editora' , asu.descricao 'Descrição Assunto', ex.statusEx
from tbExemplar ex
inner join tbLivro li on ex.codLivro = li.codigo
inner join tbEditora ed on li.codEditora = ed.codigo
inner join tbassunto asu on li.codAssunto = asu.codigo
where li.titulo LIKE '%BANCO%'
order by li.titulo desc;

/*6. Elabore uma consulta que retorne o código do empréstimo, código do exemplar, código
do livro, título do livro, descrição do assunto e data de devolução, de todos os exemplares
emprestados e que já foram devolvidos (com data de devolução IS NOT NULL). A coluna
do código do empréstimo deve aparecer na consulta como ‘Código Empréstimo, a coluna
do código do exemplar como ‘Código Exemplar’, a coluna código do livro como ‘Código
Livro’, a coluna título do livro como ‘Título Livro’ e a coluna descrição do assunto como
‘Descrição Assunto’. Usar INNER JOIN e ALIASES para as tabelas nesta consulta.*/

select EmEx.codEmprestimo 'Código Empréstimo', EmEx.codExemplar 'Código Exemplar',
ex.codLivro 'Código Livro', li.titulo 'Título Livro', asu.descricao 'Descrição Assunto', EmEx.dataDevolucao
from tbEmprestimoExemplar EmEx
inner join tbEmprestimo em on EmEx.codEmprestimo = em.codigo
inner join tbExemplar ex on EmEx.codExemplar = ex.codigo
inner join tbLivro li on ex.codLivro = li.codigo
inner join tbAssunto asu on li.codAssunto = asu.codigo
where EmEx.dataDevolucao != '';


/* 7. Salve o script conforme solicitado no início da atividade e poste no Google Sala de Aula.