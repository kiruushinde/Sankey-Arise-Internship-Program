create database demohms;

use demohms;

-- creating hospital table ---------------------
create table hospital(
	name varchar(100) primary key,
	city varchar(50)
);

insert into hospital(name, city) values ('CPR', 'Kolhapur');
insert into hospital(name, city) values ('Apple', 'Kolhapur');

select * from hospital;

------------------------------------------------

-- creating doctor table

create table doctor(
	doctor_id varchar(5) primary key,
	name varchar(20) not null
);

insert into doctor values
('d1', 'Dr.Kiran'),
('d2', 'Dr.Omkar'),
('d3', 'Dr.Suraj'),
('d4', 'Dr.Alis'),
('d5', 'Dr.Maya');

select * from doctor;

--------------------------------------------

-- creating patient table
create table patient(
	pid varchar(5) primary key,
	fname varchar(20) not null,
	lname varchar(20),
	insuranceExpired int DEFAULT 0,
);

insert into patient values
('p1', 'John', 'Smith', 0),
('p2', 'Mary', 'Jones', 0),
('p3', 'Rajesh', 'Kumar', 0),
('p4', 'Lisa', 'Chen', 0);

insert into patient(pid, fname, lname, insuranceExpired) values ('p5', 'Love', 'Babbar', 0);

select * from patient;
---------------------------------------------

-- creating insurance table to check the expirary
CREATE TABLE InsuranceLimits (
    pid VARCHAR(5) PRIMARY KEY,
    limitAmount INT,
    expiryDate DATE,
    FOREIGN KEY (pid) REFERENCES patient(pid)
);

-- create insurance for all the patients
insert into InsuranceLimits values
('p1', 5000, '2023-12-31'),
('p2', 1000, '2024-01-15');
insert into InsuranceLimits(pid, expiryDate) values('p3', '2024-02-25');
insert into InsuranceLimits values
('p4', 10000, '2025-01-01'),
('p5', 15000, '2024-06-13');

update InsuranceLimits 
set limitAmount = 8000
where pid = 'p3';

select * from InsuranceLimits;

--------------------------------------------
-- creating patientDisease details table

create table patientDisease(
	pid varchar(5),
	disease varchar(200) not null,
	primary key (pid, disease),
	foreign key(pid) references patient(pid),
);

insert into patientDisease values
('p1', 'Anxity'),
('p2', 'Asthama'),
('p2', 'Acne'),
('p3', 'Bone Cancer');

select * from patientDisease;

---------------------------------------------------

-- patient diagnosis with data

create table diagnosis
(
	patientId varchar(5),
	diagnosis varchar(50),
	DiagnosisDate DATE,
	equipment varchar(50),
	primary key(patientId, diagnosis),
	foreign key(patientId) references patient(pid),
);


insert into diagnosis values
('p1', 'Asthama', '2024-01-30', 'ECG'),
('p1', 'Blood test', '2024-02-15', 'Microscopes'),
('p2', 'Body Scan', '2024-01-10', 'X-Ray machine'),
('p3', 'Body Scan', '2023-12-29', 'X-Ray machine');

insert into diagnosis (patientId, diagnosis, DiagnosisDate, equipment) 
values ('p2', 'Urin Test', '2024-01-10', 'Microscopes');

select * from diagnosis;

-------------------------------------------------------------------

-- crate diagnosis cost table
create table diagnosisCost
(
	euquipment varchar(50) primary key,
	cost int,
);

insert into diagnosisCost values
('Microscopes', 500),
('ECG', 300),
('X-Ray machine', 899);

select * from diagnosisCost;

------------------------------------------------------

