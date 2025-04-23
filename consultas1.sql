-- 'mini rental DVD', feito pelo chatGPT
CREATE TABLE endereco (
    endereco_id SERIAL PRIMARY KEY,
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10)
);

CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco_id INT REFERENCES endereco(endereco_id)
);

CREATE TABLE categoria (
    categoria_id SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50)
);

CREATE TABLE filme (
    filme_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    ano_lancamento INT,
    categoria_id INT REFERENCES categoria(categoria_id)
);

CREATE TABLE estoque (
    estoque_id SERIAL PRIMARY KEY,
    filme_id INT REFERENCES filme(filme_id),
    quantidade_disponivel INT
);

CREATE TABLE locacao (
    locacao_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(cliente_id),
    filme_id INT REFERENCES filme(filme_id),
    data_locacao DATE,
    data_retorno DATE
);

CREATE TABLE pagamento (
    pagamento_id SERIAL PRIMARY KEY,
    locacao_id INT REFERENCES locacao(locacao_id),
    valor DECIMAL(6,2),
    data_pagamento DATE
);

CREATE TABLE loja (
    loja_id SERIAL PRIMARY KEY,
    nome_loja VARCHAR(100),
    endereco_id INT REFERENCES endereco(endereco_id)
);

CREATE TABLE funcionario (
    funcionario_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    loja_id INT REFERENCES loja(loja_id)
);


INSERT INTO endereco (rua, cidade, estado, cep) VALUES
('Rua A', 'Maranguape', 'CE', '61940-000'),
('Rua B', 'Fortaleza', 'CE', '60000-000');


INSERT INTO cliente (nome, email, telefone, endereco_id) VALUES
('João Lima', 'joao@gmail.com', '85912345678', 1),
('Maria Souza', 'maria@hotmail.com', '85987654321', 2),
('José Silva', 'jose@outlook.com', '85911223344', 1);


INSERT INTO categoria (nome_categoria) VALUES
('Ação'),
('Drama'),
('Comédia'),
('Ficção Científica');


INSERT INTO filme (titulo, ano_lancamento, categoria_id) VALUES
('Matrix', 1999, 4),
('Titanic', 1997, 2),
('Vingadores', 2012, 1),
('Todo Mundo em Pânico', 2000, 3);


INSERT INTO estoque (filme_id, quantidade_disponivel) VALUES
(1, 3),
(2, 2),
(3, 4),
(4, 1);


INSERT INTO locacao (cliente_id, filme_id, data_locacao, data_retorno) VALUES
(1, 1, '2025-03-01', '2025-03-05'),
(2, 2, '2025-03-02', '2025-03-06'),
(3, 3, '2025-03-03', '2025-03-07'),
(1, 4, '2025-03-04', '2025-03-08');


INSERT INTO pagamento (locacao_id, valor, data_pagamento) VALUES
(1, 10.00, '2025-03-01'),
(2, 8.50, '2025-03-02'),
(3, 12.00, '2025-03-03'),
(4, 7.00, '2025-03-04');


INSERT INTO loja (nome_loja, endereco_id) VALUES
('DVD Express - Maranguape', 1),
('DVD Express - Fortaleza', 2);


INSERT INTO funcionario (nome, cargo, loja_id) VALUES
('Carlos Lima', 'Gerente', 1),
('Fernanda Alves', 'Atendente', 2);




-- consultas 
-- 1) "Quais clientes moram na cidade de "Maranguape"?

SELECT
    c.nome AS "Nome do cliente",
    e.cidade AS "Nome da cidade"
FROM cliente c 
INNER JOIN endereco e ON e.endereco_id = c.endereco_id 
WHERE e.cidade = 'Maranguape'

-- 2) "Quais filmes ainda têm mais de 2 cópias disponíveis no estoque?"

SELECT 
    f.titulo AS "Nome do filme",
    e.quantidade_disponivel AS "Quantidade disponivel"
FROM estoque e
INNER JOIN filme f ON e.filme_id = f.filme_id
WHERE e.quantidade_disponivel > 2

-- 3) "Liste todas as locações feitas entre '2025-03-01' e '2025-03-03'."

SELECT 
    c.nome AS "Cliente",
    f.titulo AS "Filme",
    l.data_locacao AS "data da locação"
FROM locacao l 
INNER JOIN cliente c ON l.cliente_id = c.cliente_id
INNER JOIN filme f ON l.filme_id = f.filme_id
WHERE l.data_locacao = '2025-03-02'