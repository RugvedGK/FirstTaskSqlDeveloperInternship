use abc_hospital;

create table patient(
patientId int primary key,
pname varchar(30),
gender varchar(2),
dob date,
address varchar(40),
phone bigint unique,
email varchar(30),
blood_group varchar(7));

create table department(
departmentId int primary key,
name varchar(40),
location varchar(40)
);

create table doctor(
doctor_id int primary key,
name varchar(40),
specification varchar(40),
phone bigint unique,
email varchar(40),
departmentId int,
foreign key(departmentId) references department(departmentId)
);

create table appointment(
appointment_id int primary key,
appointment_date date,
appointment_time time,
patientId int,
foreign key (patientId) references patient(patientId),
doctor_id int,
foreign key (doctor_id) references doctor(doctor_id)
);

create table treatment(
treatment_id int primary key,
appointment_id int,
foreign key (appointment_id) references appointment(appointment_id),
description varchar(200),
prescription varchar(200)
);

CREATE TABLE bill (
bill_id INT PRIMARY KEY,
patientId INT,
treatment_id INT,
amount DECIMAL(10, 2),
payment_status VARCHAR(20),
billDate DATE,
FOREIGN KEY (patientId) REFERENCES patient(patientId),
FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

CREATE TABLE Staff (
StaffID INT PRIMARY KEY,
Name VARCHAR(100),
Role VARCHAR(50),
Phone VARCHAR(15),
Email VARCHAR(100),
DepartmentID INT,
FOREIGN KEY (departmentID) REFERENCES department(departmentID)
);
 