

-- le having va agir sur les regroupement eux-même à l'inverse du WHERE qui agit sur l'ENSEMBLE des lignes

SELECT SUM(bonus), compagny FROM pilots GROUP BY compagny HAVING SUM(bonus) > 500;

/*
+--------+----------+
| bonus  | compagny |
+--------+----------+
| 1000.0 | AUS      |   <-- WHERE agirait pour sa part sur l'ensemble des lignes
|  500.0 | FRE1     |
|  500.0 | SIN      |
| 1000.0 | AUS      |
| 1000.0 | AUS      |
|  500.0 | SIN      |
| 2000.0 | AUS      |
|  500.0 | FRE1     |
|  500.0 | CHI      |
+--------+----------+

SELECT SUM(bonus), compagny FROM pilots GROUP BY compagny HAVING SUM(bonus) > 500;
+------------+----------+
| SUM(bonus) | compagny |
+------------+----------+
|     5000.0 | AUS      |
|     1000.0 | FRE1     |
|     1000.0 | SIN      |


SELECT col1 [,col2, ...], fonction_groupe
FROM table
WHERE (condition)
**GROUP BY clo1 [, col2, ...]**
HAVING condition
ORDER BY col1 [ASC | DESC] [, col2 ...]

*/