-- =============================================
-- Instructors Table
-- =============================================

-- SP_AddNewInstructor
CREATE OR ALTER PROCEDURE SP_AddNewInstructor
    @Ins_FName NVARCHAR(25),
    @Ins_LName NVARCHAR(25),
    @DateOfBirth DATE,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(150),
    @Password NVARCHAR(255),
    @PhoneNumber NVARCHAR(15),
    @HireDate DATE,
    @Specialization NVARCHAR(100),
    @Salary DECIMAL(10, 2),
    @DepartmentID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Instructors WHERE Email = @Email)
    BEGIN
        INSERT INTO Instructors (Ins_FName, Ins_LName, DateOfBirth, Gender, Email, Password, PhoneNumber, HireDate, Specialization, Salary, DepartmentID)
        VALUES (@Ins_FName, @Ins_LName, @DateOfBirth, @Gender, @Email, @Password, @PhoneNumber, @HireDate, @Specialization, @Salary, @DepartmentID);
        SELECT 'Instructor added successfully.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Instructor already exists.' AS Result;
    END
END;

-- SP_DeleteInstructor
CREATE PROCEDURE SP_DeleteInstructor
    @InstructorID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Instructors WHERE InstructorID = @InstructorID)
    BEGIN
        SELECT 'Instructor does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Instructors WHERE InstructorID = @InstructorID;
    SELECT 'Instructor deleted successfully.' AS Result;
END;


-- SP_UpdateInstructor
CREATE PROCEDURE SP_UpdateInstructor
    @InstructorID INT,
    @Ins_FName NVARCHAR(25),
    @Ins_LName NVARCHAR(25),
    @DateOfBirth DATE,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(150),
    @Password NVARCHAR(255),
    @PhoneNumber NVARCHAR(15),
    @HireDate DATE,
    @Specialization NVARCHAR(100),
    @Salary DECIMAL(10, 2),
    @DepartmentID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Instructors WHERE InstructorID = @InstructorID)
    BEGIN
        SELECT 'Instructor does not exist.' AS Result;
        RETURN;
    END

    UPDATE Instructors
    SET 
        Ins_FName = @Ins_FName,
        Ins_LName = @Ins_LName,
        DateOfBirth = @DateOfBirth,
        Gender = @Gender,
        Email = @Email,
        Password = @Password,
        PhoneNumber = @PhoneNumber,
        HireDate = @HireDate,
        Specialization = @Specialization,
        Salary = @Salary,
        DepartmentID = @DepartmentID
    WHERE InstructorID = @InstructorID;

    SELECT 'Instructor updated successfully.' AS Result;
END;

-- SP_SelectInstructor
CREATE PROCEDURE SP_SelectInstructor
    @InstructorID INT
AS
BEGIN
    SELECT 
        InstructorID, Ins_FName, Ins_LName, DateOfBirth, Gender, 
        Email, Password, PhoneNumber, HireDate, Specialization, 
        Salary, DepartmentID
    FROM Instructors
    WHERE InstructorID = @InstructorID;
END;

-- SP_SelectAllInstructorsWithDepartment
CREATE OR ALTER PROCEDURE SP_SelectAllInstructorsWithDepartment
AS
BEGIN
    SELECT 
        I.InstructorID,
        I.Ins_FName,
        I.Ins_LName,
        I.DateOfBirth,
        I.Gender,
        I.Email,
        I.PhoneNumber,
        I.HireDate,
        I.Specialization,
        I.Salary,
        D.DepartmentName
    FROM Instructors I
    JOIN Departments D ON I.DepartmentID = D.DepartmentID;
END;

