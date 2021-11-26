
SELECT * FROM department;
-- add department
INSERT INTO department (name)
VALUES ('Boss'), ('Sales'), ('Engineering');
SELECT * FROM role;
-- add role
INSERT INTO role (title, salary, department_id)
VALUES('Boss', 0, 1),  ('Sales Lead', 100000, 2),  ('Lead Engineer', 150000, 3);

SELECT
    CONCAT(first_name, ' ', last_name) AS 'name'
    FROM employee;
SELECT * FROM employee;
-- add employee
INSERT INTO employee (first_name, last_name, role_id)
VALUES('Dan', 'Yu', 1);
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Becky', 'Moon', 2 , 1), ('Ashleigh', ' Mendez', 3, 1);

-- View department
SELECT
	department.name AS 'Department',
	id
FROM department;

-- View role
SELECT
	role.id,
	role.title AS 'Title',
	department.name AS 'Department',
    role.salary AS 'Salary'
FROM department
INNER JOIN role ON department.id = role.department_id;

-- View employee and manager
SELECT
	c1.id AS 'ID',
	c1.first_name AS 'First Name',
    c1.last_name AS 'Last Name',
    CONCAT(c2.first_name, ' ', c2.last_name) AS 'Manager'
FROM employee c1
INNER JOIN employee c2 ON c1.manager_id = c2.id;

-- View employee by manager
SELECT
	employee.id AS 'ID',
	employee.first_name AS 'First Name',
    employee.last_name AS 'Last Name',
	department.name AS 'Department',
    role.title AS 'Role',
    role.salary AS 'Salary'
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee ON role.id = employee.role_id
WHERE manager_id = 1;

-- view employee id by id
SELECT id
    FROM employee
    WHERE id = 1;
-- view employee with department and manager
SELECT
	c1.id AS 'ID',
	c1.first_name AS 'First Name',
    c1.last_name AS 'Last Name',
	department.name AS 'Department',
    role.title AS 'Role',
    role.salary AS 'Salary',
	CONCAT(c2.first_name, ' ', c2.last_name) AS 'Manager'
FROM department
INNER JOIN role ON department.id = role.department_id
INNER JOIN employee c1 ON role.id = c1.role_id
LEFT JOIN employee c2 ON c1.manager_id = c2.id;

SELECT
	*
FROM employee
GROUP BY id;

SELECT * FROM role;
DELETE FROM role WHERE id = 7;

-- View employee by department, manager
SELECT
	c1.id AS 'ID',
	c1.first_name AS 'First Name',
    c1.last_name AS 'Last Name',
	department.name AS 'Department',
    role.title AS 'Role',
    role.salary AS 'Salary',
	CONCAT(c2.first_name, ' ', c2.last_name) AS 'Manager'
FROM department
INNER JOIN role ON department.id = role.department_id
LEFT JOIN employee c1 ON role.id = c1.role_id
LEFT JOIN employee c2 ON c1.manager_id = c2.id
WHERE department.id = 2;
-- WHERE c1.manager_id = 1;

SELECT SUM(role.salary) FROM role;
-- department budget
SELECT
	department.name,
    SUM(role.salary) AS 'Department Budget'
FROM department
INNER JOIN role ON department.id = role.department_id
LEFT JOIN employee c1 ON role.id = c1.role_id
LEFT JOIN employee c2 ON c1.manager_id = c2.id
GROUP BY department.id;

SELECT
	SUM(role.salary)
FROM role
INNER JOIN department ON department.id = role.department_id
LEFT JOIN employee ON role.id = employee.role_id;


-- update employee role and manager
UPDATE employee
SET role_id = 2,
	manager_id = 1
WHERE id = 2;

-- delete employee, role, department
DELETE FROM employee WHERE id = 2;
DELETE FROM role WHERE id = 2;
DELETE FROM department WHERE id = 2;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123';

SELECT id, title FROM role;
SELECT id,
    CONCAT(first_name, ' ', last_name) AS 'name'
    FROM employee;
