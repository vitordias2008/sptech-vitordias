CREATE DATABASE cafeteria;

USE cafeteria;


-- clientes

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    telefone CHAR(11),
    PRIMARY KEY (id)
);


-- categorias

CREATE TABLE categoria (
    id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45),
    PRIMARY KEY (id)
);


-- produtos

CREATE TABLE produtos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    preco DECIMAL(10,2),
    estoque INT,
    fk_categoria INT NOT NULL,
    PRIMARY KEY (id),

    CONSTRAINT fk_produtos_categoria
        FOREIGN KEY (fk_categoria)
        REFERENCES categoria(id)
);


-- pedidos

CREATE TABLE pedidos (
    id INT NOT NULL AUTO_INCREMENT,
    qtd_produtos INT,
    dt_pedido DATE,
    fk_cliente INT NOT NULL,
    fk_produto INT NOT NULL,
    PRIMARY KEY (id),

    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (fk_cliente)
        REFERENCES cliente(id),

    CONSTRAINT fk_pedidos_produto
        FOREIGN KEY (fk_produto)
        REFERENCES produtos(id)
);


-- clientes

INSERT INTO cliente (nome, email, telefone) VALUES
('Ana Souza', 'ana.souza@email.com', '11987654321'),
('Bruno Oliveira', 'bruno.oliveira@email.com', '11976543210'),
('Carla Santos', 'carla.santos@email.com', '11965432109'),
('Daniel Lima', 'daniel.lima@email.com', '11954321098'),
('Eduarda Costa', 'eduarda.costa@email.com', '11943210987'),
('Felipe Almeida', 'felipe.almeida@email.com', '11932109876'),
('Gabriela Rocha', 'gabriela.rocha@email.com', '11921098765'),
('Henrique Martins', 'henrique.martins@email.com', '11910987654'),
('Isabela Mendes', 'isabela.mendes@email.com', '11988776655'),
('João Pedro', 'joao.pedro@email.com', '11977665544'),
('Larissa Gomes', 'larissa.gomes@email.com', '11966554433'),
('Marcos Silva', 'marcos.silva@email.com', '11955443322'),
('Natalia Ramos', 'natalia.ramos@email.com', '11944332211'),
('Pedro Alves', 'pedro.alves@email.com', '11933221100'),
('Rafaela Costa', 'rafaela.costa@email.com', '11922110099');


-- categorias

INSERT INTO categoria (descricao) VALUES
('Café'),
('Salgado'),
('Doce'),
('Bebida');


-- produtos

INSERT INTO produtos (nome, preco, estoque, fk_categoria) VALUES
('Café Espresso', 6.50, 100, 1),
('Cappuccino', 9.00, 80, 1),
('Café Latte', 10.00, 70, 1),
('Mocha', 11.50, 60, 1),
('Pão de Queijo', 5.00, 120, 2),
('Croissant', 8.50, 50, 2),
('Coxinha', 7.00, 75, 2),
('Bolo de Chocolate', 9.00, 40, 3),
('Cheesecake', 12.00, 30, 3),
('Brownie', 8.00, 45, 3),
('Chá Gelado', 7.00, 65, 4),
('Suco de Laranja', 8.00, 60, 4),
('Água', 4.00, 100, 4);


-- pedidos 02/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(3, '2026-03-02', 1, 1),
(2, '2026-03-02', 2, 2),
(4, '2026-03-02', 3, 5),
(2, '2026-03-02', 4, 8),
(3, '2026-03-02', 5, 6),
(2, '2026-03-02', 6, 11),
(4, '2026-03-02', 7, 1),
(1, '2026-03-02', 8, 9);


-- pedidos 03/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(2, '2026-03-03', 9, 3),
(3, '2026-03-03', 10, 5),
(2, '2026-03-03', 11, 7),
(2, '2026-03-03', 12, 10),
(3, '2026-03-03', 13, 2),
(1, '2026-03-03', 14, 9),
(2, '2026-03-03', 15, 12);


-- pedidos 04/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(4, '2026-03-04', 1, 2),
(3, '2026-03-04', 2, 4),
(5, '2026-03-04', 3, 5),
(2, '2026-03-04', 4, 8),
(3, '2026-03-04', 5, 9),
(4, '2026-03-04', 6, 6),
(2, '2026-03-04', 7, 12),
(3, '2026-03-04', 8, 3),
(2, '2026-03-04', 9, 10);


-- pedidos 05/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(5, '2026-03-05', 10, 4),
(4, '2026-03-05', 11, 2),
(6, '2026-03-05', 12, 5),
(3, '2026-03-05', 13, 9),
(4, '2026-03-05', 14, 6),
(5, '2026-03-05', 15, 8),
(3, '2026-03-05', 1, 11),
(4, '2026-03-05', 2, 3),
(2, '2026-03-05', 3, 10),
(3, '2026-03-05', 4, 12);


