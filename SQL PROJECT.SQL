create database StudentManagement;
GO
use StudebtManagement;
create table students(StudentId int primary key identity(1,1),
       FirstName varchar(50),LastName varchar(50),Email varchar(100) unique,
        DOB Date);
create table Courses(CourseID int primary key identity(1,1),
             CourseName varchar(100),
             DurationMonths int);
create table Enrollments(EnrollmentId int primary key Identity(1,1),
                         StudentId int Foreign Key References Students(StudentId),
                         CourseId int Foreign key References Courses(CourseID),
                         EnrollmentDate Date Default Getdate());
Insert into Students(FirstName,LastName,Email,DOB)
values
('Supraja','Sindhu','sindhuchatakondu@gmail.com','2003-11-5'),
('Lakshmi','Madhavi','madhavi@gmail.com','2005-03-5'),
('Vasantha','Swetha','sweth@gmail.com','2002-11-21');
Insert into Courses(CourseName,DurationMonths)
values
('DotNetFSD','6'),
('Machine Learning',5),
('CyberSecurity',3);
Insert into Enrollments(StudentId,CourseId)
values
(1,1),
(1,2),
(2,3),
(3,1);
select*from Students;
select*from Courses;
select s.FirstName, s.LastName, c.CourseName,e.EnrollmentDate
From Enrollments e
Join students s on e.StudentId=s.StudentId
Join Courses c on e.CourseId=c.CourseId;
select c.CourseName, COUNT(e.StudentId) AS TotalStudents
from Courses c
Left Join Enrollments e on c.CourseId = e.CourseId
group by c.CourseName;



       
