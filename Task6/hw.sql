DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE formatted_time VARCHAR(255);
    
    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;
    
    SET formatted_time = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN formatted_time;
END //
DELIMITER ;
SELECT format_seconds(123456);

DELIMITER //
CREATE PROCEDURE PrintEvenNumbers()
BEGIN
    DECLARE num INT;
    SET num = 1;
    
    WHILE num <= 10 DO
        IF num % 2 = 0 THEN
            SELECT num;
        END IF;
        SET num = num + 1;
    END WHILE;
END //

DELIMITER ;
CALL PrintEvenNumbers();