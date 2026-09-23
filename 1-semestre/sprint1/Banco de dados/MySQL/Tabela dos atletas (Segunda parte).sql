-- Criar tabela atleta
CREATE TABLE atleta (
idAtleta INT PRIMARY KEY,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

-- Adicionar atletas
INSERT INTO atleta VALUES
(1, 'Roberto', 'Futebol', 4),
(2, 'Mateus', 'Beisebol', 1),
(3, 'Vanessa', 'Volei', 6),
(4, 'Pedro', 'Futebol', 2),
(5, 'João', 'Beisebol', 2),
(6, 'Mariana', 'Volei', 3),
(7, 'Ailton', 'Futebol', 3),
(8, 'Sophia', 'Volei', 2),
(9, 'Carlos', 'Beisebol', 6),
(10, 'Marcus', 'Futebol', 3),
(11, 'João Pedro', 'Beisebol', 2),
(12, 'Mariana', 'Volei', 1),
(13, 'Gabriel', 'Futebol', 3),
(14, 'Beatriz', 'Beisebol', 5),
(15, 'Lucas', 'Natação', 2),
(16, 'Luiza', 'Natação' ,4);

-- Exibir todos os dados
SELECT * FROM atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE atleta SET qtdMedalha = 2
	WHERE idAtleta = 1;
    
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE atleta SET qtdMedalha = 3
	WHERE idAtleta = 2;
    
UPDATE atleta SET qtdMedalha = 5
	WHERE idAtleta = 3;
    
--  Atualizar o nome do atleta com o id=4;
UPDATE atleta SET nome = 'Andre'
	WHERE idAtleta = 3;
    
-- 	Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE atleta ADD COLUMN DtNasc DATE;

-- Atualizar a data de nascimento de todos os atletas;
UPDATE atleta SET DtNasc = '2001-03-14'
	WHERE idAtleta = 1;
    
UPDATE atleta SET DtNasc = '1998-11-27'
	WHERE idAtleta = 2;

UPDATE atleta SET DtNasc = '2004-07-09'
	WHERE idAtleta = 3;


UPDATE atleta SET DtNasc = '1995-02-18'
	WHERE idAtleta = 4;


UPDATE atleta SET DtNasc = '2002-09-23'
	WHERE idAtleta = 5;


UPDATE atleta SET DtNasc = '2000-05-31'
	WHERE idAtleta = 6;


UPDATE atleta SET DtNasc = '1997-12-06'
	WHERE idAtleta = 7;


UPDATE atleta SET DtNasc = '2003-04-17'
	WHERE idAtleta = 8;


UPDATE atleta SET DtNasc = '1999-08-25'
	WHERE idAtleta = 9;


UPDATE atleta SET DtNasc = '2005-01-12'
	WHERE idAtleta = 10;


UPDATE atleta SET DtNasc = '1996-10-03'
	WHERE idAtleta = 11;


UPDATE atleta SET DtNasc = '2001-06-29'
	WHERE idAtleta = 12;

UPDATE atleta SET DtNasc = '2002-02-11'
	WHERE idAtleta = 13;

UPDATE atleta SET DtNasc = '1999-07-19'
	WHERE idAtleta = 14;

UPDATE atleta SET DtNasc = '2004-10-28'
	WHERE idAtleta = 15;
    
UPDATE atleta SET DtNasc = '2007-07-01'
	WHERE idAtleta = 16;

-- Exibir tabela
SELECT * FROM atleta;

-- Excluir o atleta com o id=5;
DELETE FROM atleta
	WHERE idAtleta = 3;
    
-- Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM atleta
	WHERE modalidade != 'natação';
    
-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM atleta
	WHERE qtdMedalha >=3;
    
-- Modificar o campo modalidade do tamanho 40 para o tamanho 60]
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade
DESCRIBE atleta;

-- Limpar a tabela
TRUNCATE TABLE atleta;
