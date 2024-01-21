-- GROUP BY
SELECT department_id, SUM(salary) AS "total_salary"
FROM employees
GROUP BY department_id;

-- 1.Departments Info
SELECT department_id, COUNT(id) AS "Number of employees"
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, COUNT(id) AS "Number of employees", COUNT(salary) AS "SALARY COUNT"
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, MAX(salary) AS "MAX SALARY"
FROM employees
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2) AS "Average Salary"
FROM employees
GROUP BY department_id;

SELECT department_id, ROUND(MIN(salary), 2) AS "Min Salary"
FROM employees
WHERE salary > 800 -- will pick the salary per dep which is over 800, but there may be smaller value
GROUP BY department_id;

-- HAVING()
-- 3.Min Salary
SELECT department_id, ROUND(MIN(salary), 2) AS "Min Salary"
FROM employees
GROUP BY department_id
HAVING `Min Salary` > 800; -- will pick the min of the min as per the requirement

SELECT department_id, ROUND(MIN(salary), 2) AS "Min Salary"
FROM employees
WHERE first_name <> "Jack"
GROUP BY department_id
HAVING `Min Salary` > 800; -- will pick the min of the min as per the requirement

SELECT department_id, SUM(salary) AS "total_salary"
FROM employees
GROUP BY department_id
HAVING `total_salary` < 20000;

-- 4.Appetizers Count
SELECT COUNT(name) FROM products
WHERE category_id = 2 AND price > 8
GROUP BY category_id;

-- 5.Menu Prices
SELECT 
	category_id, 
    ROUND(AVG(price), 2) AS "Average Price", 
    ROUND(MIN(price), 2) AS "Cheapest Product",
    ROUND(MAX(price), 2) AS "Most Expensive Product"
FROM products
GROUP BY category_id;

SELECT COUNT(id), COUNT(category_id), COUNT(DISTINCT category_id)
FROM products; -- COUNT IGNORES NULLS, MEANING AT_ID MAY BE LESS DUE TO NULL VALUES

SELECT department_id, salary, COUNT(DISTINCT first_name)
FROM employees
GROUP BY department_id, salary;
