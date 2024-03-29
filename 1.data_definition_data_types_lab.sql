USE gamebar;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    category_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS `employees` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL
);

INSERT INTO employees(first_name, last_name)
VALUES
	("value", "one"),
	("value2", "two"),
	("value3", "three");

ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(50) NOT NULL AFTER first_name;

ALTER TABLE products
ADD FOREIGN KEY (category_id) REFERENCES categories(id);

ALTER TABLE employees
MODIFY COLUMN middle_name VARCHAR(100);
