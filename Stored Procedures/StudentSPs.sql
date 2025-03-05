-- =============================================
-- Students Table
-- =============================================
-- SP_AddNewStudent
CREATE OR ALTER PROCEDURE SP_AddNewStudent
    @St_FName NVARCHAR(25),
    @St_LName NVARCHAR(25),
    @DateOfBirth DATE,
    @Gender NVARCHAR(10),
    @EnrollmentDate DATE,
    @Email NVARCHAR(150),
    @Password NVARCHAR(255),
    @PhoneNumber NVARCHAR(15),
    @DepartmentID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Students WHERE Email = @Email)
    BEGIN
        INSERT INTO Students (St_FName, St_LName, DateOfBirth, Gender, EnrollmentDate, Email, Password, PhoneNumber, DepartmentID)
        VALUES (@St_FName, @St_LName, @DateOfBirth, @Gender, @EnrollmentDate, @Email, @Password, @PhoneNumber, @DepartmentID);
        SELECT 'Student added successfully.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Student already exists.' AS Result;
    END
END;

-- SP_DeleteStudent
CREATE PROCEDURE SP_DeleteStudent
    @StudentID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Students WHERE StudentID = @StudentID)
    BEGIN
        SELECT 'Student does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Students WHERE StudentID = @StudentID;
    SELECT 'Student deleted successfully.' AS Result;
END;

-- SP_UpdateStudent
CREATE PROCEDURE SP_UpdateStudent
    @StudentID INT,
    @St_FName NVARCHAR(25),
    @St_LName NVARCHAR(25),
    @DateOfBirth DATE,
    @Gender NVARCHAR(10),
    @EnrollmentDate DATE,
    @Email NVARCHAR(150),
    @Password NVARCHAR(255),
    @PhoneNumber NVARCHAR(15),
    @DepartmentID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Students WHERE StudentID = @StudentID)
    BEGIN
        SELECT 'Student does not exist.' AS Result;
        RETURN;
    END

    UPDATE Students
    SET 
        St_FName = @St_FName,
        St_LName = @St_LName,
        DateOfBirth = @DateOfBirth,
        Gender = @Gender,
        EnrollmentDate = @EnrollmentDate,
        Email = @Email,
        Password = @Password,
        PhoneNumber = @PhoneNumber,
        DepartmentID = @DepartmentID
    WHERE StudentID = @StudentID;

    SELECT 'Student updated successfully.' AS Result;
END;

-- SP_SelectStudent
CREATE PROCEDURE SP_SelectStudent
    @StudentID INT
AS
BEGIN
    SELECT 
        StudentID, St_FName, St_LName, DateOfBirth, Gender, 
        EnrollmentDate, Email, Password, PhoneNumber, DepartmentID
    FROM Students
    WHERE StudentID = @StudentID;
END;

-- SP_SelectAllStudentsWithDepartment
CREATE OR ALTER PROCEDURE SP_SelectAllStudentsWithDepartment
AS
BEGIN
    SELECT 
        S.StudentID,
        S.St_FName,
        S.St_LName,
        S.DateOfBirth,
        S.Gender,
        S.EnrollmentDate,
        S.Email,
        S.PhoneNumber,
        D.DepartmentName
    FROM Students S
    JOIN Departments D ON S.DepartmentID = D.DepartmentID;
END;
