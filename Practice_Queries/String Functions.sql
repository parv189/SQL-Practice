USE practice1;
GO;

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