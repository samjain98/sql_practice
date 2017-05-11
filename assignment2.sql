1.
SELECT country, class 
FROM classes
WHERE numGuns > 10


2.
SELECT name
FROM ships
WHERE launched < 1918


3.
SELECT ship, battle
FROM battles
WHERE result = ‘sunk’


4.
SELECT name, class, launched
FROM Ships
WHERE Ships.name = Ships.class


5.
SELECT name
FROM Ships
WHERE name = ‘r%’


6.
SELECT DISTINCT name
FROM ships, outcomes
WHERE names.size() = 3 AND Ships.name = outcomes.ship
