/*1.Conte quantos clientes existem na tabela cliente*/
SELECT COUNT(*) AS quantidade_clientes FROM cliente;

/*2.Liste o nome dos clientes e a quantidade total de aluguéis que cada um fez.*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis FROM cliente
LEFT JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome;


/*3.Mostre o total gasto por cada cliente, considerando o valor dos carros alugados.*/
SELECT cliente.nome, SUM(carro.valor) AS toltal_valor FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
JOIN carro ON aluguel.codcarro = carro.codcarro
GROUP BY cliente.nome;

/*4.Exiba a média do valor dos carros disponíveis na tebela carro.*/
SELECT AVG(valor) AS Média_valor FROM carro;

/*5.Encontre o menor e a maior valor dos carros cadastrados.*/
SELECT MIN(valor) AS Valor_Mínimo, MAX(valor) AS Valor_Máximo FROM carro;

/*6.Liste as marcas que possuem mais de um carro cadastrado.*/
SELECT marca.marca, COUNT(carro.codcarro) AS total_carros
FROM marca
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.marca
HAVING COUNT(carro.codcarro) >1;
SELECT * FROM carro;



/*7. Mostre os clientes que fizeram mais de dois aluguéis*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome
HAVING COUNT(aluguel.codalugeul) >2;

/*8. Exiba as marcas e a soma total do valor dos seus carros.*/
SELECT marca.marca, SUM(carro.valor) AS soma_carros
FROM marca
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.marca;

/*9. Liste os clientes que gastaram mais de R$300 no total de aluguéis.*/
SELECT cliente.nome, SUM(carro.valor) AS total_valor
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
JOIN carro ON aluguel.codcarro = carro.codcarro
GROUP BY cliente.nome
HAVING SUM(carro.valor) > 300;
/*10. Mostre as cidades e a quantidade de clientes que moram em cada uma,
exibindo apenas as cidades com mais de 1 cliente.*/
SELECT cidade, COUNT(*) AS quantidades_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >1;
/*Precisa agrupar(GROUP BY), usa HAVING. Usa qualquer tipo de função(SUM, AVG, ...), usa HAVING.*/

/* WHERE X HAVING:
WHERE: filtra registros ANTES DO AGRUPAMENTO
HAVING: filtra registros DEPOIS DO AGRUPAMENTO
*/