-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Nov-2022 às 12:34
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_has_produto`
--

CREATE TABLE `categoria_has_produto` (
  `Categoria` int(11) NOT NULL,
  `Produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  `Imagem` varchar(500) NOT NULL,
  `Valor` float NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_pedidos`
--

CREATE TABLE `produtos_pedidos` (
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`) VALUES
(1, 'biasus', '123');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria_has_produto`
--
ALTER TABLE `categoria_has_produto`
  ADD KEY `Categoria_has_Produto_fk0` (`Categoria`),
  ADD KEY `Categoria_has_Produto_fk1` (`Produto`);

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
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos_pedidos`
--
ALTER TABLE `produtos_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Produtos_Pedidos_fk0` (`Produtoid`),
  ADD KEY `Produtos_Pedidos_fk1` (`Pedidoid`),
  ADD KEY `Produtos_Pedidos_fk2` (`Tamanhoid`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos_pedidos`
--
ALTER TABLE `produtos_pedidos`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categoria_has_produto`
--
ALTER TABLE `categoria_has_produto`
  ADD CONSTRAINT `Categoria_has_Produto_fk0` FOREIGN KEY (`Categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `Categoria_has_Produto_fk1` FOREIGN KEY (`Produto`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `Pedido_fk0` FOREIGN KEY (`Usuarioid`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `produtos_pedidos`
--
ALTER TABLE `produtos_pedidos`
  ADD CONSTRAINT `Produtos_Pedidos_fk0` FOREIGN KEY (`Produtoid`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `Produtos_Pedidos_fk1` FOREIGN KEY (`Pedidoid`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `Produtos_Pedidos_fk2` FOREIGN KEY (`Tamanhoid`) REFERENCES `tamanho` (`id`);

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
