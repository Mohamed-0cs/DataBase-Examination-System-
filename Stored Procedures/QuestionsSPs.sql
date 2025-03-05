-- =============================================
-- Questions Table
-- =============================================

-- SP_AddNewQuestion
CREATE OR ALTER PROCEDURE SP_AddNewQuestion
    @CourseId INT,
    @QuestionText NVARCHAR(255),
    @Type NVARCHAR(10),
    @Mark FLOAT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Questions WHERE QuestionText = @QuestionText AND CourseID = @CourseId)
    BEGIN
        INSERT INTO Questions (QuestionText, QuestionType, Mark, CourseID)
        VALUES (@QuestionText, @Type, @Mark, @CourseId);
        SELECT 'Question added successfully.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Question already exists.' AS Result;
    END
END;

-- SP_DeleteQuestion
CREATE PROCEDURE SP_DeleteQuestion
    @QuestionID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Questions WHERE QuestionID = @QuestionID)
    BEGIN
        SELECT 'Question does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Questions WHERE QuestionID = @QuestionID;
    SELECT 'Question deleted successfully.' AS Result;
END;

-- SP_UpdateQuestion
CREATE PROCEDURE SP_UpdateQuestion
    @QuestionID INT,
    @QuestionText NVARCHAR(255),
    @QuestionType NVARCHAR(10),
    @Mark FLOAT,
    @CourseID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Questions WHERE QuestionID = @QuestionID)
    BEGIN
        SELECT 'Question does not exist.' AS Result;
        RETURN;
    END

    UPDATE Questions
    SET 
        QuestionText = @QuestionText,
        QuestionType = @QuestionType,
        Mark = @Mark,
        CourseID = @CourseID
    WHERE QuestionID = @QuestionID;

    SELECT 'Question updated successfully.' AS Result;
END;

-- SP_SelectQuestion
CREATE PROCEDURE SP_SelectQuestion
    @QuestionID INT
AS
BEGIN
    SELECT QuestionID, QuestionText, QuestionType, Mark, CourseID
    FROM Questions
    WHERE QuestionID = @QuestionID;
END;
