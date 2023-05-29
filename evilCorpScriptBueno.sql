CREATE DATABASE IF NOT EXISTS evilCorp;

/*HEALTH CARE - DROPS*/
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS doctors;

/*CONSPIRATIONS - DROPS*/
DROP TABLE IF EXISTS users_conspirations;
DROP TABLE IF EXISTS iluminatis;
DROP TABLE IF EXISTS conspirations;

/*REAL STATE - DROPS*/
DROP TABLE IF EXISTS adresses;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS street_numbers;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zip_codes;
DROP TABLE IF EXISTS planets;

/*USERS - DROP*/
DROP TABLE IF EXISTS users;

/*USERS + HEALTH CARE - TABLE CREATION*/
CREATE TABLE users(
	id_user BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(64) NOT NULL,
	password VARCHAR(32) NOT NULL,
	email VARCHAR(64) NOT NULL,
	name VARCHAR(32) NOT NULL
);

CREATE TABLE diseases(
	id_disease INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	disease VARCHAR(64) NOT NULL,
	symptoms TEXT NOT NULL,
	description TEXT NOT NULL,
	deadly BOOLEAN NOT NULL
);

CREATE TABLE medicines(
	id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	medicine VARCHAR(192) NOT NULL,
	cost DECIMAL(9, 2) NOT NULL,
	price DECIMAL(9, 2) NOT NULL
);

CREATE TABLE doctors(
	id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	doctor VARCHAR(64)
);

CREATE TABLE diagnoses(
	id_diagnosis BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	diagnosis TEXT NOT NULL,
	id_user BIGINT UNSIGNED NOT NULL,
	id_disease INT UNSIGNED NOT NULL,
	id_doctor INT UNSIGNED NOT NULL,
	FOREIGN KEY(id_user) REFERENCES users(id_user),
	FOREIGN KEY(id_disease) REFERENCES diseases(id_disease),
	FOREIGN KEY(id_doctor) REFERENCES doctors(id_doctor)
);

CREATE TABLE treatments(
	id_treatment BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_diagnosis BIGINT UNSIGNED NOT NULL,
	id_medicine INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis),
	FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);

/*CONSPIRACIONES - CREATE TABLES*/

CREATE TABLE conspirations(
	id_conspiration INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	conspiration VARCHAR(32) NOT NULL, 
	description TEXT NOT NULL	
);

CREATE TABLE iluminatis(
	id_iluminati INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user)
);

CREATE TABLE users_conspirations(
	id_user_conspiration BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user BIGINT UNSIGNED NOT NULL,
	id_conspiration INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_conspiration) REFERENCES conspirations(id_conspiration)
);

/*REAL STATE - CREATE TABLES*/

CREATE TABLE planets(
	id_planet INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	planet VARCHAR(64)
);

CREATE TABLE countries(
	id_country INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	country VARCHAR(64),
	id_planet INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_planet) REFERENCES planets(id_planet)
);

CREATE TABLE cities(
	id_city INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(64),
	id_country INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_country) REFERENCES countries(id_country)
);

CREATE TABLE streets(
	id_street BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	street VARCHAR(128) NOT NULL,
	id_city INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_city) REFERENCES cities(id_city)
);

CREATE TABLE street_numbers(
	id_street_number INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	street_number VARCHAR(8)
);

CREATE TABLE staircases(
	id_staircase INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	staircase VARCHAR(8)
);

CREATE TABLE floors(
	id_floor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`floor` VARCHAR(8)
);

CREATE TABLE doors(
	id_door INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	door VARCHAR(8)
);

CREATE TABLE zip_codes(
	id_zip_code INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	zip_code VARCHAR(16)
);

CREATE TABLE adresses(
	id_adress BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_street BIGINT UNSIGNED NOT NULL,
	id_street_number INT UNSIGNED NOT NULL,
	id_staircase INT UNSIGNED NOT NULL,
	id_floor INT UNSIGNED NOT NULL,
	id_door INT UNSIGNED NOT NULL,
	id_zip_code INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_street) REFERENCES streets(id_street),
	FOREIGN KEY (id_street_number) REFERENCES street_numbers(id_street_number),
	FOREIGN KEY (id_staircase) REFERENCES staircases(id_staircase),
	FOREIGN KEY (id_floor) REFERENCES floors(id_floor),
	FOREIGN KEY (id_door) REFERENCES doors(id_door),
	FOREIGN KEY (id_zip_code) REFERENCES zip_codes(id_zip_code)
);