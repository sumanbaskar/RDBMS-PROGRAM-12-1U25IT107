CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Commerce');

INSERT INTO Faculty (FacultyID, FacultyName)
VALUES
(101, 'Dr. Kumar'),
(102, 'Dr. Priya'),
(103, 'Dr. Ravi');

INSERT INTO Student (StudentID, StudentName, DepartmentID)
VALUES
(1, 'Arun', 1),
(2, 'Priya', 1),
(3, 'Kavin', 2),
(4, 'Divya', 3);

INSERT INTO Course (CourseID, CourseName, FacultyID)
VALUES
(201, 'DBMS', 101),
(202, 'Python Programming', 102),
(203, 'Web Development', 103),
(204, 'Computer Networks', 101);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(1, 1, 201),
(2, 1, 202),
(3, 2, 201),
(4, 2, 203),
(5, 3, 203),
(6, 4, 204);

SELECT
    s.StudentID,
    s.StudentName,
    d.DepartmentName
FROM Student s
JOIN Department d
    ON s.DepartmentID = d.DepartmentID;

SELECT
    f.FacultyID,
    f.FacultyName,
    c.CourseID,
    c.CourseName
FROM Faculty f
JOIN Course c
    ON f.FacultyID = c.FacultyID;

SELECT
    s.StudentName,
    c.CourseName
FROM Student s
JOIN Enrollment e
    ON s.StudentID = e.StudentID
JOIN Course c
    ON e.CourseID = c.CourseID;
