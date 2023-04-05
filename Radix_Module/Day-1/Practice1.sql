USE SQL_Practice;
GO 

CREATE TABLE countries(
country_id INT NOT NULL,
country_name VARCHAR NOT NULL,
region_id INT NOT NULL
);

ALTER TABLE countries ADD CONSTRAINT rist CHECK(country_name IN('Italy','India','China'));
ALTER TABLE countries ADD CONSTRAINT uq_countries UNIQUE(country_id,region_id)
ALTER TABLE countries ALTER COLUMN country_name VARCHAR(5) NOT NULL

INSERT INTO countries (country_id,country_name,region_id) 
VALUES (1,'Italy',101);
INSERT INTO countries (country_id,country_name,region_id) 
VALUES (2,'Italy',101);
INSERT INTO countries (country_id,country_name,region_id) 
VALUES (5,'India',107); 
INSERT INTO countries (country_id,country_name,region_id) 
VALUES (3,'China',111); 

SELECT * FROM countries
DROP TABLE IF EXISTS countries
GO

CREATE TABLE job_history(
employee_id INT PRIMARY KEY NOT NULL,
start_date DATE NOT NULL,
end_date VARCHAR(10) CONSTRAINT d CHECK(end_date LIKE'__/__/____') NOT NULL,
job_id DECIMAL(4,0) NOT NULL,
department_id INT NOT NULL
);
INSERT INTO job_history VALUES(3,'2015-06-19','15/11/2022',87,4) 
INSERT INTO job_history VALUES(2,'2012-07-29','31/01/2015',1,3) 
INSERT INTO job_history VALUES(4,'2012-07-29','31/01/2015',2,2) 

SELECT * FROM job_history
DROP TABLE job_history


CREATE TABLE jobs(
job_id DECIMAL(4,0) NOT NULL PRIMARY KEY,
job_title VARCHAR(20)NOT NULL DEFAULT' ',
min_salary DECIMAL(5,0) DEFAULT 8000,
max_salary DECIMAL(7,0) DEFAULT NULL
);
INSERT INTO jobs(job_id) VALUES(1);
INSERT INTO jobs(job_id) VALUES(87);
INSERT INTO jobs(job_id) VALUES(83);
SELECT * FROM jobs
DROP TABLE IF EXISTS jobs  
GO


CREATE TABLE departments(
department_id DECIMAL(4,0) PRIMARY KEY,
department_name VARCHAR(20) NOT NULL
);
INSERT INTO departments VALUES (7,'ABC')
DROP TABLE departments

CREATE TABLE employees(
employee_id DECIMAL(4,0) PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(30),
phone_number VARCHAR(10),
hire_date DATE,
job_id DECIMAL(4,0)NOT NULL FOREIGN KEY REFERENCES jobs(job_id),
salary DECIMAL(6,0),
commission DECIMAL(4,0),
manager_id DECIMAL(4,0),
department_id DECIMAL(4,0) FOREIGN KEY REFERENCES departments (department_id)
);
INSERT INTO employees VALUES (101,'Rohit','Sharma','RO@573','1234567813','2012-12-30',1,654325,2334,23,07);
SELECT * FROM employees
DROP TABLE IF EXISTS employees;

