-- =============================================
-- Report SPs
-- =============================================

-- 1) SP that returns the students' information according to department NO parameter.
CREATE PROCEDURE SP_GetStudentsByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT 
        StudentID, 
        St_FName + ' ' + St_LName AS FullName, 
        DateOfBirth, 
        Gender, 
        EnrollmentDate, 
        Email, 
        PhoneNumber
    FROM Students
    WHERE DepartmentID = @DepartmentID;
END;

EXEC SP_GetStudentsByDepartment @DepartmentID=1;

-- 2) SP that takes the student ID and returns the grades of the student in all courses.
CREATE PROCEDURE SP_GetStudentGrades
    @StudentID INT
AS
BEGIN
    SELECT 
        C.CourseName, 
        SC.Grade
    FROM StudentCourse SC
    JOIN Courses C ON SC.CourseID = C.CourseID
    WHERE SC.StudentID = @StudentID;
END;

EXEC SP_GetStudentGrades @StudentID=1;

-- 3) SP that takes the instructor ID and returns the name of the courses that he teaches and the number of students per course.
CREATE OR ALTER PROCEDURE SP_GetInstructorCoursesWithStudentCount
    @InstructorID INT
AS
BEGIN
    SELECT 
        C.CourseName, 
        COUNT(SC.StudentID) AS StudentCount
    FROM Courses C
    LEFT JOIN StudentCourse SC ON C.CourseID = SC.CourseID
    WHERE C.InstructorID = @InstructorID
    GROUP BY C.CourseName;
END;

EXEC SP_GetInstructorCoursesWithStudentCount @InstructorID=1;

--4)  SP that takes CourseID and returns its topics
CREATE PROCEDURE SP_GetCourseTopics
    @CourseID INT
AS
BEGIN
    SELECT TopicName
    FROM Topic
    WHERE CourseID = @CourseID;
END;

EXEC SP_GetCourseTopics @CourseID=2;

-- 5) SP that takes Exam number or ID and returns Questions in it.
CREATE PROCEDURE SP_GetExamQuestions
    @ExamID INT
AS
BEGIN
    SELECT 
        Q.QuestionText, 
        Q.QuestionType, 
        Q.Mark
    FROM Questions Q
    JOIN ExamQuestions EQ ON Q.QuestionID = EQ.QuestionID
    WHERE EQ.ExamID = @ExamID;
END;

EXEC SP_GetExamQuestions @ExamID=5
EXEC SP_GetExamQuestions @ExamID=6
EXEC SP_GetExamQuestions @ExamID=7

-- 6) SP that takes Exam number or ID and returns the Questions with the student answers.
CREATE PROCEDURE SP_GetExamQuestionsWithStudentAnswers
    @ExamID INT,
    @StudentID INT
AS
BEGIN
    SELECT 
        Q.QuestionText, 
        Q.QuestionType, 
        Q.Mark, 
        C.ChoiceText AS StudentAnswer
    FROM Questions Q
    JOIN ExamQuestions EQ ON Q.QuestionID = EQ.QuestionID
    JOIN ExamStudentAnswer ESA ON Q.QuestionID = ESA.QuestionID
    JOIN Choices C ON ESA.ChoiceID = C.ChoiceID
    WHERE EQ.ExamID = @ExamID AND ESA.StudentID = @StudentID;
END;

EXEC SP_GetExamQuestionsWithStudentAnswers @ExamID=5 , @StudentID=1
EXEC SP_GetExamQuestionsWithStudentAnswers @ExamID=5 , @StudentID=2