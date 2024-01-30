-- SELECTS ALL from t1 and t2, where there is a match
SELECT *
FROM employees
INNER JOIN departments 
ON employees.department_id = departments.department_id;

-- SELECTS ALL from t1 even if there is no match in t2
SELECT *
FROM employees
LEFT JOIN departments 
ON employees.department_id = departments.department_id;

-- SELECTS ALL from t2 even if there is no match in t1
-- if the tables are swapped is a LEFT JOIN
SELECT *
FROM employees
RIGHT JOIN departments 
ON employees.department_id = departments.department_id;

-- SELECT OUTER JOIN not used in Mysql, however UNION or Left and RIght Join is used
SELECT *
FROM employees
INNER JOIN departments 
ON employees.department_id = departments.department_id
UNION
SELECT *
FROM employees
RIGHT JOIN departments 
ON employees.department_id = departments.department_id;

-- CROSS JOIN results in a Cartesian product
SELECT *
FROM employees
CROSS JOIN departments;

SELECT * FROM employees, departments;

SELECT *
FROM employees
CROSS JOIN departments
WHERE employees.department_id = 3;

-- 1.Managers
SELECT e.employee_id, 
	CONCAT_WS(" ", e.first_name, e.last_name) AS full_name, 
	d.department_id AS department_name, 
	d.name
FROM departments d 
INNER JOIN employees e
ON e.employee_id = d.manager_id
ORDER BY e.employee_id
LIMIT 5;

SELECT e.employee_id, 
	CONCAT_WS(" ", e.first_name, e.last_name) AS full_name, 
	d.department_id AS department_name, 
	d.name
FROM employees e 
RIGHT JOIN departments d 
ON e.employee_id = d.manager_id
ORDER BY e.employee_id
LIMIT 5;

-- 4.Higher Salary
SELECT COUNT(employees.employee_id) AS count
FROM employees
WHERE employees.salary > (SELECT AVG(salary) FROM employees);

-- 2.Towns Addresses
SELECT t.town_id, t.name AS town_name, a.address_text
FROM towns t
JOIN addresses a
ON a.town_id = t.town_id
WHERE t.name IN ("San Francisco", "Sofia", "Carnation")
ORDER BY t.town_id, a.address_id;

SELECT t.town_id, t.name AS town_name, a.address_text
FROM towns t
JOIN addresses a
ON a.town_id = t.town_id AND t.name IN ("San Francisco", "Sofia", "Carnation")
ORDER BY t.town_id, a.address_id;

-- 3.Employees Without Managers
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE manager_id IS NULL;

-- self join
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    m.employee_id AS manager_id,
    m.first_name,
    m.last_name
FROM
    employees e
        JOIN
    employees m ON e.manager_id = m.employee_id;
