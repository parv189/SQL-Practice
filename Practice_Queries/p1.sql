USE SQL_Practice;																									/*to use named database*/
Go																													/*GO is a batch separator*/

CREATE DATABASE SQL_Practice
CREATE DATABASE practice2
CREATE DATABASE practice4
CREATE DATABASE practice3																							    /*to create multiple databases*/					
CREATE DATABASE practice5
CREATE DATABASE practice6
GO

DROP DATABASE practice3,practice4,practice5,practice6;																	/*to delete multiple database*/
DROP DATABASE practice2
GO

CREATE SCHEMA example2
GO 

CREATE TABLE SQL_Practice..TB1(
col_1 INT PRIMARY KEY,																								/*db.schema.object(col1 datatype pk, col2 datatype )*/
col_2 VARCHAR(10),
col_3 VARCHAR(15)
);

INSERT INTO SQL_Practice..TB1(col_1,col_2,COL_3)
VALUES (1,'parv','Gajipara')

ALTER TABLE SQL_Practice..TB1 ADD ID int IDENTITY(1,1)                                                        /*first must change identity options to no and other options*/
ALTER TABLE TB1 ALTER COLUMN ID VARCHAR(35) 

SELECT * FROM SQL_Practice..TB1;
SELECT * FROM SQL_Practice.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE WHERE TABLE_NAME = 'TB1'
ALTER TABLE SQL_Practice..TB1 DROP CONSTRAINT PK__TB1__9014219BDD0ABE08;
ALTER TABLE SQL_Practice..TB1 ADD PRIMARY KEY (ID)

ALTER TABLE SQL_Practice..TB1 DROP COLUMN col_1

ALTER TABLE SQL_Practice..TB1 ALTER COLUMN col_2 VARCHAR(10) NOT NULL;
ALTER TABLE SQL_Practice..TB1 ALTER COLUMN COL_3 VARCHAR(15) NOT NULL; 

EXEC sp_rename 'TB1.COL_3','col_3';


INSERT INTO SQL_Practice..TB1(col_1,col_2,COL_3)
VALUES (2,'Raj','Virani'),
(3,'Karm','Raval'),

INSERT INTO SQL_Practice..TB1(col_1,col_2,COL_3)
VALUES(5,'Viral','Shah');

SELECT name FROM master.sys.databases																					/*to see list of all databases*/
ORDER BY name;

EXEC sp_databases;																										/*execute the stored procedure*/

 