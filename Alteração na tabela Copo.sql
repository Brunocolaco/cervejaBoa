alter table copo add Nome varchar(45) ;

ALTER TABLE `cerveja`.`copo` 
CHANGE COLUMN `TipoCopo` `TipoCopo` BLOB NULL DEFAULT NULL AFTER `idCopo`;
