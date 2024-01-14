-- Create Database
CREATE DATABASE IF NOT EXISTS minions;

USE minions;

-- 1.Create Tables
CREATE TABLE IF NOT EXISTS minions (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS towns (
    town_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50)
);

-- 2.Alter Minions Table
ALTER TABLE towns
RENAME column town_id to id;

ALTER TABLE minions
ADD COLUMN town_id INT,
ADD FOREIGN KEY (town_id) REFERENCES towns(id);

-- ALTER TABLE minions
-- ADD FOREIGN KEY (town_id) REFERENCES towns(id);

-- 3.Insert Records in Both Tables
INSERT INTO towns(name)
VALUES
	("Sofia"),
	("Plovdiv"),
	("Varna");
    
INSERT INTO minions(name, age, town_id)
VALUES
	("Kevin", 22, 1),
    ("Bob", 15, 3),
    ("Steward", NULL, 2);
    
-- 4.Truncate Table Minions
TRUNCATE minions;

-- 5.Drop All Tables
DROP TABLES minions, towns;

CREATE DATABASE people;

USE people;

-- 6.Create Table People
CREATE TABLE IF NOT EXISTS people (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height DOUBLE(3, 2),
    weight DOUBLE(4, 2),
    gender CHAR(1) NOT NULL,
    CONSTRAINT chk_gender CHECK (gender IN ('m' , 'f')),
    birthdate TEXT NOT NULL,
    biography LONGBLOB
);


INSERT INTO people(name, gender, birthdate)
VALUES
	( "TEST1","m", "2002/04/01"),
    ( "TEST2","m", "2002/04/01"),
    ( "TEST3","m", "2002/04/01"),
    ( "TEST4","m", "2002/04/01"),
    ( "TEST5","m", "2002/04/01");

    
-- 7.Create Table Users
CREATE TABLE IF NOT EXISTS users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  password VARCHAR(26) NOT NULL,
  profile_picture TINYBLOB,
  last_login_time TIMESTAMP,
  is_deleted BOOL);

INSERT INTO users(username, password)
VALUE
	("TEST1", "mr"),
	("test2", "mf"),
	("TEST3", "fsss"),
	("test4", "dm"),
	("TEST5", "mff");

-- 8.Change Primary Key
ALTER TABLE users
MODIFY COLUMN id INT,
DROP PRIMARY KEY,
ADD PRIMARY KEY(id, username);

-- 9.Set Default Value of a Field
ALTER TABLE users
CHANGE last_login_time last_login_time TIMESTAMP DEFAULT NOW();

-- 10.Set Unique Field
ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY (id);

ALTER TABLE users
ADD UNIQUE (username);

-- 11.Movies Database
CREATE DATABASE db_movies;

USE db_movies;

CREATE TABLE IF NOT EXISTS directors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    director_name VARCHAR(255) NOT NULL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director_id INT NOT NULL,
    copyright_year TEXT,
    length TEXT,
    genre_id INT,
    category_id INT NOT NULL,
    rating DOUBLE,
    notes TEXT
);

INSERT INTO directors(director_name)
VALUES
    ("Kubrik"),
    ("Beson"),
    ("Ivanov"),
    ("Petrov"),
    ("Goshev");

INSERT INTO genres(genre_name)
VALUES
    ("sci-fi"),
    ("comedy"),
    ("thriller"),
    ("horror"),
    ("mystery");
    
INSERT INTO categories(category_name)
VALUES
    ("PG"),
    ("PG12"),
    ("18+"),
    ("PG15"),
    ("PG3");
    
INSERT INTO movies (title, director_id, genre_id, category_id)
VALUES
    ("sci-fi", 1, 1, 2),
    ("comedy", 2, 2, 1),
    ("thriller", 3, 3, 4),
    ("horror", 4, 4, 3),
    ("mystery", 5, 5, 5);

-- 13.Basic Insert
CREATE DATABASE `soft_uni`;
USE `soft_uni`;

CREATE TABLE `towns` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);

CREATE TABLE `addresses` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `address_text` VARCHAR(45),
    `town_id` INT,
    CONSTRAINT fk_addresses_towns
    FOREIGN KEY (`town_id`)
    REFERENCES `towns`(`id`)
);

CREATE TABLE `departments` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);

CREATE TABLE `employees` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `middle_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `job_title` VARCHAR(20) NOT NULL,
    `department_id` INT NOT NULL,
    `hire_date` DATE,
    `salary` DECIMAL(19, 2),
    `address_id` INT,
    CONSTRAINT fk_employees_departments
    FOREIGN KEY (`department_id`)
    REFERENCES `departments`(`id`),
    CONSTRAINT fk_employees_addresses
    FOREIGN KEY (`address_id`)
    REFERENCES `addresses`(`id`)
);

INSERT INTO `towns`
VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna'),
(4, 'Burgas');

INSERT INTO `departments`
VALUES
(1, 'Engineering'), 
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Software Development'),
(5, 'Quality Assurance');

INSERT INTO `employees` (`id`, `first_name`, `middle_name`, 
`last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES
(1, 'Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
(2, 'Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
(3, 'Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
(4, 'Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
(5, 'Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM towns
ORDER BY name asc;

SELECT * FROM departments
ORDER BY name asc;

SELECT * FROM employees
ORDER BY salary desc;

SELECT name FROM towns
ORDER BY name asc;
SELECT name FROM departments
ORDER BY name asc;
SELECT first_name, last_name, job_title, salary FROM employees
ORDER BY salary desc;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees SET salary = salary + salary * 0.10;
SELECT salary FROM employees;
    
   
