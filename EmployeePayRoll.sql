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

---------------------UC8------------------------------
ALTER TABLE employee_payroll
ADD department VARCHAR(50) NOT NULL DEFAULT 'Not Specified';
ALTER TABLE employee_payroll
ADD phone VARCHAR(20) NULL,
    address VARCHAR(100) NULL;

--------------------------UC9-----------------------------
ALTER TABLE employee_payroll
ADD basic_pay DECIMAL(10, 2),
    deductions DECIMAL(10, 2),
    taxable_pay DECIMAL(10, 2),
    income_tax DECIMAL(10, 2),
    net_pay DECIMAL(10, 2);

--------------------------UC10------------------------------
INSERT INTO employee_payroll (name, salary, start_date, gender, phone, address, department)
VALUES ('Terissa', 5000.00, '2023-01-01', 'F', '1234567890', 'Address', 'Sales and Marketing');
