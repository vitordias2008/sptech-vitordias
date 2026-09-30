CREATE DATABASE sprint2;
USE sprint2;


-- animais

CREATE TABLE animal (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
especie VARCHAR(45),
raca VARCHAR(45),
idade INT
);

CREATE TABLE ficha_medica (
id INT PRIMARY KEY AUTO_INCREMENT,
data_ultima_consulta DATE,
peso DECIMAL(5,2),
vacina_em_dia CHAR(3),
observacao VARCHAR(100),
fk_animal INT UNIQUE,
FOREIGN KEY (fk_animal) REFERENCES animal(id),
CHECK (vacina_em_dia IN ('Sim', 'Nao'))
);

INSERT INTO animal VALUES
(NULL, 'Thor', 'Cachorro', 'Golden Retriever', 5),
(NULL, 'Mingau', 'Gato', 'Siames', 3),
(NULL, 'Mel', 'Cachorro', 'Shih-tzu', 1),
(NULL, 'Nina', 'Gato', NULL, 9),
(NULL, 'Fred', 'Cachorro', 'Pinscher', 7);

INSERT INTO ficha_medica VALUES
(NULL, '2026-08-14', 27.80, 'Sim', 'Animal saudavel', 1),
(NULL, '2026-07-22', 4.10, 'Nao', NULL, 2),
(NULL, '2026-09-03', 4.30, 'Sim', 'Vacinas atualizadas', 3),
(NULL, '2026-06-18', 5.70, 'Nao', 'Precisa retornar', 4);

SELECT * FROM animal;

SELECT * FROM ficha_medica;

SELECT nome, especie
FROM animal;

SELECT *
FROM ficha_medica
WHERE vacina_em_dia = 'Nao';

SELECT *
FROM animal
ORDER BY idade DESC;

SELECT *
FROM animal
WHERE especie = 'Cachorro';

SELECT nome AS 'Pet',
especie AS 'Tipo'
FROM animal;

SELECT peso AS 'Peso (kg)',
data_ultima_consulta AS 'Ultima Consulta'
FROM ficha_medica;

SELECT nome,
idade * 7 AS 'Idade Humana Aproximada'
FROM animal;

SELECT nome AS 'Nome do Pet',
raca AS 'Raca/Tipo'
FROM animal;

SELECT nome,
CASE
WHEN idade < 2 THEN 'Filhote'
WHEN idade BETWEEN 2 AND 7 THEN 'Adulto'
ELSE 'Idoso'
END AS fase_vida
FROM animal;

SELECT animal.nome,
CASE
WHEN ficha_medica.vacina_em_dia = 'Sim' THEN 'Vacinado'
ELSE 'Pendente'
END AS vacinacao
FROM animal
JOIN ficha_medica
ON animal.id = ficha_medica.fk_animal;

SELECT peso,
CASE
WHEN peso < 5 THEN 'Pequeno'
WHEN peso BETWEEN 5 AND 20 THEN 'Médio'
ELSE 'Grande'
END AS porte
FROM ficha_medica;

SELECT nome,
CASE
WHEN especie = 'Cachorro' THEN 'Canino'
WHEN especie = 'Gato' THEN 'Felino'
ELSE 'Outro'
END AS especie_tipo
FROM animal;

SELECT animal.nome,
IFNULL(ficha_medica.observacao, 'Nenhuma observação') AS observacao
FROM animal
JOIN ficha_medica
ON animal.id = ficha_medica.fk_animal;

SELECT animal.nome,
IFNULL(ficha_medica.data_ultima_consulta, 'SEM FICHA') AS data_ultima_consulta
FROM animal
LEFT JOIN ficha_medica
ON animal.id = ficha_medica.fk_animal;

SELECT animal.nome,
ficha_medica.peso,
ficha_medica.data_ultima_consulta
FROM animal
JOIN ficha_medica
ON animal.id = ficha_medica.fk_animal;

