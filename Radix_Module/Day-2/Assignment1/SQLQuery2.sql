USE SQL_Practice2;
GO 

CREATE TABLE Employee (
EMPLOYEE_ID DECIMAL(2,0),
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY DECIMAL(8,0),
JOINING_DATE VARCHAR(21) CHECK(JOINING_DATE LIKE'__-___-__ __.__.__ __'),
DEPARTMENT VARCHAR(20)
);
--DROP TABLE Employee;
INSERT INTO Employee VALUES (1,'John','braham',1000000,'01-JAN-13 12.00.00 AM','Banking'),
(2, 'Michael','Clarke',800000, '01-JAN-13 12.00.00 AM', 'Insurance'),
(3, 'Roy', 'Thomas', 700000, '01-FEB-13 12.00.00 AM', 'Banking'),
(4, 'Tom', 'Jose', 600000, '01-FEB-13 12.00.00 AM', 'Insurance'),
(5, 'Jerry', 'Pinto', 650000, '01-FEB-13 12.00.00 AM', 'Insurance'),
(6, 'Philip', 'Mathew', 750000, '01-JAN-13 12.00.00 AM', 'Services'),
(7, 'TestName1', '123', 650000, '01-JAN-13 12.00.00 AM', 'Services'),
(8, 'TestName2', 'Lname%', 600000, '01-FEB-13 12.00.00 AM', 'Insurance');

SELECT * FROM Employee;

SELECT e.FIRST_NAME,e.LAST_NAME FROM Employee e;

SELECT e.FIRST_NAME 'Employee Name' FROM Employee e;

SELECT * FROM Employee e WHERE e.FIRST_NAME = 'John';

SELECT * FROM Employee e WHERE e.FIRST_NAME = 'John' OR e.FIRST_NAME = 'Roy';

SELECT * FROM Employee e WHERE e.FIRST_NAME <> 'John' AND e.FIRST_NAME <> 'Roy';

SELECT * FROM Employee e WHERE  SUBSTRING(e.FIRST_Name,1,1) = 'J';
SELECT * FROM Employee e WHERE  LEFT(e.FIRST_Name,1) = 'J';

SELECT * FROM Employee e WHERE CHARINDEX('o',FIRST_Name) <> 0;

SELECT * FROM Employee WHERE SALARY BETWEEN 500000 AND 800000;

SELECT COUNT(DEPARTMENT) FROM Employee GROUP BY DEPARTMENT;
SELECT DISTINCT DEPARTMENT FROM Employee;

SELECT TOP 2 SALARY FROM Employee ORDER BY SALARY DESC;

WITH Average
AS (SELECT SALARY FROM Employee WHERE SALARY BETWEEN 500000 AND 800000)
SELECT AVG(SALARY) AS AVG_of_Five_to_eight FROM Average;


SELECT FIRST_Name,Last_Name FROM Employee WHERE RIGHT(Last_Name,1) = '%';

SELECT incentive FROM
(SELECT (SALARY*10)/100 AS incentive FROM Employee) AS TB_Incentive 
WHERE incentive > 100000;