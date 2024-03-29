-- 1.Find Names of All Employees by First Name
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE "sa%"
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE UPPER(SUBSTR(first_name, 1, 2)) = "Sa" -- UPPER not needed as SUBSTR ci
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE LOWER(LEFT(first_name, 2)) = "Sa" -- LOWER not needed as LEFT ci
ORDER BY employee_id;

-- 2.Find Names of All Employees by Last Name
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE "%EI%"
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE last_name REGEXP "ei|EI|Ei|eI"
ORDER BY employee_id;

-- 3.Find First Names of All Employees
SELECT first_name 
FROM employees
WHERE department_id IN(3, 10) AND 
	  YEAR(hire_date) >= "1995" AND YEAR(hire_date) <= "2005"
ORDER BY employee_id;

SELECT first_name 
FROM employees
WHERE department_id IN(3, 10) AND 
	  YEAR(hire_date) BETWEEN "1995" AND "2005"
ORDER BY employee_id;

SELECT first_name 
FROM employees
WHERE department_id IN(3, 10) AND 
	  EXTRACT(YEAR FROM hire_date) BETWEEN "1995" AND "2005"
ORDER BY employee_id;

-- 4.Find All Employees Except Engineers
SELECT first_name, last_name
FROM employees
WHERE job_title REGEXP '^((?!.*engineer*).)*$'
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

SELECT first_name, last_name
FROM employees
WHERE LOCATE("engineer", job_title) = 0
ORDER BY employee_id;

-- 5.Find Towns with Name Length
SELECT name
FROM towns
WHERE CHAR_LENGTH(name) IN (5, 6)
ORDER BY name;

-- 6.Find Towns Starting With
SELECT town_id, name
FROM towns
WHERE LEFT(name, 1) IN("M", "K", "B", "E")
ORDER BY name;

SELECT town_id, name
FROM towns
WHERE SUBSTRING(name, 1, 1) IN("M", "K", "B", "E")
ORDER BY name;

SELECT town_id, name
FROM towns
WHERE name REGEXP "^[MKBE]"
ORDER BY name;

-- 7.Find Towns Not Starting With
SELECT town_id, name
FROM towns
WHERE LEFT(name, 1) NOT IN("R", "B", "D")
ORDER BY name;

SELECT town_id, name
FROM towns
WHERE SUBSTR(name, 1, 1) NOT IN("R", "B", "D")
ORDER BY name;

SELECT town_id, name
FROM towns
WHERE name NOT REGEXP "^[RBD]"
ORDER BY name;

-- 8.Create View Employees Hired After 2000 Year
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name FROM employees
WHERE EXTRACT(YEAR FROM hire_date) > 2000;

SELECT * FROM v_employees_hired_after_2000;

-- 9.Length of Last Name
SELECT first_name, last_name
FROM employees
WHERE CHAR_LENGTH(last_name) = 5;

-- 10.Countries Holding 'A' 3 or More Times
SELECT country_name, iso_code
FROM countries
WHERE country_name LIKE '%a%a%a%'
ORDER BY iso_code;

-- 11.Mix of Peak and River Names
SELECT peak_name, river_name, 
CONCAT(LOWER(peak_name), SUBSTR(LOWER(river_name), 2)) AS "mix"
FROM rivers, peaks
WHERE RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY CONCAT(LOWER(peak_name), SUBSTR(river_name, 2));

-- 12.Games from 2011 and 2012 Year
SELECT name, DATE_FORMAT(start, "%Y-%m-%d") AS "start"
FROM games
WHERE EXTRACT(YEAR FROM start) IN (2011, 2012)
ORDER BY start, name
LIMIT 50;

-- 13. User Email Providers
SELECT user_name, SUBSTR(email, LOCATE("@", email) + 1) AS "email provider"
FROM users
ORDER BY SUBSTR(email, LOCATE("@", email) + 1), user_name;

SELECT user_name, RIGHT(email, LOCATE("@", email)) AS "email provider"
FROM users
ORDER BY SUBSTR(email, LOCATE("@", email) + 1), user_name;

-- 14.Get Users with IP Address Like Pattern
SELECT user_name, ip_address
FROM users
WHERE ip_address LIKE "___.1%.%.___"
ORDER BY user_name;

-- 15.Show All Games with Duration and Part of the Day
SELECT name as "game", 
CASE
    WHEN HOUR(start) >= 0 and HOUR(start) < 12 THEN "Morning"
    WHEN HOUR(start) >= 12 and HOUR(start) < 18 THEN "Afternoon"
    ELSE "Evening"
END AS "Part of the Day",
CASE
    WHEN duration <= 3 THEN "Extra Short"
    WHEN duration BETWEEN 4 AND 6 THEN "Short"
    WHEN duration BETWEEN 7 AND 10 THEN "Long"
    ELSE "Extra Long"
END AS "Duration"
FROM games;

-- 16.Orders Table

SELECT product_name, order_date, 
	DATE_ADD(order_date, INTERVAL 3 DAY) AS "pay_due", 
	DATE_ADD(order_date, INTERVAL 1 MONTH) AS "deliver_due"
FROM orders;
