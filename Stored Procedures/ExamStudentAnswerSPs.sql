-- =============================================
-- ExamStudentAnswer Table
-- =============================================

-- SP_DeleteExamStudentAnswer
CREATE PROCEDURE SP_DeleteExamStudentAnswer
    @ExamID INT,
    @StudentID INT,
    @QuestionID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ExamStudentAnswer WHERE ExamID = @ExamID AND StudentID = @StudentID AND QuestionID = @QuestionID)
    BEGIN
        SELECT 'ExamStudentAnswer record does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM ExamStudentAnswer WHERE ExamID = @ExamID AND StudentID = @StudentID AND QuestionID = @QuestionID;
    SELECT 'ExamStudentAnswer record deleted successfully.' AS Result;
END;

-- SP_SelectExamStudentAnswer
CREATE PROCEDURE SP_SelectExamStudentAnswer
    @ExamID INT,
    @StudentID INT
AS
BEGIN
    SELECT ExamID, StudentID, QuestionID, ChoiceID
    FROM ExamStudentAnswer
    WHERE ExamID = @ExamID AND StudentID = @StudentID;
END;