USE dbBrunoCrepaldiAtividade2;
/*1. Elabore uma consulta que retorne todos os dados do leitor (somente os atributos da
tabela tbLeitor).*/

select * from tbleitor;

/*2. Elabore uma consulta que retorne o código, a descrição e a quantidade de exemplares
das categorias cadastradas.*/

select codigo, descricao, quantidadeExemplares from tbcategoria;

/*3. Elabore uma consulta que retorne o código do livro, título do livro e o código do assunto
de todos os livros do assunto 1.*/

select codigo, titulo, codAssunto from tbLivro where codAssunto = 1;

/*4. Elabore uma consulta que retorne o código do exemplar, o código do livro, o título do
livro e o status de todos os exemplares que possuem statusEx = I.*/

select tbExemplar.codigo, codLivro, titulo, statusEx
from tbExemplar
inner join tbLivro on tbExemplar.codLivro = tbLivro.codigo
 where statusEx = 'I';

/*5. Elabore uma consulta que retorne o código do livro, título do livro, descrição do assunto
e nome da editora de todos os livros do assunto 6 e da editora 1.*/

select tbLivro.codigo, titulo, descricao, tbEditora.nome
from tbLivro
inner join tbAssunto on tbLivro.codAssunto = tbAssunto.codigo
inner join tbEditora on tbLivro.codEditora = tbEditora.codigo
where codAssunto = 6 and codEditora = 1;

/*6. Elabore uma consulta que retorne o código do exemplar, título do livro, edição do
exemplar, ano de publicação do exemplar, do livro de código 1 e status do exemplar
igual a A.*/

select tbExemplar.codigo, titulo, edicao, anoPublicacao
from tbExemplar
inner join tbLivro on tbExemplar.codLivro = tbLivro.codigo
where codLivro = 1 and statusEx = 'A';

/*7. Elabore uma consulta que retorne o código do exemplar, o código do livro, o nome do
livro, o nome da editora do livro, a descrição do assunto do livro e o status do exemplar
de todos os exemplares com código do exemplar entre 10 e 15.*/

select tbExemplar.codigo, tbExemplar.codLivro, 
tbLivro.titulo, tbEditora.nome, tbAssunto.descricao, statusEx
from tbExemplar
inner join tbLivro on tbExemplar.codLivro = tbLivro.codigo
inner join tbEditora on tbLivro.codEditora = tbEditora.codigo
inner join tbAssunto on tbLivro.codAssunto = tbAssunto.codigo
where tbExemplar.codigo between 10 and 15;

/*8. Elabore uma consulta que retorne o código do exemplar, código do livro, título do livro,
descrição do assunto, de todos os exemplares emprestados.*/

select tbExemplar.codigo, tbExemplar.codLivro, 
tbLivro.titulo, tbAssunto.descricao
from tbExemplar
inner join tbLivro on tbExemplar.codLivro = tbLivro.codigo
inner join tbAssunto on tbLivro.codAssunto = tbAssunto.codigo
inner join tbEmprestimoExemplar on tbEmprestimoExemplar.codExemplar = tbExemplar.codigo
where tbEmprestimoExemplar.codExemplar;

/*9. Elabore uma consulta que retorne o código do empréstimo, a data de empréstimo, o
código do leitor, o nome do leitor, o código da categoria e a descrição da categoria de
todos os empréstimos efetuados no mês de fevereiro (período de 01/02/2023 até
28/02/2023).*/

SELECT tbEmprestimo.codigo , tbEmprestimo.dataEmprestimo, tbLeitor.codigo, tbLeitor.nome, 
tbCategoria.codigo, tbCategoria.descricao FROM tbEmprestimo
INNER JOIN tbLeitorCategoria ON tbEmprestimo.codLeitorEmp = tbLeitorCategoria.codLeitor
AND tbEmprestimo.codCategoriaEmp = tbLeitorCategoria.codCategoria
INNER JOIN tbLeitor ON tbLeitorCategoria.codLeitor = tbLeitor.codigo
INNER JOIN tbCategoria ON tbLeitorCategoria.codCategoria = tbCategoria.codigo
WHERE tbEmprestimo.dataEmprestimo between'2023-02-01' AND '2023-02-28';

/*10.Salve o script conforme solicitado no início da atividade e poste no Google Sala de Aula.*/