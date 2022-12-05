-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Dez-2022 às 14:11
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `roana`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `Nome`) VALUES
(1, 'Blusas'),
(2, 'Calças'),
(3, 'Casacos'),
(4, 'Saias'),
(5, 'Shorts'),
(6, 'Vestidos'),
(7, 'Conjuntos'),
(8, 'Acessórios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `Valor` float NOT NULL,
  `id` int(11) NOT NULL,
  `Criado` datetime NOT NULL,
  `Concluido` tinyint(1) NOT NULL,
  `Usuarioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`Valor`, `id`, `Criado`, `Concluido`, `Usuarioid`) VALUES
(450, 1, '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  `Imagem` varchar(500) NOT NULL,
  `Valor` float NOT NULL,
  `id` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos pedidos`
--

CREATE TABLE `produtos pedidos` (
  `id` int(11) NOT NULL,
  `Produtoid` int(11) NOT NULL,
  `Pedidoid` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL DEFAULT 0,
  `Tamanhoid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quantidade`
--

CREATE TABLE `quantidade` (
  `Quantidade` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `Tamanhoid` int(11) NOT NULL,
  `Produtoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

CREATE TABLE `tamanho` (
  `Nome` varchar(10) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tamanho`
--

INSERT INTO `tamanho` (`Nome`, `id`) VALUES
('P', 1),
('M', 2),
('G', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `permission`) VALUES
(1, 'admin', '123', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Pedido_fk0` (`Usuarioid`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Produto_fk0` (`idCategoria`);

--
-- Índices para tabela `produtos pedidos`
--
ALTER TABLE `produtos pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Produtos Pedidos_fk0` (`Produtoid`),
  ADD KEY `Produtos Pedidos_fk1` (`Pedidoid`),
  ADD KEY `Produtos Pedidos_fk2` (`Tamanhoid`);

--
-- Índices para tabela `quantidade`
--
ALTER TABLE `quantidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Quantidade_fk0` (`Tamanhoid`),
  ADD KEY `Quantidade_fk1` (`Produtoid`);

--
-- Índices para tabela `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produtos pedidos`
--
ALTER TABLE `produtos pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `quantidade`
--
ALTER TABLE `quantidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tamanho`
--
ALTER TABLE `tamanho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `Pedido_fk0` FOREIGN KEY (`Usuarioid`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `Produto_fk0` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);

--
-- Limitadores para a tabela `produtos pedidos`
--
ALTER TABLE `produtos pedidos`
  ADD CONSTRAINT `Produtos Pedidos_fk0` FOREIGN KEY (`Produtoid`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `Produtos Pedidos_fk1` FOREIGN KEY (`Pedidoid`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `Produtos Pedidos_fk2` FOREIGN KEY (`Tamanhoid`) REFERENCES `tamanho` (`id`);

--
-- Limitadores para a tabela `quantidade`
--
ALTER TABLE `quantidade`
  ADD CONSTRAINT `Quantidade_fk0` FOREIGN KEY (`Tamanhoid`) REFERENCES `tamanho` (`id`),
  ADD CONSTRAINT `Quantidade_fk1` FOREIGN KEY (`Produtoid`) REFERENCES `produto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
