/*
    T-SQL : Transact SQL
    system databases are 
    > master 
    > model
    > msdb
    > tempdb 

*/

create DATABASE demoDatabase;

ALTER DATABASE demoDatabase MODIFY name = new_DemoDatabase;

ALTER DATABASE new_DemoDatabase MODIFY name = DemoDatabase;

use DemoDatabase;

CREATE TABLE employees
(
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(100),
    department VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

select *
from employees;

-- modifying table adding column
Alter TABLE employees ADD Country varchar(20) null;

-- deleting column
ALTER TABLE employees DROP COLUMN Country;

-- adding vlaues to it
INSERT INTO employees
    (employee_id, first_name, last_name, job_title, department, hire_date, salary)
VALUES
    (1, 'John', 'Doe', 'Software Engineer', 'IT', '2022-01-01', 75000.00);

CREATE TABLE test
(
    id int PRIMARY KEY,
    age int CHECK(age <= 25),
);

INSERT INTO test
    (id, age)
VALUES(1, 20);
INSERT INTO test
    (id, age)
VALUES(1, 27);
SELECT *
from test;


create table studentPK
(
    rollNo int PRIMARY KEY
);

CREATE TABLE studentMarksFK
(
    rollNo int,
    eng int,
    phy int,
    chem int,
    FOREIGN KEY (rollNo) REFERENCES studentPK(rollNo)
);

INSERT INTO studentPK
    (rollNo)
VALUES
    (1);
INSERT INTO studentMarksFK
    (rollNo, eng, phy, chem)
VALUES
    (1, 23, 23, 89);

SELECT *
from studentPK;
SELECT *
from studentMarksFK;

/*
    #️⃣ what is super key ?
    --> it is key by using which you can identify a column uniquely. 
    e.g. id, id + name etc.

    #️⃣ candidate key 
    --> any attribute can be candidate key, but there should be unique values in that column. 

    e.g. firstname cannot be candidate key as it contains duplicate values. 
    so, by adding emain, phone no. to the table we can find candidate key. 

    #️⃣ Primary key 
    --> uniquely identifies each row in a table and it cannot be null 
    --> there can be only one primary key in a table 

    #️⃣ Unique key 
    --> it uniquely identifies the column
    --> there can be multiple unique keys 

    #️⃣ Foreign key 
    --> it takes reference from the primary key 
    --> it links two tables together 

*/

SELECT *
from employees;

INSERT INTO employees
    (employee_id, first_name, last_name, job_title, department, hire_date, salary)
VALUES
    (2, 'Jane', 'Smith', 'Marketing Specialist', 'Marketing', '2022-02-15', 60000.00),
    (3, 'Robert', 'Johnson', 'Financial Analyst', 'Finance', '2022-03-10', 80000.00),
    (4, 'Emily', 'Brown', 'HR Manager', 'Human Resources', '2022-04-05', 90000.00),
    (5, 'Michael', 'Williams', 'Sales Representative', 'Sales', '2022-05-20', 70000.00);

-- selecting top 4 empnames from table 
select top 4
    first_name
from employees;

-- selecting 50 percent records i.e if 10 then 5 records are displayed 

select top 50 percent
    first_name
from employees;

select DISTINCT hire_date
from employees;

-- #️⃣ not operators: <> 

/*
    Logical operators in COMMENT sql
    1. and 
    2. or 
    3. between: within the range 
    4. exists: checks whether the row is present or not with specified condition 
    5. like: used to compare 
    6. not 
    7. is null 


*/

-- using between 
select *
from employees
WHERE salary BETWEEN 75000.00 and 100000.00;

-- using exits
if exists(select *
from employees
WHERE employee_id=5)
PRINT 'Yes employee with id 5 exists'
else
PRINT 'No';

-- find the name of employees whose name starts with character like a, b, m etc. 
SELECT *
from employees
WHERE first_name LIKE 'm%';

-- find the name of employees whose name ends with character like a, b, m etc. 
SELECT *
from employees
WHERE first_name LIKE '%n';

-- find the name of employees whose name starts with character like a, b, m etc. 
SELECT *
from employees
WHERE first_name LIKE '%a%';

-- underscore: if _ : matches string with one character
/*
    __ : two underscore two lenght
    so on.
*/
SELECT *
from employees
WHERE first_name LIKE '____';

-- #️⃣ String functions 

select ASCII('a') as ASCIIValue;
select ASCII('A') as ASCIIValue;
select ASCII('z') as ASCIIValue;

select CHAR(89);

select CHARINDEX('me', 'this is me kiran');

select concat('kiran','meow');

SELECT CONCAT_WS('_', 'My', 'name', 'is', 'Meow🐱');

select LEFT('HelloMeow', 4);
select right('HelloMeow', 4);

SELECT len('Hello mazi Utkuuu');

SELECT UPPER('hellomazimeow');
SELECT lower('HELLOMEOW');

select RTRIM('utkuuu    ');
select LTRIM('    utkuuu    ');


/*
    #️⃣ Implementing joins 


*/

use DemoDatabase;
-- Create the "departments" table
CREATE TABLE departments
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments
    (department_id, department_name)
VALUES
    (1, 'IT'),
    (2, 'Marketing'),
    (3, 'Finance'),
    (4, 'Human Resources'),
    (5, 'Sales');

INSERT INTO departments
    (department_id, department_name)
VALUES(11, 'Human Resources');

-- insert few more to employees
INSERT INTO employees
    (employee_id, first_name, last_name, job_title, department, hire_date, salary)
VALUES
    (6, 'Sarah', 'Jones', 'Data Scientist', 'IT', '2022-06-15', 85000.00),
    (7, 'David', 'Miller', 'Graphic Designer', 'Marketing', '2022-07-20', 65000.00),
    (8, 'Amanda', 'Lee', 'Accountant', 'Finance', '2022-08-25', 75000.00),
    (9, 'Christopher', 'Taylor', 'Recruiter', 'Human Resources', '2022-09-30', 70000.00),
    (10, 'Jennifer', 'Anderson', 'Sales Manager', 'Sales', '2022-10-05', 95000.00);

select *
from departments;

select *
from employees;

-- in both the tables two columns are same i.e. id 

-- #️⃣ Inner join: it combines two tables and returns the matching rows. this is done by using unique identifier in both tables e.g. id 

SELECT emp.employee_id, emp.first_name, emp.last_name, emp.job_title, departments.department_name
from employees emp
    INNER JOIN departments on (emp.employee_id = departments.department_id);

-- #️⃣ Left Join : it returns all the records from left table, but for those records that are not matching in right table, it returns null for them

SELECT dpt.department_id, dpt.department_name, emp.first_name, emp.last_name
from departments dpt LEFT JOIN employees emp on emp.employee_id = dpt.department_id;


-- #️⃣ Right Join: it returns all the rows from right table, but in the left table if particular value is not found then null is returned. 
-- in right table there are 10 records, so 10 rows are in output, but in left there 5 matching so, ohter 5 are retuned with null value.COMMENT
SELECT dpt.department_id, dpt.department_name, emp.first_name, emp.last_name
from departments dpt RIGHT JOIN employees emp on emp.employee_id = dpt.department_id;

-- #️⃣ full join --> left + right - duplicate rows 
SELECT dpt.department_id, dpt.department_name, emp.first_name, emp.last_name
from departments dpt FULL JOIN employees emp on emp.employee_id = dpt.department_id;

-- #️⃣ Cross join : every record from left table is multiplied with the each record of right table. 

SELECT dpt.department_id, dpt.department_name, emp.first_name, emp.last_name
from departments dpt cross JOIN employees emp;