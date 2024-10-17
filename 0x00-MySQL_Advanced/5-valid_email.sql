-- SQL script that creates a trigger that resets the attribute
DROP TRIGGER IF EXISTS reset;
DELIMITER ^^
CREATE TRIGGER reset
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 1
    ELSE
	SET NEW.valid_email = NEW.valid_email
    END IF
END ^^
DELIMITER ;
