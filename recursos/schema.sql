CREATE TABLE `usuario` (
  `id` integer PRIMARY KEY NOT NULL,
  `nome` text NOT NULL,
  `email` text NOT NULL,
  `senha_hash` text NOT NULL,
  `senha_salt` text NOT NULL
);

CREATE TABLE `carteira` (
  `id` integer PRIMARY KEY NOT NULL,
  `saldo` float NOT NULL,
  `nome` text NOT NULL, 
  `descricao` text ,
  `id_usuario` int NOT NULL
);

CREATE TABLE `transacao` (
  `id` integer PRIMARY KEY NOT NULL,
  `valor` float NOT NULL,
  `recorrencias` int,
  `inicio` date,
  `juros` float,
  `nome` text NOT NULL,
  `descricao` text,
  `id_categoria` int NOT NULL,
  `id_carteira` int NOT NULL
);

CREATE TABLE `meta` (
  `id` integer PRIMARY KEY NOT NULL,
  `atual` float,
  `objetivo` float,
  `limite` date,
  `inicio` date
);

CREATE TABLE `categoria` (
  `id` integer PRIMARY KEY NOT NULL,
  `nome` text NOT NULL
);

ALTER TABLE `carteira` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

ALTER TABLE `transacao` ADD FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);

ALTER TABLE `transacao` ADD FOREIGN KEY (`id_carteira`) REFERENCES `carteira` (`id`);