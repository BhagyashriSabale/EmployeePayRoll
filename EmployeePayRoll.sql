-------------------UC1--------------
CREATE DATABASE payroll_service;
USE payroll_service;

--------------------UC2---------------
CREATE TABLE employee_payroll (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50),
  salary DECIMAL(10,2),
  start_date DATE
);

--------------------UC3------------------
INSERT INTO employee_payroll (name, salary, start_date)
VALUES ('Bill', 5000.00, '2018-03-11');
INSERT INTO employee_payroll (name, salary, start_date)
VALUES ('Charlie', 6000.00, '2022-08-15');
INSERT INTO employee_payroll (name, salary, start_date)
VALUES ('Robert Johnson', 4500.00, '2023-03-10');
INSERT INTO employee_payroll (name, salary, start_date)
VALUES ('John Doe', 8000.00, '2023-01-01');

---------------------------UC4-------------------------
SELECT * FROM employee_payroll;

---------------------------UC5-------------------------
SELECT salary FROM employee_payroll WHERE name = 'Bill';

SELECT * FROM employee_payroll WHERE start_date BETWEEN CAST('2018-01-01' AS DATE) AND CAST(GETDATE() AS DATE);

----------------------UC6------------------------------
ALTER TABLE employee_payroll ADD gender CHAR(1) NULL;
UPDATE employee_payroll 
SET gender = 'M'
WHERE name IN ('Bill', 'Charlie');
UPDATE employee_payroll 
SET gender = 'F'
WHERE name IN ('Robert Johnson', 'John Doe');

---------------------UC7--------------------------------
------------------SUM----------------------
SELECT gender, SUM(salary) AS total_salary
FROM employee_payroll
GROUP BY gender;
------------------AVG----------------------
SELECT gender, AVG(salary) AS average_salary
FROM employee_payroll
GROUP BY gender;
------------------MIN/MAX----------------------
SELECT gender, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employee_payroll
GROUP BY gender;
-------------------COUNT---------------------
SELECT gender, COUNT(*) AS employee_count
FROM employee_payroll
GROUP BY gender;
