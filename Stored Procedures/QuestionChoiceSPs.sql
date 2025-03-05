-- =============================================
-- QuestionChoices Table
-- =============================================

-- SP_DeleteQuestionChoice
CREATE PROCEDURE SP_DeleteQuestionChoice
    @QuestionID INT,
    @ChoiceID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM QuestionChoices WHERE QuestionID = @QuestionID AND ChoiceID = @ChoiceID)
    BEGIN
        SELECT 'QuestionChoice record does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM QuestionChoices WHERE QuestionID = @QuestionID AND ChoiceID = @ChoiceID;
    SELECT 'QuestionChoice record deleted successfully.' AS Result;
END;

-- SP_UpdateQuestionChoice
CREATE PROCEDURE SP_UpdateQuestionChoice
    @QuestionID INT,
    @ChoiceID INT,
    @IsCorrect BIT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM QuestionChoices WHERE QuestionID = @QuestionID AND ChoiceID = @ChoiceID)
    BEGIN
        SELECT 'QuestionChoice record does not exist.' AS Result;
        RETURN;
    END

    UPDATE QuestionChoices
    SET IsCorrect = @IsCorrect
    WHERE QuestionID = @QuestionID AND ChoiceID = @ChoiceID;

    SELECT 'QuestionChoice record updated successfully.' AS Result;
END;

-- SP_SelectQuestionChoice
CREATE PROCEDURE SP_SelectQuestionChoice
    @QuestionID INT
AS
BEGIN
    SELECT QuestionID, ChoiceID, IsCorrect
    FROM QuestionChoices
    WHERE QuestionID = @QuestionID;
END;