SELECT CONCAT(animal.nome, ' - ', animal.especie, ' - ', ficha_medica.peso, ' kg') AS resumo
FROM animal
JOIN ficha_medica
ON animal.id = ficha_medica.fk_animal;

SELECT nome,
IFNULL(raca, 'Raca não informada') AS raca
FROM animal;


-- farmacias

CREATE TABLE farmacia (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj VARCHAR(18) UNIQUE
);

CREATE TABLE endereco (
id INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(60),
numero INT,
bairro VARCHAR(45),
cidade VARCHAR(45),
fk_farmacia INT UNIQUE,
FOREIGN KEY (fk_farmacia) REFERENCES farmacia(id)
);

CREATE TABLE farmaceutico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
crf VARCHAR(20),
turno VARCHAR(10),
fk_farmacia INT,
FOREIGN KEY (fk_farmacia) REFERENCES farmacia(id),
CHECK (turno IN ('Manhã', 'Tarde', 'Noite'))
);

INSERT INTO farmacia VALUES
(NULL, 'Drogasil', '12345678000110'),
(NULL, 'Droga Raia', '24567891000142'),
(NULL, 'Pague Menos', '37894561000125');

INSERT INTO endereco VALUES
(NULL, 'Avenida Paulista', 1540, 'Bela Vista', 'São Paulo', 1),
(NULL, 'Rua Vergueiro', 920, 'Vila Mariana', 'São Paulo', 2);

INSERT INTO farmaceutico VALUES
(NULL, 'Lucas Silva', 'CRF18432', 'Manhã', 1),
(NULL, 'Mariana Souza', 'CRF27541', 'Tarde', 1),
(NULL, 'Pedro Santos', 'CRF39218', 'Noite', 2),
(NULL, 'Ana Oliveira', 'CRF46127', 'Manhã', 2),
(NULL, 'Gabriel Lima', 'CRF57834', 'Noite', 3);

SELECT * FROM farmacia;

SELECT * FROM endereco;

SELECT * FROM farmaceutico;

SELECT nome, cnpj
FROM farmacia;

SELECT *
FROM farmaceutico
WHERE turno = 'Noite';

SELECT *
FROM endereco
ORDER BY cidade;

SELECT nome, crf
FROM farmaceutico;

SELECT nome AS 'Estabelecimento',
cnpj AS 'Documento'
FROM farmacia;

SELECT nome AS 'Profissional',
turno AS 'Horario de Trabalho'
FROM farmaceutico;

SELECT rua AS 'Logradouro',
numero AS 'Num.'
FROM endereco;

SELECT CONCAT(rua, ', ', numero) AS 'Endereço Completo'
FROM endereco;

SELECT nome,
CASE
WHEN turno = 'Manhã' THEN '06h-12h'
WHEN turno = 'Tarde' THEN '12h-18h'
ELSE '18h-00h'
END AS periodo
FROM farmaceutico;

SELECT nome,
CASE
WHEN cnpj LIKE '1%' THEN 'Matriz'
ELSE 'Filial'
END AS tipo_cnpj
FROM farmacia;

SELECT bairro,
CASE
WHEN bairro = 'Bela Vista' THEN 'Zona Central'
WHEN bairro = 'Vila Mariana' THEN 'Zona Sul'
ELSE 'Outra'
END AS zona
FROM endereco;

SELECT nome,
CASE
WHEN turno = 'Noite' THEN 'Adicional Noturno'
ELSE 'Normal'
END AS carga_horaria
FROM farmaceutico;

SELECT farmacia.nome,
IFNULL(endereco.rua, 'SEM ENDERECO') AS rua
FROM farmacia
LEFT JOIN endereco
ON farmacia.id = endereco.fk_farmacia;

SELECT farmaceutico.nome,
farmaceutico.crf,
farmacia.nome
FROM farmaceutico
JOIN farmacia
ON farmaceutico.fk_farmacia = farmacia.id;

