1.
SELECT Ships.name, Ships.class, Ships.launched
FROM Ships, Classes
WHERE Ships.class = Classes.class AND Classes.displacement > 35000


2.
SELECT Ships.name, Classes.displacement, Classes.numGuns
FROM Outcomes, Ships, Classes
WHERE Outcomes.ship = Ships.name AND Ships.class = Classes.class AND Outcomes.battle = “Guadalcanal”


3.
SELECT DISTINCT Ships.name, Battles.name, Outcomes.ship
FROM Ships, Battles, Outcomes
WHERE *


4.
SELECT name
FROM Ships
WHERE (Ships.class) IN 
	(
SELECT Classes.class
FROM Classes
WHERE bore = “16”
);

	SELECT *
	FROM new_ships
	WHERE EXISTS (
		SELECT Ships.name
		FROM Ships, Classes
		WHERE Ships.class = Classes.class AND Classes.bore = “16”
		) new_ships


5.
SELECT Outcomes.battle
FROM Outcomes
WHERE (Outcomes.ship) IN 
	(
SELECT Ships.name 
FROM Ships
WHERE Ships.class = “Kongo”
);
	SELECT *
	FROM kongo_ships
	WHERE EXISTS
		(
		SELECT Outcomes.battle
		FROM Outcomes, Ships
		WHERE Outcomes.ship = Ships.name AND Ships.class = “Kongo”
		) kongo_ships


6.
SELECT country
FROM Classes
WHERE bore >= ALL 
	(
SELECT bore
FROM Classes
WHERE *
) ;

SELECT country
FROM Classes
WHERE NOT bore < ANY 
	(
SELECT bore
FROM Classes
WHERE *
) ;