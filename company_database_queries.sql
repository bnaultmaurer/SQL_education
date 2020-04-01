-- find all employees
SELECT *
FROM employee;

-- find all clients
SELECT *
FROM client;

-- fine all employees ordered by salary
SELECT *
FROM employee
ORDER BY salary DESC;

-- find all employees ordered by sex then name
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

-- find the first 5 employees in the table
SELECT *
FROM employee
LIMIT 5;

-- find the first and last names of all employees
SELECT employee.first_name, employee.last_name
FROM employee;

-- find the forename and surname names of all employees
SELECT employee.first_name AS forename, employee.last_name AS surname
FROM employee;

-- find out all the different genders
SELECT DISTINCT employee.sex
FROM employee;

-- find the number of employees
SELECT COUNT(employee.emp_id) AS num_employees
FROM employee;

-- find the number of female employees born after 1970
SELECT COUNT(employee.emp_id)
FROM employee
WHERE employee.sex = 'F' AND employee.birth_day > '1971-01-01';

-- find the average of all employee's salaries
SELECT AVG(employee.salary)
FROM employee;

-- find the average of all employee's salaries who are male
SELECT AVG(employee.salary)
FROM employee
WHERE employee.sex = 'M';

-- find the sum of all employee's salaries
SELECT SUM(employee.salary)
FROM employee
WHERE employee.sex = 'M';

-- find out how many males and females there are
SELECT COUNT(employee.sex), employee.sex
FROM employee
GROUP BY employee.sex;

-- find the total sales of each salesman
SELECT SUM(works_with.total_sales)
FROM works_with
GROUP BY works_with.emp_id;

-- wildcards
-- % = any number of characters, _ = one character

-- find any clients who are an LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC';

-- find any branch suppliers who are in the label business
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%label%';

-- find any employee born in October
SELECT employee.first_name, employee.last_name, employee.birth_day
FROM employee
WHERE employee.birth_day LIKE '____-10%';

-- find any clients who are schools
SELECT *
FROM client
WHERE client.client_name LIKE '%school%';


-- Union --
-- have to have select the same number of columns
-- also need to have same data types (i.e. string)


-- find a list of employee and branch names
SELECT employee.first_name AS Company_names
FROM employee
UNION
SELECT branch.branch_name
FROM branch
UNION
SELECT client.client_name
FROM client;

-- find a list of all clients and branch supplier's names
SELECT client_name AS Clients_and_Suppliers, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- find a list of all money spent or earned by the company
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

-- Joins --
-- four types
-- 1) JOIN = join all that match both tables (inner join)
-- 2) LEFT JOIN = include all rows in the left table
-- 3) RIGHT JOIN = include all rows in the right table
-- 4) FULL OUTER JOIN = LEFT JOIN and RIGHT JOIN combined

-- find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Nested Queries




























asdfasdf
