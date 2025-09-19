-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criar tabela autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

-- Criar tabela livros
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(id_autor)
);

-- Inserir dados na tabela autores
INSERT INTO autores (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado');

-- Inserir dados na tabela livros
INSERT INTO livros (titulo, autor_id) VALUES
('Dom Casmurro', 1),
('A Hora da Estrela', 2),
('Gabriela, Cravo e Canela', 3),
('Memórias Póstumas de Brás Cubas', 1);

SELECT * FROM autores;
SELECT * FROM livros;
/*Exiba os livros com nome dos autores correspondentes*/
SELECT livros.titulo, autores.nome_autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id_autor;

INSERT INTO livros (titulo, autor_id) VALUES
('Divergente ', NULL);

INSERT INTO autores (nome_autor) VALUES
('ET Bilu');
/*Exiba todos os livros, mostrando o autor quando houver, ou NULL quando não houver autor*/
SELECT livros.titulo, autores.nome_autor
FROM livros
LEFT JOIN  autores ON livros.autor_id =  autores.id_autor;
/*LEFT JOIN: retorna todas as linhas da tabela à esquerda e as correspondências da tabela  da direita.
Quando não tem correspondência, mostra NULL*/
/*RIGHT JOIN: retorna todas as linhas da tabela à direita e as correspondências da tabela da esquerda.
Quando não tem correspondência, mostra NULL*/

/*Exiba todos os autores, com seus livros correpondentes ou NULL caso não tenha livros cadastrados*/
SELECT autores.nome_autor, livros.titulo
FROM livros
RIGHT JOIN autores ON autores.id_autor = livros.autor_id ;

/*Liste todos os livros com seus autores em ordem alfabética pelo título*/
SELECT livros.titulo, autores.nome_autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id_autor
ORDER BY livros.titulo ASC;

/*Liste todos os autores e a quantidade de livros que cada um possui*/
SELECT autores.nome_autor, count(livros.titulo) AS quantidade_livros
FROM autores
LEFT JOIN livros ON livros.autor_id = autores.id_autor
GROUP BY autores.nome_autor;

/*Liste todos os altores que não tem nehum livro cadastrado*/

SELECT autores.nome_autor, count(livros.titulo) AS quantidade_livros
FROM autores
LEFT JOIN livros ON livros.autor_id = autores.id_autor
GROUP BY autores.nome_autor
HAVING count(livros.titulo) = 0;

/*Buscar os títulos dos livros que foram escritos por 'Machado de Assis'*/
SELECT livros.titulo
FROM livros
INNER JOIN autores ON  autores.id_autor = livros.autor_id
WHERE autores.nome_autor = 'Machado de Assis';

/*Exiba o total de livros na tabela*/
SELECT COUNT(livros.titulo) AS quantidade_livros FROM livros;

/*Listar autores e seus livros, ordenados pelo nome do autor e depois pelo título do livro*/
SELECT autores.nome_autor, livros.titulo 
FROM autores
INNER JOIN livros ON autores.id_autor = livros.autor_id
ORDER BY autores.nome_autor; 

/*TRUNCATE: remove todas as linhas da tabela, mantendo a estrutura dela*/
TRUNCATE TABLE livros;

/*RENOMEAR: RENAME*/
RENAME TABLE livros TO obras;
RENAME TABLE obras TO livros;

/*Renomear coluna*/
ALTER TABLE livros RENAME COLUMN titulo TO nome_titulo;
ALTER TABLE livros RENAME COLUMN nome_titulo TO titulo;

/*DLC: Linguagem de controle de dados(Data Control Language): gerencia permissões
de acesso ao banco de dados
GRANT: CONCEDER ACESSO
REVOKE: REVOGAR O ACESSO
*/

/*TCL: Transaction Control Language(Linguagem de controle de transação)
Transação: operação que deve ser executada para garantir a integridade e a 
consistência dos dados.
COMMIT: Gravar permanentemente todas as alterações da transação. Após o commit
as alterações não podem ser desfeitas.

ROLLBACK: Desfazer as alterções feitas desde o início da transação ou desde o último
sevepoint, retornando o banco ao estado anterior.

SAVEPOINT: Cria um ponto intermediário de uma transção para que seja possível
reverter parcialmente as operações até aquele determinado ponto, sem desfazer toda 
a transação.
*/

START TRANSACTION;

INSERT INTO livros(titulo, autor_id) VALUES ('Novo Livro', 2);

SAVEPOINT antes_update;
SELECT * FROM livros;

UPDATE livros SET titulo = 'Livro Atualizado' WHERE id_livro = 1;

/*Se algo der errado, voltamos ao savepoint*/
ROLLBACK TO SAVEPOINT antes_update;

/*SELECT coluna1, coluna2,...
FROM tabela
WHERE condição
GROUP BY coluna
HAVING condição_agrupamento
ORDER BY coluna ASC|DESC
LIMIT número;*/