CREATE DATABASE Universidade;
USE Universidade;

CREATE TABLE IF NOT EXISTS Alunos (
	mat INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Disciplinas (
	cod_disc VARCHAR(20) PRIMARY KEY NOT NULL,
    nome_disc VARCHAR(100) NOT NULL,
    carga_hor INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Professores (
	cod_prof INT PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Turma (
	cod_disc VARCHAR(20) NOT NULL,
    cod_turma INT NOT NULL,
    cod_prof INT NOT NULL,
    ano INT NOT NULL,
    horario VARCHAR(20),
    PRIMARY KEY (cod_disc, cod_turma, cod_prof, ano),
    FOREIGN KEY (cod_disc) REFERENCES Disciplinas(cod_disc),
    FOREIGN KEY (cod_prof) REFERENCES Professores(cod_prof)
);

CREATE TABLE Historico(
	mat INT NOT NULL,
    cod_disc VARCHAR(20),
    cod_turma INT NOT NULL,
    ano INT NOT NULL,
    cod_prof INT NOT NULL, 
    frequencia INT NOT NULL,
    nota FLOAT NOT NULL,
    PRIMARY KEY (mat, cod_disc, cod_turma, cod_prof, ano),
    FOREIGN KEY (mat) REFERENCES Alunos(mat),
	FOREIGN KEY (cod_disc, cod_turma, cod_prof, ano)
    REFERENCES Turma(cod_disc, cod_turma, cod_prof, ano) 
);

INSERT INTO Alunos (MAT, nome, endereco, cidade) VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

INSERT INTO Disciplinas (COD_DISC, nome_disc, carga_hor) VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

INSERT INTO Professores (COD_PROF, nome, endereco, cidade) VALUES
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

INSERT INTO Turma (COD_DISC, COD_TURMA, COD_PROF, ANO, horario) VALUES
('BD', 1, 212131, 2015, '11H-12H'),
('BD', 2, 212131, 2015, '13H-14H'),
('POO', 1, 192011, 2015, '08H-09H'),
('WEB', 1, 192011, 2015, '07H-08H'),
('ENG', 1, 122135, 2015, '10H-11H');

INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010101, 'BD', 1, 212131, 2015, 90, 4.5),
(2015010101, 'BD', 2, 212131, 2015, 95, 6.0),
(2015010101, 'POO', 1, 192011, 2015, 80, 7.5),
(2015010101, 'WEB', 1, 192011, 2015, 85, 8.0),
(2015010101, 'ENG', 1, 122135, 2015, 90, 7.0),

(2015010102, 'BD', 1, 212131, 2015, 85, 3.0),
(2015010102, 'BD', 2, 212131, 2015, 90, 6.5),
(2015010102, 'POO', 1, 192011, 2015, 90, 5.0),
(2015010102, 'WEB', 1, 192011, 2015, 75, 6.0),
(2015010102, 'ENG', 1, 122135, 2015, 80, 6.5),

(2015010103, 'BD', 1, 212131, 2015, 75, 2.0),
(2015010103, 'BD', 2, 212131, 2015, 95, 4.0),
(2015010103, 'POO', 1, 192011, 2015, 85, 8.0),
(2015010103, 'WEB', 1, 192011, 2015, 88, 7.5),
(2015010103, 'ENG', 1, 122135, 2015, 92, 8.0),

(2015010104, 'BD', 1, 212131, 2015, 90, 6.0),
(2015010104, 'BD', 2, 212131, 2015, 82, 5.5),
(2015010104, 'POO', 1, 192011, 2015, 92, 4.5),
(2015010104, 'WEB', 1, 192011, 2015, 85, 5.0),
(2015010104, 'ENG', 1, 122135, 2015, 80, 6.0),

(2015010105, 'BD', 1, 212131, 2015, 95, 7.0),
(2015010105, 'BD', 2, 212131, 2015, 90, 8.0),
(2015010105, 'POO', 1, 192011, 2015, 85, 6.5),
(2015010105, 'WEB', 1, 192011, 2015, 80, 7.0),
(2015010105, 'ENG', 1, 122135, 2015, 92, 7.5),

(2015010106, 'BD', 1, 212131, 2015, 93, 4.0),
(2015010106, 'BD', 2, 212131, 2015, 85, 3.5),
(2015010106, 'POO', 1, 192011, 2015, 90, 7.0),
(2015010106, 'WEB', 1, 192011, 2015, 87, 7.5),
(2015010106, 'ENG', 1, 122135, 2015, 90, 7.0);

SELECT * FROM Historico;
/*Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD =código da disciplinas)*/
SELECT DISTINCT mat
FROM Historico
WHERE cod_disc = 'BD' AND ano = 2015 AND nota < 5;

/*Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015.*/
SELECT mat, AVG(nota) AS media_nota /*AVG = average = média*/
FROM Historico
WHERE cod_disc = 'POO' AND ano = 2015
GROUP BY mat;

/*Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO*/
SELECT mat, AVG(nota) AS media_nota /*AVG = average = média*/
FROM Historico
WHERE cod_disc = 'POO' AND ano = 2015
GROUP BY mat
HAVING AVG(nota) > 6; /*HAVING = FILTRAR*/

/*Encontre quantos alunos não são de Natal.*/
SELECT COUNT(*) AS quantidade_alunos_fora_natal /**/
FROM Alunos
WHERE cidade <> 'NATAL';

/*Liste os nomes dos alunos que tiraram nota maior que 7 na disciplina "ENG" em 2015*/
SELECT Alunos.nome
FROM Alunos
JOIN Historico ON Alunos.mat = Historico. mat
WHERE Historico.cod_disc = 'ENG'
	AND Historico.ano =2015
    AND Historico.nota > 7;
    
/* Mostre para cada professor o nome, cidade, e a quantidade de turmas que ele ministrou em 2015.*/
SELECT Professores.nome, Professores.cidade, COUNT(cod_turma)
FROM Professores
JOIN Turmas ON Professores.cod_prof = Turmas.cod_prof
WHERE Historico.ANO = 2015
	AND
 