-- =============================================
-- Courses Table
-- =============================================

-- SP_AddNewCourse
CREATE OR ALTER PROCEDURE SP_AddNewCourse
    @CourseName NVARCHAR(100),
    @CourseDescription NVARCHAR(255),
    @InstructorID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Courses WHERE CourseName = @CourseName)
    BEGIN
        INSERT INTO Courses (CourseName, CourseDescription, InstructorID)
        VALUES (@CourseName, @CourseDescription, @InstructorID);
        SELECT 'Course added successfully.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Course already exists.' AS Result;
    END
END;

-- SP_DeleteCourse
CREATE OR ALTER PROCEDURE SP_DeleteCourse
    @CourseID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Courses WHERE CourseID = @CourseID)
    BEGIN
        SELECT 'Course does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Topic WHERE CourseID = @CourseID;
    DELETE FROM Courses WHERE CourseID = @CourseID;
    SELECT 'Course deleted successfully.' AS Result;
END;

-- SP_UpdateCourse
CREATE PROCEDURE SP_UpdateCourse
    @CourseID INT,
    @CourseName NVARCHAR(100),
    @CourseDescription NVARCHAR(255),
    @InstructorID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Courses WHERE CourseID = @CourseID)
    BEGIN
        SELECT 'Course does not exist.' AS Result;
        RETURN;
    END

    UPDATE Courses
    SET 
        CourseName = @CourseName,
        CourseDescription = @CourseDescription,
        InstructorID = @InstructorID
    WHERE CourseID = @CourseID;

    SELECT 'Course updated successfully.' AS Result;
END;

-- SP_SelectCourse
CREATE PROCEDURE SP_SelectCourse
    @CourseID INT
AS
BEGIN
    SELECT CourseID, CourseName, CourseDescription, InstructorID
    FROM Courses
    WHERE CourseID = @CourseID;
END;

-- SP_SelectAllCoursesWithInstructorAndDepartment
CREATE OR ALTER PROCEDURE SP_SelectAllCoursesWithInstructorAndDepartment
AS
BEGIN
    SELECT 
        C.CourseID,
        C.CourseName,
        C.CourseDescription,
        I.Ins_FName + ' ' + I.Ins_LName AS InstructorName,
        D.DepartmentName
    FROM Courses C
    JOIN Instructors I ON C.InstructorID = I.InstructorID
    JOIN Departments D ON I.DepartmentID = D.DepartmentID;
END;