SELECT farmacia.nome,
endereco.cidade,
farmaceutico.nome
FROM farmacia
JOIN endereco
ON farmacia.id = endereco.fk_farmacia
JOIN farmaceutico
ON farmacia.id = farmaceutico.fk_farmacia;

SELECT CONCAT(farmaceutico.nome, ' - ', farmaceutico.crf, ' - ', farmacia.nome) AS info
FROM farmaceutico
JOIN farmacia
ON farmaceutico.fk_farmacia = farmacia.id;

SELECT rua,
IFNULL(bairro, 'Bairro não informado') AS bairro
FROM endereco;


-- musica

CREATE TABLE artista (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
genero_musical VARCHAR(45),
pais VARCHAR(45),
ativo CHAR(3),
CHECK (ativo IN ('Sim', 'Nao'))
);

CREATE TABLE musica (
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(60),
duracao_segundos INT,
ano_lancamento INT,
fk_artista INT,
FOREIGN KEY (fk_artista) REFERENCES artista(id)
);

INSERT INTO artista VALUES
(NULL, 'The Weeknd', 'Pop', 'Canada', 'Sim'),
(NULL, 'Bruno Mars', 'Pop', 'Estados Unidos', 'Sim'),
(NULL, 'Daft Punk', 'Eletronica', NULL, 'Nao'),
(NULL, 'Imagine Dragons', 'Rock', 'Estados Unidos', 'Sim');

INSERT INTO musica VALUES
(NULL, 'Blinding Lights', 198, 2019, 1),
(NULL, 'Save Your Tears', 214, 2020, 1),
(NULL, 'Locked Out of Heaven', 229, 2012, 2),
(NULL, 'Just the Way You Are', 218, 2010, 2),
(NULL, 'Get Lucky', 355, 2013, 3),
(NULL, 'Musica Desconhecida', 176, 2024, NULL);

SELECT * FROM artista;

SELECT * FROM musica;

SELECT titulo, duracao_segundos
FROM musica;

SELECT *
FROM musica
WHERE ano_lancamento > 2020;

SELECT *
FROM artista
ORDER BY nome;

SELECT *
FROM musica
WHERE duracao_segundos > 200;

SELECT titulo AS 'Nome da Música',
ano_lancamento AS 'Ano'
FROM musica;

SELECT nome AS 'Cantor/Banda',
genero_musical AS 'Estilo'
FROM artista;

SELECT duracao_segundos / 60 AS 'Duração (min)'
FROM musica;

SELECT titulo AS 'Faixa',
ano_lancamento AS 'Lançamento'
FROM musica;

SELECT titulo,
CASE
WHEN ano_lancamento < 2000 THEN 'Clássico'
WHEN ano_lancamento BETWEEN 2000 AND 2015 THEN 'Moderno'
ELSE 'Atual'
END AS era
FROM musica;

SELECT nome,
CASE
WHEN ativo = 'Sim' THEN 'Em atividade'
ELSE 'Inativo'
END AS status
FROM artista;

SELECT titulo,
CASE
WHEN duracao_segundos < 180 THEN 'Curta'
WHEN duracao_segundos BETWEEN 180 AND 300 THEN 'Normal'
ELSE 'Longa'
END AS tamanho
FROM musica;

SELECT nome,
CASE
WHEN pais = 'Brasil' THEN 'Nacional'
ELSE 'Internacional'
END AS origem
FROM artista;

SELECT nome,
IFNULL(pais, 'Pais desconhecido') AS pais
FROM artista;

SELECT musica.titulo,
IFNULL(artista.nome, 'ARTISTA DESCONHECIDO') AS artista
FROM musica
LEFT JOIN artista
ON musica.fk_artista = artista.id;

SELECT musica.titulo,
musica.ano_lancamento,
artista.nome
FROM musica
JOIN artista
ON musica.fk_artista = artista.id;

