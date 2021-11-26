DROP DATABASE IF EXISTS employee_tracker_DB;
CREATE DATABASE employee_tracker_DB;
USE employee_tracker_DB;

-- DROP DATABASE employee_tracker_DB;

CREATE TABLE department (
	id INT AUTO_INCREMENT,
    PRIMARY KEY (id),
    name VARCHAR (30) NOT NULL
);

CREATE TABLE role (
	id INT AUTO_INCREMENT,
    PRIMARY KEY (id),
    title VARCHAR(30) NOT NULL,
    salary DEC NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee (
	id INT AUTO_INCREMENT,
    PRIMARY KEY (id),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(id),
    manager_id INT REFERENCES id
);
