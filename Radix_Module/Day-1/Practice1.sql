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