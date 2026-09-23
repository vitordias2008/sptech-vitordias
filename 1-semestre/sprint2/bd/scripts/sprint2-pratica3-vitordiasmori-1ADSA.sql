CREATE DATABASE sprint2;
USE sprint2;

-- EXERCÍCIO 1

CREATE TABLE Atleta(
idAtleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

INSERT INTO Atleta VALUES
(default, 'Gabriel', 'Natacao', 3),
(default, 'Lucas', 'Natacao', 2),
(default, 'Matheus', 'Atletismo', 5),
(default, 'Pedro', 'Atletismo', 1),
(default, 'Carlos', 'Natacao', 4),
(default, 'Bruno', 'Atletismo', 2);

CREATE TABLE Pais(
idPais INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
capital VARCHAR(40)
);

INSERT INTO Pais VALUES
(default, 'Brasil', 'Brasilia'),
(default, 'Argentina', 'Buenos Aires'),
(default, 'Estados Unidos', 'Washington'),
(default, 'Franca', 'Paris');

ALTER TABLE Atleta ADD fkPais INT;
ALTER TABLE Atleta ADD CONSTRAINT fkAtletaPais
FOREIGN KEY (fkPais) REFERENCES Pais(idPais);

UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 1;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 2;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 3;
UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 4;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 5;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 6;

SELECT * FROM Atleta
JOIN Pais ON fkPais = idPais;

SELECT Atleta.nome AS Atleta,
Pais.nome AS Pais
FROM Atleta
JOIN Pais ON fkPais = idPais;

SELECT * FROM Atleta
JOIN Pais ON fkPais = idPais
WHERE Pais.capital = 'Brasilia';


-- EXERCÍCIO 2

CREATE TABLE Musica(
idMusica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO Musica VALUES
(default, 'Numb', 'Linkin Park', 'Rock'),
(default, 'In The End', 'Linkin Park', 'Rock'),
(default, '505', 'Arctic Monkeys', 'Rock'),
(default, 'Die For You', 'The Weeknd', 'Pop'),
(default, 'Blinding Lights', 'The Weeknd', 'Pop');

CREATE TABLE Album(
idAlbum INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
tipo VARCHAR(10),
dtLancamento DATE
);

INSERT INTO Album VALUES
(default, 'Meteora', 'Fisico', '2003-03-25'),
(default, 'After Hours', 'Digital', '2020-03-20'),
(default, 'Favourite Worst Nightmare', 'Fisico', '2007-04-23');

-- a)

SELECT * FROM Musica;

SELECT * FROM Album;

-- b)

ALTER TABLE Musica ADD fkAlbum INT;

ALTER TABLE Musica ADD CONSTRAINT fkMusicaAlbum
FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);

-- c)

UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 1;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 2;
UPDATE Musica SET fkAlbum = 3 WHERE idMusica = 3;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 4;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 5;

-- d)

SELECT * FROM Musica
JOIN Album ON fkAlbum = idAlbum;

-- e)

SELECT Musica.titulo,
Album.nome
FROM Musica
JOIN Album ON fkAlbum = idAlbum;

-- f)

SELECT * FROM Musica
JOIN Album ON fkAlbum = idAlbum
WHERE Album.tipo = 'Digital';


-- EXERCÍCIO 3

