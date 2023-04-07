USE SQL_Practice2;
GO

EXEC sp_help 'dbo.Employee';
EXEC sp_columns	Employee;
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Employee';	

--REPLACE(EXPRESSION/COLUMN,Target,value)
SELECT REPLACE('It is a best coffee at the famous coffee shop.', 'Coffee', 'tea') AS Result;         /*not case sencetive*/
SELECT REPLACE('It is a best coffee at the famous coffee shop.'COLLATE Latin1_General_CS_AS,'Coffee', 'tea') AS Result;  /*TO MAKE CASE SENCETIVE*/
UPDATE Employee SET FIRST_NAME = REPLACE(FIRST_NAME,'a','A')  
WHERE FIRST_NAME IS NOT NULL;

SELECT COALESCE(NULL, 'Hello') AS Result;
SELECT ISNULL(NULL, 'Hello') AS Result;
/*SELECT firstname+' '+lastname AS fullname, relationship,  
  COALESCE(homenumber, worknumber, personalnumber, 'NA') AS phone  
FROM emp_contact;*/

/*IF ELSE*/
DECLARE @x INT = 20;

IF @x > 10
BEGIN
PRINT 'hiiii';
END

SELECT * FROM Employee;

BEGIN
DECLARE @salary INT;
SELECT @salary=SALARY FROM Employee WHERE SALARY > 600000;
SELECT @salary;

IF @salary>600000
BEGIN
PRINT 'hey';
END
END

/*TEMP TABLE*/
SELECT*FROM Employee;

SELECT FIRST_NAME,LAST_NAME INTO #Names FROM Employee ;
SELECT * FROM #Names;
/*Another Way*/
CREATE TABLE #xyz (
FIRST_NAME VARCHAR(20)
);           
INSERT INTO #xyz
SELECT FIRST_NAME FROM Employee;
SELECT * FROM #xyz;

/*Stored Procedure*/
CREATE PROCEDURE SORTING
AS
BEGIN
SELECT * FROM Employee;
END
EXEC SORTING;
IF OBJECT_ID ('procedure_name', 'P') IS NOT NULL     
    DROP PROCEDURE SORTING;

