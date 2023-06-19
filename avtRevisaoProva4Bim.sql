USE dbAvaliacao4BIM;
/*1. Elabore uma consulta que retorne todos os dados da tabela tbPaciente dos pacientes que
residem no Estado (UF) do Paraná;*/

SELECT *
FROM tbPaciente
WHERE UF = 'PR';


/*2. Elabore uma consulta que retorne o código do exame, o nome do exame, o nome do grupo
do exame e o valor de todos os exames cadastrados. Coloque aliases nas colunas.*/

SELECT e.codExame AS Código, e.nome AS Exame, g.nome AS Grupo, e.valor AS Valor
FROM tbExame e
INNER JOIN tbGrupoExame g ON e.codGrupoEx = g.codGrupoEx;


/*3. Elabore uma consulta que retorne o número do pedido de exame, a data do pedido, o
código do paciente, o nome do paciente e a cidade do paciente de todos os pedidos de
exames. Coloque aliases nas colunas.*/

SELECT ped.codPedidoEx AS Pedido, ped.dataPedido AS Data, pac.codPaciente AS Código, pac.nome AS Paciente, pac.cidade AS Cidade
FROM tbPedidoEx ped
INNER JOIN tbPaciente pac ON ped.codPaciente = pac.codPaciente;


/*4. Elabore uma consulta que retorne o número do pedido de exame, a data do pedido, o
código do paciente, o nome do paciente, o código do convênio e o nome do convênio de
todos os pedidos de exames realizados entre os dias 03/11/2022 e 10/11/2022. Coloque
aliases nas colunas.*/

SELECT pe.codPedidoEx AS 'Pedido', pe.dataPedido AS 'Data Pedido' ,
 p.codPaciente AS 'Código', p.nome AS 'Paciente', 
 c.codConvenio AS 'Convênio', c.nome AS 'NomeConvenio'
FROM tbPedidoEx pe
INNER JOIN tbPaciente p ON pe.codPaciente = p.codPaciente
INNER JOIN tbConvenio c ON pe.codConvenio = c.codConvenio
WHERE pe.dataPedido BETWEEN '2022/11/03' AND '2022/11/10';


/*5. Elabore uma consulta que retorne o número do pedido de exame, o código do exame, o
nome do exame, o nome do paciente e o nome do médico de todos os exames dos pedidos
de exames. Coloque aliases nas colunas.*/

SELECT ped.codPedidoEx 'Número do Pedido', 
exp.codExame 'Código do Exame', 
ex.nome 'Nome do Exame', 
pac.nome 'Nome do Paciente', 
med.nome 'Nome do Médico' 
FROM tbPedidoEx ped 
INNER JOIN tbExamePorPedido exp ON ped.codPedidoEx = exp.codPedidoEx 
INNER JOIN tbExame ex ON exp.codExame = ex.codExame 
INNER JOIN tbMedico med ON ped.CRMMedico = med.CRMMedico 
INNER JOIN tbPaciente pac ON ped.codPaciente = pac.codPaciente;



/*6. Elabore uma consulta que retorne o número do pedido de exame, local de coleta, o código
do exame, o nome do exame, o nome do paciente e o nome do convênio de todos os
exames dos pedidos de exame cadastrados, cujo local de coleta foi no Hospital. Coloque
aliases nas colunas.*/

SELECT ped.codPedidoEx 'Número do Pedido', 
ped.localColeta 'Local de Coleta', 
ex.codExame  'Código do Exame', 
ex.nome 'Nome do Exame', 
pac.nome 'Nome do Paciente', 
co.nome 'Nome do Convênio' 
FROM tbPedidoEx ped 
INNER JOIN tbExamePorPedido exp ON ped.codPedidoEx = exp.codPedidoEx 
INNER JOIN tbExame ex ON exp.codExame = ex.codExame 
INNER JOIN tbPaciente pac ON ped.codPaciente = pac.codPaciente 
INNER JOIN tbConvenio co ON ped.codConvenio = co.codConvenio 
WHERE pe.localColeta = 'Hospital';


/*7. Elabore uma consulta que retorne o código do exame, o nome do exame, o número do
pedido do exame, o CRM do médico, o nome do médico, a especialidade do médico e o
nome do paciente de todos os pedidos de exames cadastrados, cuja especialidade do
médico seja Dermatologista. Coloque aliases nas colunas.*/

SELECT ex.codExame AS 'Código do Exame', 
ex.nome AS 'Nome do Exame', 
ep.codPedidoEx AS 'Número do Pedido', 
me.CRMMedico AS 'CRM do Médico', 
me.nome AS 'Nome do Médico', 
me.especialidade AS 'Especialidade do Médico', 
pa.nome AS 'Nome do Paciente' 
FROM tbExame ex 
INNER JOIN tbExamePorPedido ep ON ex.codExame = ep.codExame 
INNER JOIN tbPedidoEx pe ON ep.codPedidoEx = pe.codPedidoEx 
INNER JOIN tbMedico me ON pe.CRMMedico = me.CRMMedico 
INNER JOIN tbPaciente pa ON pe.codPaciente = pa.codPaciente 
WHERE me.especialidade = 'Dermatologista';


/*8. Elabore uma consulta que retorne o código do exame, o nome do exame, o nome do grupo
do exame, o número do pedido do exame, o CRM do médico, o nome do médico, a
especialidade do médico, o nome do paciente e o nome do convênio de todos os pedidos
de exames cadastrados, cuja hora em que vai ficar pronto seja 17:00. Coloque aliases nas
colunas e ordenar a consulta em ordem descendente de nome do exame.*/



/*9. Elabore uma consulta que retorne o total de exames por grupo de exame. Mostar, nesta
consulta, o código do grupo do exame, o nome do grupo do exame e o valor total calculado.
Coloque aliases nas colunas e ordenar pelo nome do grupo do exame.*/




/*10.Elabore uma consulta mostre o valor mais alto entre os exames cadastrados. Mostrar,
nesta consulta, o nome do exame, o nome do grupo do exame e o valor do exame. Coloque
aliases nas colunas.*/




/*11.Elabore uma consulta que use mais de uma tabela, função agregada, group by e having.
Escreva o enunciado desta consulta no script.*/


