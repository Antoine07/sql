
ALTER TABLE compagnies
ADD status ENUM("published", "unpublished", "draft") DEFAULT "draft";

INSERT INTO compagnies (comp, name, status)  VALUES ("A5", "alan" , NULL) ;

-- Attention vous pouvez également imposer NOT NULL au champ de type ENUM en MySQL

ALTER TABLE compagnies
ADD status ENUM("published", "unpublished", "draft") NOT NULL DEFAULT "draft";

-- IMPOSSIBLE car status est not null
INSERT INTO compagnies (comp, name, status)  VALUES ("A5", "alan" , NULL) ;

ALTER TABLE compagnies
ADD numStreet INT UNSIGNED ;

ALTER TABLE compagnies
DROP numStreet ;    

ALTER TABLE compagnies
ADD numStreet INT UNSIGNED AFTER `name` ;


-- pilots
CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `numFlying` DECIMAL(7,1),
    `compagny` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pilots PRIMARY KEY (`certificate`)
) ENGINE=InnoDB ;

-- add constraint FOREIN KEY

ALTER TABLE pilots ADD CONSTRAINT fk_pilots_compagny FOREIGN KEY (compagny) REFERENCES compagnies(`comp`);


-- add constraint unique
ALTER TABLE pilots ADD CONSTRAINT un_name UNIQUE (`name`) ;

-- drop constraint 
ALTER TABLE pilots DROP INDEX `un_name`;


-- show all constraint

SELECT COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'pilots';
