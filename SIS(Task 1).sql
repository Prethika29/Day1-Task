create database SIS;
use SIS;

-- Table 1.Students
create table Students
(
student_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date,
email varchar(50) unique,
phone_number varchar(15)
);

-- Table 4: Teacher
create table teacher(
teacher_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique
);

-- Table 2: Courses
create table Courses(
course_id int auto_increment primary key,
course_name varchar(50) not null,
credits int,
teacher_id int,
foreign key (teacher_id) references Teacher(teacher_id)
);

-- Table 3: Enrollments
create table Enrollments(
enrollment_id int auto_increment primary key,
student_id int,
foreign key (student_id) references Students(student_id),
course_id int,
foreign key (course_id) references Courses(course_id),
enrollment_date date);

-- Table 5: Payments
create table Payments(
payment_id int auto_increment primary key,
student_id int,
foreign key (student_id) references Students(student_id),
amount decimal(10,2),
payment_date date
);

-- Insert into tables
-- 1.Students
insert into Students (student_id, first_name, last_name, date_of_birth, email, phone_number) values
(1, 'Arun', 'Kumar', '2005-06-01', 'arun.kumar@gmail.com', '9874563210'),
(2, 'Karthik', 'Raj', '2002-05-23', 'karthik.raj@gmail.com', '9870123456'),
(3, 'Suresh', 'Vel', '2000-12-09', 'suresh.vel@gmail.com', '9012365478'),
(4, 'Vijay', 'Murugan', '2004-12-09', 'vijay.murugan@gmail.com', '8012345679'),
(5, 'Praveen', 'Selvan', '2001-08-08', 'praveen.selvan@gmail.com', '8794561230'),
(6, 'Anitha', 'Mani', '2003-03-19', 'anitha.mani@gmail.com', '7894561230'),
(7, 'Divya', 'Rajan', '2005-02-26', 'divya.rajan@gmail.com', '7012345689'),
(8, 'Priya', 'Pandian', '2001-03-22', 'priya.pandian@gmail.com', '7984561230'),
(9, 'Lakshmi', 'Nathan', '2001-05-11', 'lakshmi.nathan@gmail.com', '6012345789'),
(10, 'barathi', 'Sankar', '2005-11-01', 'barathi.sankar@gmail.com', '6789451230');

-- 4. Teacher
-- Insert Teachers
INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Meena', 'Rajan', 'meena.rajan@school.edu'),
(2, 'Ganesh', 'Sankar', 'ganesh.sankar@school.edu'),
(3, 'Deepa', 'Murugan', 'deepa.murugan@school.edu'),
(4, 'Vijay', 'Mani', 'vijay.mani@school.edu'),
(5, 'Bhavani', 'Pandian', 'bhavani.pandian@school.edu'),
(6, 'Senthil', 'Vel', 'senthil.vel@school.edu'),
(7, 'Keerthi', 'Kumar', 'keerthi.kumar@school.edu'),
(8, 'Arun', 'Nathan', 'arun.nathan@school.edu'),
(9, 'Divya', 'Selvan', 'divya.selvan@school.edu'),
(10, 'Suresh', 'Raj', 'suresh.raj@school.edu');

-- 2.Courses
insert Courses (course_id, course_name, credits, teacher_id) values
(1, 'Tamil', 2, 5),
(2, 'English', 3, 6),
(3, 'Mathematics', 3, 6),
(4, 'Biology', 3, 6),
(5, 'Physics', 2, 7),
(6, 'Chemistry', 3, 5),
(7, 'History', 2, 1),
(8, 'Geography', 3, 9),
(9, 'Computer Science', 2, 3),
(10, 'Economics', 2, 4);

-- 3. Enrollments
insert into Enrollments (enrollment_id, student_id, course_id, enrollment_date) values
(1, 7, 9, '2024-12-18'),
(2, 9, 3, '2024-05-28'),
(3, 7, 2, '2023-06-02'),
(4, 9, 2, '2024-07-24'),
(5, 4, 1, '2024-04-13'),
(6, 10, 5, '2025-03-11'),
(7, 2, 10, '2024-02-22'),
(8, 6, 4, '2024-07-30'),
(9, 10, 5, '2025-04-18'),
(10, 9, 3, '2024-09-23');

-- 5. Payments
insert into Payments (payment_id, student_id, amount, payment_date) values
(1, 6, 4226.31, '2023-06-28'),
(2, 3, 4820.34, '2023-06-28'),
(3, 4, 4663.66, '2024-07-03'),
(4, 8, 1592.64, '2023-05-01'),
(5, 3, 1602.58, '2025-02-07'),
(6, 3, 4633.30, '2025-02-07'),
(7, 6, 4367.06, '2024-09-07'),
(8, 5, 1701.35, '2024-07-27'),
(9, 9, 4127.13, '2024-04-21'),
(10, 2, 3903.52, '2024-11-01');