CREATE TABLE Department (
    DepartmentID INTEGER PRIMARY KEY,
    DepartmentName TEXT NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INTEGER PRIMARY KEY,
    FacultyName TEXT NOT NULL
);

CREATE TABLE Student (
    StudentID INTEGER PRIMARY KEY,
    StudentName TEXT NOT NULL,
    DepartmentID INTEGER,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INTEGER PRIMARY KEY,
    CourseName TEXT NOT NULL,
    FacultyID INTEGER,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

CREATE TABLE Enrollment (
    EnrollmentID INTEGER PRIMARY KEY,
    StudentID INTEGER,
    CourseID INTEGER,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Commerce');

INSERT INTO Faculty VALUES
(101, 'Dr. Kumar'),
(102, 'Dr. Priya'),
(103, 'Dr. Ravi');

INSERT INTO Student VALUES
(1, 'Arun', 1),
(2, 'Priya', 1),
(3, 'Kavin', 2),
(4, 'Divya', 3);

INSERT INTO Course VALUES
(201, 'DBMS', 101),
(202, 'Python Programming', 102),
(203, 'Web Development', 103),
(204, 'Computer Networks', 101);

INSERT INTO Enrollment VALUES
(1, 1, 201),
(2, 1, 202),
(3, 2, 201),
(4, 2, 203),
(5, 3, 203),
(6, 4, 204);
