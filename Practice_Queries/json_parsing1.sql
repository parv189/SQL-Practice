USE SQL_Practice3;
GO

DECLARE @JSON NVARCHAR(MAX) = N'{
"brand": "BMW",
"year": 2019,
"price": 1234.6,
"color": "red",
"owner": null
}'


SELECT * FROM OPENJSON(@JSON);
GO


DECLARE @JSON2 NVARCHAR(500) = N'{
    "owner": null,
  "brand": "BMW",
  "year": 2020,
   "status": false,
  "color": [ "red", "white", "yellow" ],
 
  
  "Model": {
    "name": "BMW M4",
    "Fuel Type": "Petrol",
    "TransmissionType": "Automatic",
    "Turbo Charger": "true",
    "Number of Cylinder": 4
 
  }
}'


SELECT * FROM OPENJSON(@JSON2);
GO

CREATE PROCEDURE PQR (@X NVARCHAR(500))
AS
BEGIN
SELECT * FROM OPENJSON(@X)
END
DECLARE @JSON NVARCHAR(MAX) = N'{
"brand": "BMW",
"year": 2019,
"price": 1234.6,
"color": "red",
"owner": null
}'
EXEC PQR @JSON;
GO
DECLARE @JSON2 NVARCHAR(500) = N'{
    "owner": null,
  "brand": "BMW",
  "year": 2020,
   "status": false,
  "color": [ "red", "white", "yellow" ],
 
  
  "Model": {
    "name": "BMW M4",
    "Fuel Type": "Petrol",
    "TransmissionType": "Automatic",
    "Turbo Charger": "true",
    "Number of Cylinder": 4
 
  }
}'
EXEC PQ @JSON2;
GO


DECLARE @JSON2 NVARCHAR(500) = N'{
    "owner": null,
  "brand": "BMW",
  "year": 2020,
   "status": false,
  "color": [ "red", "white", "yellow" ],
 
  
  "Model": {
    "name": "BMW M4",
    "Fuel Type": "Petrol",
    "TransmissionType": "Automatic",
    "Turbo Charger": "true",
    "Number of Cylinder": 4
 
  }
}'
SELECT * FROM OPENJSON(@JSON2)
WITH(OWNER VARCHAR(20) '$.owner',
BRAND VARCHAR(20) '$.brand',
[YEAR] INT '$.year',
STATUS BIT '$.status',
COLOR NVARCHAR(MAX) '$.color' AS JSON,
MODEL NVARCHAR(MAX) '$.Model' AS JSON);
GO


DECLARE @JSON2 NVARCHAR(500) = N'{"arr":[
  {"owner": null,
  "brand": "BMW",
  "year": 2020,
   "status": false,
  "color": [ "red", "white", "yellow" ]},

  {"owner": null,
  "brand": "AUDI",
  "year": 2019,
   "status": false,
  "color": [ "blue", "black", "yellow" ]}]
}'
--SELECT JSON_VALUE (@JSON2,'$.arr[1].year')'Year';
SELECT * FROM OPENJSON(@JSON2)
WITH(OWNER VARCHAR(20) '$.arr[1].owner',
BRAND VARCHAR(20) '$.arr[1].brand',
YEAR_ INT '$.arr[1].year',
STATUS_ BIT '$.arr[1].status')
CROSS APPLY OPENJSON(@JSON2,'$.arr[1].color')WITH(
COLOR VARCHAR(20) '$')

GO
DECLARE @c NVARCHAR(MAX) = N'{"arr":[2,68,5,3,2,8,6]}'
INSERT INTO val VALUES(JSON_VALUE(@c,'$.arr[0]')),
(JSON_VALUE(@c,'$.arr[1]')),
(JSON_VALUE(@c,'$.arr[2]')),
(JSON_VALUE(@c,'$.arr[3]')),
(JSON_VALUE(@c,'$.arr[4]'));

CREATE TABLE val (
[Values] INT
);
drop table val;
SELECT * FROM val;

/*----------------------------------------------------USE JSON Functions to get Values FROM ARRAY-----------------------------------------------------*/
DECLARE @arr NVARCHAR(500) ;							/*JSON_QUERY*/
SET @arr = N'{
"employees":
[      {
         "name":"Raj",
         "email":"raj@gmail.com",
         "age":32,
		 "Address":{"Village":"Sohna","City":"Jaipur","Country":"India"}
          
},
      {
         "name":"Mohan",
         "email":"Mohan@yahoo.com",
         "age":21,
         "Address":{"Village":"Sohna","City":"Jaipur","Country":"India"}
        }   
]
}';

--SELECT JSON_VALUE(@arr,'$.employee')                              /*IT will give null*/
--SELECT JSON_VALUE(@arr,'strict$.employee')                       /*strict for errer ,by default its null*/
--SELECT JSON_QUERY(@arr,'$')employee_String;						/*TO GET array string*/
--SELECT JSON_QUERY(@arr,'$.employees')employee_Array;              /*to get employee array*/
--SELECT JSON_QUERY(@arr,'$.employees[0]')employee_Object;
--SELECT JSON_QUERY(@arr,'$.employees[0].name')                     /*null*/
--SELECT JSON_QUERY(@arr,'$.employee[0].Address')                    /*null/
--SELECT JSON_VALUE(@arr,'$.employees[1].name')                      /*IT will give singel value of key*/
SELECT JSON_VALUE(@arr,'$.employees[1].Address.City')                      /*IT will give singel value of key*/


/*----------------------------------------------------------------------------------------------------------------------------------*/
