USE practice1;
GO

/*DML*/
CREATE TABLE Cars_Details  
(  
Car_Number INT PRIMARY KEY,  
Car_Name VARCHAR (50),  
Car_Price NUMERIC(9,2) NOT NULL CHECK(Car_Price >= 500000),  
Car_Count DECIMAL(2,0) NOT NULL  
) ;  
INSERT INTO Cars_Details VALUES (2578, 'Creta', 1500000,2),  
(9258, 'Audi',3000000,3),   
(8233, 'Venue',900000,1),  
(6214, 'Nexon',1000000,3);  
INSERT INTO Cars_Details VALUES (1111, 'i20', 900000,5);
INSERT INTO Cars_Details VALUES (1511, 'i20', 900000,5);

SELECT Car_Name,Car_Price FROM Cars_Details;
SELECT SUM(Car_Count) FROM Cars_Details WHERE Car_Price > 1000000							/*sum of car count where car price is grater than 10lakh*/
SELECT * FROM Cars_Details WHERE Car_Name = 'Audi';											/*select audi*/
UPDATE Cars_Details SET Car_Price = 950000 WHERE Car_Name = 'i20';							/*update row*/
/*DISTINCT*/
SELECT DISTINCT Car_Name FROM Cars_Details;                                                 /*To avoide duplicate values*/
--DELETE FROM Cars_Details WHERE Car_Number = 1511;
--DROP TABLE Cars_Details;


/*DQL*/
CREATE TABLE Students_Details  
(  
Student_Number INT PRIMARY KEY,  
Student_Name VARCHAR (50),  
Student_Grade NUMERIC(3,0) NOT NULL,  
Student_City VARCHAR(20)NOT NULL,
Student_Email VARCHAR(10)NOT NULL,
Mobile VARCHAR(10)NOT NULL,
Student_Age DECIMAL(2,0) NOT NULL
) ; 
INSERT INTO Students_Details VALUES (100,'pqr',1,'Ahmedabad','AB@345','12375634',19),
(101,'pqr',2,'Ahmedabad','AB@345','1235634',20),
(102,'per',1,'Rajkot','AB@345','13673234',21),
(103,'sqr',4,'Junagadh','AB@345','13763234',19),
(104,'pqy',1,'Surat','AB@345','1235673534',18),
(105,'pes',2,'Bhavnagar','AB@345','12356334',19);
DELETE FROM Students_Details;

SELECT CONCAT (Student_Number,' has name ',Student_Name)AS ID_Name_Details FROM Students_Details;                     /*CONCAT Columns */
SELECT Student_Name+' live in '+Student_City AS Student_City FROM Students_Details ;                                       /*CONCAT STRING Literals  (+) */
SELECT * FROM Students_Details;
GO

CREATE TABLE Student_Report(
Student_Number INT NOT NULL FOREIGN KEY (Student_Number) REFERENCES Students_Details(Student_Number),
English INT NOT NULL,
Math INT NOT NULL,
Science INT NOT NULL
);
ALTER TABLE Student_Report ADD CONSTRAINT Ch_Grat_40 CHECK(English>40);
ALTER TABLE Student_Report ADD CONSTRAINT Ch2_Grat_40 CHECK(Math>40);
ALTER TABLE Student_Report ADD CONSTRAINT Ch3_Grat_40 CHECK(Science>40);

INSERT INTO Student_Report VALUES (100,80,45,69),
(101,41,70,64),
(102,68,80,67),
(103,79,60,88),
(104,60,89,65),
(105,90,69,89);

SELECT * FROM Student_Report;
GO 

/*USE OF WHERE*/
SELECT Student_Name FROM Students_Details WHERE Student_Number 
IN(SELECT Student_Number FROM Student_Report WHERE English > 70);                /*Name of Students Who got 70+ in English*/

SELECT * ,(SELECT AVG(c) FROM (VALUES(English),(Math),(Science)) v(c))AS Total FROM Student_Report;					  /*Row wise Average in another column*/

SELECT Student_Name FROM Students_Details WHERE Student_Number IN                                                         /*Row wise average from different table*/
(SELECT Student_Number FROM Student_Report WHERE(SELECT AVG(c) FROM (VALUES(English),(Math),(Science)) v(c)) > 80);

/*RANGE OPERATOR*/
SELECT Student_Name,Student_Email,Mobile FROM Students_Details WHERE Student_Age BETWEEN 19 AND 20;


