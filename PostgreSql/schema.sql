CREATE TABLE Student (
    ID                 INTEGER,
    FirstName          VARCHAR(50),
    LastName           VARCHAR(50),
    DateOfBirth        DATE,
    EnrolledDate       DATE,
    Gender             CHAR(1),
    NationalIDNumber   VARCHAR(20),
    StudentCardNumber  VARCHAR(20)
);

CREATE TABLE Teacher (
    ID              INTEGER,
    FirstName       VARCHAR(20),
    LastName        VARCHAR(30),
    DateOfBirth     DATE,
    AcademicRank    VARCHAR(20),
    HireDate        DATE
);

CREATE TABLE Course (
    ID            INTEGER,
    Name          VARCHAR(100),
    Credit        INTEGER,
    AcademicYear  VARCHAR(10),
    Semester      VARCHAR(10)
);

CREATE TABLE Grade (
    ID           INTEGER,
    StudentID    INTEGER,  
    CourseID     INTEGER,  
    TeacherID    INTEGER,  
    Grade        INTEGER,  
    Comment      VARCHAR(100),
    CreatedDate  DATE
);

INSERT INTO Student VALUES 
    (1, 'Alice', 'Johnson', '2001-03-15', '2023-09-01', 'F', NULL, NULL),
    (2, 'Bob', 'Smith', '2000-07-22', '2023-09-01', 'M', NULL, NULL);

INSERT INTO Teacher VALUES 
    (1, 'Dr. Emily', 'Davis', NULL, 'Professor', '2010-05-10'),
    (2, 'Mr. John', 'Brown', NULL, 'Lecturer', '2018-11-20');

INSERT INTO Course VALUES 
    (1, 'Mathematics 101', 4, '2023-2024', 'Fall'),
    (2, 'History 101', 3, '2023-2024', 'Fall');

INSERT INTO Grade VALUES 
    (1, 1, 1, 1, 92, 'Excellent performance', '2023-12-15'),
    (2, 2, 2, 2, 85, 'Good work', '2023-12-15');

SELECT * FROM Student;
