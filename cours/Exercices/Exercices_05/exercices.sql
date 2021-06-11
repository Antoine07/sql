

-- 1 

SELECT * FROM pilots WHERE compagny= "AUS";

-- 2 on peut ajouter dans la projection des comandes cela crée une colonne en plus

SELECT `name` FROM pilots WHERE compagny= "FRE1" AND numFlying > 15;

SELECT `name` AS 'super Name', CURRENT_TIMESTAMP as "Date request" FROM pilots WHERE compagny= "FRE1" AND numFlying > 15;

-- 3 même requêtes mais dans la réponse on voudrait avoir une colonne bonus qui attribue à chaque pilote un bonus aléatoire supplémentaire

SELECT `name` AS 'super Name', FLOOR(RAND()*10 + 1) as "bonus" FROM pilots WHERE compagny= "FRE1" AND numFlying > 15;


-- 4

SELECT `name` FROM pilots WHERE compagny= "FRE1" AND numFlying > 20;

-- 5 

SELECT `name` FROM pilots WHERE (compagny= "FRE1" OR  compagny= "FRE2") AND numFlying > 20;

SELECT `name` FROM pilots WHERE compagny IN ("FRE2", "FRE1")  AND numFlying > 20;


-- 6 sélectionnez les pilotes de la compagnie FRE1 ou la compagnie FRE2 qui a fait plus de 20 h de vols.

SELECT `name` FROM pilots WHERE compagny= "FRE1" OR  (compagny= "FRE2" AND numFlying > 20);

-- meme chose en jouant sur le AND prioritaire par rapport au OR

SELECT `name` FROM pilots WHERE compagny= "FRE1" OR  compagny= "FRE2" AND numFlying > 20;

-- 7 valeurs entre

SELECT `name`, numFlying
FROM pilots
WHERE numFlying  BETWEEN 190 AND 200;

-- 8

SELECT `name` FROM pilots WHERE compagny IN ("AUS", "FRE1")  ;


-- 9 compagnie dont le nom contient un a et commence par un F

SELECT `name`, compagny FROM pilots WHERE compagny LIKE '%a%'  ;

SELECT `name`, compagny FROM pilots WHERE compagny LIKE 'f%'  ;

-- 10 compagnie dont le nom contient un i suivi d'un caractère uniquement

SELECT `name`, compagny FROM pilots WHERE compagny LIKE '%i_'  ;

/*
Exercice supplémentaire avec une Regex ceci permet d'extraire des sous-chaînes
Récupérez tous les noms des pilotes dont le nom de leur compagnie se termine par R suivi de 2 caractères exactement
*/


SELECT name, compagny FROM pilots WHERE compagny REGEXP '.*r.{2}$';

-- vous pouvez tester les Regex directement en console 

SELECT "ANTOINE" REGEXP '^A.*E$' ;

SELECT "ANTOINE" REGEXP '^A.*X$' ;

/*

^  : commence par, ^A : commence par A

*/

SELECT "ANTOINE" REGEXP '^A' ;

/*

$  : se termine par,  E$ : se termine par un E

*/

SELECT "ANTOINE" REGEXP 'E$' ;

/*
^  : commence par, ^A : commence par A

$  : se termine par,  E$ : se termine par un E

*/

SELECT "ANTOINE" REGEXP '^E$' ; 

-- match avec E uniquement

/*

Quantificateur 
* : 0, N
{1,}  1 à N
{, 2}  de 0 à 2
{2} deux caractères exactements
*/

/*

. : n'importe quel caractère
[a-z] tous les caractères compris entre a et z
[0-1] tous les caractères compris entre a et z
[aZ-zZ0-1] tous les caractères alphanumérique

*/


-- Ajoutez une colonne Bonus

ALTER TABLE pilots 
ADD bonus DECIMAL(5,1) AFTER name;

UPDATE pilots
SET bonus = 1000
WHere certificate IN ('ct-1', 'ct-11', 'ct-12');

UPDATE pilots
SET bonus = 2000
WHere certificate IN ('ct-56');

UPDATE pilots
SET bonus = 500
WHere certificate NOT IN ('ct-1', 'ct-11', 'ct-12', 'ct-56'); -- pensez au complémentaire

-- en une requete avec case when

UPDATE `pilots`
    SET `bonus` =
        (CASE
            WHEN `certificate` IN ('ct-1', 'ct-11', 'ct-12') THEN 1000
            WHEN `certificate` IN ('ct-56') THEN 2000
            ELSE 500
        END);