-- creating doctorsPatient details (which doctor is treating to what patient..

create table docPatientDetails(
	doctor_id varchar(5),
	pid varchar(5),
	primary key (doctor_id, pid),
	foreign key(doctor_id) references doctor(doctor_id),
	foreign key(pid) references patient(pid)
);

-- inserting values into docpatient details
insert into docPatientDetails values
('d1', 'p1'),
('d1', 'p2'),
('d2', 'p3');

select * from docPatientDetails;

---------------------------------------------------------------

-- create equipment table
create table equipment(
	eq_id varchar(5) primary key,
	eq_name varchar(20)
);

insert into equipment(eq_id, eq_name) values('e1', 'x-ray machine');
insert into equipment(eq_id, eq_name) values('e2', 'ECG');
insert into equipment(eq_id, eq_name) values('e3', 'ventilator');
insert into equipment(eq_id, eq_name) values('e4', 'scissors');
insert into equipment(eq_id, eq_name) values('e5', 'Microscopes');

select * from equipment where eq_name = 'x-ray machine';
select * from equipment where eq_id = 'e4';


select * from equipment;

------------------------------------------------------------------

-- creating nurse table
create table nurse(
	nurse_id varchar(5) primary key,
	n_fname varchar(15) not null,
	n_lname varchar(15)
);

insert into nurse(nurse_id, n_fname, n_lname) values('n1', 'Utkuuu', 'Ghatage');
insert into nurse(nurse_id, n_fname, n_lname) values('n2', 'Smitali', 'Erudkar');
insert into nurse(nurse_id, n_fname, n_lname) values('n3', 'Aishwarhya', 'Bacchan');
insert into nurse values
('n4', 'Lila', 'Henderson'),
('n5', 'Aria', 'Mills'),
('n6', 'Lina', 'Garcia'),
('n7', 'Eva', 'Este');


-- create index on nurse table
create index nurseIndex
on nurse (nurse_id);

select * from nurse where nurse_id = 'n3';

---------------------------------------------------------------------------

-- creating department table
create table department(
	dpt_id varchar(5) primary key,
	dpt_name varchar(20) not null,
);

insert into department values
('dpt01', 'emergency'),
('dpt02', 'medical'),
('dpt03', 'operation theatre');

select * from department;

---------------------------------------------------------------

-- create table for department doctors..which doctors are belonging to which department

create table deptDoctors(
	dept_id varchar(5),
	doc_id varchar(5),
	primary key(dept_id, doc_id),
	foreign key(dept_id) references department(dpt_id),
	foreign key(doc_id) references doctor(doctor_id)
);

insert into deptDoctors values
('dpt01', 'd1'),
('dpt01', 'd2'),
('dpt01', 'd3'),
('dpt02', 'd4'),
('dpt03', 'd5');

select * from deptDoctors;

----------------------------------------------------------------------


-- there are also nurse in the department, create table for that
create table deptNurse(
	dept_id varchar(5),
	nurse_id varchar(5),
	primary key(dept_id, nurse_id),
	foreign key(dept_id) references department(dpt_id),
	foreign key(nurse_id) references nurse(nurse_id)
);

-- insert data for department nurses
insert into deptNurse values
('dpt01', 'n1'),
('dpt01', 'n2'),
('dpt01', 'n3'),
('dpt02', 'n1'),
('dpt02', 'n4'),
('dpt02', 'n5');

select * from deptNurse;

----------------------------------------------------------------------------------

-- Answering Questions

-- fetching details of name of patient using id
select pid, fname, lname from patient where pid = 'p1';

-- fetch diagnosis details of patient
select * from diagnosis where patientId='p1';

-- generating bill. We need to use join on three tables patient, diagnosis and cost.
-- (keep in mind that, give only that statements which can be grouped..)
SELECT
    p.pid AS PatientID,
    p.fname AS FirstName,
    p.lname AS LastName,

    sum(dc.cost) AS totalBill
FROM
    patient p
JOIN
    diagnosis d ON p.pid = d.patientId
JOIN
    diagnosisCost dc ON d.equipment = dc.euquipment
where 
	p.pid = 'p1'
Group by
    p.pid, p.fname, p.lname;

-- Fetching data from multiple tables..
-- which doctor is giving treatment to which patient. we use doctor patient details table.

select 
	doc.doctor_id, 
	doc.name, 
	p.pid,
	p.fname,
	p.lname
from
	doctor doc
join 
	docPatientDetails  docDet on doc.doctor_id = docDet.doctor_id
join
	patient p on p.pid = docDet.pid;

-- creating view to fech the detials of patients
create view fetchPatients as
	select 
		p.pid, 
		p.fname,
		p.lname, 
		pd.disease 
	from 
		patient p 
	join 
		patientDisease pd on p.pid = pd.pid  

-- this is how we execute the view
select * from fetchPatients;


-- optimizing bill generation usign stored procedure
CREATE PROCEDURE generateBill @patient_id varchar(5)
AS
	SELECT
		p.pid AS PatientID,
		p.fname AS FirstName,
		p.lname AS LastName,
		sum(dc.cost) AS totalBill
	FROM
	   patient p
	JOIN
		diagnosis d ON p.pid = d.patientId
	JOIN
		diagnosisCost dc ON d.equipment = dc.euquipment
	where 
		p.pid = @patient_id
	Group by
		p.pid, p.fname, p.lname;


exec generateBill @patient_id = 'p2'; -- this is how we execute the procedure..

-- Add necessary triggers to indicate when patients medical insurance limit has expired.

