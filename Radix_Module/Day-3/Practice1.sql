USE practice1;
GO
/*COUNT()*/
SELECT * FROM [dbo].[Student_Report];
SELECT COUNT(*) Count FROM Student_Report WHERE English > 60 ;

SELECT * FROM Orders;
SELECT COUNT(*) FROM Orders;
SELECT COUNT(Customers_ID) FROM Orders ;
SELECT COUNT(DISTINCT Customers_ID) FROM Orders ;
SELECT COUNT(*) FROM Orders GROUP BY Customers_ID;
SELECT COUNT(Customers_ID) FROM Orders GROUP BY Customers_ID HAVING COUNT(*) >1 ;

/*SUM()*/
SELECT * FROM Student_Report;
SELECT SUM(English) FROM Student_Report;
SELECT SUM(English) FROM Student_Report WHERE English > 60;
SELECT Student_Number,(SELECT SUM(English)FROM Student_Report WHERE English > 60) 
FROM Student_Report WHERE English > 60 GROUP BY Student_Number;

SELECT SUM(Car_Price) FROM Cars_Details GROUP BY Car_Count HAVING COUNT(*) > 1;
SELECT * FROM Cars_Details;


/*AVERAGE()*/
SELECT AVG(Car_Count) FROM Cars_Details;
SELECT AVG(English) FROM Student_Report;
SELECT *,(SELECT AVG(c) FROM (VALUES (English),(Math),(Science)) v(c)) Average FROM Student_Report;

/*MAX()*/
SELECT MAX(English) FROM Student_Report;

/*MIN()*/
SELECT MIN(English) FROM Student_Report;                                 /*minium record in english*/
SELECT TOP 4 English FROM Student_Report ORDER BY English DESC;				/*Top 4 record in Englisg*/
WITH CTE																	/*Using CTE to find 4 th record*/
AS(SELECT TOP 4 English top4 FROM Student_Report ORDER BY English DESC)
SELECT MIN(top4) FROM CTE;

SELECT MIN(top4) FROM(SELECT TOP 4 English top4 FROM Student_Report ORDER BY English DESC)AS DTB;          /*Same thing using derived table*/

/*Sub Quaries*/
SELECT Car_Name FROM Cars_Details WHERE Car_Number 
IN(SELECT DISTINCT Car_Number FROM Cars_Details WHERE Car_Price > 1500000);


/*SELECT INTO*/
SELECT * INTO a.Employee_data FROM a.Employee;
SELECT * FROM a.Employee_data;

SELECT Emp_ID,Emp_Name INTO a.Employee_data2 FROM a.Employee;
SELECT * FROM a.Employee_data2;
 
SELECT Emp_ID,Emp_Name,Project_ID INTO a.Employee_data3 FROM a.Employee 
WHERE CHARINDEX('a',Emp_Name) <> 0;
SELECT * FROM a.Employee_data3;

/*INNER JOINS*/
SELECT c.Name 'Customers Name',
o.Order_Date 'Ordered On',
'Has Id: '+ (SELECT CONVERT(VARCHAR(5),c.Customers_ID)) ID
FROM Customers c
	JOIN Orders o ON c.Customers_ID = o.Customers_ID;

/*OUTER JOINS*/
/*LEFT JOIN*/
SELECT * 
FROM Customers c LEFT JOIN Orders o ON c.Customers_ID = o.Customers_ID WHERE Order_ID IS NULL;

/*RIGHT JOIN*/
SELECT * 
FROM Customers c RIGHT JOIN Orders o ON c.Customers_ID = o.Customers_ID;

/*FULL OUTER JOIN*/
SELECT * FROM Customers FULL OUTER JOIN Orders ON Customers.Customers_ID = Orders.Customers_ID;

/*SELF JOIN*/
SELECT lhs.Customers_ID 'ID1',
rhs.Customers_ID 'ID2',
lhs.Order_Date 'Ordered On DATE'
FROM Orders lhs INNER JOIN Orders rhs ON lhs.Order_Date = rhs.Order_Date AND lhs.Customers_ID < rhs.Customers_ID;

/*CROSS JOIN*/
SELECT c.Customers_ID 'Customers_ID',
o.Order_ID 'Order_ID',
o.Order_Date 'Order_Date'
FROM Customers c , Orders o