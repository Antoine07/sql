

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
Récupérez tous les noms des pilotes dont le nom de leur compagnie se termine par I suivi de 2 caractères exactement
*/