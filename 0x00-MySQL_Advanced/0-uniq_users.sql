-- Create database and table
DROP  TABLE IF EXISTS users;
CREATE TABLE users (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email varchar(255) NOT NULL UNIQUE,
	name varchar(255)
);
