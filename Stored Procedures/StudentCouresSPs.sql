-- =============================================
-- StudentCourse Table
-- =============================================

-- SP_EnrollStudentInCourse
CREATE OR ALTER PROCEDURE SP_EnrollStudentInCourse
    @StudentId INT,
    @CourseId INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM StudentCourse WHERE StudentID = @StudentId AND CourseID = @CourseId)
    BEGIN
        SELECT 'Student is already enrolled in this course.' AS Result;
        RETURN;
    END

    INSERT INTO StudentCourse (StudentID, CourseID, AttemptNumber, Grade)
    VALUES (@StudentId, @CourseId, 0, NULL);

    SELECT 'Student enrolled in the course successfully.' AS Result;
END;

-- SP_DeleteStudentCourse
CREATE PROCEDURE SP_DeleteStudentCourse
    @StudentID INT,
    @CourseID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM StudentCourse WHERE StudentID = @StudentID AND CourseID = @CourseID)
    BEGIN
        SELECT 'StudentCourse record does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM StudentCourse WHERE StudentID = @StudentID AND CourseID = @CourseID;
    SELECT 'StudentCourse record deleted successfully.' AS Result;
END;

-- SP_UpdateStudentCourse
CREATE PROCEDURE SP_UpdateStudentCourse
    @StudentID INT,
    @CourseID INT,
    @AttemptNumber INT,
    @Grade NVARCHAR(2)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM StudentCourse WHERE StudentID = @StudentID AND CourseID = @CourseID)
    BEGIN
        SELECT 'StudentCourse record does not exist.' AS Result;
        RETURN;
    END

    UPDATE StudentCourse
    SET 
        AttemptNumber = @AttemptNumber,
        Grade = @Grade
    WHERE StudentID = @StudentID AND CourseID = @CourseID;

    SELECT 'StudentCourse record updated successfully.' AS Result;
END;

-- SP_SelectStudentCourse
CREATE PROCEDURE SP_SelectStudentCourse
    @StudentID INT,
    @CourseID INT
AS
BEGIN
    SELECT StudentID, CourseID, AttemptNumber, Grade
    FROM StudentCourse
    WHERE StudentID = @StudentID AND CourseID = @CourseID;
END;