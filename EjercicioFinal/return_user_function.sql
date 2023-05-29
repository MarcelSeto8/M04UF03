DROP FUNCTION IF EXISTS return_random_user;

DELIMITER $$

CREATE FUNCTION return_random_user(_id_planet INT UNSIGNED) RETURNS VARCHAR(32)
BEGIN

	DECLARE users INT;
	DECLARE random_num INT;
	DECLARE random_user INT;
	DECLARE random_name VARCHAR(32);

	SET users = (SELECT COUNT(*) FROM users_planets WHERE users_planets.id_planet = _id_planet);
	SET random_num = FLOOR(RAND() * users);
	SET random_user = (SELECT id_user FROM users_planets WHERE users_planets.id_planet = _id_planet LIMIT random_num, 1);
	SET random_name = (SELECT users.name FROM users WHERE users.id_user = random_user);

	RETURN random_name;

END $$

DELIMITER ;
