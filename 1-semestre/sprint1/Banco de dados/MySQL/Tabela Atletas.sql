-- Criar Banco de Dados
CREATE DATABASE atletas;

-- Selecionar o Banco de Dados
USE atletas;

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
(12, 'Mariana', 'Volei', 1);

-- Exibir todos os dados
SELECT * FROM atleta;

-- Exibir os dados ordenados por modalidade
SELECT * FROM atleta ORDER BY modalidade;

-- Exibir os  ados ordenados por qtdMedalha descrescente
SELECT * FROM atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados dos atletas cujo nome contenha a letra s
SELECT * FROM atleta 
  WHERE nome LIKE '%s%';
  
-- Exibir os dados dos atletas cujo nome contenha determinada letra
SELECT * FROM atleta 
  WHERE nome LIKE '%i%';

-- Exibir os dados dos atletas cujo nome comece com uma determinada letra.
SELECT * FROM atleta 
  WHERE nome LIKE 'M%';
  
-- Exibir os dados dos atletas cujo nome termine com a letra o.
SELECT * FROM atleta 
  WHERE nome LIKE '%o';
  
-- Exibir dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM atleta 
  WHERE nome LIKE '%r_';
  
-- Eliminar a tabela 
DROP TABLE atleta;

  