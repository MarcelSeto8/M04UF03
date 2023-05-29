DROP VIEW IF EXISTS count_persons_x_planet;

CREATE VIEW count_persons_x_planet 
AS SELECT planets.planet, COUNT(users_planets.id_user) AS count_user
FROM users, planets, users_planets 
WHERE users.id_user = users_planets.id_user 
AND planets.id_planet = users_planets.id_planet 
GROUP BY planets.planet
ORDER BY count_user DESC;
