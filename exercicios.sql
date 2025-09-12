/*1.Conte quantos clientes existem na tabela cliente*/
SELECT COUNT(*) AS quantidade_clientes FROM cliente;

/*2.Liste o nome dos clientes e a quantidade total de aluguéis que cada um fez.*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome 
HAVING COUNT(aluguel.codaluguel);

/*3.Mostre o tatal gasto por cada cliente, considerando o valor dos carros alugados.*/

/*4.Exiba a média do valor dos carros disponíveis na tebela carro.*/

/*5.Encontre o menor e a maior valor dos carros cadastrados.*/

/*6.Liste as marcas que possuem mais de um carro cadastrado.*/

/**/