SELECT CONCAT(musica.titulo, ' - ', artista.nome, ' - ', musica.ano_lancamento) AS catalogo
FROM musica
JOIN artista
ON musica.fk_artista = artista.id;

SELECT artista.nome,
musica.titulo
FROM musica
RIGHT JOIN artista
ON musica.fk_artista = artista.id;


-- oficina

CREATE TABLE cliente (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
telefone VARCHAR(20),
email VARCHAR(60)
);

CREATE TABLE veiculo (
id INT PRIMARY KEY AUTO_INCREMENT,
placa VARCHAR(10) UNIQUE,
marca VARCHAR(45),
modelo VARCHAR(45),
ano INT,
fk_cliente INT,
FOREIGN KEY (fk_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente VALUES
(NULL, 'Lucas Silva', '11976543218', 'lucas@email.com'),
(NULL, 'Mariana Souza', '11984567231', 'mariana@email.com'),
(NULL, 'Pedro Santos', '11965439872', NULL),
(NULL, 'Ana Oliveira', '11973456219', 'ana@email.com');

INSERT INTO veiculo VALUES
(NULL, 'ABC1D23', 'Fiat', 'Argo', 2021, 1),
(NULL, 'DEF4G56', 'Chevrolet', 'Onix', 2017, 1),
(NULL, 'GHI7J89', 'Volkswagen', 'Gol', 2013, 2),
(NULL, 'JKL1M23', 'Toyota', 'Corolla', 2009, 3),
(NULL, 'NOP4Q56', 'Fiat', 'Uno', 2014, NULL);

SELECT * FROM cliente;

SELECT * FROM veiculo;

SELECT placa, marca, modelo
FROM veiculo;

SELECT *
FROM veiculo
WHERE marca = 'Fiat';

SELECT *
FROM veiculo
ORDER BY ano DESC;

SELECT *
FROM veiculo
WHERE ano < 2015;

SELECT placa AS 'Placa do Veículo',
modelo AS 'Modelo do Carro'
FROM veiculo;

SELECT nome AS 'Proprietario',
telefone AS 'Contato'
FROM cliente;

SELECT ano,
2026 - ano AS 'Idade do Veículo'
FROM veiculo;

SELECT CONCAT(marca, ' ', modelo) AS 'Veículo Completo'
FROM veiculo;

SELECT placa,
CASE
WHEN ano >= 2020 THEN 'Novo'
WHEN ano BETWEEN 2010 AND 2019 THEN 'Seminovo'
ELSE 'Antigo'
END AS classificação
FROM veiculo;

SELECT modelo,
CASE
WHEN marca = 'Fiat' THEN 'Nacional'
WHEN marca = 'Chevrolet' THEN 'Nacional'
WHEN marca = 'Volkswagen' THEN 'Nacional'
ELSE 'Importado'
END AS tipo_marca
FROM veiculo;

SELECT nome,
CASE
WHEN email IS NOT NULL THEN 'Sim'
ELSE 'Não'
END AS possui_email
FROM cliente;

SELECT placa,
CASE
WHEN ano BETWEEN 2000 AND 2009 THEN 'Anos 2000'
WHEN ano BETWEEN 2010 AND 2019 THEN 'Anos 2010'
ELSE 'Anos 2020'
END AS decada
FROM veiculo;

SELECT nome,
IFNULL(email, 'Email não cadastrado') AS email
FROM cliente;

SELECT veiculo.placa,
veiculo.modelo,
IFNULL(cliente.nome, 'SEM DONO') AS proprietario
FROM veiculo
LEFT JOIN cliente
ON veiculo.fk_cliente = cliente.id;

SELECT veiculo.placa,
veiculo.modelo,
cliente.nome
FROM veiculo
JOIN cliente
ON veiculo.fk_cliente = cliente.id;

SELECT CONCAT(veiculo.placa, ' - ', veiculo.modelo, ' - ', cliente.nome) AS registro
FROM veiculo
JOIN cliente
ON veiculo.fk_cliente = cliente.id;

SELECT cliente.nome,
veiculo.placa,
veiculo.modelo
FROM veiculo
RIGHT JOIN cliente
ON veiculo.fk_cliente = cliente.id;


-- cs2

CREATE TABLE equipe (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
regiao VARCHAR(15),
ranking INT,
CHECK (regiao IN ('Americas', 'Europa', 'Asia'))
);

CREATE TABLE jogador_cs (
id INT PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(45),
nome_real VARCHAR(60),
funcao VARCHAR(15),
fk_equipe INT,
FOREIGN KEY (fk_equipe) REFERENCES equipe(id),
CHECK (funcao IN ('Rifler', 'AWPer', 'Entry', 'IGL', 'Suporte'))
);

INSERT INTO equipe VALUES
(NULL, 'FURIA', 'Americas', 7),
(NULL, 'Vitality', 'Europa', 3),
(NULL, 'The MongolZ', 'Asia', NULL),
(NULL, 'NAVI', 'Europa', 11);

INSERT INTO jogador_cs VALUES
(NULL, 'FalleN', 'Gabriel Silva', 'AWPer', 1),
(NULL, 'KSCERATO', 'Kaike Santos', 'Rifler', 1),
(NULL, 'ZywOo', 'Mathieu Martin', 'AWPer', 2),
(NULL, 'apEX', 'Dan Moreau', 'IGL', 2),
(NULL, 'bLitz', 'Bataa Ganbold', 'IGL', 3),
(NULL, 'flameZ', 'Shahar Levi', 'Entry', NULL);

SELECT * FROM equipe;

SELECT * FROM jogador_cs;

SELECT nickname, funcao
FROM jogador_cs;

SELECT *
FROM jogador_cs
WHERE funcao = 'AWPer';

SELECT *
FROM equipe
ORDER BY ranking;

SELECT *
FROM jogador_cs
WHERE nickname LIKE 'F%';

SELECT nickname AS 'Nick',
nome_real AS 'Nome Verdadeiro'
FROM jogador_cs;

SELECT nome AS 'Time',
regiao AS 'Região Competitiva'
FROM equipe;

SELECT ranking AS 'Posição no Ranking Mundial'
FROM equipe;

SELECT CONCAT(nickname, ' - ', funcao) AS 'Jogador e Função'
FROM jogador_cs;

SELECT nome,
CASE
WHEN ranking <= 5 THEN 'Tier 1'
WHEN ranking BETWEEN 6 AND 20 THEN 'Tier 2'
ELSE 'Tier 3'
END AS nivel
FROM equipe;

SELECT nickname,
CASE
WHEN funcao = 'Rifler' THEN 'Agressivo'
WHEN funcao = 'Entry' THEN 'Agressivo'
WHEN funcao = 'AWPer' THEN 'Sniper'
ELSE 'Tático'
END AS tipo_função
FROM jogador_cs;

SELECT nome,
CASE
WHEN regiao = 'Americas' THEN 'Ocidente'
ELSE 'Oriente'
END AS continente
FROM equipe;

SELECT nickname,
CASE
WHEN funcao = 'IGL' THEN 'Sim - In-Game Leader'
ELSE 'Não'
END AS líder
FROM jogador_cs;

SELECT nome,
IFNULL(ranking, 'Sem ranking') AS ranking
FROM equipe;

SELECT jogador_cs.nickname,
IFNULL(equipe.nome, 'FREE AGENT') AS equipe
FROM jogador_cs
LEFT JOIN equipe
ON jogador_cs.fk_equipe = equipe.id;

SELECT jogador_cs.nickname,
jogador_cs.funcao,
equipe.nome
FROM jogador_cs
JOIN equipe
ON jogador_cs.fk_equipe = equipe.id;

SELECT CONCAT(jogador_cs.nickname, ' - ', jogador_cs.funcao, ' - ', equipe.nome) AS perfil
FROM jogador_cs
JOIN equipe
ON jogador_cs.fk_equipe = equipe.id;

SELECT equipe.nome,
jogador_cs.nickname
FROM jogador_cs
RIGHT JOIN equipe
ON jogador_cs.fk_equipe = equipe.id;


-- tenis

CREATE TABLE marca (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
pais_origem VARCHAR(45)
);

CREATE TABLE tenis (
id INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(60),
tamanho INT,
preco DECIMAL(7,2),
categoria VARCHAR(15),
fk_marca INT,
FOREIGN KEY (fk_marca) REFERENCES marca(id),
CHECK (preco > 0),
CHECK (categoria IN ('Corrida', 'Casual', 'Basquete', 'Futebol'))
);

INSERT INTO marca VALUES
(NULL, 'Nike', 'Estados Unidos'),
(NULL, 'Adidas', 'Alemanha'),
(NULL, 'Olympikus', 'Brasil'),
(NULL, 'New Balance', NULL);

INSERT INTO tenis VALUES
(NULL, 'Pegasus 41', 41, 749.90, 'Corrida', 1),
(NULL, 'Air Force 1', 40, 679.90, 'Casual', 1),
(NULL, 'Ultraboost 5', 42, 949.90, 'Corrida', 2),
(NULL, 'Corre 4', 39, 579.90, 'Corrida', 3),
(NULL, 'Street Pro', 37, 189.90, 'Casual', NULL);

SELECT * FROM marca;

SELECT * FROM tenis;

SELECT modelo, preco
FROM tenis;

SELECT *
FROM tenis
WHERE categoria = 'Corrida';

SELECT *
FROM tenis
ORDER BY preco DESC;

SELECT *
FROM tenis
WHERE tamanho >= 40;

SELECT modelo AS 'Produto',
preco AS 'Valor (R$)'
FROM tenis;

SELECT nome AS 'Fabricante',
pais_origem AS 'Pais'
FROM marca;

SELECT preco * 1.15 AS 'Preço com Frete'
FROM tenis;

SELECT CONCAT(modelo, ' - ', tamanho) AS 'Descrição do Produto'
FROM tenis;

SELECT modelo,
CASE
WHEN preco < 200 THEN 'Econômico'
WHEN preco BETWEEN 200 AND 500 THEN 'Intermediário'
ELSE 'Premium'
END AS faixa_preço
FROM tenis;

SELECT modelo,
CASE
WHEN categoria = 'Corrida' THEN 'Esporte - Performance'
WHEN categoria = 'Casual' THEN 'Dia a Dia'
ELSE 'Esporte - Específico'
END AS uso
FROM tenis;

SELECT nome,
CASE
WHEN pais_origem = 'Brasil' THEN 'Nacional'
ELSE 'Importada'
END AS origem
FROM marca;

SELECT modelo,
CASE
WHEN tamanho < 38 THEN 'Pequeno'
WHEN tamanho BETWEEN 38 AND 42 THEN 'Médio'
ELSE 'Grande'
END AS numeração
FROM tenis;

SELECT nome,
IFNULL(pais_origem, 'Origem desconhecida') AS pais_origem
FROM marca;

SELECT tenis.modelo,
IFNULL(marca.nome, 'MARCA GENERICA') AS marca
FROM tenis
LEFT JOIN marca
ON tenis.fk_marca = marca.id;

SELECT tenis.modelo,
tenis.preco,
marca.nome
FROM tenis
JOIN marca
ON tenis.fk_marca = marca.id;

SELECT CONCAT(tenis.modelo, ' - ', tenis.categoria, ' - ', marca.nome) AS vitrine
FROM tenis
JOIN marca
ON tenis.fk_marca = marca.id;

SELECT marca.nome,
tenis.modelo
FROM tenis
RIGHT JOIN marca
ON tenis.fk_marca = marca.id;
```