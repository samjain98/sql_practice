CREATE TABLE Classes(
class		CHAR(20) PRIMARY KEY,
type		CHAR(2),
country 	CHAR(255),
numGuns	REAL,
bore		REAL,
displacement	REAL,
CHECK (numGuns <= 19 OR bore < 28)
);


CREATE TABLE Ships(
name		CHAR(20) PRIMARY KEY 
class		CHAR(20),
launched	REAL,
CHECK (name in (
SELECT Ships.name 
FROM Ships, Battles, Outcomes 
WHERE Battles.date < YEAR(Ships.launched) AND                      Ships.name = Outcomes.ship AND                            Outcomes.battle = Battles.name 
                                            )
);


CREATE ASSERTION ShipTypes CHECK
(
NOT EXISTS
(
		SELECT country
		FROM Classes
		WHERE type = “bb”

		INTERSECT

		SELECT country
		FROM Classes
		WHERE type = “bc”

)
);


CREATE ASSERTION ClassShip CHECK
(
	NOT EXISTS
	(
		SELECT class
		FROM Classes
		WHERE class NOT IN 
(
SELECT name shipName 
FROM Ships 
UNION 
SELECT ship shipName 
FROM Outcomes;
)
		)
);