/*IN /NOT IN (they can have multiple values)*/
SELECT Student_Email FROM Students_Details WHERE Student_Name IN ('per','sqr');                                                           /*Email of Student Whose Name is per*/
SELECT Student_Number,Student_Email,Mobile FROM Students_Details WHERE Student_Number NOT IN												/*Detail of student Whose average is in range of 60 to 80*/
(SELECT Student_Number FROM Student_Report WHERE (SELECT AVG(k) FROM (VALUES (English),(Math),(Science)) v(k)) BETWEEN 60 AND 80 );

/*LIKE ORDER BY TOP DISTINCT*/
SELECT Student_Number FROM Student_Report WHERE English LIKE'68';                    /*Number of student who got 68 in English*/  
SELECT TOP 3 * FROM Students_Details ORDER BY Student_Age;							/*Top 3 students details in order*/
GO 

CREATE SCHEMA a;
CREATE TABLE a.Employee(
Emp_ID DECIMAL(4,0) NOT NULL PRIMARY KEY,
Emp_Name VARCHAR(20) NOT NULL,
Manager_ID DECIMAL(4,0) NOT NULL,
Project_ID DECIMAL(4,0) NOT NULL
);
INSERT INTO a.Employee VALUES (101,'Mahendra',103,501),
(102,'Rajesh',103,502),
(103,'Hitesh',103,501),
(104,'Smit',106,504),
(105,'Rajdeep',106,504);
SELECT * FROM a.Employee
GO

CREATE TABLE a.Project(
Project_ID DECIMAL(4,0) NOT NULL PRIMARY KEY,
Emp_ID DECIMAL(4,0) NOT NULL ,
Manager_ID DECIMAL(4,0) NOT NULL,
Project_Name VARCHAR(50) NOT NULL
);
INSERT INTO a.Project VALUES (501,101,103,'quirg qeigqo g8qgihjq'),
(502,102,103,'asjdfh aushdf udh'),
(503,107,106,'fhvioqu lsuidvaiuv fuvhid'),
(504,10,106,'adhsgv kjhkg jhsdgjah');
SELECT * FROM a.Project;
--DROP TABLE a.Project;

/*UNION*/
SELECT a.Employee.Emp_Name,Project_Name FROM a.Employee LEFT JOIN a.Project ON a.Employee.Project_ID = a.Project.Project_ID
UNION
SELECT a.Employee.Emp_Name,Project_Name FROM a.Employee RIGHT JOIN a.Project ON a.Employee.Project_ID = a.Project.Project_ID;

/*INTERSECT*/
SELECT a.Employee.Emp_Name,Project_Name FROM a.Employee LEFT JOIN a.Project ON a.Employee.Project_ID = a.Project.Project_ID
INTERSECT
SELECT a.Employee.Emp_Name,Project_Name FROM a.Employee RIGHT JOIN a.Project ON a.Employee.Project_ID = a.Project.Project_ID;

/*EXPECT*/
SELECT a.Employee.Emp_Name,Project_Name FROM a.Employee LEFT JOIN a.Project ON a.Employee.Project_ID = a.Project.Project_ID
EXCEPT
SELECT a.Employee.Emp_Name,Project_Name FROM a.Employee RIGHT JOIN a.Project ON a.Employee.Project_ID = a.Project.Project_ID;


/*STRING FUNCTIONS*/
SELECT * FROM Customers; 

SELECT ASCII([Name]) 'ASCII' FROM Customers;

SELECT CHAR(50) 'CHAR' FROM Customers;

SELECT CHAR(50) 'CHAR' FROM Customers;

SELECT CHARINDEX('Z', 'Customer',3) AS MatchPosition;

SELECT CONCAT('Parv','Gajipara') 'Name';

SELECT 'Parv'+'Gajipara' 'Name';

SELECT CONCAT_WS(',','Apple','Banana','Mango') 'Fruits';

SELECT DATALENGTH('Parv Gajipara  ') 'Name';
SELECT LEN('Parv Gajipara  ') 'Name';

SELECT SOUNDEX('Parv') 'soundex_parv' ,SOUNDEX('Gajipara') 'soundex_gajipara';
SELECT DIFFERENCE('Parv','G');

DECLARE @d DATETIME = CONVERT(DATETIME,'2020/03/12');
SELECT FORMAT(@d,'d');

SELECT FORMAT(GETDATE(),'dd/mm/yyyy');

SELECT LEFT(Name,5) FROM Customers ;

SELECT LOWER(SUBSTRING(Name,1,1))FROM Customers;  

SELECT TRANSLATE('Parv','P','G');