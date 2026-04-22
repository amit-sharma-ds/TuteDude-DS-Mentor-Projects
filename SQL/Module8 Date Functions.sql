SELECT curdate();

SELECT current_date();

SELECT current_date; -- without braces also works

SELECT current_TIME;

SELECT current_TIME();

SELECT current_timestamp();

SELECT now();

SELECT DATE_ADD(current_date(), INTERVAL 4 DAY);

SELECT current_date() + INTERVAL 4 DAY;

SELECT DATE_ADD(current_date(), INTERVAL -4 DAY);

SELECT current_date() - INTERVAL 4 DAY;

SELECT current_date() + INTERVAL -4 DAY;

SELECT DATE_ADD(current_date(), INTERVAL 2 MONTH);

SELECT current_date() - INTERVAL 4 DAY;

SELECT current_date() - INTERVAL 4 MONTH;

SELECT current_date() - INTERVAL 4 YEAR;

SELECT DATE(current_timestamp());


-- DATE Functions

-- Query1
SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 4 DAY);
SELECT CURRENT_DATE() + INTERVAL 4 DAY;

-- Query1.2
SELECT DATE(CURRENT_TIMESTAMP());

-- Query1.3
SELECT DATE('2025-09-05 05:50:55.2100');

--  Query2
SELECT DATE_ADD('2025-09-05', INTERVAL 1 DAY);
SELECT DATE('2025-09-05') + INTERVAL 1 DAY;  

-- Query 3
SELECT DATE_ADD('2025-09-05', INTERVAL -1 WEEK);
SELECT DATE('2025-090-05') + INTERVAL -1 WEEK;

-- Query4
SELECT DATE_ADD('2025-09-05', INTERVAL 1 MONTH);
SELECT DATE('2025-09-05') + INTERVAL 1 MONTH;

-- Query5
SELECT DATE_ADD('2025-09-05', INTERVAL -1 YEAR);

 -- Query6
 SELECT EXTRACT(YEAR FROM '2025-09-05 05:50:55.2100');
 
 -- Query7
 SELECT DATEDIFF('2024-05-24', '2024-05-01');
 
 -- Query8
 SELECT TIMESTAMPDIFF(MINUTE, '2024-05-24 10:00:00', '2028-05-24 10:30:00');
 
-- Query9
SELECT DATE_FORMAT('2024-02-19', '%D %M %Y') AS formatted_date; -- will give month name
SELECT DATE_FORMAT('2024-02-19', '%D %m %Y') AS formatted_date; -- It will give month number






-- Create Database
CREATE DATABASE demo;
USE demo;

-- Create Table
CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10,2),
    Department VARCHAR(255)
);

-- Insert Data
INSERT INTO Employee (EmployeeID, FirstName, LastName, BirthDate, HireDate, Salary, Department)
VALUES
(1, 'John', 'Doe', '1990-05-15', '2015-03-10', 55000.00, 'Sales'),
(2, 'Jane', 'Smith', '1985-08-21', '2016-01-22', 60000.00, 'Marketing'),
(3, 'Michael', 'Johnson', '1992-12-02', '2017-07-05',52000.00, 'IT'),
(4, 'Emily', 'Davis', '1998-04-17', '2018-09-12', 65000.00, 'HR'),
(5, 'David', 'Wilson', '1995-07-09', '2019-02-28', 58000.00, 'Finance'),
(6, 'Sarah', 'Anderson', '1983-02-14', '2020-06-15', 70000.00, 'Sales'),
(7, 'Jennifer', 'Lee', '1991-11-30', '2021-04-20', 54000.00, 'IT'),
(8, 'Matthew', 'Brown', '1989-09-05', '2015-12-03', 61000.00, 'IT'),
(9, 'Olivia', 'Taylor', '1994-06-23', '2017-08-18', 59000.00,'HR'),
(10, 'Daniel', 'Martinez', '1987-03-07', '2018-11-14', 66000.00, 'Finance'),
(11, 'Ava', 'Garcia', '1993-01-12', '2019-10-07', 57000.00, 'Sales'),
(12, 'William', 'Rodriguez', '1984-10-28', '2020-03-25', 63000.00, 'Marketing'),
(13, 'Sophia', 'Hernandez', '1996-04-03', '2021-07-09', 62000.00, 'IT'),
(14, 'James', 'Lopez', '1986-08-10', '2016-09-02', 67000.00, 'HR'),
(15, 'Emma', 'Clark', '1990-12-19', '2017-11-30', 60000.00, 'Finance');

-- Tenure Query 
SELECT 
    EmployeeID,
    TIMESTAMPDIFF(YEAR, HireDate, CURRENT_DATE()) AS Tenure
FROM Employee;