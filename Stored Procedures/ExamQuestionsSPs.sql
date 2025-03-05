-- =============================================
-- ExamQuestions Table
-- =============================================

-- SP_DeleteExamQuestion
CREATE PROCEDURE SP_DeleteExamQuestion
    @QuestionID INT,
    @ExamID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ExamQuestions WHERE QuestionID = @QuestionID AND ExamID = @ExamID)
    BEGIN
        SELECT 'ExamQuestion record does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM ExamQuestions WHERE QuestionID = @QuestionID AND ExamID = @ExamID;
    SELECT 'ExamQuestion record deleted successfully.' AS Result;
END;

-- SP_SelectExamQuestion 
CREATE OR ALTER PROCEDURE SP_SelectExamQuestion
    @ExamID INT
AS
BEGIN
    SELECT 
        Q.QuestionID,
        Q.QuestionText,
        Q.QuestionType,
        Q.Mark
    FROM Questions Q
    JOIN ExamQuestions EQ ON Q.QuestionID = EQ.QuestionID
    WHERE EQ.ExamID = @ExamID
    ORDER BY NEWID();
END;
