-- Criar Banco de Dados
CREATE DATABASE Musicas;

-- Selecionar o Banco de Dados
USE Musicas;

-- Criar tabela atleta
CREATE TABLE Musicas (
idMusica INT PRIMARY KEY,
Titulo VARCHAR(40),
Artista VARCHAR(40),
Gênero VARCHAR(40)
);

-- Adicionar atletas
INSERT INTO musicas VALUES
('1', 'Thearefore I Am', 'Billie Eilish', 'Pop'),
('2', 'Hotline Bling', 'Drake', 'Hip-Hop'),
('3', 'LUNCH', 'Billie Eilish', 'Pop'),
('4', 'Promessas', 'Thiaguinho', 'Pagode'),
('5', 'Balaclava', 'Arctic Monkeys', 'Rock'),
('6', 'Not Like Us', 'Kendrick Lamar', 'Hip-Hop'),
('7', 'Smooth Criminal', 'Michael Jackson', 'Pop'),
('8', 'Ate que durou', 'Péricles', 'Pagode'),
('9', 'BAD', 'Michael Jackson', 'Pop'),
('10', 'Human Nature', 'Michael Jackson', 'Pop'),
('11', 'HUMBLE.', 'Kendrick Lamar', 'Hip-hop'),
('12', 'Nutshell', 'Alice in Chains', 'Rock');

-- Exibir todos os dados
SELECT * FROM Musicas;

-- Exibir apenas os dados das musicas de um determinado gênero.
SELECT * FROM musicas
 WHERE gênero LIKE 'Hip-Hop';

-- Exibir apenas os dados das musicas de um determinado artista.
SELECT * FROM musicas
 WHERE artista LIKE 'Michael Jackson';

-- Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM musicas ORDER BY titulo;
  
-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
SELECT * FROM musicas ORDER BY artista DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra. (H)
SELECT * FROM musicas
  WHERE titulo LIKE 'H%';
  
-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra. (s)
SELECT * FROM musicas 
  WHERE artista LIKE '%s';
  
-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra. (o)
SELECT * FROM musicas
  WHERE gênero LIKE '_o%' ORDER BY gênero;
  
  -- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra. (a)
  SELECT * FROM musicas
  WHERE titulo LIKE '%a_'; 
  
-- Eliminar a tabela.
DROP TABLE musicas;

  