-- Criar a tabela
CREATE TABLE Jogos(
idJogo INT PRIMARY KEY,
Nome VARCHAR(50),
Comentario VARCHAR(200),
Ranking CHAR(1)
) ;

-- Inserir Jogos

INSERT INTO Jogos VALUES
(1, 'Cyberpunk 2077', 'Cyberpunk 2077 se passa em Night City, uma cidade futurista dominada por tecnologia, violência e grandes corporações. O jogo mistura RPG, ação e exploração em um mundo aberto cheio de escolhas. Após um lançamento problemático, recebeu grandes melhorias e hoje se destaca pela história, personagens e ambientação.
', '1'),
(2, 'Clair Obscur: Expedition 33', 'Clair Obscur: Expedition 33 é um RPG que combina combate por turnos com ações em tempo real. A história acompanha uma expedição tentando impedir uma entidade que, todos os anos, elimina pessoas de determinada idade. O jogo chama atenção pelo visual artístico, trilha sonora, narrativa emocional e sistema de combate.
', '2'),
(3, 'The Last of Us 2', 'The Last of Us Part II acompanha Ellie em uma jornada marcada por vingança, violência e suas consequências. O jogo possui uma narrativa pesada e controversa, colocando o jogador diante de diferentes perspectivas do conflito. Destaca-se pelas atuações, gráficos, combate intenso e construção detalhada do mundo.
', '3'),
(4, 'Lies of P', 'Lies of P é um soulslike inspirado na história de Pinóquio, mas ambientado em uma cidade sombria tomada por máquinas. O jogo apresenta combates difíceis, chefes marcantes e grande variedade de armas. Sua atmosfera lembra Bloodborne, enquanto suas próprias mecânicas dão identidade à experiência.
', '4'),
(5, 'The Witcher 3: Wild Hunt', 'The Witcher 3 acompanha Geralt de Rívia na busca por Ciri enquanto enfrenta monstros, guerras e conflitos políticos. É um RPG de mundo aberto conhecido pela qualidade de suas missões, personagens e escolhas com consequências. Mesmo anos após seu lançamento, continua sendo uma referência do gênero.
', '5'),
(6, 'Minecraft', 'Minecraft é um jogo de sobrevivência e construção baseado em blocos. O jogador pode explorar um mundo praticamente infinito, coletar recursos, enfrentar criaturas e construir quase qualquer coisa. Sua liberdade é seu maior destaque, permitindo desde aventuras simples até construções, máquinas e servidores extremamente complexos.
', '8'),
(7, 'God of War (2018)', 'God of War acompanha Kratos e seu filho Atreus em uma jornada pelas terras da mitologia nórdica. Diferente dos jogos anteriores, apresenta um Kratos mais velho e preocupado com sua relação com o filho. O jogo combina combate brutal, exploração e uma história emocional sobre família, passado e responsabilidade.
', '6'),
(8, 'Skyrim', 'Skyrim é um RPG de mundo aberto que coloca o jogador em uma enorme região dominada por conflitos, magia e dragões. Sua principal qualidade é a liberdade: é possível seguir a história principal ou simplesmente explorar, realizar missões e desenvolver o personagem de diversas formas.
', '7'),
(9, 'Red Dead Redemption 2', 'Red Dead Redemption 2 acompanha Arthur Morgan, membro de uma gangue de fora da lei durante o declínio do Velho Oeste. O jogo possui um enorme mundo aberto, extremamente detalhado e vivo. Sua narrativa lenta e profunda desenvolve temas como lealdade, mudança e redenção, tornando Arthur um protagonista memorável.', '9');


-- Exibir todos os Jogos
SELECT * FROM Jogos;

-- Exibir apenas as especialidades dos Jogos
SELECT Nome, Especialidade FROM Jogos;

-- Exibir apenas os dados dos Jogos de uma determinada especialidade.
SELECT * FROM Jogos
	WHERE Especialidade LIKE 'Matematica';
    
-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM Jogos ORDER BY Nome;
    
-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM Jogos ORDER BY dtNasc DESC;

-- Exibir os dados da tabela, dos Jogos cujo nome comece com uma determinada letra. (j)
SELECT * FROM Jogos
	WHERE Nome LIKE 'j%';
    
--  Exibir os dados da tabela, dos Jogos cujo nome termine com uma determinada letra. (o)
SELECT * FROM Jogos
	WHERE nome LIKE '%o';
    
-- Exibir os dados da tabela, dos Jogos cujo nome tenha como segunda letra uma determinada letra. (o)
SELECT * FROM Jogos
	WHERE Nome LIKE '_o%';
    
-- Exibir os dados da tabela, dos Jogos cujo nome tenha como penúltima letra uma determinada letra. (c)
SELECT * FROM Jogos
	WHERE Nome LIKE '%c_';
    
-- Eliminar a tabela
DROP TABLE Jogos;