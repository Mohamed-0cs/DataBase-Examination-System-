use ExaminationSystem
-- =============================================
-- Additional Procedures
-- =============================================

-- SP_CheckExamEligibility
CREATE OR ALTER PROCEDURE SP_CheckExamEligibility
    @StudentId INT,
    @CourseId INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM StudentCourse WHERE StudentID = @StudentId AND CourseID = @CourseId)
    BEGIN
        SELECT 'Student is not enrolled in this course.' AS Result;
        RETURN;
    END

    DECLARE @AttemptNumber INT, @Grade NVARCHAR(2);
    SELECT 
        @AttemptNumber = AttemptNumber,
        @Grade = Grade
    FROM StudentCourse
    WHERE StudentID = @StudentId AND CourseID = @CourseId;

    IF @AttemptNumber = 2
    BEGIN
        SELECT 'Student has exhausted all attempts for this course.' AS Result;
    END
    ELSE IF @AttemptNumber = 1 AND @Grade IN ('A', 'B', 'C', 'D')
    BEGIN
        SELECT 'Student has already achieved a passing grade. Cannot take the exam again.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Student is eligible to take the exam.' AS Result;
    END
END;

-- SP_StartExam
CREATE OR ALTER PROCEDURE SP_StartExam
    @StudentId INT,
    @CourseId INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM StudentCourse WHERE StudentID = @StudentId AND CourseID = @CourseId)
    BEGIN
        SELECT 'Student is not enrolled in this course.' AS Result;
        RETURN;
    END

    UPDATE StudentCourse
    SET AttemptNumber = AttemptNumber + 1
    WHERE StudentID = @StudentId AND CourseID = @CourseId;

    SELECT 'Exam started successfully. AttemptNumber has been incremented.' AS Result;
END;

CREATE TYPE StudentAnswersType AS TABLE (
    QuestionId INT,
    CorrectChoiceId INT
);

-- SP_AddStudentAnswers
CREATE OR ALTER PROCEDURE SP_AddStudentAnswers
    @ExamId INT,
    @StudentId INT,
    @Answers StudentAnswersType READONLY
AS
BEGIN
    DECLARE @CourseId INT;
    SELECT @CourseId = CourseID FROM Exams WHERE ExamID = @ExamId;

    IF NOT EXISTS (SELECT 1 FROM StudentCourse WHERE StudentID = @StudentId AND CourseID = @CourseId)
    BEGIN
        SELECT 'Student is not enrolled in this course.' AS Result;
        RETURN;
    END

    INSERT INTO ExamStudentAnswer (ExamID, StudentID, QuestionID, ChoiceID)
    SELECT @ExamId, @StudentId, QuestionId, CorrectChoiceId
    FROM @Answers A
    WHERE NOT EXISTS (
        SELECT 1 
        FROM ExamStudentAnswer ESA
        WHERE ESA.ExamID = @ExamId 
          AND ESA.StudentID = @StudentId 
          AND ESA.QuestionID = A.QuestionId
    );

    SELECT 'Answers added successfully.' AS Result;
END;

-- SP_CalculateGrade
CREATE OR ALTER PROCEDURE SP_CalculateGrade
    @ExamId INT,
    @StudentId INT
AS
BEGIN
    DECLARE @TotalMarks FLOAT, @StudentMarks FLOAT;

    SELECT @TotalMarks = SUM(Mark)
    FROM Questions Q
    JOIN ExamQuestions EQ ON Q.QuestionID = EQ.QuestionID
    WHERE EQ.ExamID = @ExamId;

    SELECT @StudentMarks = SUM(Q.Mark)
    FROM Questions Q
    JOIN ExamStudentAnswer ESA ON Q.QuestionID = ESA.QuestionID
    JOIN QuestionChoices QC ON Q.QuestionID = QC.QuestionID AND ESA.ChoiceID = QC.ChoiceID
    WHERE ESA.ExamID = @ExamId AND ESA.StudentID = @StudentId AND QC.IsCorrect = 1;

    DECLARE @Percentage FLOAT = (@StudentMarks / @TotalMarks) * 100;

    DECLARE @Grade NVARCHAR(2);
    SET @Grade = CASE
        WHEN @Percentage >= 90 THEN 'A'
        WHEN @Percentage >= 80 THEN 'B'
        WHEN @Percentage >= 70 THEN 'C'
        WHEN @Percentage >= 60 THEN 'D'
        ELSE 'F' 
    END;

    DECLARE @CourseId INT;
    SELECT @CourseId = CourseID FROM Exams WHERE ExamID = @ExamId;

    UPDATE StudentCourse
    SET Grade = @Grade
    WHERE StudentID = @StudentId AND CourseID = @CourseId;

    SELECT 
        'Exam completed successfully.' AS Result,
        @Percentage AS Percentage,
        @Grade AS Grade;
END;