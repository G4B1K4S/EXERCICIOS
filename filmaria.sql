CREATE DATABASE filmaria;
USE filmaria;

CREATE TABLE categorias(
	id_categoria INT,
    nome_categoria VARCHAR(15),
    PRIMARY KEY(id_categoria)
);
    
INSERT INTO categorias VALUES
(1, 'sports'),
(2, 'drama');

CREATE TABLE filmes(
	id_filmes INT,
    titulo_filme VARCHAR(30),
    id_categoria INT,
    PRIMARY KEY(id_filmes),
	FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
);

INSERT INTO filmes VALUES
(1, "Herois da Sanita", 1),
(2, "Janela traseira", 2);

SELECT filmes.titulo_filme
FROM filmes
LEFT JOIN categorias
ON categorias.id_categoria = filmes.id_filme
WHERE categoria.nome_categoria = 'sports'
ORDER BY filmes.titulo_filme ASC;

