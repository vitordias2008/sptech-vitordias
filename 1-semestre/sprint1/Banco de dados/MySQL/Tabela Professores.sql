-- Criar a tabela
CREATE TABLE Professores(
idProfessor INT PRIMARY KEY,
Nome VARCHAR(50),
Especialidade VARCHAR(40),
dtNasc date
) ;

-- Inserir professores
INSERT INTO professores VALUES
(1, 'Jonathan', 'Historia', '1989-10-13'),
(2, 'Henrique', 'Fisica', '1993-01-25'),
(3, 'Socrates', 'Matematica', '1977-05-19'),
(4, 'Alessandro', 'Historia', '1985-02-09'),
(5, 'Adilson', 'Matematica', '1960-11-15'),
(6, 'Francisco', 'Portugues', '1987-04-23'),
(7, 'Jessica', 'Fisica', '1999-11-12'),
(8, 'Moises', 'Portugues', '1978-12-03');


-- Exibir todos os professores
SELECT * FROM professores;

-- Exibir apenas as especialidades dos professores
SELECT Nome, Especialidade FROM professores;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM professores
	WHERE Especialidade LIKE 'Matematica';
    
-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM professores ORDER BY Nome;
    
-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM professores ORDER BY dtNasc DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra. (j)
SELECT * FROM professores
	WHERE Nome LIKE 'j%';
    
--  Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra. (o)
SELECT * FROM professores
	WHERE nome LIKE '%o';
    
-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra. (o)
SELECT * FROM professores
	WHERE Nome LIKE '_o%';
    
-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra. (c)
SELECT * FROM professores
	WHERE Nome LIKE '%c_';
    
-- Eliminar a tabela
DROP TABLE professores;