DROP USER IF EXISTS 'parca'@'localhost';

CREATE USER 'parca'@'localhost' IDENTIFIED BY 'parca123';
GRANT SELECT, UPDATE ON evilCorp.users TO 'parca'@'localhost';

FLUSH PRIVILEGES;
