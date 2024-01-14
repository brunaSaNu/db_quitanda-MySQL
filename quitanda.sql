CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    datavalidade DATE,
	preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

-- INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
-- values ("tomate",100, "2023-12-15", 8.00);
-- INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
-- values ("maçã",20, "2023-12-15", 5.00);
-- INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
-- values ("laranja",50, "2023-12-15", 10.00);
-- INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
-- values ("banana",200, "2023-12-15", 12.00);
-- INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
-- values ("uva",1200, "2023-12-15", 30.00);
-- INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
-- values ("pêra",500, "2023-12-15", 2.99);


SELECT * FROM db_quitanda.tb_produtos;

CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL
);

-- INSERT INTO tb_categorias (descricao)
-- VALUES ("Frutas");

-- INSERT INTO tb_categorias (descricao)
-- VALUES ("Verduras");

-- INSERT INTO tb_categorias (descricao)
-- VALUES ("Legumes");

-- INSERT INTO tb_categorias (descricao)
-- VALUES ("Temperos");

-- INSERT INTO tb_categorias (descricao)
-- VALUES ("Ovos");

-- INSERT INTO tb_categorias (descricao)
-- VALUES ('Outros');

SELECT * FROM tb_categorias;

ALTER TABLE tb_produtos ADD categoriaid BIGINT;
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

UPDATE tb_produtos SET categoriaid = 3 WHERE id = 1;																																							
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 2;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 3;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 4;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 5;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 6;


INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Grapefruit", 3000, "2022-03-13", 50.00, 1);

INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

SELECT * FROM tb_produtos;

-- ordem crescente
SELECT * FROM tb_produtos ORDER BY nome ASC;

-- ordem decrescente 
SELECT * FROM tb_produtos ORDER BY nome DESC;

-- ordenando por mais de um campo da tabela
SELECT * FROM tb_produtos ORDER BY nome, preco ASC;

-- SELECT com o operador IN - todos os produtos cujo preço seja determinado
SELECT * FROM tb_produtos WHERE preco IN (5.00, 10.00, 15.00);

-- SELECT com o operador BETWEEN - produtos que tem o seu preço ENTRE 
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 15.00;

-- busca textual SELECT com o operador LIKE - produtos que contenham a sílaba "ra"
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";

-- média preço funções matemáticas 
SELECT AVG(Preco) AS Media FROM tb_produtos;

-- INNER JOIN
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- LEFT JOIN 
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos LEFT JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- RIGHT JOIN
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos RIGHT JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- SELECT com GROUP BY
SELECT tb_categorias.Descricao, AVG(tb_produtos.Preco) AS Preco_Medio
FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.Id = tb_produtos.CategoriaId
GROUP BY tb_categorias.Descricao;