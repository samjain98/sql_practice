CREATE TRIGGER AddShipTrigger 
AFTER INSERT ON Classes 
REFERENCING 
NEW ROW AS NewRow 
FOR EACH ROW 
INSERT INTO Ships(name, class, launched) 
VALUES (NewRow.class, NewRow.class, NULL);

CREATE TRIGGER Above35000Displacement
AFTER INSERT ON Classes
REFERENCING NEW ROW AS NewRow
FOR EACH ROW
WHEN (NewRow.displacement > 35000)
BEGIN
	UPDATE Classes
	SET displacement = 35000
	WHERE class = NewRow.class
END;

CREATE TRIGGER CheckShip
BEFORE INSERT ON Outcomes
REFERENCING NEW ROW AS NewRow
FOR EACH ROW
WHEN (TRUE)
BEGIN 
	IF (NewRow.ship NOT IN (SELECT name FROM Ships)) THEN
		INSERT INTO Ships
		VALUES (NewRow.ship, NULL, NULL);
	END IF;

	IF (NewRow.battle NOT IN (SELECT name FROM Battles)) THEN
		INSERT INTO Battles
		VALUES(NewRow.battle, NULL);
	END IF;
END;

