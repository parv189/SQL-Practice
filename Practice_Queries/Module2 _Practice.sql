USE practice1;
GO

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





