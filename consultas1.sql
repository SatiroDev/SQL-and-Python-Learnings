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
