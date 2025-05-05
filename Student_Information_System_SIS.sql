drop database SIS;
create database SIS;
use SIS;

-- Table 1.Students
create table Students
(
student_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
student_name varchar(100) generated always as (concat(first_name, ' ' , last_name)),
date_of_birth date,
email varchar(50) unique,
phone_number varchar(15)
);

-- Table 4: Teacher
create table teacher(
teacher_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
teacher_name varchar(100) generated always as (concat(first_name, ' ', last_name)),
email varchar(50) unique
);

-- Table 2: Courses
create table Courses(
course_id int auto_increment primary key,
course_name varchar(50) not null,
credits int,
teacher_id int,
constraint fk1 foreign key (teacher_id) references Teacher(teacher_id) on delete set null on update cascade
);

-- Table 3: Enrollments
create table Enrollments(
enrollment_id int auto_increment primary key,
student_id int,
constraint fk2 foreign key (student_id) references Students(student_id) on delete cascade on update cascade,
course_id int,
constraint fk3 foreign key (course_id) references Courses(course_id) on delete cascade on update cascade,
enrollment_date date);

-- Table 5: Payments
create table Payments(
payment_id int auto_increment primary key,
student_id int,
constraint fk4 foreign key (student_id) references Students(student_id) on delete cascade on update cascade,
amount decimal(10,2) not null,
payment_date date not null
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
select * from Students;

-- 4. Teacher
-- Insert Teachers
insert into Teacher (teacher_id, first_name, last_name, email) values
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
select * from Teacher;

-- 2.Courses
insert into Courses (course_id, course_name, credits, teacher_id) values
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
select * from Courses;

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
select * from Enrollments;

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
select * from Payments;

-- Tasks 2: Select, Where, Between, AND, LIKE: 

-- 2.1 Write an SQL query to insert a new student into the "Students" table with the following details: 
insert into Students (first_name, last_name, date_of_birth, email, phone_number) values 
('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
select * from Students;

-- 2.2 Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
insert into Enrollments (student_id, course_id, enrollment_date) values (3, 4, current_date());
select * from Enrollments;

-- 2.3 Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and  modify their email address.  
update Teacher set email = 'ganesh.newemail@school.edu' where teacher_id = 2;
select * from Teacher;

-- 2.4 Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course. 
delete from Enrollments where student_id = 3 and course_id = 4;
select * from Enrollments;

-- 2.5 Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
update Courses set teacher_id = 8 where course_id = 5;
select * from Courses;

-- 
-- 2.6 Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity. 
delete from Students where student_id = 3;
select * from Students;

-- 2.7 Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount. 
update Payments set amount = 4500.00 where payment_id = 3;
select * from Payments;

------------------------------------------------------------------------------------------------------------------------------------
-- Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:  

-- 3.1 Write an SQL query to calculate the total payments made by a specific student. 
-- You will need to join the "Payments" table with the "Students" table based on the student's ID.
select s.student_id, s.student_name, sum(p.amount) as total_payments
from Students s
inner join Payments p using (student_id)
where s.student_id = 6
group by s.student_id;

-- 3.2 Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table. 
select c.course_id, c.course_name, count(e.student_id) as enrolled_students
from Courses c
inner join Enrollments e using (course_id)
group by c.course_id;

-- 3.3 Write an SQL query to find the names of students who have not enrolled in any course. 
-- Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select s.student_id, s.student_name
from Students s
left join Enrollments e using (student_id)
where e.enrollment_id is null;

-- 3.4 Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. 
-- Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables. 
select s.student_name, c.course_name
from Students s
inner join Enrollments e using (student_id)
inner join Courses c using (course_id);

-- 3.5 Create a query to list the names of teachers and the courses they are assigned to. 
-- Join the "Teacher" table with the "Courses" table. 
select t.teacher_name, c.course_name
from Teacher t
inner join Courses c using (teacher_id);

-- 3.6 Retrieve a list of students and their enrollment dates for a specific course. 
-- You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
select s.student_name, c.course_name, e.enrollment_date
from Students s
inner join Enrollments e using (student_id)
inner join Courses c using (course_id)
where c.course_name = 'Biology';

-- 3.7 Find the names of students who have not made any payments. 
-- Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
select s.student_id, s.student_name
from Students s
left join Payments p using (student_id)
where p.payment_id is null;

-- 3.8 Write a query to identify courses that have no enrollments. 
-- You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
select c.course_id, c.course_name
from Courses c
left join Enrollments e using (course_id)
where e.enrollment_id is null;

-- 3.9 Identify students who are enrolled in more than one course. 
-- Use a self-join on the "Enrollments" table to find students with multiple enrollment records. 
select s.student_id, s.student_name, count(e.course_id) as course_count
from Students s
inner join Enrollments e using (student_id)
group by s.student_id, student_name
having count(e.course_id) > 1;

-- 3.10 Find teachers who are not assigned to any courses. 
-- Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments. 
select t.teacher_id, t.teacher_name
from teacher t
left join Courses c using (teacher_id)
where c.course_id is null;

-------------------------------------------------

-- Task 4 Subquery and its type
-- 4.1 Write an SQL query to calculate the average number of students enrolled in each course. 
-- Use aggregate functions and subqueries to achieve this.
select c.course_id, c.course_name,
    ( select count(*)
        from Enrollments e
        where e.course_id = c.course_id
    ) as enrollment_count
from Courses c;

-- 4.2 Identify the student(s) who made the highest payment. 
-- Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount. 
select s.student_id, s.student_name, p.amount
from Students s
inner join Payments p using (student_id)
where p.amount = (
    select max(amount) from Payments
);

-- 4.3 Retrieve a list of courses with the highest number of enrollments. 
-- Use subqueries to find the course(s) with the maximum enrollment count. 
select c.course_id, c.course_name, count(e.student_id) as enrollment_count
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name
having count(e.student_id) = (
    select max(enroll_count)
    from (
        select count(*) as enroll_count
        from enrollments
        group by course_id
    ) as sub
)order by course_id asc;

-- Task 4.4 Calculate the total payments made to courses taught by each teacher. 
-- Use subqueries to sum payments for each teacher's courses.
select t.teacher_id, teacher_name,
       (
         select sum(p.amount)
         from Payments p
         inner join Enrollments e using (student_id)
         inner join Courses c using (course_id)
         where c.teacher_id = t.teacher_id
       ) as total_payments
from Teacher t;

-- 4.5 Identify students who are enrolled in all available courses. 
-- Use subqueries to compare a student's enrollments with the total number of courses. 
select s.student_id, student_name
from Students s
where (
    select count(distinct e.course_id)
    from Enrollments e where e.student_id = s.student_id) = (
    select count(*) from Courses
);

-- 4.6 Retrieve the names of teachers who have not been assigned to any courses. 
-- Use subqueries to find teachers with no course assignments. 
select teacher_id, teacher_name
from Teacher
where teacher_id not in (
    select distinct teacher_id from Courses where teacher_id is not null
);

-- 4.7 Calculate the average age of all students. 
-- Use subqueries to calculate the age of each student based on their date of birth. 
select avg(student_age) as average_age
from (
    select timestampdiff(year, date_of_birth, curdate()) as student_age
    from Students
) as age_data;

-- 4.8 Identify courses with no enrollments. 
-- Use subqueries to find courses without enrollment records.
select course_id, course_name
from Courses
where course_id not in (
    select distinct course_id from Enrollments
);

-- 4.9 Calculate the total payments made by each student for each course they are enrolled in. 
-- Use subqueries and aggregate functions to sum payments.
select s.student_id, student_name, c.course_id, c.course_name, (
        select sum(p.amount)
        from Payments p
         where p.student_id = s.student_id
    )  total_payments
from Students s
inner join Enrollments e using (student_id)
inner join Courses c using (course_id)
group by s.student_id, c.course_id
order by student_id asc;

-- 4.10 Identify students who have made more than one payment. 
-- Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
select student_id, student_name
from Students
where student_id in (
    select student_id
    from Payments
    group by student_id
    having count(payment_id) > 1
);

-- 4.11 Write an SQL query to calculate the total payments made by each student. 
-- Join the "Students" table with the "Payments" table and 
-- use GROUP BY to calculate the sum of payments for each student. 
select s.student_id, s.student_name, sum(p.amount) as total_payment
from Students s
inner join Payments p using (student_id)
group by s.student_id;

-- 4.12 Retrieve a list of course names along with the count of students enrolled in each course. 
-- Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
select c.course_id, c.course_name, count(e.student_id) as enrolled_students
from Courses c
inner join Enrollments e using (course_id)
group by c.course_id, c.course_name
order by c.course_id;

-- 4.13 Calculate the average payment amount made by students. 
-- Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average. 
select s.student_id, s.student_name, avg(p.amount) as average_payment
from Students s
inner join Payments p using (student_id)
group by s.student_id
order by s.student_id asc;




