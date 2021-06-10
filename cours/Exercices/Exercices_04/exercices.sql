
-- insert values

-- cotes couchés sécurités pour ne pas collisionner avec les mots réservés du langage

DELETE FROM `pilots`;
DELETE FROM `compagnies`;

INSERT INTO `compagnies` (comp, `name`) VALUES 
    ('AUS', 'australia' ),
    ('CHI', 'china' ),
    ('FRE1', 'france' ),
    ('SIN', 'singa' );

INSERT INTO `pilots`
(`certificate`,`numFlying`,`compagny` ,`name`)
VALUES
    ('ct-1', 90, 'AUS', 'Alan' ),
    ('ct-12', 190, 'AUS', 'Albert' ),
    ('ct-7', 80, 'CHI', 'Pierre' ),
    ('ct-11', 200, 'AUS', 'Sophie' ),
    ('ct-6', 20, 'FRE1', 'Jhon' ),
    ('ct-10', 90, 'FRE1', 'Tom' ),
    ('ct-100', 200, 'SIN', 'Yi' ),
    ('ct-16', 190, 'SIN', 'Yan' ),
    ('ct-56', 300, 'AUS', 'Benoit' )
    ;


-- create field 