CREATE TABLE pessoa(
idpessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

CREATE TABLE Reserva(
idReserva INT PRIMARY KEY AUTO_INCREMENT,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME,
fkPessoa INT
);

INSERT INTO pessoa VALUES
(default, 'Vitor', '12345678901'),
(default, 'Lucas', '23456789012'),
(default, 'Gabriel', '34567890123'),
(default, 'Matheus', '45678901234'),
(default, 'Bruno', '56789012345');

INSERT INTO Reserva VALUES
(default, '2026-09-01 10:00:00', '2026-09-02 10:00:00', '2026-09-05 15:00:00', 1),
(default, '2026-09-03 12:00:00', '2026-09-04 09:00:00', NULL, 2),
(default, '2026-09-05 14:00:00', '2026-09-06 08:00:00', '2026-09-08 18:00:00', 3),
(default, '2026-09-10 16:00:00', '2026-09-11 10:00:00', NULL, 4),
(default, '2026-09-12 18:00:00', '2026-09-13 11:00:00', '2026-09-15 13:00:00', 5);

ALTER TABLE Reserva ADD CONSTRAINT fkPessoaReserva
FOREIGN KEY (fkPessoa) REFERENCES pessoa(idpessoa);

SELECT * FROM pessoa
JOIN Reserva ON idpessoa = fkPessoa;

SELECT pessoa.nome AS Pessoa,
Reserva.dtReserva AS DataReserva,
Reserva.dtRetirada AS DataRetirada,
Reserva.dtDevolucao AS DataDevolucao
FROM pessoa
JOIN Reserva ON idpessoa = fkPessoa;

SELECT pessoa.nome,
Reserva.dtReserva,
CASE
WHEN Reserva.dtDevolucao IS NULL THEN 'Reserva em andamento'
ELSE 'Reserva finalizada'
END AS Situacao
FROM pessoa
JOIN Reserva ON idpessoa = fkPessoa;

SELECT pessoa.nome,
Reserva.dtReserva,
IFNULL(Reserva.dtDevolucao, 'Ainda nao devolvido') AS Devolucao
FROM pessoa
JOIN Reserva ON idpessoa = fkPessoa;


-- EXERCÍCIO 4

CREATE TABLE Pessoa1(
idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE
);

CREATE TABLE Pessoa2(
idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE,
fkPessoa1 INT UNIQUE
);

INSERT INTO Pessoa1 VALUES
(default, 'Vitor', '2008-06-06'),
(default, 'Lucas', '2005-04-12'),
(default, 'Gabriel', '2004-08-21'),
(default, 'Matheus', '2006-01-30'),
(default, 'Bruno', '2003-11-15');

INSERT INTO Pessoa2 VALUES
(default, 'Luiza', '2007-03-10', 1),
(default, 'Ana', '2006-07-18', 2),
(default, 'Julia', NULL, 3),
(default, 'Mariana', '2005-02-11', 4),
(default, 'Beatriz', '2004-09-25', 5);

ALTER TABLE Pessoa2 ADD CONSTRAINT fkPessoa1Pessoa2
FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa1);

SELECT * FROM Pessoa1
JOIN Pessoa2 ON idPessoa1 = fkPessoa1;

SELECT Pessoa1.nome AS Pessoa1,
Pessoa2.nome AS Pessoa2
FROM Pessoa1
JOIN Pessoa2 ON idPessoa1 = fkPessoa1;

SELECT Pessoa1.nome,
Pessoa2.nome,
CASE
WHEN Pessoa2.dtNascimento IS NULL THEN 'Data nao cadastrada'
ELSE 'Data cadastrada'
END AS Situacao
FROM Pessoa1
JOIN Pessoa2 ON idPessoa1 = fkPessoa1;

SELECT Pessoa1.nome,
Pessoa2.nome,
IFNULL(Pessoa2.dtNascimento, 'Data nao informada') AS Nascimento
FROM Pessoa1
JOIN Pessoa2 ON idPessoa1 = fkPessoa1;


-- EXERCÍCIO 5

CREATE TABLE Candidato(
idCandidato INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

CREATE TABLE Habilitacao(
idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
numero CHAR(11),
categoria CHAR(1),
acc CHAR(3),
dtEmissao DATE,
dtValidade DATE,
fkCandidato INT UNIQUE
);

INSERT INTO Candidato VALUES
(default, 'Vitor', '11111111111'),
(default, 'Lucas', '22222222222'),
(default, 'Gabriel', '33333333333'),
(default, 'Matheus', '44444444444'),
(default, 'Bruno', '55555555555');

INSERT INTO Habilitacao VALUES
(default, '10000000001', 'B', NULL, '2026-01-10', '2027-01-10', 1),
(default, '10000000002', 'A', 'ACC', '2026-02-15', '2027-02-15', 2),
(default, '10000000003', 'B', NULL, '2026-03-20', '2027-03-20', 3),
(default, '10000000004', 'A', NULL, '2026-04-25', '2027-04-25', 4),
(default, '10000000005', 'B', 'ACC', '2026-05-30', '2027-05-30', 5);

ALTER TABLE Habilitacao ADD CONSTRAINT fkHabilitacaoCandidato
FOREIGN KEY (fkCandidato) REFERENCES Candidato(idCandidato);

SELECT * FROM Candidato
JOIN Habilitacao ON idCandidato = fkCandidato;

SELECT Candidato.nome AS Candidato,
Habilitacao.numero AS NumeroHabilitacao,
Habilitacao.categoria AS Categoria
FROM Candidato
JOIN Habilitacao ON idCandidato = fkCandidato;

SELECT Candidato.nome,
Habilitacao.categoria,
CASE
WHEN Habilitacao.categoria = 'A' THEN 'Motocicleta'
WHEN Habilitacao.categoria = 'B' THEN 'Automovel'
ELSE 'Outra categoria'
END AS TipoCategoria
FROM Candidato
JOIN Habilitacao ON idCandidato = fkCandidato;

SELECT Candidato.nome,
Habilitacao.categoria,
IFNULL(Habilitacao.acc, 'Não solicitada') AS ACC
FROM Candidato
JOIN Habilitacao ON idCandidato = fkCandidato;


-- EXERCÍCIO 6

CREATE TABLE Endereco(
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(45),
numero INT,
bairro VARCHAR(45),
complemento VARCHAR(45)
);

CREATE TABLE Farmacia(
idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14),
fkEndereco INT UNIQUE
);

