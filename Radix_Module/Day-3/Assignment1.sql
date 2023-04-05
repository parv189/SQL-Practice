USE SQL_Practice3;
GO


CREATE TABLE Employee (
EMPLOYEE_ID DECIMAL(2,0) PRIMARY KEY,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
SALARY DECIMAL(8,0),
JOINING_DATE VARCHAR(21) CHECK(JOINING_DATE LIKE'__-___-__ __.__.__ __'),
DEPARTMENT VARCHAR(20),
MANAGER_ID DECIMAL(1,0)
);
INSERT INTO Employee VALUES (1,'John','braham',1000000,'01-JAN-13 12.00.00 AM','Banking',NULL),
(2, 'Michael','Clarke',800000, '01-JAN-13 12.00.00 AM', 'Insurance',1),
(3, 'Roy', 'Thomas', 700000, '01-FEB-13 12.00.00 AM', 'Banking',1),
(4, 'Tom', 'Jose', 600000, '01-FEB-13 12.00.00 AM', 'Insurance',2),
(5, 'Jerry', 'Pinto', 650000, '01-FEB-13 12.00.00 AM', 'Insurance',3),
(6, 'Philip', 'Mathew', 750000, '01-JAN-13 12.00.00 AM', 'Services',3),
(7, 'TestName1', '123', 650000, '01-JAN-13 12.00.00 AM', 'Services',2),
(8, 'TestName2', 'Lname%', 600000, '01-FEB-13 12.00.00 AM', 'Insurance',2);
SELECT * FROM Employee;
GO

CREATE TABLE Incentives(
EMPLOYEE_REF_ID DECIMAL(2,0) FOREIGN KEY REFERENCES Employee(EMPLOYEE_ID),
INCENTIVE_DATE VARCHAR(9) CHECK(INCENTIVE_DATE LIKE'__-___-__'),
INCENTIVE_AMOUNT INT
);
INSERT INTO Incentives VALUES(1,'01-FEB-13',5000),
(2,'01-FEB-13',3000),
(3,'01-FEB-13',4000),
(1,'01-JAN-13',4500),
(2,'01-JAN-13',3500);
SELECT * FROM Incentives;
GO

SELECT DATEDIFF(DD,CONVERT(DATE,SUBSTRING(e.JOINING_DATE,1,9)),CONVERT(DATE,i.INCENTIVE_DATE)) Diff_In_Day
FROM Employee e JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee e JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT > 3000;

SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee e LEFT JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

SELECT rhs.FIRST_NAME EmployeeName,lhs.FIRST_NAME ManagerName  FROM Employee lhs JOIN Employee rhs ON lhs.EMPLOYEE_ID = rhs.MANAGER_ID;  

SELECT e.FIRST_NAME,COALESCE(i.INCENTIVE_AMOUNT,0) incentive_amount   FROM Employee e LEFT JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

SELECT DEPARTMENT,SUM(SALARY) 'TOTAL SALARY BY DEPARTMENT' FROM Employee GROUP BY DEPARTMENT;

WITH CTE
AS(SELECT DEPARTMENT,SUM(SALARY) 'TOTAL_SALARY_BY_DEPARTMENT' FROM Employee GROUP BY DEPARTMENT)
SELECT DEPARTMENT,TOTAL_SALARY_BY_DEPARTMENT FROM CTE ORDER BY TOTAL_SALARY_BY_DEPARTMENT DESC;

SELECT DEPARTMENT,MAX(SALARY) 'MAXIMUM_SALARY' FROM Employee GROUP BY DEPARTMENT;

WITH CTE
AS(SELECT DEPARTMENT,MIN(SALARY) 'MINIMUM_SALARY' FROM Employee GROUP BY DEPARTMENT)
SELECT DEPARTMENT,MINIMUM_SALARY FROM CTE ORDER BY MINIMUM_SALARY ASC;

WITH CTE
AS (SELECT DEPARTMENT,SUM(SALARY) 'TOTAL_SALARY' FROM Employee GROUP BY DEPARTMENT)
SELECT DEPARTMENT,TOTAL_SALARY FROM CTE WHERE TOTAL_SALARY > 800000 ORDER BY TOTAL_SALARY DESC;


