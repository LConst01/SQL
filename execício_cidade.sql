CREATE DATABASE mundo;
USE mundo; 

CREATE TABLE Pais(
	Id_pais INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(35) NOT NULL, 
    Continente VARCHAR(35) NOT NULL,
    Pop REAL NOT NULL, 
    PIB REAL NOT NULL,
    Expec_vida REAL NOT NULL
);

CREATE TABLE Cidade(
	Id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(35) NOT NULL,
    Id_pais INT NOT NULL, 
    Pais VARCHAR(35) NOT NULL,
    Pop REAL NOT NULL,
    Capital VARCHAR(1) NOT NULL,
    FOREIGN KEY (Id_pais) REFERENCES Pais(Id_pais)
);

CREATE TABLE Rio(
	Id_rio INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(35) NOT NULL,
    Id_pais INT NOT NULL,
    Nascente VARCHAR(35) NOT NULL, 
    Pais VARCHAR(35) NOT NULL,
    Comprimento INTEGER NOT NULL,
    FOREIGN KEY (Id_pais) REFERENCES Pais(Id_pais)
);

INSERT INTO Pais(Nome, Continente, Pop, PIB, Expec_vida) VALUES
	('Canada', 'Am. Norte', 30.1, 658, 77.08),
    ('Mexico', 'Am. Norte', 107.5, 694, 69.1),
    ('Brasil', 'Am. Sul', 183.3, 10004, 65.2),
    ('USA', 'Am. Norte', 270.0, 8003, 75.5);
    
INSERT INTO Cidade(Nome, Id_pais, Pais, Pop, Capital) VALUES
	('Washington', 4, 'USA', 3.3, 'S'),
    ('Monterrey', 2, 'Mexico', 2.0, 'N'),
    ('Brasilia', 3, 'Brasil', 1.5, 'S'),
    ('São Paulo', 3, 'Brasil', 15.0, 'N'),
    ('Ottawa', 1, 'Canada', 0.8, 'S'),
    ('Cid. Mexico', 2, 'Mexico', 14.1, 'S');

INSERT INTO Rio(Nome, Id_pais, Nascente, Pais, Comprimento) VALUES
	('St. Lawrence',4, 'USA', 'USA', 3.3),
	('Grande',4, 'USA', 'Mexico', 2.0),
    ('Parana',3, 'Brasil', 'Brasil', 1.5),
    ('Mississipi',4, 'USA', 'USA', 15.0);
    
/*1. Liste todas as cidades e os países aos quais pertencem.*/
SELECT Cidade.Nome AS Cidade,  Pais.Nome AS Pais
FROM Cidade
LEFT JOIN Pais ON Cidade.Id_Pais = Pais.Id_Pais;

/*2. Liste todas as cidades que são capitais.*/
SELECT Nome FROM Cidade
WHERE Capital = 'S';

/*3. Liste todos os atributos dos países onde a expectativa de vida é menor que 70 anos.*/
SELECT * FROM Pais
WHERE Expec_vida < 70;

/*4. Liste todas as capitais e as populações dos países cujos PIB é maior que 1 trilhão de dólares.*/
SELECT Cidade.Nome, Cidade.Pop FROM Cidade
RIGHT JOIN Pais ON Pais.Id_pais = Cidade.Id_pais
WHERE Pais.PIB > 1000 AND  Cidade.Capital = 'S';

/*5. Quais são o nome e a população da capital do país onde o rio St. Lawrence tem sua nascente.*/
SELECT Cidade.Nome, Cidade.Pop FROM Cidade
JOIN Rio ON Rio.Id_pais = Cidade.Id_pais
WHERE Rio.Nome = 'St. Lawrence';

/*6. Qual é a média da população das cidades que não são capitais.*/
SELECT AVG(Cidade.Pop) AS Media_Populacao_C, AVG(Pais.Pop) AS Media_Populacao_P FROM Cidade
JOIN Pais ON Pais.Id_pais = Cidade.Id_pais
GROUP BY Cidade.Capital
HAVING Capital = 'N';

/*7. Para cada continente retorne o PIB médio de seus países.*/

/*8. Para cada país onde pelo menos 2 rios tem nascente, encontre o comprimento do menor rio.*/
SELECT Pais.Nome AS 
/*9. Liste os países cujo PIB é maior que o PIB é do Canada*/

