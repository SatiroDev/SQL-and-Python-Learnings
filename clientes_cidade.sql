CREATE TABLE cliente(
    cliente_id SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100)
);

CREATE TABLE cidade(
    cidade_id SERIAL PRIMARY KEY,
    nome_cidade VARCHAR(50)
);

CREATE TABLE cliente_cidade(
    cid_id INT REFERENCES cidade(cidade_id),
    clien_id INT REFERENCES cliente(cliente_id)
);

INSERT INTO cliente (nome_cliente)
VALUES 
('José Satiro'),
('Maria Clara'),
('João Lima');

INSERT INTO cidade (nome_cidade)
VALUES
('Maranguape'),
('Fortaleza');

INSERT INTO cliente_cidade (cid_id, clien_id)
VALUES
(1, 1),
(1, 2),
(2, 3);


SELECT 
    cliente.nome_cliente AS "Nome do cliente",
    cidade.nome_cidade AS "Cidade"
FROM cliente_cidade
INNER JOIN cidade ON cliente_cidade.cid_id = cidade.cidade_id
INNER JOIN cliente ON cliente_cidade.clien_id = cliente.cliente_id