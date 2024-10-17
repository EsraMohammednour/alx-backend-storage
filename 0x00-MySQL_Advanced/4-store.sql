-- script that create tigger.
DELIMITER ^^
DROP TRIGGER IF EXISTS decrease;
CREATE TRIGGER decrease
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
        SET quantity = quantity - NEW.number
        WHERE name = NEW.item_name;
END;
^^
DELIMITER ;