-- pedidos 06/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(7, '2026-03-06', 5, 4),
(6, '2026-03-06', 6, 2),
(8, '2026-03-06', 7, 5),
(5, '2026-03-06', 8, 9),
(6, '2026-03-06', 9, 6),
(5, '2026-03-06', 10, 8),
(4, '2026-03-06', 11, 11),
(5, '2026-03-06', 12, 3),
(4, '2026-03-06', 13, 10),
(6, '2026-03-06', 14, 12),
(3, '2026-03-06', 15, 1);


-- pedidos 07/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(10, '2026-03-07', 1, 4),
(8, '2026-03-07', 2, 2),
(12, '2026-03-07', 3, 5),
(10, '2026-03-07', 4, 9),
(8, '2026-03-07', 5, 6),
(9, '2026-03-07', 6, 8),
(7, '2026-03-07', 7, 11),
(10, '2026-03-07', 8, 3),
(8, '2026-03-07', 9, 10),
(9, '2026-03-07', 10, 12),
(6, '2026-03-07', 11, 1),
(7, '2026-03-07', 12, 7),
(8, '2026-03-07', 13, 4),
(6, '2026-03-07', 14, 9),
(5, '2026-03-07', 15, 2);


-- pedidos 08/03

INSERT INTO pedidos
(qtd_produtos, dt_pedido, fk_cliente, fk_produto) VALUES
(5, '2026-03-08', 1, 3),
(4, '2026-03-08', 2, 5),
(5, '2026-03-08', 3, 8),
(4, '2026-03-08', 4, 2),
(6, '2026-03-08', 5, 6),
(3, '2026-03-08', 6, 9),
(4, '2026-03-08', 7, 11),
(5, '2026-03-08', 8, 4),
(3, '2026-03-08', 9, 10),
(4, '2026-03-08', 10, 12);


-- grafico 1
-- faturamento por dia
-- esse select pode alimentar o grafico de barras da dashboard

SELECT
    p.dt_pedido AS 'Data',
    COUNT(p.id) AS 'Quantidade de pedidos',
    SUM(p.qtd_produtos) AS 'Produtos vendidos',
    COUNT(DISTINCT p.fk_cliente) AS 'Clientes',
    SUM(p.qtd_produtos * pr.preco) AS 'Faturamento do dia',
	SUM(p.qtd_produtos * pr.preco) / COUNT(p.qtd_produtos) AS 'Ticket Médio'
FROM pedidos AS p
JOIN produtos AS pr
    ON p.fk_produto = pr.id
GROUP BY p.dt_pedido
ORDER BY p.dt_pedido;

-- grafico 2
-- fluxo de pessoas por dia


SELECT
    p.dt_pedido AS 'Data',
    COUNT(p.id) AS 'Quantidade de pedidos',
    SUM(p.qtd_produtos) AS 'Produtos vendidos',
    COUNT(DISTINCT p.fk_cliente) AS 'Clientes',
    SUM(p.qtd_produtos * pr.preco) AS 'Faturamento do dia',
	SUM(p.qtd_produtos * pr.preco) / COUNT(p.qtd_produtos) AS 'Ticket Médio'
FROM pedidos AS p
JOIN produtos AS pr
    ON p.fk_produto = pr.id
GROUP BY p.dt_pedido
ORDER BY p.dt_pedido;


-- grafico 2
-- faturamento por produto
-- mostra quais produtos mais geraram receita

SELECT
    pr.nome AS 'Produto',
    COUNT(p.id) AS 'Quantidade Pedidos',
    SUM(p.qtd_produtos) AS 'Quantidade Vendida',
    SUM(p.qtd_produtos * pr.preco) AS 'Faturamento'
FROM pedidos AS p
JOIN produtos AS pr
    ON p.fk_produto = pr.id
JOIN categoria AS c
    ON pr.fk_categoria = c.id
GROUP BY
    pr.id,
    pr.nome,
    c.descricao,
    pr.preco
ORDER BY faturamento DESC;


-- grafico 1
-- faturamento por dia

SELECT
    p.dt_pedido AS 'Data',
    COUNT(p.id) AS 'Pedidos Realizados',
    SUM(p.qtd_produtos) AS 'Total de produtos',
    COUNT(DISTINCT p.fk_cliente) AS 'Pessoas atendidas',
    SUM(p.qtd_produtos * pr.preco) AS 'Faturamento'
FROM pedidos AS p
	JOIN produtos AS pr
		ON p.fk_produto = pr.id
GROUP BY p.dt_pedido
ORDER BY p.dt_pedido;