CREATE TABLE Farmaceutico(
idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
crf VARCHAR(15),
turno VARCHAR(20),
fkFarmacia INT
);

INSERT INTO Endereco VALUES
(default, 'Rua das Flores', 100, 'Centro', NULL),
(default, 'Rua Brasil', 250, 'Jardins', 'Loja 2'),
(default, 'Avenida Paulista', 1000, 'Bela Vista', NULL),
(default, 'Rua Augusta', 500, 'Consolacao', 'Terreo'),
(default, 'Rua da Paz', 80, 'Liberdade', NULL);

INSERT INTO Farmacia VALUES
(default, 'Farmacia Central', '11111111111111', 1),
(default, 'Farmacia Vida', '22222222222222', 2),
(default, 'Farmacia Saude', '33333333333333', 3),
(default, 'Farmacia Popular', '44444444444444', 4),
(default, 'Farmacia Bem Estar', '55555555555555', 5);

INSERT INTO Farmaceutico VALUES
(default, 'Carlos', 'CRF1001', 'Manha', 1),
(default, 'Mariana', 'CRF1002', 'Tarde', 2),
(default, 'Gabriel', 'CRF1003', 'Noite', 3),
(default, 'Ana', 'CRF1004', 'Manha', 4),
(default, 'Lucas', 'CRF1005', 'Tarde', 5);

ALTER TABLE Farmacia ADD CONSTRAINT fkFarmaciaEndereco
FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco);

ALTER TABLE Farmaceutico ADD CONSTRAINT fkFarmaceuticoFarmacia
FOREIGN KEY (fkFarmacia) REFERENCES Farmacia(idFarmacia);

SELECT * FROM Farmacia
JOIN Endereco ON fkEndereco = idEndereco
JOIN Farmaceutico ON idFarmacia = fkFarmacia;

SELECT Farmacia.nome AS Farmacia,
Endereco.rua AS Rua,
Farmaceutico.nome AS Farmaceutico
FROM Farmacia
JOIN Endereco ON fkEndereco = idEndereco
JOIN Farmaceutico ON idFarmacia = fkFarmacia;

SELECT Farmacia.nome,
Farmaceutico.nome,
CASE
WHEN Farmaceutico.turno = 'Manha' THEN 'Turno matutino'
WHEN Farmaceutico.turno = 'Tarde' THEN 'Turno vespertino'
ELSE 'Turno noturno'
END AS Periodo
FROM Farmacia
JOIN Farmaceutico ON idFarmacia = fkFarmacia;

SELECT Farmacia.nome,
Endereco.rua,
IFNULL(Endereco.complemento, 'Sem complemento') AS Complemento
FROM Farmacia
JOIN Endereco ON fkEndereco = idEndereco;


-- DESAFIO

CREATE TABLE Time(
idTime INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
estado CHAR(2)
);

CREATE TABLE Tecnico(
idTecnico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkTime INT UNIQUE
);

CREATE TABLE Escalacao(
idEscalacao INT PRIMARY KEY AUTO_INCREMENT,
numJogador CHAR(3),
nome VARCHAR(45),
posicao VARCHAR(45),
tipo VARCHAR(45),
dtJogo DATETIME,
fkTecnico INT
);

ALTER TABLE Tecnico ADD CONSTRAINT fkTecnicoTime
FOREIGN KEY (fkTime) REFERENCES Time(idTime);

ALTER TABLE Escalacao ADD CONSTRAINT fkEscalacaoTecnico
FOREIGN KEY (fkTecnico) REFERENCES Tecnico(idTecnico);
