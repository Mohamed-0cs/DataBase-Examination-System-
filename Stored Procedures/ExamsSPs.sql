-- =============================================
-- Exams Table
-- =============================================
-- SP_ExamGeneration
CREATE OR ALTER PROCEDURE SP_ExamGeneration
    @ExamName NVARCHAR(100),
    @CourseId INT,
    @NumberOfMCQ INT,
    @NumberOfTF INT,
    @StartTime DATETIME,
    @Duration INT
AS
BEGIN

    IF EXISTS (SELECT 1 FROM Exams WHERE ExamName = @ExamName AND CourseID = @CourseId)
    BEGIN
        SELECT 'Exam already exists for this course.' AS Result;
        RETURN;
    END

    IF (@NumberOfMCQ + @NumberOfTF) != 10
    BEGIN
        SELECT 'Total number of questions must be 10.' AS Result;
        RETURN;
    END

    INSERT INTO Exams (ExamName, StartTime, Duration, CreatedTime, CourseID)
    VALUES (@ExamName, @StartTime, @Duration, GETDATE(), @CourseId);

    DECLARE @ExamId INT = SCOPE_IDENTITY();

    INSERT INTO ExamQuestions (QuestionID, ExamID)
    SELECT TOP (@NumberOfMCQ) QuestionID, @ExamId
    FROM Questions
    WHERE CourseID = @CourseId AND QuestionType = 'MCQ'
    ORDER BY NEWID();

    INSERT INTO ExamQuestions (QuestionID, ExamID)
    SELECT TOP (@NumberOfTF) QuestionID, @ExamId
    FROM Questions
    WHERE CourseID = @CourseId AND QuestionType = 'TF'
    ORDER BY NEWID();

    SELECT 'Exam generated successfully.' AS Result;
END;

-- SP_DeleteExam
CREATE OR ALTER PROCEDURE SP_DeleteExam
    @ExamID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Exams WHERE ExamID = @ExamID)
    BEGIN
        SELECT 'Exam does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM ExamStudentAnswer WHERE ExamID = @ExamID;
    DELETE FROM ExamQuestions WHERE ExamID = @ExamID;
    DELETE FROM Exams WHERE ExamID = @ExamID;

    SELECT 'Exam deleted successfully.' AS Result;
END;

-- SP_UpdateExam
CREATE OR ALTER PROCEDURE SP_UpdateExam
    @ExamID INT,
    @ExamName NVARCHAR(100),
    @StartTime DATETIME,
    @Duration INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Exams WHERE ExamID = @ExamID)
    BEGIN
        SELECT 'Exam does not exist.' AS Result;
        RETURN;
    END
    UPDATE Exams
    SET 
        ExamName = @ExamName,
        StartTime = @StartTime,
        Duration = @Duration,
        CreatedTime = GETDATE()
    WHERE ExamID = @ExamID;

    SELECT 'Exam updated successfully.' AS Result;
END;

-- SP_SelectExam
CREATE PROCEDURE SP_SelectExam
    @ExamID INT
AS
BEGIN
    SELECT ExamID, ExamName, StartTime, Duration, CreatedTime, CourseID
    FROM Exams
    WHERE ExamID = @ExamID;
END;

--SP To Display All Exams
CREATE PROCEDURE SP_DisplayAllExams
    @CourseId INT
AS
BEGIN
    SELECT * 
    FROM Exams 
    WHERE CourseId = @CourseId;
END