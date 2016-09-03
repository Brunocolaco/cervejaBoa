
CREATE SCHEMA IF NOT EXISTS `cervejaBoa` DEFAULT CHARACTER SET utf8 ;
USE `cervejaBoa` ;


CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Copo` (
  `idCopo` INT NOT NULL AUTO_INCREMENT,
  `TipoCopo` VARCHAR(45) NULL,
  PRIMARY KEY (`idCopo`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Cor` (
  `idCor` INT NOT NULL AUTO_INCREMENT,
  `NomeCor` VARCHAR(45) NULL,
  PRIMARY KEY (`idCor`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Nacionalidade` (
  `idNacionalidade` INT NOT NULL AUTO_INCREMENT,
  `NomePais` VARCHAR(65) NULL,
  PRIMARY KEY (`idNacionalidade`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Estilo` (
  `idEstilo` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstilo`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Cerveja` (
  `idCerveja` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(60) NULL,
  `DescricaoCerveja` VARCHAR(500) NULL,
  `TeorAlcoolico` DOUBLE NULL,
  `TemperaturaIdeal` DOUBLE NULL,
  `ProporcaoodemaltedeCevada` DOUBLE NULL,
  `Preco` DOUBLE NULL,
  `idCopo` INT NOT NULL,
  `idCor` INT NOT NULL,
  `idNacionalidade` INT NOT NULL,
  `idEstilo` INT NOT NULL,
  `Imagem` BLOB NULL,
  PRIMARY KEY (`idCerveja`, `idCopo`, `idCor`, `idNacionalidade`, `idEstilo`),
  foreign key(idCopo) references Copo (idCopo),
  foreign key (idCor) references Cor (idCor),
  foreign key (idNacionalidade) references Nacionalidade(idNacionalidade),
  foreign key (idEstilo) references Estilo(idEstilo))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(90) NULL,
  `Login` VARCHAR(20) NULL,
  `Senha` VARCHAR(30) NULL,
  `Email` VARCHAR(65) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `cervejaBoa`.`Avaliacao` (
  `idAvaliacao` INT NOT NULL AUTO_INCREMENT,
  `DescricaoAvaliacao` VARCHAR(120) NULL,
  `Nota` INT NULL,
  `Preco` DOUBLE NULL,
  `DataAvaliacao` DATE NULL,
  `idCerveja` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idAvaliacao`, `idCerveja`, `idUsuario`),
	foreign key (idCerveja) references Cerveja (idCerveja),
    foreign key (idUsuario) references Usuario (idUsuario)
    )
ENGINE = InnoDB;

insert into estilo values(1, 'Ipa');
insert into estilo values(2, 'Lagers');
insert into estilo values(3, 'Pilsners');
insert into estilo values(4, 'Porter');
insert into estilo values(5, 'Stout');
insert into estilo values(6, 'Trapistas');
insert into estilo values(7,'Trigo/Weiss');
insert into estilo values(8,'Tripel');
insert into estilo values(9,'Dunkelweizen');

insert into cor values(1, 'Amarelo');
insert into cor values(2, 'Amarelo Palha');
insert into cor values(3, 'Ambar');
insert into cor values(4, 'Cobre');
insert into cor values(5, 'Cobre Claro');
insert into cor values(6, 'Dourado');
insert into cor values(7, 'Marrom');
insert into cor values(8, 'Marrom Claro');
insert into cor values(9, 'Marrom Escuro');
insert into cor values(10, 'Marrom Muito Escuro');
insert into cor values(11, 'Preto');
insert into cor values(12, 'Preto Opaco');

insert into copo values(1, 'Calice');
insert into copo values(2, 'Caneca');
insert into copo values(3, 'Cilindrico');
insert into copo values(4, 'Conhaque');
insert into copo values(5, 'Flauta');
insert into copo values(6, 'Lager');
insert into copo values(7, 'Mass');
insert into copo values(8, 'Pilsner');
insert into copo values(9, 'Pint');
insert into copo values(10, 'Taça');
insert into copo values(11, 'Tulipa');
insert into copo values(12, 'Tumbler');
insert into copo values(13, 'Weiss');
insert into copo values(14, 'Yard');

insert into nacionalidade values(1, 'Alemanha');

insert into cerveja values(1, 'Erdinger', 'Dark Erdinger Weissbier é uma especialidade de Cerveja rica e suave de trigo Erdinger Weissbräu. Ela deve seu sabor encorpado ao fino lúpulo e malte escuro usado em sua produção. A especialidade Cerveja escura é produzida de acordo com uma antiga receita. Seu sabor picante também resulta do aumento da proporção do mosto original. Como todas as cervejas de trigo Erdinger, esta variedade escura também adquire seu sabor típico de envelhecimento em garrafa',
								5.6, 6, 6, 18.00, 6, 7, 1, 9, 1);

select * from cerveja;