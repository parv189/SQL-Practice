--USE SQL_Practice3;
GO

CREATE VIEW Details AS
SELECT 
CASE DEPARTMENT
	WHEN 'Banking' THEN 'Bank Dept'
	WHEN 'Insurance' THEN 'Insurance_Dept'
	WHEN 'Services' THEN 'Services_Dept'
END AS Departments
FROM Employee;
GO
SELECT * FROM Details;
--DROP VIEW Details
GO

SELECT DISTINCT e.EMPLOYEE_ID , e.FIRST_NAME, e.LAST_NAME,e.JOINING_DATE
FROM Employee e JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

SELECT lhs.FIRST_NAME,lhs.LAST_NAME,lhs.JOINING_DATE,lhs.SALARY FROM Employee lhs JOIN Employee rhs ON lhs.SALARY > rhs.SALARY
WHERE rhs.FIRST_NAME = 'Roy'
GO

CREATE VIEW Detail_1 AS
SELECT e.FIRST_NAME,e.LAST_NAME,e.SALARY,e.JOINING_DATE,ISNULL(i.INCENTIVE_DATE,'NA')'INCENTIVE_DATE',COALESCE(i.INCENTIVE_AMOUNT,0)'INCENTIVE_AMOUNT'
FROM Employee e LEFT JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
GO
SELECT * FROM Detail_1;
--DROP VIEW Detail_1
GO

CREATE VIEW Detail_2 AS
SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee e JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
WHERE i.INCENTIVE_AMOUNT > 3000;
GO
SELECT * FROM Detail_2;

ALTER TABLE Employee ADD Job VARCHAR(20),Department_NO INT,[Location] VARCHAR(20);
UPDATE Employee
SET Job = 
(CASE EMPLOYEE_ID
	WHEN 1 THEN 'Junior'
	WHEN 2 THEN 'Junior'
	WHEN 3 THEN 'Junior'
	WHEN 4 THEN 'Junior'
	WHEN 5 THEN 'Senior'
	WHEN 6 THEN 'Senior'
	WHEN 7 THEN 'Senior'
	WHEN 8 THEN 'Junior'
END)

UPDATE Employee
SET Department_NO =
(CASE DEPARTMENT
	WHEN 'Banking' THEN 1
	WHEN 'Insurance' THEN 2
	WHEN 'Services' THEN 3
END)

UPDATE Employee
SET [Location] =
(CASE EMPLOYEE_ID
	WHEN 1 THEN 'London'
	WHEN 3 THEN 'London'
	WHEN 6 THEN 'London'
	WHEN 2 THEN 'Delhi'
	WHEN 4 THEN 'Delhi'
	WHEN 7 THEN 'Delhi'
END)
GO 

CREATE VIEW Detail_3 AS
SELECT e.FIRST_NAME ,e.LAST_NAME,e.Job,e.Department_NO,e.DEPARTMENT  FROM Employee e 
WHERE [Location] = 'London';
GO
SELECT * FROM Detail_3;
GO

CREATE VIEW Detail_4 AS
SELECT DEPARTMENT,COUNT(EMPLOYEE_ID)'NO_OF_Employee' FROM Employee GROUP BY DEPARTMENT;
GO
SELECT * FROM Detail_4;

CREATE TABLE Job_History(
Employee_ID INT PRIMARY KEY,
Job_Tital VARCHAR(20),
Starting_Date DATE,
Ending_Date DATE,
Department VARCHAR(20)
)
INSERT INTO Job_History VALUES(1,'Junior Developer','2020-01-01','2023-05-07',70),
(2,'Junior Developer','2019-01-01','2020-06-20',80),
(3,'Junior Developer','2018-01-01','2021-12-31',90),
(4,'Junior Developer','2017-01-01','2023-02-26',90),
(5,'Senior Developer','2020-04-01','2023-03-31',80),
(6,'Senior Developer','2020-04-01','2023-01-19',70),
(7,'Senior Developer','2015-07-23','2019-08-06',90),
(8,'Senior Developer','2016-01-19','2029-03-31',90);
GO

CREATE VIEW Detail_5 AS
SELECT Employee_ID,Job_Tital,DATEDIFF(DD,Starting_Date,Ending_Date)'No_Of_Date' FROM Job_History
WHERE Department = '90';
GO
SELECT * FROM Detail_5;

SELECT e.DEPARTMENT,e.FIRST_NAME'Manager Name',e.[Location] FROM Employee e JOIN Employee f ON e.EMPLOYEE_ID = f.MANAGER_ID; 

SELECT * FROM(SELECT e.DEPARTMENT,e.FIRST_NAME'Manager_Name',e.LAST_NAME,e.JOINING_DATE,e.SALARY 
FROM Employee e JOIN Employee f ON e.EMPLOYEE_ID=f.MANAGER_ID 
WHERE DATEDIFF(YY,CONVERT(DATE,SUBSTRING(e.JOINING_DATE,1,9)),GETDATE()) > 5)AS
TB2 GROUP BY DEPARTMENT,Manager_Name,LAST_NAME,JOINING_DATE,SALARY;







