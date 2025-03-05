-- =============================================
-- Choices Table
-- =============================================

-- SP_AddNewChoice
CREATE OR ALTER PROCEDURE SP_AddNewChoice
    @QuestionId INT,
    @ChoiceText NVARCHAR(255),
    @IsCorrect BIT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Choices WHERE ChoiceText = @ChoiceText)
    BEGIN
        DECLARE @ExistingChoiceId INT;
        SELECT @ExistingChoiceId = ChoiceID FROM Choices WHERE ChoiceText = @ChoiceText;

        INSERT INTO QuestionChoices (QuestionID, ChoiceID, IsCorrect)
        VALUES (@QuestionId, @ExistingChoiceId, @IsCorrect);

        SELECT 'Choice already exists. Linked to the question successfully.' AS Result;
    END
    ELSE
    BEGIN
        INSERT INTO Choices (ChoiceText)
        VALUES (@ChoiceText);

        DECLARE @NewChoiceId INT = SCOPE_IDENTITY();

        INSERT INTO QuestionChoices (QuestionID, ChoiceID, IsCorrect)
        VALUES (@QuestionId, @NewChoiceId, @IsCorrect);

        SELECT 'Choice added and linked to the question successfully.' AS Result;
    END
END;

-- SP_DeleteChoice
CREATE PROCEDURE SP_DeleteChoice
    @ChoiceID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Choices WHERE ChoiceID = @ChoiceID)
    BEGIN
        SELECT 'Choice does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Choices WHERE ChoiceID = @ChoiceID;
    SELECT 'Choice deleted successfully.' AS Result;
END;

-- SP_UpdateChoice
CREATE PROCEDURE SP_UpdateChoice
    @ChoiceID INT,
    @ChoiceText NVARCHAR(255)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Choices WHERE ChoiceID = @ChoiceID)
    BEGIN
        SELECT 'Choice does not exist.' AS Result;
        RETURN;
    END

    UPDATE Choices
    SET ChoiceText = @ChoiceText
    WHERE ChoiceID = @ChoiceID;

    SELECT 'Choice updated successfully.' AS Result;
END;

-- SP_SelectChoice
CREATE PROCEDURE SP_SelectChoice
    @ChoiceID INT
AS
BEGIN
    SELECT ChoiceID, ChoiceText
    FROM Choices
    WHERE ChoiceID = @ChoiceID;
END;


-- SP_GetChoicesByQuestionId
CREATE OR ALTER PROCEDURE SP_GetChoicesByQuestionId
    @QuestionId INT
AS
BEGIN
    SELECT 
        C.ChoiceID,
        C.ChoiceText,
        QC.IsCorrect
    FROM Choices C
    JOIN QuestionChoices QC ON C.ChoiceID = QC.ChoiceID
    WHERE QC.QuestionID = @QuestionId;
END;