CREATE DATABASE Oficina;

CREATE TABLE Tbl_Oficina(
	Placa VARCHAR(10) PRIMARY KEY NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Ano INT NOT NULL
);

INSERT INTO Tbl_Oficina(Placa, Marca, Modelo, Ano)
VALUES
	('DVT7894', 'Ford', 'Fiesta', 2000),
    ('GDU5684', 'Chevrolet', 'Corsa', 2003);

UPDATE Tbl_Oficina SET Modelo= 'EcoSport' WHERE Placa = 'DVT7894';

SELECT * FROM Tbl_Oficina;

DELETE FROM Tbl_Oficina WHERE Placa = 'GDU5684';

CREATE VIEW View_Oficina_Dois AS
SELECT Marca, Modelo, Ano
FROM Tbl_Oficina WHERE Ano >= 2000;
SELECT * FROM View_Oficina_Dois;

ALTER TABLE Tbl_Oficina
ADD COLUMN Tabela_Fipe  FLOAT(30) AFTER Ano;

UPDATE Tbl_Oficina 
SET Tabela_Fipe = CASE
	WHEN Placa = 'DVT7894' THEN 16331
    WHEN Placa = 'GDU5684' THEN 13233
END;
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Tbl_Oficina;