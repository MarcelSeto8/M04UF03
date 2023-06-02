DROP VIEW IF EXISTS medicineplanet_money_revenue;

CREATE VIEW medicineplanet_money_revenue
AS SELECT planets.planet, SUM(price) revenue
FROM users, medicines, diagnoses, treatments, planets, users_planets
WHERE planets.id_planet = users_planets.id_planet 
AND diagnoses.id_user = users_planets.id_user 
AND diagnoses.id_diagnosis=treatments.id_diagnosis 
AND medicines.id_medicine = treatments.id_medicine
GROUP BY planets.planet
ORDER BY revenue DESC;
