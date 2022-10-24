CREATE TABLE `Produto` (
	`Nome` varchar(50) NOT NULL,
	`Descricao` varchar(100) NOT NULL,
	`Imagem` varchar(500) NOT NULL,
	`Valor` FLOAT NOT NULL,
	`id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Tamanho` (
	`Nome` varchar(10) NOT NULL,
	`id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Quantidade` (
	`Quantidade` INT NOT NULL,
	`id` INT NOT NULL AUTO_INCREMENT,
	`Tamanhoid` INT NOT NULL,
	`Produtoid` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Pedido` (
	`Valor` FLOAT NOT NULL,
	`id` INT NOT NULL AUTO_INCREMENT,
	`Criado` DATETIME NOT NULL,
	`Concluido` BOOLEAN NOT NULL,
	`Usuarioid` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Usuario` (
	`id` INT NOT NULL,
	`Nome` varchar(35) NOT NULL,
	`Sobrenome` varchar(50) NOT NULL,
	`Email` varchar(100) NOT NULL,
	`Senha` varchar(35) NOT NULL,
	`Permissao` varchar(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Categorias` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Nome` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Categoria_has_Produto` (
	`Categoria` INT NOT NULL,
	`Produto` INT NOT NULL
);

CREATE TABLE `Produtos_Pedidos` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Produtoid` INT NOT NULL,
	`Pedidoid` INT NOT NULL,
	`Quantidade` INT NOT NULL DEFAULT '0',
	`Tamanhoid` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

ALTER TABLE `Quantidade` ADD CONSTRAINT `Quantidade_fk0` FOREIGN KEY (`Tamanhoid`) REFERENCES `Tamanho`(`id`);

ALTER TABLE `Quantidade` ADD CONSTRAINT `Quantidade_fk1` FOREIGN KEY (`Produtoid`) REFERENCES `Produto`(`id`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk0` FOREIGN KEY (`Usuarioid`) REFERENCES `Usuario`(`id`);

ALTER TABLE `Categoria_has_Produto` ADD CONSTRAINT `Categoria_has_Produto_fk0` FOREIGN KEY (`Categoria`) REFERENCES `Categorias`(`id`);

ALTER TABLE `Categoria_has_Produto` ADD CONSTRAINT `Categoria_has_Produto_fk1` FOREIGN KEY (`Produto`) REFERENCES `Produto`(`id`);

ALTER TABLE `Produtos_Pedidos` ADD CONSTRAINT `Produtos_Pedidos_fk0` FOREIGN KEY (`Produtoid`) REFERENCES `Produto`(`id`);

ALTER TABLE `Produtos_Pedidos` ADD CONSTRAINT `Produtos_Pedidos_fk1` FOREIGN KEY (`Pedidoid`) REFERENCES `Pedido`(`id`);

ALTER TABLE `Produtos_Pedidos` ADD CONSTRAINT `Produtos_Pedidos_fk2` FOREIGN KEY (`Tamanhoid`) REFERENCES `Tamanho`(`id`);









