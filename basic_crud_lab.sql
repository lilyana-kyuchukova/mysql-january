CREATE DATABASE IF NOT EXISTS `hotel`; 
USE `hotel`;

CREATE TABLE departments (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50)
);

INSERT INTO departments(name) 
VALUES('Front Office'), ('Support'), ('Kitchen'), ('Other');

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	department_id INT NOT NULL,
	salary DOUBLE NOT NULL,
	CONSTRAINT `fk_department_id` 
    FOREIGN KEY (`department_id`) 
    REFERENCES `departments` (`id`)
);

INSERT INTO `employees` (`first_name`,`last_name`, `job_title`,`department_id`,`salary`) 
VALUES
	('John', 'Smith', 'Manager',1, 900.00),
	('John', 'Johnson', 'Customer Service',2, 880.00),
	('Smith', 'Johnson', 'Porter', 4, 1100.00),
	('Peter', 'Petrov', 'Front Desk Clerk', 1, 1100.00),
	('Peter', 'Ivanov', 'Sales', 2, 1500.23),
	('Ivan' ,'Petrov', 'Waiter', 3, 990.00),
	('Jack', 'Jackson', 'Executive Chef', 3, 1800.00),
	('Pedro', 'Petrov', 'Front Desk Supervisor', 1, 2100.00),
	('Nikolay', 'Ivanov', 'Housekeeping', 4, 1600.00);
	

	
CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
	`type` VARCHAR(30)
);

INSERT INTO rooms(`type`) 
VALUES('apartment'), ('single room');

CREATE TABLE clients (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	room_id INT NOT NULL,
    CONSTRAINT fk_clients_rooms
    FOREIGN KEY (room_id)
    REFERENCES rooms(id)
);

INSERT INTO clients(`first_name`,`last_name`,`room_id`) 
VALUES('Pesho','Petrov', 1),('Gosho','Georgiev', 2),
('Mariya','Marieva', 2), ('Katya','Katerinova', 1), ('Nikolay','Nikolaev', 2);

-- 1.Select Employee Information
SELECT id, first_name, last_name, job_title 
FROM employees
ORDER BY first_name, last_name;

-- Aliases
SELECT 
    e.id AS 'Employee No:',
    e.first_name AS 'First Name',
    e.last_name AS 'Surname'
FROM
    employees AS e
ORDER BY e.id;

-- Concatenation of columns, skips NULL values and does not return anything
SELECT 
    id AS 'Employee No:',
    CONCAT(first_name, ' ', last_name) AS 'Full Name'
FROM
    employees
ORDER BY id;

-- Concatenation of columns with separator
SELECT 
    id AS 'Employee No:',
    CONCAT_WS(' ', first_name, last_name, job_title) AS 'Details'
FROM
    employees
ORDER BY id;

-- 2.Select Employees with Filter
SELECT 
    id,
    CONCAT_WS(' ', first_name, last_name) AS 'full_name',
    job_title,
    salary
FROM
    employees
WHERE
    salary > 1000
ORDER BY id ASC;

-- filtering with Distinct
SELECT DISTINCT
    department_id
FROM
    employees;

-- equal not equal
SELECT * FROM employees
WHERE department_id != 1;

SELECT * FROM employees
WHERE department_id <> 1;
    
-- comparison conditions
SELECT * FROM employees
WHERE department_id <> 1 AND salary > 1000;
    
SELECT * FROM employees
WHERE department_id = 1 OR salary > 1000;

SELECT * FROM employees
WHERE department_id = 1 AND first_name IS NOT NULL;

SELECT * FROM employees
WHERE department_id IN (1, 2) AND first_name IS NULL;

-- BETWEEN <= and =>
SELECT * FROM employees
WHERE department_id = 1 AND (salary BETWEEN 1000 AND 1100);

-- 5.Select Employees by Multiple Filters
SELECT * FROM employees
WHERE department_id = 4 AND salary >= 1000
ORDER BY id;

-- Views
CREATE OR REPLACE VIEW my_view AS
    SELECT 
        id,
        CONCAT_WS(' ', first_name, last_name) AS 'full_name',
        job_title,
        salary
    FROM
        employees
    WHERE
        salary > 1000
    ORDER BY first_name , last_name DESC;

SELECT * FROM my_view;

SELECT `full_name` FROM my_view;

-- 4.Top Paid Employee
CREATE VIEW v_top_paid_employee AS
    SELECT * FROM employees
    ORDER BY salary desc
    LIMIT 1;
    
SELECT * FROM v_top_paid_employee;
SET SQL_SAFE_UPDATES = 0;

-- 3.Update Employees Salary
UPDATE employees
SET salary = salary + 100
WHERE job_title = "Manager";

UPDATE employees
SET salary = salary * 1.10,
	job_title = CONCAT("Senior", " ", job_title)
WHERE department_id = 2;

SELECT salary FROM employees;

-- Inserting data
CREATE TABLE employees_start_date
AS SELECT concat_ws(" ", first_name, last_name) AS "full_name"
FROM employees;

ALTER TABLE employees_start_date
ADD COLUMN start_date TIMESTAMP;

INSERT INTO employees_start_date
VALUE ("lILLY VANILY", NOW());

CREATE TABLE employee_names(
	id INT PRIMARY KEY AUTO_INCREMENT,
	names VARCHAR(255));
    
INSERT INTO employee_names(names)
SELECT full_name FROM employees_start_date;

-- 6.Delete from Table
DELETE FROM employees
WHERE department_id IN (1, 2);

DELETE FROM employees
WHERE department_id BETWEEN 1 AND 2;

DELETE FROM employees
WHERE department_id = 1 OR department_id = 2;

SELECT * FROM employees
ORDER BY id;
