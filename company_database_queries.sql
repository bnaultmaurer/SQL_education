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

-- Nested Queries (3:12:05)

-- find names of all employees who have
-- sold over $30,000 to a single client
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

-- find all cients who are handled by the branch
-- that Michael Scott manages
SELECT client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1
);

-- On Delete (3:21:54)

-- ON DELETE SET NULL = if deleted,
-- ON DELETE CASCADE = delete all rows associated with other delete

DELETE FROM employee
WHERE emp_id = 102;

-- use ON DELETE SET NULL with foreign keys
-- better to use ON DELETE CASCADE with primary keys

-- Triggers (3:30:06)

-- a trigger is a block of code that defines a certain action
-- when another sction is taken
-- add trigger table to database
CREATE TABLE trigger_test(
    message VARCHAR(100)
);

-- trigger example
DELIMITER $$ -- need to change delimiter as ; used below
CREATE
    TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);
    END $$
DELIMITER ;

-- insert new employee to test
INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);
INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

-- IF, ELSE IF conditions example
DELIMITER $$ -- need to change delimiter as ; used below
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES('added male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES('added female employee');
        ELSE
            INSERT INTO trigger_test VALUES('added other employee');
        END IF;
    END $$
DELIMITER ;

-- insert new employee
INSERT INTO employee
VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

-- can also make triggers for INSERT, UPDATE, DELETE
-- can also make triggers AFTER and INSERT, UPDATE, DELETE

-- drop triggers
DROP TRIGGER my_trigger;


-- ER Diagrams Intro
-- ER - Entity Relationship

-- Entity - an object we want to model and store information about (i.e. student)
-- Attributes - specific pieces of information about an entity (name, GPA, grade #)
-- Primary Key - Attribute that uniquiley identifies an entry in the database table
--      primary keys typically underlined
-- composite attributes - attributes that can be broken up into sub-attributes
--      name to first and last name
-- multi-values attribute -- attribute that can have more than one value
--      clubs - 
-- derived attribute - attribute that can be derived from the other attributes
--      honors is GPA > 3.5
-- Multiple entities - you can define more than one entity
--      classes
-- relationships - defines a relationship between two entities
-- student takes class, class is taken by student
-- total participation - all members must participate in the relationship
--      single line indicates partial participation
--      double line indicates total participation
-- Relationship Attribute - an attribute about the relationship
--      class grades
-- Relationship Cardinality - the number of instances of an entity from a relation
-- that can be associated with the relation
--      1:1 a studnet can take 1 class
--      1:N a student can take any number N classes
--      N:M  a class can have M students
-- Weak Entity - An entity that cannot be uniquely identified by its attributes alone



























asdfasdf
