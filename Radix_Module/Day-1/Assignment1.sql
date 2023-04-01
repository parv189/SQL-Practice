CREATE SCHEMA a

CREATE TABLE a.inventory(
item_ID DECIMAL(3,0) NOT NULL PRIMARY KEY,
quantity INT NOT NULL
);
INSERT INTO a.inventory VALUES (13,50),(23,200),(10,578),(4,1003),(7,2054);
SELECT * FROM a.inventory;
GO


CREATE TABLE a.sales(
sale_ID DECIMAL(6,0)NOT NULL PRIMARY KEY,
item_ID DECIMAL(3,0) NOT NULL FOREIGN KEY REFERENCES a.inventory(item_ID),
--emp_ID DECIMAL(4,0) NOT NULL FOREIGN KEY REFERENCES a.employee(emp_ID),
sale_quantity INT NOT NULL,
sale_price NUMERIC(5,2) NOT NULL
);
ALTER TABLE a.sales add emp_ID DECIMAL(4,0) FOREIGN KEY REFERENCES a.employee(emp_ID);
INSERT INTO a.sales VALUES (185,4,70,200.00,102);
UPDATE a.sales SET emp_ID = 102 WHERE sale_ID = 403;
SELECT * FROM a.sales;
--SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE;
--ALTER TABLE a.employee DROP CONSTRAINT FK__employee__sale_I__5BAD9CC8
--DROP TABLE a.sales
GO 

CREATE TABLE a.account(
acc_ID INT NOT NULL PRIMARY KEY,
[commission(%)] NUMERIC(6,2)
);
INSERT INTO a.account VALUES(3009,3045.56),(3301,3455.45),(2006,2043.05),(1056,1234.67),(3296,577.09),(2889,345.78),(1232,987.67);
SELECT * FROM a.account;
SELECT  * FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ;
--ALTER TABLE a.employee DROP CONSTRAINT FK__employee__acc_ID__5CA1C101;
--DROP TABLE a.account
GO


CREATE TABLE a.employee(
emp_ID DECIMAL(4,0) NOT NULL PRIMARY KEY,
emp_name VARCHAR(20) NOT NULL,
sale_ID DECIMAL(6,0) NOT NULL FOREIGN KEY REFERENCES a.sales(sale_ID),
acc_ID INT NOT NULL FOREIGN KEY REFERENCES a.account(acc_ID),
);
ALTER TABLE a.employee ADD FOREIGN KEY (sale_ID) REFERENCES a.sales(sale_ID);
ALTER TABLE a.employee ADD FOREIGN KEY (acc_ID) REFERENCES a.account(acc_ID);
INSERT INTO a.employee VALUES (101,'Ashvin',263,1056);
INSERT INTO a.employee VALUES (102,'Hitesh',403,1232);
INSERT INTO a.employee VALUES (103,'Karan',185,2006);
INSERT INTO a.employee VALUES (104,'Hitesh',185,3296);
SELECT * FROM a.employee
GO