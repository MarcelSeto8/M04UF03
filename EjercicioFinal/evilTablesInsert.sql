INSERT INTO users(username, password, email, name)
VALUES
	('root', 'admin123', 'root@enti.cat', 'Admin'),
	('marcel8', 'marcelito123', 'marcel.seto@enti.cat', 'Marcel'),
	('pablo21', 'pablitosocias', 'pablo.lopez@enti.cat', 'Pablo'),
	('johnK', 'johnasa12', 'john.largao@enti.cat', 'John'),
	('guillermojazz', 'saxofon21', 'guillem.agutllo@enti.cat', 'Guillem');

INSERT INTO diseases(disease, symptoms, description, deadly)
VALUES 
	('Dolor de cabeza', 'Fuerte dolor de cabeza acompañado de secrecion nasal', 'Mucho dolor de cabeza en todos lados', false),
	('Ebola', 'Transformación en mono', 'Sale mucha sangre de todos lados', true),
	('Covid-19', 'Mocos y tos seca', 'Tienes que estarte sonando constantemente y aislado', true),
	('Cancer', 'Perdida de peso y malestar', 'Crecimiento de celulas muertas', true),
	('Diabetes', 'Perdida de apetito, cansancio constante...', 'Falta de azucar en la sangre', false);

INSERT INTO medicines(medicine, cost, price)
VALUES
	('Ibuprofeno', 4.50, 9.05),
	('Gamfos', 20.20, 38.99),
	('Sangtness', 12.43, 37.55),
	('Rinomer', 2.12, 5.50),
	('Glucosan', 6.37, 15.98);

INSERT INTO doctors(doctor)
VALUES
	('Juan Ramón Salado'),
	('Pablo Lopez Socias'),
	('Sofia Viralta Lambón'),
	('Juana Chacón Lopez'),
	('Roberta Miguelez Beltrán');

INSERT INTO diagnoses(diagnosis, id_user, id_disease, id_doctor)
VALUES
	('El paciente padece de Covid-19 sebero', 2, 3, 1),
	('El paciente tiene Ebola de grado 1', 1, 2, 2),
	('El paciente tiene Cancer de Colon en fase no avanzada', 4, 4, 3),
	('El paciente tiene una cefalea que le impide trabajar', 5, 1, 4),
	('El paciente presenta una diabetes de tipo 1 en nivel avanzado', 3, 5, 5);

INSERT INTO treatments(id_diagnosis, id_medicine)
VALUES
	(1, 4), (2, 3), (3, 2), (4, 1), (4, 4), (5, 5);

INSERT INTO conspirations(conspiration, description)
VALUES
	('Tierraplanista', 'Consiste en creer que la tierra no es redonda, sino que es plana'),
	('Hitler vivo y coleando', 'Consiste en creer que Hitler no murió en el final de la segunda guerra mundial'),
	('Efecto Mandela', 'Consiste en creer que pikachu tiene la cola negra'),
	('Iluminismo', 'Consiste en creer que los iluminatis existen'),
	('Beticismo', 'Consiste en creer que el betis puede ganar algo');

INSERT INTO iluminatis(id_user)
VALUES
	(1), (4);

INSERT INTO users_conspirations(id_user, id_conspiration)
VALUES
	(1, 5), (1, 2), (3, 5), (4, 3), (4, 1);

INSERT INTO planets(planet)
VALUES 
	('Tierra'), ('Venus'), ('Jupiter'), ('Marte'), ('Pluton');

INSERT INTO countries(country, id_planet)
VALUES
	('España', 1), 
	('Colombia', 1),
	('EEUU', 1),
	('Wafe', 2),
	('Venasaur', 2),
	('Cangis', 2),
	('Rar', 3),
	('Osiris', 3),
	('Redstone', 3),
	('Canto', 4),
	('Ristalk', 4),
	('Mintol', 4),
	('Kikiw', 5),
	('Loic', 5),
	('Promte', 5);

INSERT INTO cities(city, id_country)
VALUES
	('Barcelona', 1),
	('Waldrof', 4),
	('Candor', 9),
	('Elibol', 12),
	('Bade', 14);

INSERT INTO streets(street, id_city)
VALUES
	('Calle A', 1),
	('Calle B', 2),
	('Calle C', 3),
	('Calle D', 4), 
	('Calle E', 5);

INSERT INTO street_numbers(street_number)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO staircases(staircase)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO floors(`floor`)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO doors(door)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
	
INSERT INTO zip_codes(zip_code)
VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO adresses(id_street, id_street_number, id_staircase, id_floor, id_door, id_zip_code)
VALUES
	(1, 1, 1, 1, 1, 1),
	(2, 2, 2, 2, 2, 2),
	(3, 3, 3, 3, 3, 3),
	(4, 4, 4, 4, 4, 4),
	(5, 5, 5, 5, 5, 5);

INSERT INTO users_adresses(id_user, id_adress)
VALUES
	(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

INSERT INTO users_planets (id_user, id_planet)
VALUES
	(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);


