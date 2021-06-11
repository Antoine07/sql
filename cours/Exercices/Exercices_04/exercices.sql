
-- insert values

-- cotes couchés sécurités pour ne pas collisionner avec les mots réservés du langage

TRUNCATE `pilots`;
TRUNCATE `compagnies`;

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


-- create fields birth_day, next_fligth, num_jobs

ALTER TABLE pilots 
ADD birth_day DATETIME,
ADD next_fligth DATETIME, 
ADD num_jobs  SMALLINT UNSIGNED DEFAULT 0 ;

-- 
ALTER TABLE pilots
CHANGE next_fligth next_flight DATETIME;

ALTER TABLE pilots
DROP birth_day,
DROP next_flight,
DROP num_jobs;


UPDATE `pilots`
SET `birth_day` = '1978-02-04 00:00:00',
 `next_flight` = '2020-12-04 09:50:52',
 `num_jobs` = 10
 WHERE name = 'Yi';

UPDATE `pilots`
SET `birth_day` = '1978-10-17 00:00:00',
 `next_flight` = '2020-06-11 12:00:52',
 `num_jobs` = 50
 WHERE name = 'Sophie';

UPDATE `pilots`
SET `birth_day` = '1990-04-04 00:00:00',
 `next_flight` = '2020-05-08 12:50:52',
 `num_jobs` = 10
 WHERE name = 'Albert';

UPDATE `pilots`
SET `birth_day` = '1998-01-04 00:00:00',
 `next_flight` = '2020-05-08 12:50:52',
 `num_jobs` = 30
 WHERE name = 'Yan';

UPDATE `pilots`
SET `birth_day` = '2000-01-04 00:00:00',
 `next_flight` = '2020-02-04 12:50:52',
 `num_jobs` = 7
 WHERE name = 'Benoit';

UPDATE `pilots`
SET `birth_day` = '2000-01-04 00:00:00',
 `next_flight` = '2020-12-04 12:50:52',
 `num_jobs` = 13
 WHERE name = 'Jhon';

 UPDATE `pilots`
SET `birth_day` = '1977-01-04 00:00:00',
 `next_flight` = '2020-05-04 12:50:52',
 `num_jobs` = 8
 WHERE name = 'Pierre';