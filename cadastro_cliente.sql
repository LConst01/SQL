CREATE DATABASE Cadastro_Cliente;
USE Cadastro_Cliente;
CREATE TABLE Cliente(
	Cod_Cli INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome_Cli VARCHAR(50) NOT NULL,
    Genero_Cli CHAR(01) NOT NULL CHECK(Genero_Cli IN ('F','M', 'O')) DEFAULT 'O',
    Renda_Cli DECIMAL(10,2) CHECK(Renda_Cli >=0) DEFAULT 0,
    RG_Cli CHAR(12) NOT NULL UNIQUE
);

CREATE TABLE Funcionario(
	Cod_Func INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome_Func VARCHAR(50) NOT NULL,
    Genero_Func CHAR(01) NOT NULL CHECK(Genero_Func IN ('F', 'M', 'O')) DEFAULT 'O',
    Sal_Func DECIMAL(10,2) NOT NULL CHECK(Sal_Func >= 0), 
    Data_Cadast_Func DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO Cliente (Cod_Cli, Nome_Cli, Genero_Cli, Renda_Cli, RG_Cli)
VALUES 
	(1, 'Jõao Carlos', 'M', 5000.00, 123456),
    (2, 'Daniel', 'M', 5000.00, 145678),
    (3, 'Helena', 'F', 6000.00, 56433),
    (4, 'Roberta', 'F', 5000.00, 564322),
    (5, 'Renata', 'F', 3000.00, 654321),
    (6, 'Giovanna', 'F', 3500.00, 56421);
    
ALTER TABLE Funcionario
MODIFY COLUMN Data_Cadast_Func DATE NOT NULL;
    
INSERT INTO Funcionario (Nome_Func, Genero_Func, Sal_Func, Data_Cadast_Func)
VALUES 
	('Salvador', 'M', 7000.00, '1995-01-03'),
    ('Antônio', 'M', 6000.00, '1998-05-06'),
    ('Antonieta', 'F', 6500.00, '1998-08-07'),
    ('Eduardo', 'M', 4000.00, '2000-08-06'),
    ('Leny', 'F', 3000.00, '2001-08-06');
/*Com base nas tabelas criadas anteriormente, escreva uma consulta que exiba o tipo se é 'cliente' ou 'funcionário', o nome, o gênero, a data de cadastro e o RG*/

SELECT 
	'Cliente' AS Tipo,
    Nome_Cli AS Nome,
    Genero_Cli AS Genero,
    NULL AS Data_cadastro, 
    RG_Cli AS RG
FROM Cliente

UNION ALL

SELECT 
	'Funcionario' AS Tipo,
    Nome_Func AS Nome,
    Genero_Func AS Genero,
    DATE_FORMAT(Data_Cadast_Func, '%d/%m/%Y') AS Data_Cadastro, 
	NULL AS RG
FROM Funcionario;
    