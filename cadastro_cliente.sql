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