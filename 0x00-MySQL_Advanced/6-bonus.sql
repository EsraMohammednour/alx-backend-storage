--SQL script that creates a stored procedure AddBonus
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus()
AS
BEGIN
    SELECT user_id, project_name, score FROM corrections;
END $$
DELIMITER ;
