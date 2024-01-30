
-- use practice;


-- SELECT *
-- from person;

-- creating procedure

-- 1. basic 
-- use practice;

CREATE PROCEDURE shownames
AS
select name
from person 
GO;

exec shownames;

-- 2. with parameter

-- when you want to send parameters, then you will use @parameter after the name of procedure, and you can have any no. of parameters 

CREATE PROCEDURE shownames1
    @age INT
AS
SELECT *
from person
WHERE age > @age;

exec shownames1 @age = 15;

-- and while executing the procedure, you will use exec keyword and pass the necessary parameters.


-- 3. with more parameters 

CREATE PROCEDURE shownames7
    @age int,
    @gender CHAR
AS
select *
from person
where age > @age AND gender = @gender;

exec shownames7 @age = 20, @gender = 'f';