-- 1.Employee Address
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees e
JOIN addresses a ON e.address_id = a.address_id
ORDER BY e.address_id
LIMIT 5;

-- 2.Addresses with Towns
SELECT e.first_name, e.last_name, t.name, a.address_text
FROM employees e
JOIN addresses a ON e.address_id = a.address_id
JOIN towns t ON t.town_id = a.town_id
ORDER BY e.first_name, e.last_name
LIMIT 5;

-- 3.Sales Employee
SELECT e.employee_id, e.first_name, e.last_name, d.name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.name = "Sales"
ORDER BY e.employee_id DESC;

-- 4.Employee Departments
SELECT e.employee_id, e.first_name, e.salary, d.name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

-- 5.Employees Without Project
SELECT e.employee_id, e.first_name
FROM employees e
WHERE e.employee_id NOT IN (SELECT employee_id from employees_projects)
ORDER BY e.employee_id DESC
LIMIT 3;

-- 6.Employees Hired After
SELECT e.first_name, e.last_name, e.hire_date, d.name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.hire_date > "1999-01-01" AND d.name IN("Sales", "Finance")
ORDER BY e.hire_date;

-- 7.Employees with Project
SELECT e.employee_id, e.first_name, p.name AS project_name
FROM employees e
JOIN employees_projects ON e.employee_id = employees_projects.employee_id
JOIN projects p ON p.project_id = employees_projects.project_id
WHERE DATE(p.start_date) > "2002-08-13" AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5;

-- 8.Employee 24
SELECT e.employee_id, e.first_name,
IF (YEAR(p.start_date) >= 2005, NULL, p.name) AS project_name
FROM employees e
JOIN employees_projects ON e.employee_id = employees_projects.employee_id
JOIN projects p ON p.project_id = employees_projects.project_id
WHERE e.employee_id = 24
ORDER BY p.name;

-- 9.Employee Manager
SELECT e.employee_id, e.first_name, m.employee_id, m.first_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id AND e.manager_id IN(3, 7)
ORDER BY e.first_name;

-- 10.Employee Summary
SELECT e.employee_id, 
CONCAT_WS(" ", e.first_name, e.last_name) AS employee_name, 
CONCAT_WS(" ", m.first_name, m.last_name) AS manager_name,
d.name AS department_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d
ON d.department_id = e.department_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.employee_id
LIMIT 5;

-- 11.Min Average Salary
SELECT AVG(salary) AS min_average_salary FROM employees
GROUP BY department_id
ORDER BY `min_average_salary`
LIMIT 1;

-- 12.Highest Peaks in Bulgaria
SELECT mc.country_code, m.mountain_range, p.peak_name, p.elevation
FROM mountains_countries mc
JOIN mountains m ON mc.mountain_id = m.id
JOIN peaks p ON p.mountain_id = m.id
WHERE p.elevation > 2835 AND mc.country_code = "BG"
ORDER BY p.elevation DESC;

-- 13.Count Mountain Ranges
SELECT mc.country_code, COUNT(m.mountain_range) AS mountain_range
FROM mountains_countries mc
JOIN mountains m ON mc.mountain_id = m.id
WHERE mc.country_code IN(
	SELECT country_code 
    FROM countries 
    WHERE country_name IN("United States", "Russia", "Bulgaria"))
GROUP BY mc.country_code
ORDER BY mountain_range DESC;

-- 14.Countries with Rivers
SELECT c.country_name, r.river_name
FROM countries c
LEFT JOIN countries_rivers cr ON cr.country_code = c.country_code
LEFT JOIN rivers r ON cr.river_id = r.id
WHERE c.continent_code = "AF"
ORDER BY c.country_name
LIMIT 5;

-- 15.Continents and Currencies
SELECT c.continent_code, c.currency_code, COUNT(*) AS currency_usage
FROM countries c
GROUP BY c.continent_code, c.currency_code
HAVING `currency_usage` > 1
    AND `currency_usage` = (SELECT COUNT(*) AS cn
    FROM countries AS c2
    WHERE
        c2.continent_code = c.continent_code
    GROUP BY c2.currency_code
    ORDER BY cn DESC
    LIMIT 1)
ORDER BY c.continent_code , c.continent_code;

-- 16.Countries Without Any Mountains
SELECT COUNT(c.country_code) AS country_count
FROM countries c
WHERE c.country_code NOT IN (SELECT country_code FROM mountains_countries);

-- 17.Highest Peak and Longest River by Country
SELECT 
    c.country_name,
    MAX(p.elevation) AS 'highest_peak_elevation',
    MAX(r.length) AS 'longest_river_length'
FROM
    countries AS c
        LEFT JOIN
    mountains_countries AS mc ON c.country_code = mc.country_code
        LEFT JOIN
    peaks AS p ON mc.mountain_id = p.mountain_id
        LEFT JOIN
    countries_rivers AS cr ON c.country_code = cr.country_code
        LEFT JOIN
    rivers AS r ON cr.river_id = r.id
GROUP BY c.country_name
ORDER BY `highest_peak_elevation` DESC , `longest_river_length` DESC , c.country_name
LIMIT 5;
