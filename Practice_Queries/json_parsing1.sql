USE test1;
GO

DECLARE @JSON NVARCHAR(MAX) = N'{
"brand": "BMW",
"year": 2019,
"price": 1234.6,
"color": "red",
"owner": null
}'
EXEC P @JSON;

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
EXEC P @JSON2

SELECT * FROM OPENJSON(@JSON2);
GO

CREATE PROCEDURE P (@X NVARCHAR(500))
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
EXEC P @JSON;
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
EXEC P @JSON2;
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
[YEAR] INT '$.yesr',
STATUS BIT '$.ststus',
COLOR NVARCHAR(MAX) '$.color' AS JSON,
MODEL NVARCHAR(MAX) '$.model' AS JSON);
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
YEAR_ INT '$.year',
STATUS_ BIT '$.status',
COLORS NVARCHAR(MAX) '$.color' AS JSON,
MODEL NVARCHAR(MAX) '$.Model' AS JSON)
CROSS APPLY OPENJSON(COLORS)WITH(
COLOR VARCHAR(20) '$')
CROSS APPLY OPENJSON(MODEL)WITH(
Model_Data VARCHAR(200) '$')
GO