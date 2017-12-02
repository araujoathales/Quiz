DROP TABLE IF EXISTS Questoes CASCADE;
DROP TABLE IF EXISTS Dificuldade CASCADE;
DROP TABLE IF EXISTS Materia CASCADE;
DROP TABLE IF EXISTS Questao_Fechada CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;
DROP TABLE IF EXISTS Tipo_Usuario CASCADE;
DROP TABLE IF EXISTS Forum CASCADE;
DROP TABLE IF EXISTS Sessao CASCADE;
DROP TABLE IF EXISTS Desempenho CASCADE;

CREATE TABLE `Questoes`
(
  `Cod_Questao` Char(10) NOT NULL,
  `Cod_dificuldade` Char(10) NOT NULL,
  `Cod_Materia` Char(10) NOT NULL,
  `Txt_Enunciado` Text NOT NULL,
  `resposta` Text NOT NULL
)
;

CREATE INDEX `IX_Relationship1` ON `Questoes` (`Cod_dificuldade`)
;

CREATE INDEX `IX_Relationship2` ON `Questoes` (`Cod_Materia`)
;

ALTER TABLE `Questoes` ADD  PRIMARY KEY (`Cod_Questao`)
;

-- Table Dificuldade

CREATE TABLE `Dificuldade`
(
  `Cod_dificuldade` Char(10) NOT NULL,
  `Peso da dificuldade` Int
)
;

ALTER TABLE `Dificuldade` ADD  PRIMARY KEY (`Cod_dificuldade`)
;

-- Table Materia

CREATE TABLE `Materia`
(
  `Cod_Materia` Char(10) NOT NULL,
  `Desc_Materia` Char(20) NOT NULL
)
;

ALTER TABLE `Materia` ADD  PRIMARY KEY (`Cod_Materia`)
;

-- Table Questao_Fechada

CREATE TABLE `Questao_Fechada`
(
  `Cod_Questao` Char(10) NOT NULL,
  `Seq_Opcao` Char(20) NOT NULL,
  `desc_Opcao` Char(25) NOT NULL
)
;

ALTER TABLE `Questao_Fechada` ADD  PRIMARY KEY (`Cod_Questao`,`Seq_Opcao`)
;

-- Table Usuario

CREATE TABLE `Usuario`
(
  `nomeusuario` Char(20) NOT NULL,
  `Cod_Tipo` Char(5),
  `NomeCompleto` Char(20),
  `Email` Char(30) NOT NULL,
  `Senha` Char(20) NOT NULL
)
;

CREATE INDEX `IX_Relationship4` ON `Usuario` (`Cod_Tipo`)
;

ALTER TABLE `Usuario` ADD  PRIMARY KEY (`nomeusuario`)
;

-- Table Tipo_Usuario

CREATE TABLE `Tipo_Usuario`
(
  `Cod_Tipo` Char(5) NOT NULL,
  `Desc_Tipo` Char(20) NOT NULL
)
;

ALTER TABLE `Tipo_Usuario` ADD  PRIMARY KEY (`Cod_Tipo`)
;

-- Table Sessao

CREATE TABLE `Sessao`
(
  `nomeusuario` Char(20) NOT NULL,
  `Id_Sessao` Char(10) NOT NULL,
  `Data_Entrada` Char(20) NOT NULL,
  `Data_Saida` Char(20) NOT NULL,
  `resposta` Char(20) NOT NULL,
  `Acertos` INTEGER NOT NULL,
  `Erros` INTEGER NOT NULL
    
)
;

ALTER TABLE `Sessao` ADD  PRIMARY KEY (`Id_Sessao`,`nomeusuario`)
;

-- Table Forum

CREATE TABLE `Forum`
(
  `nomeusuario` Char(20) NOT NULL,
  `Cod_Questao` Char(10) NOT NULL,
  `Data_Postagem` Timestamp NOT NULL,
  `Txt_Cometario` Text
)
;

ALTER TABLE `Forum` ADD  PRIMARY KEY (`Data_Postagem`)
;

-- Table Desempenho

CREATE TABLE `Desempenho`
(
  `Cod_Questao` Char(10) NOT NULL,
  `Id_Sessao` Char(10) NOT NULL,
  `nomeusuario` Char(20) NOT NULL
)
;

ALTER TABLE `Desempenho` ADD  PRIMARY KEY (`Cod_Questao`,`Id_Sessao`,`nomeusuario`)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `Questoes` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`Cod_dificuldade`) REFERENCES `Dificuldade` (`Cod_dificuldade`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Questoes` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`Cod_Materia`) REFERENCES `Materia` (`Cod_Materia`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Questao_Fechada` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`Cod_Questao`) REFERENCES `Questoes` (`Cod_Questao`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Usuario` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`Cod_Tipo`) REFERENCES `Tipo_Usuario` (`Cod_Tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Sessao` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`nomeusuario`) REFERENCES `Usuario` (`nomeusuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Forum` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`Cod_Questao`) REFERENCES `Questoes` (`Cod_Questao`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Forum` ADD CONSTRAINT `Relationship11` FOREIGN KEY (`nomeusuario`) REFERENCES `Usuario` (`nomeusuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Desempenho` ADD CONSTRAINT `Relationship14` FOREIGN KEY (`Cod_Questao`) REFERENCES `Questoes` (`Cod_Questao`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Desempenho` ADD CONSTRAINT `Relationship15` FOREIGN KEY (`Id_Sessao`, `nomeusuario`) REFERENCES `Sessao` (`Id_Sessao`, `nomeusuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

