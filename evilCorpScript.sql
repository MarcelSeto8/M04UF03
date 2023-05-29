DROP DATABASE IF EXISTS evilCorp;
CREATE DATABASE evilCorp;

USE evilCorp;

DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id_user BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(32) NOT NULL,
	password VARCHAR(32) NOT NULL,
	name VARCHAR(16) NOT NULL,
	surname VARCHAR(32) NOT NULL,
	email VARCHAR(64) NOT NULL,
	contact_number VARCHAR(13) NOT NULL,
	register DATETIME NOT NULL,
	country VARCHAR(32) NOT NULL,
	gender CHAR(1) NOT NULL,
	birthdate DATE NOT NULL
);

CREATE TABLE medicines(
	id_medicine INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	medicine VARCHAR(192) NOT NULL,
	cost DECIMAL(9,2) NOT NULL,
	price DECIMAL(9,2) NOT NULL,
	secondary_effects TEXT NOT NULL,
	description TEXT NOT NULL
);

CREATE TABLE diseases (
	id_disease INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	disease VARCHAR(64) NOT NULL,
	medical_area VARCHAR(64) NOT NULL,
	risk_of_the_disease INT NOT NULL,
	common_sympthoms TEXT NOT NULL,
	description TEXT NOT NULL
);

CREATE TABLE doctors (
	id_doctor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	doctor VARCHAR(32)
);

CREATE TABLE diagnoses (
	id_diagnosis BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	diagnose TEXT NOT NULL,
	datetime DATETIME NOT NULL,
	id_doctor INT UNSIGNED NOT NULL,
	id_user BIGINT UNSIGNED NOT NULL,
	id_disease INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor),
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_disease) REFERENCES diseases(id_disease)
);

CREATE TABLE treatments (
	id_treatment BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_diagnosis BIGINT UNSIGNED NOT NULL,
	id_medicine INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis),
	FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);

INSERT INTO users (username, password, name, surname, email, contact_number, register, country, gender, birthdate) VALUES ('juanjito77', 'edb63ec8a3c3bd9361c0f9cf9b334030', 'Juanjo', 'Ramon', 'juanjo789@gmail.com','615453186',now(), 'Spain', 'M', '1965-05-11'), ('doñaconchita', 'b3d17085d299b37af7a2ba47f1d0573d', 'Conchi', 'Lambon', 'laconchita12@gmail.com','738105915', now(), 'Spain', 'F', '1972-08-31'), ('pacadelucia', '54e55216ecbdbc9eccdbd63ae40d5c48', 'Francisca', 'Franca', 'soyfrancisca@gmail.com','639539164', now(), 'Spain', 'F', '1962-01-25');

INSERT INTO medicines(medicine, cost, price, secondary_effects, description) VALUES ('Ibuprofeno', 10.24, 20.00, 'Diarrea, nauseas, sangrado interno, dolor de cabeza y estornudos', 'Medicamento en forma de pastilla, hay diferentes cantidades, sirbe de antitermico y antinflamatorio'), ('Rinomer', 5.00, 12.74, 'Mareo y obstrucción respiratoria', 'Medicamento en esprai para destaponar la nariz'), ('Penicilina', 40.64, 64.22, 'Desmayos, aritmeas y vomitos', 'Se usa para calmar el dolor de ciertas enfermedades'), ('Piruleta para llaga', 2.45, 4.99, 'Irritación vucal', 'Medicamento oral que sirve para el alivio inmediato del dolor de llagas');

INSERT INTO diseases (disease, medical_area, risk_of_the_disease, common_sympthoms, description) VALUES (

INSERT INTO doctors (doctor) VALUES ('Juan Ramon el Cano'), ('German Las Heras');



