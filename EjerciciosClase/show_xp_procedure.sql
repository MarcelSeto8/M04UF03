DROP PROCEDURE IF EXISTS show_hp;

DELIMITER $$

CREATE PROCEDURE show_hp()
BEGIN
	DECLARE id_char INT UNSIGNED;
	DECLARE hp_char INT;

	DECLARE salir INT DEFAULT;

	DECLARE cur CURSOR FOR SELECT id_character, hp FROM stats;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET salir = 1;

	OPEN CUR;

	bucle:LOOP
		FETCH cur INTO id_char, hp_char;

		IF salir = 1 THEN
			SELECT CONCAT ("Fin del bucle") AS end_text;
			LEAVE bucle;
		END IF;

		IF hp_char <= 26 THEN
			UPDATE stats SET hp=99 WHERE stats.id_character=id_char;
		END IF;

	END LOOP bucle;
	CLOSE cur;

END $$

DELIMITER ;
