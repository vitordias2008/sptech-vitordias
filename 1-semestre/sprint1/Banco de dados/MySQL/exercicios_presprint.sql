-- Exercício 1 - Loja de Jogos

CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    diretor VARCHAR(30),
    genero VARCHAR(30),
    lancamento DATE,
    nota INT,
    qtdD INT
);

-- a)
INSERT INTO jogo VALUES
(DEFAULT, 'CyberPunk 2077', 'Adam Badowski', 'Ficção Cientifica', '2020-12-10', 10, 150),
(DEFAULT, 'The Last of Us Part II', 'Neil Druckmann', 'Ação e Aventura', '2020-06-19', 10, 120),
(DEFAULT, 'God of War', 'Cory Barlog', 'Ação e Aventura', '2018-04-20', 9, 180),
(DEFAULT, 'Elden Ring', 'Hidetaka Miyazaki', 'RPG de Ação', '2022-02-25', 7, 200),
(DEFAULT, 'Lies of P', 'Choi Ji-won', 'RPG de Ação', '2023-09-18', 10, 90),
(DEFAULT, 'Ghost of Tsushima', 'Nate Fox', 'Ação e Aventura', '2020-07-17', 8, 140);

-- b)
ALTER TABLE jogo ADD COLUMN midia VARCHAR(10);

ALTER TABLE jogo ADD CONSTRAINT chk_midia
CHECK (midia IN ('física', 'digital'));

-- c)
UPDATE jogo SET midia = 'digital' WHERE id = 1;
UPDATE jogo SET midia = 'física' WHERE id = 2;
UPDATE jogo SET midia = 'física' WHERE id = 3;
UPDATE jogo SET midia = 'digital' WHERE id = 4;
UPDATE jogo SET midia = 'física' WHERE id = 5;
UPDATE jogo SET midia = 'física' WHERE id = 6;

-- d)
SELECT * FROM jogo
WHERE lancamento >= '2015-01-01';

-- e)
SELECT * FROM jogo WHERE nome LIKE '%a%' AND midia = 'física';

-- f)
SELECT * FROM jogo WHERE diretor NOT LIKE '%e%';

-- g)
ALTER TABLE jogo ADD CONSTRAINT chk_nota
CHECK (nota >= 0 AND nota <= 10);

-- h)
SELECT * FROM jogo WHERE genero = 'Ação e Aventura'
AND qtdD > 0;

-- i)
DELETE FROM jogo WHERE qtdD = 0;

-- j)
ALTER TABLE jogo RENAME COLUMN diretor TO criador;

DESC jogo;


-- Exercício 2 - Esportes Olímpicos

CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20),
    qtdJogadores INT,
    estreia DATE,
    paisOrigem VARCHAR(30),
    CONSTRAINT chk_categoria CHECK (categoria IN ('Individual', 'Coletivo'))
);

-- a)
INSERT INTO esporte VALUES
(DEFAULT, 'Futebol', 'Coletivo', 11, '1900-05-20', 'Inglaterra'),
(DEFAULT, 'Basquete', 'Coletivo', 5, '1936-08-07', 'Estados Unidos'),
(DEFAULT, 'Skate', 'Individual', 1, '2021-07-25', 'Estados Unidos'),
(DEFAULT, 'Surfe', 'Individual', 1, '2021-07-25', 'Polinésia'),
(DEFAULT, 'Voleibol', 'Coletivo', 6, '1964-10-11', 'Estados Unidos');

-- b)
ALTER TABLE esporte ADD COLUMN popularidade DECIMAL(4,2);

ALTER TABLE esporte ADD CONSTRAINT chk_popularidade
CHECK (popularidade >= 0 AND popularidade <= 10);

DESC esporte;

-- c)
UPDATE esporte SET popularidade = 9.80 WHERE id = 1;
UPDATE esporte SET popularidade = 9.20 WHERE id = 2;
UPDATE esporte SET popularidade = 8.10 WHERE id = 3;
UPDATE esporte SET popularidade = 7.80 WHERE id = 4;
UPDATE esporte SET popularidade = 8.90 WHERE id = 5;

-- d)
SELECT * FROM esporte ORDER BY popularidade ASC;

-- e)
SELECT * FROM esporte WHERE estreia >= '2000-01-01';

-- f)
ALTER TABLE esporte ADD CONSTRAINT chk_estreia
CHECK (estreia >= '1896-04-06' AND estreia <= '2026-09-01');

-- g)
ALTER TABLE esporte
DROP CHECK chk_categoria;

-- h)
SELECT * FROM esporte WHERE paisOrigem LIKE '_a%';

-- i)
SELECT * FROM esporte WHERE qtdJogadores BETWEEN 4 AND 11;

-- j)
DELETE FROM esporte WHERE id IN (1, 3, 5);


-- Exercício 3 - Desenhos Animados

CREATE DATABASE desenho;
USE desenho;

CREATE TABLE desenhoAnimado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    lancamento DATE,
    emissoraOriginal VARCHAR(50),
    classificacao INT,
    status VARCHAR(15),
    nota INT,
    CONSTRAINT chk_nota_desenho CHECK (nota BETWEEN 1 AND 5)
) AUTO_INCREMENT = 10;

