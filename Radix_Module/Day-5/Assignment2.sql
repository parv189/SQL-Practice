USE SQL_Practice3;
CREATE TABLE Student(
Name VARCHAR(20), 
Address VARCHAR(50), 
City VARCHAR(20), 
DOB DATE, 
Standard INT
);
Drop Table Student;
DECLARE @stu NVARCHAR(MAX) = N'{
"Arr":[{"Name":"Ahan",
	"Address":"102,Binori Gracia, Bopal",
	"City":"Ahmedabad",
	"DOB":"2007-05-24",
	"Standard":11},

	{"Name":"Diya",
	"Address":"404, Ashok Socity, Vasana",
	"City":"Ahmedabad",
	"DOB":"2008-01-13",
	"Standard":10}
	]}'
INSERT INTO Student VALUES (JSON_VALUE(@stu,'$.Arr[0].Name'),JSON_VALUE(@stu,'$.Arr[0].Address'),
JSON_VALUE(@stu,'$.Arr[0].City'),JSON_VALUE(@stu,'$.Arr[0].DOB'),JSON_VALUE(@stu,'$.Arr[0].Standard'));
INSERT INTO Student VALUES (JSON_VALUE(@stu,'$.Arr[1].Name'),JSON_VALUE(@stu,'$.Arr[1].Address'),
JSON_VALUE(@stu,'$.Arr[1].City'),JSON_VALUE(@stu,'$.Arr[1].DOB'),JSON_VALUE(@stu,'$.Arr[1].Standard'));
SELECT * FROM Student;

