-- 'mini rental DVD', feito pelo chatGPT
CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE filme (
    filme_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    categoria VARCHAR(50)
);

CREATE TABLE locacao (
    locacao_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(cliente_id),
    filme_id INT REFERENCES filme(filme_id),
    data_locacao DATE
);

INSERT INTO cliente (nome) VALUES
('João Silva'),
('Maria Souza'),
('Carlos Alberto');

INSERT INTO filme (titulo, categoria) VALUES
('Matrix', 'Ficção'),
('Titanic', 'Romance'),
('Velozes e Furiosos', 'Ação'),
('O Rei Leão', 'Animação');

INSERT INTO locacao (cliente_id, filme_id, data_locacao) VALUES
(1, 1, '2025-04-01'),
(2, 2, '2025-04-02'),
(3, 3, '2025-04-02'),
(1, 4, '2025-04-03'),
(2, 3, '2025-04-04');


































-- consultas 
-- 1) "Liste todos os clientes que alugaram filmes da categoria 'Ação'."
SELECT 
    c.nome AS "Nome do cliente",
    f.categoria AS "Nome da categoria"
FROM locacao l
INNER JOIN cliente c ON l.cliente_id = c.cliente_id
INNER JOIN filme f ON l.filme_id = f.filme_id
WHERE f.categoria = 'Ação'

-- 2) "Quais filmes o cliente 'Maria Souza' alugou?"
SELECT 
    c.nome AS "Nome cliente",
    f.titulo AS "Nome do filme"
FROM locacao l 
INNER JOIN cliente c ON l.cliente_id = c.cliente_id
INNER JOIN filme f ON l.filme_id = f.filme_id
WHERE c.nome = 'Maria Souza'

-- 3) "Quantas locações cada cliente fez?"
SELECT
    c.nome AS "Nome do cliente",
    COUNT(locacao_id) AS "Quantidade de alocação"
FROM locacao a 
INNER JOIN cliente c ON a.cliente_id = c.cliente_id
GROUP BY c.nome
