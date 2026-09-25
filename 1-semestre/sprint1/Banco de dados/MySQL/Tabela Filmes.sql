-- Criar a tabela
CREATE TABLE Filmes(
idFilme INT PRIMARY KEY,
Titulo VARCHAR(50),
Gênero VARCHAR(40),
Diretor VARCHAR(40)
) ;

-- Inserir filmes
INSERT INTO filmes VALUES
(1, 'Batman: O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan'),
(2, 'Corra!', 'Terror', 'Jordan Peele'),
(3, 'It, A Coisa', 'Terror', 'Andy Muschietti'),
(4, 'Obsessão', 'Terror', 'Curry Barker'),
(5, 'Interestelar', 'Ficção Científica', 'Christopher Nolan'),
(6, 'O Homem de Aço', 'Ação', 'Christopher Nolan'),
(7, 'Vingadores: Ultimato', 'Ação', 'Anthony Russo e Joe Russo'),
(8, 'O Lobo de Wall Street', 'Comédia', 'Martin Scorsese'),
(9, 'Invocação do Mal', 'Terror', 'James Wan'),
(10, 'Parasita', 'Suspense', 'Bong Joon-ho'),
(11, 'Clube da Luta', 'Drama', 'David Fincher'),
(12, 'Pânico', 'Terror', 'Wes Craven');

-- Exibir todos os filmes
SELECT * FROM filmes;

-- Exibir apenas os titulos e diretores
SELECT Titulo, Diretor FROM filmes;

-- Exibir apenas os dados dos filmes de um determinado gênero. (Terror)
SELECT * FROM filmes
	WHERE Gênero LIKE 'Terror';
    
-- Exibir apenas os dados dos filmes de um determinado diretor.
SELECT * FROM filmes
	WHERE Diretor LIKE 'Christopher Nolan';
    
-- Exibir os dados da tabela ordenados pelo título do filme.
SELECT * FROM filmes ORDER BY Titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT * FROM filmes ORDER BY Diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra. (i)
SELECT * FROM filmes
	WHERE Titulo LIKE 'i%';
    
--  Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra. (a)
SELECT * FROM filmes
	WHERE Titulo LIKE '%a';
    
-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra (a)
SELECT * FROM filmes
	WHERE Titulo LIKE '_a%';
    
-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra. (a)
SELECT * FROM filmes
	WHERE Titulo LIKE '%a_';
    
-- Eliminar a tabela
DROP TABLE filmes;