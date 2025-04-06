CREATE TABLE Student (
    ID                 SERIAL PRIMARY KEY,
    FirstName          VARCHAR(50) NOT NULL,
    LastName           VARCHAR(50) NOT NULL,
    DateOfBirth        DATE,
    EnrolledDate       DATE,
    Gender             CHAR(1),
    NationalIDNumber   VARCHAR(20),
    StudentCardNumber  VARCHAR(20)
);

CREATE TABLE Teacher (
    ID              SERIAL PRIMARY KEY,
    FirstName       VARCHAR(20) NOT NULL,
    LastName        VARCHAR(30) NOT NULL,
    DateOfBirth     DATE,
    AcademicRank    VARCHAR(20),
    HireDate        DATE
);

CREATE TABLE Course (
    ID            SERIAL PRIMARY KEY,
    Name          VARCHAR(100) NOT NULL,
    Credit        INTEGER,
    AcademicYear  VARCHAR(10),
    Semester      VARCHAR(10)
);

CREATE TABLE Grade (
    ID           SERIAL PRIMARY KEY,
    StudentID    INTEGER REFERENCES Student(ID),
    CourseID     INTEGER REFERENCES Course(ID),
    TeacherID    INTEGER REFERENCES Teacher(ID),
    Grade        SMALLINT CHECK (Grade BETWEEN 0 AND 100),
    Comment      VARCHAR(100),
    CreatedDate  DATE DEFAULT CURRENT_DATE
);

CREATE TABLE AchievementType (
    ID                 SERIAL PRIMARY KEY,
    Name               VARCHAR(50) NOT NULL,
    Description        TEXT,
    ParticipationRate  DECIMAL(5,2)
);

CREATE TABLE GradeDetails (
    ID                   SERIAL PRIMARY KEY,
    GradeID              INTEGER REFERENCES Grade(ID),
    AchievementTypeID    INTEGER REFERENCES AchievementType(ID),
    AchievementPoints    DECIMAL(5,2),
    AchievementMaxPoints DECIMAL(5,2),
    AchievementDate      DATE
);


INSERT INTO Student (FirstName, LastName, DateOfBirth, EnrolledDate)
VALUES 
    ('Alice', 'Johnson', '2001-03-15', '2023-09-01'),
    ('Bob', 'Smith', '2000-07-22', '2023-09-01');


INSERT INTO Teacher (FirstName, LastName, AcademicRank, HireDate)
VALUES 
    ('Dr. Emily', 'Davis', 'Professor', '2010-05-10'),
    ('Mr. John', 'Brown', 'Lecturer', '2018-11-20');


INSERT INTO Course (Name, Credit, AcademicYear, Semester)
VALUES 
    ('Mathematics 101', 4, '2023-2024', 'Fall'),
    ('History 101', 3, '2023-2024', 'Fall');


INSERT INTO Grade (StudentID, CourseID, TeacherID, Grade, Comment)
VALUES 
    (1, 1, 1, 92, 'Excellent performance'),
    (2, 2, 2, 85, 'Good work');

SELECT * FROM Student;