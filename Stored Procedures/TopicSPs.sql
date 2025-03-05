-- =============================================
-- Topic Table
-- =============================================

-- SP_AddNewTopic
CREATE OR ALTER PROCEDURE SP_AddNewTopic
    @CourseId INT,
    @TopicName NVARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Topic WHERE CourseID = @CourseId AND TopicName = @TopicName)
    BEGIN
        INSERT INTO Topic (CourseID, TopicName)
        VALUES (@CourseId, @TopicName);
        SELECT 'Topic added successfully.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Topic already exists.' AS Result;
    END
END;

-- SP_DeleteTopic
CREATE PROCEDURE SP_DeleteTopic
    @CourseID INT,
    @TopicName NVARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Topic WHERE CourseID = @CourseID AND TopicName = @TopicName)
    BEGIN
        SELECT 'Topic does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Topic WHERE CourseID = @CourseID AND TopicName = @TopicName;
    SELECT 'Topic deleted successfully.' AS Result;
END;

-- SP_UpdateTopic
CREATE PROCEDURE SP_UpdateTopic
    @CourseID INT,
    @OldTopicName NVARCHAR(100),
    @NewTopicName NVARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Topic WHERE CourseID = @CourseID AND TopicName = @OldTopicName)
    BEGIN
        SELECT 'Topic does not exist.' AS Result;
        RETURN;
    END

    UPDATE Topic
    SET TopicName = @NewTopicName
    WHERE CourseID = @CourseID AND TopicName = @OldTopicName;

    SELECT 'Topic updated successfully.' AS Result;
END;

-- SP_SelectTopic
CREATE PROCEDURE SP_SelectTopic
    @CourseID INT
AS
BEGIN
    SELECT CourseID, TopicName
    FROM Topic
    WHERE CourseID = @CourseID;
END;