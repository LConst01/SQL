CREATE DATABASE Carro;
USE Carro;
CREATE TABLE IF NOT EXISTS tbl_carro(
	placa VARCHAR(7) PRIMARY KEY NOT NULL, /*primay key já é not null*/
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fab INT NOT NULL
);

INSERT INTO tbl_carro(placa, marca, modelo, ano_fab)
VALUES
	('DAE6534', 'Ford', 'Fiesta', 1999),
	('DKL4598', 'Volksvagen', 'Gol', 2001),
	('DKL7878', 'Ford', 'Fiesta', 2001),
	('JDM8776', 'Volksvagen', 'Santana', 2002),
	('JJM3692', 'Chevrolet', 'Corsa', 1999);


SELECT * FROM tbl_carro;

/*UPDATE: atualizar algum campo*/
UPDATE tbl_carro SET modelo = 'New Fiesta' WHERE placa = 'DAE6534';
SELECT * FROM tbl_carro;

SET SQL_SAFE_UPDATES = 0;

/*DELETE: deletar algum campo*/
DELETE FROM tbl_carro WHERE placa = 'DKL4598';
SELECT * FROM tbl_carro;

/*Create view: tabela virtual*/
CREATE VIEW View_Carros_Dois AS 
SELECT marca, modelo, ano_fab 
FROM tbl_carro WHERE ano_fab >= 2000;

SELECT * FROM View_Carros_Dois;  
SELECT * FROM tbl_carro;

/*ADD COLUM: adicionar coluna*/
ALTER TABLE tbl_carro
ADD COLUMN table_fipe FLOAT(10) AFTER modelo;
SELECT * FROM tbl_carro;


UPDATE tbl_carro SET table_fipe = 15000 WHERE placa = 'DAE6534';

UPDATE tbl_carro 
SET table_fipe = CASE
	WHEN  placa = 'DKL7878' THEN 8000
    WHEN  placa = 'JDM8776' THEN 12000
    WHEN  placa = 'JJM3692' THEN 8000
END;



