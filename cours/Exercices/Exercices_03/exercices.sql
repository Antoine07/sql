
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