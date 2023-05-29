DROP PROCEDURE IF EXISTS conspiraciones;

DELIMITER $$

CREATE PROCEDURE conspiraciones (_id_conspiration INT, _id_user INT, id_telacreiste INT)
BEGIN

	DECLARE handler_p INT DEFAULT 1;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET handler_p = 0;

	START TRANSACTION;
		INSERT INTO users_conspiraciones (id_user, id_conspiration) 
		VALUES (_id_user, _id_conspiration)

		IF id_telacreiste = 1 THEN
			COMMIT;
		ELSE
			ROLLBACK;
		END IF;

	END $$

DELIMITER ;
