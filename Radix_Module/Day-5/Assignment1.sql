USE SQL_Practice3;
GO

SELECT * FROM Employee;
GO
CREATE OR ALTER PROCEDURE p AS
SELECT
(CASE DEPARTMENT
	WHEN 'Banking' THEN 'Bank Dept'
	WHEN 'Insurance' THEN 'Insurance Dept'
	WHEN 'Services' THEN 'Services Dept'
END)'Department'
FROM Employee;
EXEC p;
GO

SELECT * FROM Employee e JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

SELECT DISTINCT e.SALARY FROM Employee e,Employee f WHERE e.SALARY > f.SALARY AND f.FIRST_NAME = 'Roy';
GO

CREATE OR ALTER VIEW v1 AS
SELECT e.FIRST_NAME,e.LAST_NAME,e.SALARY,e.JOINING_DATE,i.INCENTIVE_DATE,i.INCENTIVE_AMOUNT FROM Employee e LEFT JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
GO
SELECT * FROM v1;
GO

CREATE OR ALTER VIEW v2 AS
SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee e JOIN Incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID WHERE i.INCENTIVE_AMOUNT > 3000;
GO





SELECT * FROM v2;

