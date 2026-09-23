-- Criar Banco de Dados
CREATE DATABASE sprint1;

-- Selecionar o Banco de Dados
USE sprint1;

-- Criar tabela musicas
CREATE TABLE Musicas (
idMusica INT PRIMARY KEY,
Titulo VARCHAR(40),
Artista VARCHAR(40),
Gênero VARCHAR(40)
);

-- Adicionar musicas
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
('12', 'Nutshell', 'Alice in Chains', 'Rock'),
('13', 'Bum Bum Tam Tam', 'MC Fioti', 'Funk'),
('14', 'Amor de Verdade', 'MC Kekel e MC Rita', 'Funk'),
('15', 'Tá OK', 'DENNIS e Kevin O Chris', 'Funk'),
('16', '505', 'Arctic Monkeys', 'Rock'),
('17', 'Die With A Smile', 'Lady Gaga e Bruno Mars', 'Pop'),
('18', 'Money Trees', 'Kendrick Lamar', 'Hip-Hop'),
('19', 'No Surprises', 'Radiohead', 'Rock'),
('20', 'Blinding Lights', 'The Weeknd', 'Pop'),
('21', 'Deixa Acontecer', 'Grupo Revelação', 'Pagode');

-- a) Exibir todos os dados da tabela.
SELECT * FROM musicas;

-- b) Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE musicas ADD COLUMN Curtidas INT;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE musicas SET curtidas = '15700'
    WHERE idMusica = 1;

UPDATE musicas SET curtidas = '5200'
    WHERE idMusica = 2;

UPDATE musicas SET curtidas = '8700'
    WHERE idMusica = 3;

UPDATE musicas SET curtidas = '12300'
    WHERE idMusica = 4;

UPDATE musicas SET curtidas = '3400'
    WHERE idMusica = 5;

UPDATE musicas SET curtidas = '19800'
    WHERE idMusica = 6;

UPDATE musicas SET curtidas = '7600'
    WHERE idMusica = 7;

UPDATE musicas SET curtidas = '22100'
    WHERE idMusica = 8;

UPDATE musicas SET curtidas = '9100'
    WHERE idMusica = 9;

UPDATE musicas SET curtidas = '14500'
    WHERE idMusica = 10;

UPDATE musicas SET curtidas = '6300'
    WHERE idMusica = 11;

UPDATE musicas SET curtidas = '17400'
    WHERE idMusica = 12;

UPDATE musicas SET curtidas = '2800'
    WHERE idMusica = 13;

UPDATE musicas SET curtidas = '11200'
    WHERE idMusica = 14;

UPDATE musicas SET curtidas = '25600'
    WHERE idMusica = 15;

UPDATE musicas SET curtidas = '14600'
    WHERE idMusica = 16;

UPDATE musicas SET curtidas = '27800'
    WHERE idMusica = 17;

UPDATE musicas SET curtidas = '19300'
    WHERE idMusica = 18;

UPDATE musicas SET curtidas = '12100'
    WHERE idMusica = 19;

UPDATE musicas SET curtidas = '31500'
    WHERE idMusica = 20;

UPDATE musicas SET curtidas = '8400'
    WHERE idMusica = 21;
    

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE musicas MODIFY artista VARCHAR(80);

--  e) Atualizar a quantidade de curtidas da música com id=1;

UPDATE musicas SET curtidas = '20700'
    WHERE idMusica = 1;
    
-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;

UPDATE musicas SET curtidas = '52700'
    WHERE idMusica = 2;
    
    UPDATE musicas SET curtidas = '56800'
    WHERE idMusica = 3;
    
-- g) Atualizar o nome da música com o id=5;
UPDATE musicas SET titulo = 'Teddy Picker'
    WHERE idMusica = 5;
    
-- h) Excluir a música com o id=4;
DELETE FROM musicas
	WHERE idMusica = 4;
    
-- i) Exibir as músicas onde o gênero é diferente de funk;
SELECT * FROM musicas
	WHERE gênero != 'FUNK';
    
-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM musicas
	WHERE curtidas >=20;
    
-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
DESCRIBE musicas;

-- l) Limpar os dados da tabela;
TRUNCATE musicas;
