USE practice1;
GO

CREATE TABLE Customers(
Customers_ID DECIMAL(4,0) NOT NULL PRIMARY KEY,
[Name] VARCHAR(10) NOT NULL
);
INSERT INTO Customers VALUES (101,'Meet'),
(102,'Ravi'),
(103,'Vishal'),
(104,'Deep'),
(105,'Parv'),
(106,'Nirav');
SELECT * FROM Customers;
GO

CREATE TABLE Orders(
Order_ID DECIMAL(4,0) NOT NULL PRIMARY KEY,
Customers_ID DECIMAL(4,0) NOT NULL,
Order_Date VARCHAR(10) NOT NULL CHECK(Order_Date LIKE'__/__/____')
);
--DROP TABLE Orders;
INSERT INTO Orders VALUES (501,101,'30/01/2023'),
(502,102,'05/02/2023'),
(503,101,'10/02/2023'),
(504,103,'15/02/2023'),
(505,103,'28/02/2023'),
(506,103,'07/03/2023');
INSERT INTO Orders VALUES (507,107,'18/03/2023'),
(508,108,'21/03/2023');
INSERT INTO Orders VALUES (509,109,'18/03/2023'),
(5010,110,'21/03/2023');
UPDATE Orders SET Order_ID = 510 WHERE Customers_ID = 110;
SELECT * FROM Orders;
GO

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