INSERT INTO desenhoAnimado VALUES
(DEFAULT, 'Hora de Aventura', '2010-04-05', 'Cartoon Network', 10, 'exibindo', 5),
(DEFAULT, 'Ben 10', '2005-12-27', 'Cartoon Network', 10, 'exibindo', 4),
(DEFAULT, 'Bob Esponja', '1999-05-01', 'Nickelodeon', 10, 'finalizado', 5),
(DEFAULT, 'Os Padrinhos Mágicos', '2001-03-30', 'Nickelodeon', 10, 'cancelado', 4),
(DEFAULT, 'Steven Universo', '2013-11-04', 'Cartoon Network', 10, 'exibindo', 5);

-- a)
SELECT * FROM desenhoAnimado;

-- b)
SELECT * FROM desenhoAnimado WHERE classificacao <= 14;

-- c)
SELECT * FROM desenhoAnimado WHERE emissoraOriginal = 'Cartoon Network';

-- d)
ALTER TABLE desenhoAnimado ADD CONSTRAINT chk_status
CHECK (status IN ('exibindo', 'finalizado', 'cancelado'));

-- e)
UPDATE desenhoAnimado SET status = 'finalizado' WHERE id IN (10, 11);

-- f)
DELETE FROM desenhoAnimado WHERE id = 12;

-- g)
SELECT * FROM desenhoAnimado WHERE titulo LIKE 'S%';

-- h)
ALTER TABLE desenhoAnimado RENAME COLUMN classificacao TO classificacaoIndicativa;

-- i)
UPDATE desenhoAnimado SET nota = 5, lancamento = '2005-12-27' WHERE id = 11;

-- j)
TRUNCATE TABLE desenhoAnimado;

-- k)
ALTER TABLE desenhoAnimado DROP CHECK chk_status;


-- Exercício 4 - Despensa do Scooby-Doo

CREATE DATABASE estoque;
USE estoque;

CREATE TABLE MisteriosSA (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    dataCompra DATE,
    preco DECIMAL(10,2),
    peso DECIMAL(10,2),
    dataRetirada DATE
);

-- a)
INSERT INTO MisteriosSA VALUES
(1, 'Biscoitos Scooby', '2024-07-10', 25.90, 500, NULL),
(2, 'Cachorro-quente', '2024-07-15', 32.50, 300, NULL),
(3, 'Biscoitos Scooby', '2024-07-28', 35.90, 650, NULL),
(4, 'Cachorro-quente', '2024-08-02', 18.50, 250, NULL),
(5, 'Biscoitos Scooby', '2024-08-10', 40.00, 800, NULL);

-- b)
SELECT * FROM MisteriosSA;

-- c)
SELECT nome, dataCompra, dataRetirada, id FROM MisteriosSA ORDER BY dataCompra ASC;

-- d)
UPDATE MisteriosSA SET dataRetirada = '2024-07-20' WHERE id = 1;

-- e)
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

-- f)
ALTER TABLE MisteriosSA ADD CONSTRAINT chk_nome
CHECK (nome IN ('Biscoitos Scooby', 'Cachorro-quente'));

-- g)
SELECT nome, dataCompra AS 'data da compra', dataRetirada AS 'data da retirada' FROM MisteriosSA WHERE nome = 'Biscoitos Scooby';

-- h)
SELECT * FROM MisteriosSA WHERE dataCompra < '2024-07-25';

-- i)
SELECT * FROM MisteriosSA WHERE preco >= 30.50;

-- j)
TRUNCATE TABLE MisteriosSA;


-- Exercício 5 - Heróis

CREATE DATABASE vingadores;
USE vingadores;

CREATE TABLE heroi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(100),
    altura INT
);

INSERT INTO heroi VALUES
(DEFAULT, 'Homem de Ferro', 'Vingadores Ultimato', 'Armadura tecnológica', 185),
(DEFAULT, 'Thor', 'Thor Ragnarok', 'Controle de raios', 190),
(DEFAULT, 'Capitão América', 'Capitão América 2', 'Super força e escudo', 188),
(DEFAULT, 'Hulk', 'Vingadores', 'Super força', 244),
(DEFAULT, 'Homem-Aranha', 'Sem Volta Para Casa', 'Sentido aranha', 173);

-- a)
SELECT * FROM heroi;

-- b)
ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

ALTER TABLE heroi ADD CONSTRAINT chk_regeneracao
CHECK (regeneracao IN (TRUE, FALSE));

-- c)
ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

-- d)
DELETE FROM heroi WHERE id = 3;

-- e)
INSERT INTO heroi VALUES
(DEFAULT, 'Wolverine', 'Deadpool & Wolverine', 'Regeneração acelerada', 188, TRUE);

-- f)
SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';

-- g)
SELECT * FROM heroi WHERE nome NOT LIKE '%a%';

-- h)
SELECT nome FROM heroi WHERE altura > 190;

-- i)
SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

-- j)
TRUNCATE TABLE heroi;
