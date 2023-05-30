DROP PROCEDURE IF EXISTS kill_user;

DELIMITER $$

CREATE PROCEDURE kill_user(IN _name_user VARCHAR(64)) 
BEGIN
	DECLARE user_dead VARCHAR(32);
	DECLARE is_user_alive BOOLEAN;

	SELECT users.dead INTO is_user_alive 
	FROM users
	WHERE users.name = _name_user;

	IF is_user_alive THEN

	SELECT CONCAT('El usuario con nombre ', _name_user, ' está muerte.') AS message;

	ELSE

	UPDATE users
	SET users.dead = TRUE
	WHERE users.name = _name_user;

	SELECT CONCAT('He matado a ', _name_user, '. JIJIJIJI!') AS message;

	END IF;

END $$

DELIMITER ;
