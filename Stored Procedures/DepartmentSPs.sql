-- =============================================
-- Departments Table
-- =============================================
-- SP_AddNewDepartment
CREATE OR ALTER PROCEDURE SP_AddNewDepartment
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(255)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Departments WHERE DepartmentName = @DepartmentName)
    BEGIN
        INSERT INTO Departments (DepartmentName, Description)
        VALUES (@DepartmentName, @Description);
        SELECT 'Department added successfully.' AS Result;
    END
    ELSE
    BEGIN
        SELECT 'Department already exists.' AS Result;
    END
END;

-- SP_DeleteDepartment
CREATE OR ALTER PROCEDURE SP_DeleteDepartment
    @DepartmentID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Departments WHERE DepartmentID = @DepartmentID)
    BEGIN
        SELECT 'Department does not exist.' AS Result;
        RETURN;
    END

    DELETE FROM Departments WHERE DepartmentID = @DepartmentID;
    SELECT 'Department deleted successfully.' AS Result;
END;


-- SP_UpdateDepartment
CREATE PROCEDURE SP_UpdateDepartment
    @DepartmentID INT,
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(255)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Departments WHERE DepartmentID = @DepartmentID)
    BEGIN
        SELECT 'Department does not exist.' AS Result;
        RETURN;
    END

    UPDATE Departments
    SET DepartmentName = @DepartmentName, Description = @Description
    WHERE DepartmentID = @DepartmentID;

    SELECT 'Department updated successfully.' AS Result;
END;

-- SP_SelectDepartment
CREATE PROCEDURE SP_SelectDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT DepartmentID, DepartmentName, Description
    FROM Departments
    WHERE DepartmentID = @DepartmentID;
END;


-- SP_SelectAllDepartments
CREATE OR ALTER PROCEDURE SP_SelectAllDepartments
AS
BEGIN
    SELECT DepartmentID, DepartmentName, Description
    FROM Departments;
END;

