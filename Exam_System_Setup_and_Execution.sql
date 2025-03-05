-- Add a new department
EXEC SP_AddNewDepartment @DepartmentName = 'Full Stack .NET', @Description = 'Department for Full Stack .NET Development';
EXEC SP_AddNewDepartment @DepartmentName = 'Full Stack Python', @Description = 'Department for Full Stack Python Development';
EXEC SP_AddNewDepartment @DepartmentName = 'Cyber Security', @Description = 'Department for Cyber Security';

-- Add a new instructors
-- Department 1
EXEC SP_AddNewInstructor @Ins_FName = 'Ahmed', @Ins_LName = 'Mohamed',@DateOfBirth = '1985-05-15', @Gender = 'Male',
    @Email = 'ahmed.mohamed@iti.edu', @Password = '123', @PhoneNumber = '01271567893',
	@HireDate = '2005-09-01',@Specialization = 'Software Engineering',@Salary = 80000.00,
    @DepartmentID = 1; 

EXEC SP_AddNewInstructor 
    @Ins_FName = 'Fatma', @Ins_LName = 'Mohamed', @DateOfBirth = '1985-02-02', @Gender = 'Female', 
    @Email = 'fatma.mohamed@iti.edu', @Password = '123', @PhoneNumber = '01023456789', 
    @HireDate = '2012-01-01', @Specialization = '.NET Development', @Salary = 85000.00, 
	@DepartmentID = 1;

-- Department 2
EXEC SP_AddNewInstructor 
    @Ins_FName = 'Youssef', @Ins_LName = 'Hassan', @DateOfBirth = '1990-03-03', @Gender = 'Male', 
    @Email = 'youssef.hassan@iti.edu', @Password = '123', @PhoneNumber = '01034567890', 
    @HireDate = '2015-01-01', @Specialization = 'Python Development', @Salary = 80000.00,
	@DepartmentID = 2;

EXEC SP_AddNewInstructor 
    @Ins_FName = 'Sara', @Ins_LName = 'Ahmed', @DateOfBirth = '1992-04-04', @Gender = 'Female', 
    @Email = 'sara.ahmed@iti.edu', @Password = '123', @PhoneNumber = '01045678901', 
    @HireDate = '2016-01-01', @Specialization = 'Python Development', @Salary = 82000.00, 
	@DepartmentID = 2;

-- Department 3
EXEC SP_AddNewInstructor 
    @Ins_FName = 'Omar', @Ins_LName = 'Youssef', @DateOfBirth = '1988-05-05', @Gender = 'Male', 
    @Email = 'omar.youssef@iti.edu', @Password = '123', @PhoneNumber = '01056789012', 
    @HireDate = '2014-01-01', @Specialization = 'Cyber Security', @Salary = 95000.00, 
	@DepartmentID = 3;

EXEC SP_AddNewInstructor 
    @Ins_FName = 'Mariam', @Ins_LName = 'Elsayed', @DateOfBirth = '1991-06-06', @Gender = 'Female', 
    @Email = 'mariam.elsayed@iti.edu', @Password = '123', @PhoneNumber = '01067890123', 
    @HireDate = '2017-01-01', @Specialization = 'Cyber Security', @Salary = 92000.00, 
	@DepartmentID = 3;

----------------------------------
-- Add a new course
----------------------------------
EXEC SP_AddNewCourse @CourseName = 'C# OOP', @CourseDescription = 'Object-Oriented Programming in C#',
    @InstructorID = 1; 
EXEC SP_AddNewCourse @CourseName = 'ASP.NET Core', @CourseDescription = 'Web Development with ASP.NET Core', 
	@InstructorID = 2;
EXEC SP_AddNewCourse @CourseName = 'Entity Framework', @CourseDescription = 'Database Access with Entity Framework', 
	@InstructorID = 1;
EXEC SP_AddNewCourse @CourseName = 'Blazor', @CourseDescription = 'Building Web Apps with Blazor', 
	@InstructorID = 2;


EXEC SP_AddNewCourse @CourseName = 'Python Basics', @CourseDescription = 'Introduction to Python Programming', 
	@InstructorID = 3;
EXEC SP_AddNewCourse @CourseName = 'Django', @CourseDescription = 'Web Development with Django', 
	@InstructorID = 3;
EXEC SP_AddNewCourse @CourseName = 'Flask', @CourseDescription = 'Web Development with Flask', 
	@InstructorID = 4;
EXEC SP_AddNewCourse @CourseName = 'Data Science with Python', @CourseDescription = 'Data Analysis and Visualization', 
	@InstructorID = 4;


EXEC SP_AddNewCourse @CourseName = 'Ethical Hacking', @CourseDescription = 'Fundamentals of Ethical Hacking', 
	@InstructorID = 5;
EXEC SP_AddNewCourse @CourseName = 'Network Security', @CourseDescription = 'Securing Network Infrastructure', 
	@InstructorID = 5;
EXEC SP_AddNewCourse @CourseName = 'Penetration Testing', @CourseDescription = 'Advanced Penetration Testing Techniques', 
	@InstructorID = 6;
EXEC SP_AddNewCourse @CourseName = 'Cryptography', @CourseDescription = 'Principles of Cryptography', 
	@InstructorID = 6;



-- Add topics for the course
EXEC SP_AddNewTopic @CourseId = 1, @TopicName = 'Intro';
EXEC SP_AddNewTopic @CourseId = 1, @TopicName = 'Encapsulation';
EXEC SP_AddNewTopic @CourseId = 1, @TopicName = 'Inheritance';
EXEC SP_AddNewTopic @CourseId = 1, @TopicName = 'Abstraction';
EXEC SP_AddNewTopic @CourseId = 1, @TopicName = 'Polymorphism';

EXEC SP_AddNewTopic @CourseId = 2, @TopicName = 'Razor Pages';
EXEC SP_AddNewTopic @CourseId = 2, @TopicName = 'MVC Pattern';
EXEC SP_AddNewTopic @CourseId = 2, @TopicName = 'API Development';
EXEC SP_AddNewTopic @CourseId = 2, @TopicName = 'Authentication';

EXEC SP_AddNewTopic @CourseId = 3, @TopicName = 'Database First';
EXEC SP_AddNewTopic @CourseId = 3, @TopicName = 'Code First';
EXEC SP_AddNewTopic @CourseId = 3, @TopicName = 'Migrations';
EXEC SP_AddNewTopic @CourseId = 3, @TopicName = 'LINQ';

EXEC SP_AddNewTopic @CourseId = 4, @TopicName = 'Blazor Components';
EXEC SP_AddNewTopic @CourseId = 4, @TopicName = 'Blazor Server';
EXEC SP_AddNewTopic @CourseId = 4, @TopicName = 'Blazor WebAssembly';
EXEC SP_AddNewTopic @CourseId = 4, @TopicName = 'State Management';

EXEC SP_AddNewTopic @CourseId = 5, @TopicName = 'Variables and Data Types';
EXEC SP_AddNewTopic @CourseId = 5, @TopicName = 'Control Structures';
EXEC SP_AddNewTopic @CourseId = 5, @TopicName = 'Functions';
EXEC SP_AddNewTopic @CourseId = 5, @TopicName = 'Modules and Packages';

EXEC SP_AddNewTopic @CourseId = 6, @TopicName = 'Django Models';
EXEC SP_AddNewTopic @CourseId = 6, @TopicName = 'Django Views';
EXEC SP_AddNewTopic @CourseId = 6, @TopicName = 'Django Templates';
EXEC SP_AddNewTopic @CourseId = 6, @TopicName = 'Django Admin';

EXEC SP_AddNewTopic @CourseId = 7, @TopicName = 'Flask Basics';
EXEC SP_AddNewTopic @CourseId = 7, @TopicName = 'Routing';
EXEC SP_AddNewTopic @CourseId = 7, @TopicName = 'Templates';
EXEC SP_AddNewTopic @CourseId = 7, @TopicName = 'Forms';

EXEC SP_AddNewTopic @CourseId = 8, @TopicName = 'NumPy';
EXEC SP_AddNewTopic @CourseId = 8, @TopicName = 'Pandas';
EXEC SP_AddNewTopic @CourseId = 8, @TopicName = 'Matplotlib';
EXEC SP_AddNewTopic @CourseId = 8, @TopicName = 'Seaborn';

EXEC SP_AddNewTopic @CourseId = 9, @TopicName = 'Introduction to Hacking';
EXEC SP_AddNewTopic @CourseId = 9, @TopicName = 'Footprinting';
EXEC SP_AddNewTopic @CourseId = 9, @TopicName = 'Scanning';
EXEC SP_AddNewTopic @CourseId = 9, @TopicName = 'Enumeration';

EXEC SP_AddNewTopic @CourseId = 10, @TopicName = 'Firewalls';
EXEC SP_AddNewTopic @CourseId = 10, @TopicName = 'Intrusion Detection';
EXEC SP_AddNewTopic @CourseId = 10, @TopicName = 'VPNs';
EXEC SP_AddNewTopic @CourseId = 10, @TopicName = 'Wireless Security';

EXEC SP_AddNewTopic @CourseId = 11, @TopicName = 'Reconnaissance';
EXEC SP_AddNewTopic @CourseId = 11, @TopicName = 'Exploitation';
EXEC SP_AddNewTopic @CourseId = 11, @TopicName = 'Post-Exploitation';
EXEC SP_AddNewTopic @CourseId = 11, @TopicName = 'Reporting';

EXEC SP_AddNewTopic @CourseId = 12, @TopicName = 'Symmetric Encryption';
EXEC SP_AddNewTopic @CourseId = 12, @TopicName = 'Asymmetric Encryption';
EXEC SP_AddNewTopic @CourseId = 12, @TopicName = 'Hashing';
EXEC SP_AddNewTopic @CourseId = 12, @TopicName = 'Digital Signatures';


-- Add 5 students
EXEC SP_AddNewStudent 
    @St_FName = 'Eslam',
    @St_LName = 'Elsayed',
    @DateOfBirth = '2000-01-01',
    @Gender = 'Male',
    @EnrollmentDate = '2023-09-01',
    @Email = 'eslam.elsayed@student.edu',
    @Password = 'student123',
    @PhoneNumber = '111-111-1111',
    @DepartmentID = 1;

EXEC SP_EnrollStudentInCourse @StudentId = 1, @CourseId = 1;
EXEC SP_EnrollStudentInCourse @StudentId = 1, @CourseId = 2;
EXEC SP_EnrollStudentInCourse @StudentId = 1, @CourseId = 3;
EXEC SP_EnrollStudentInCourse @StudentId = 1, @CourseId = 4;


EXEC SP_AddNewStudent 
    @St_FName = 'Abdalla',
    @St_LName = 'Osama',
    @DateOfBirth = '2000-02-02',
    @Gender = 'Male',
    @EnrollmentDate = '2023-09-01',
    @Email = 'abdalla.osama@student.edu',
    @Password = 'student123',
    @PhoneNumber = '222-222-2222',
    @DepartmentID = 1;

EXEC SP_EnrollStudentInCourse @StudentId = 2, @CourseId = 1;
EXEC SP_EnrollStudentInCourse @StudentId = 2, @CourseId = 2;
EXEC SP_EnrollStudentInCourse @StudentId = 2, @CourseId = 3;
EXEC SP_EnrollStudentInCourse @StudentId = 2, @CourseId = 4;

EXEC SP_AddNewStudent 
    @St_FName = 'Mariam',
    @St_LName = 'Elkomi',
    @DateOfBirth = '2000-03-03',
    @Gender = 'Female',
    @EnrollmentDate = '2023-09-01',
    @Email = 'mariam.elkomi@student.edu',
    @Password = 'student123',
    @PhoneNumber = '333-333-3333',
    @DepartmentID = 1;

EXEC SP_EnrollStudentInCourse @StudentId = 3, @CourseId = 1;
EXEC SP_EnrollStudentInCourse @StudentId = 3, @CourseId = 2;
EXEC SP_EnrollStudentInCourse @StudentId = 3, @CourseId = 3;
EXEC SP_EnrollStudentInCourse @StudentId = 3, @CourseId = 4;

EXEC SP_AddNewStudent 
    @St_FName = 'Omar',
    @St_LName = 'Saad',
    @DateOfBirth = '2000-04-04',
    @Gender = 'Male',
    @EnrollmentDate = '2023-09-01',
    @Email = 'omar.saad@student.edu',
    @Password = 'student123',
    @PhoneNumber = '444-444-4444',
    @DepartmentID = 1;

EXEC SP_EnrollStudentInCourse @StudentId = 4, @CourseId = 1;
EXEC SP_EnrollStudentInCourse @StudentId = 4, @CourseId = 2;
EXEC SP_EnrollStudentInCourse @StudentId = 4, @CourseId = 3;
EXEC SP_EnrollStudentInCourse @StudentId = 4, @CourseId = 4;

EXEC SP_AddNewStudent 
    @St_FName = 'Mohamed',
    @St_LName = 'Masoud',
    @DateOfBirth = '2000-05-05',
    @Gender = 'Male',
    @EnrollmentDate = '2023-09-01',
    @Email = 'mohamed.masoud@student.edu',
    @Password = 'student123',
    @PhoneNumber = '555-555-5555',
    @DepartmentID = 1;


EXEC SP_EnrollStudentInCourse @StudentId = 5, @CourseId = 1;
EXEC SP_EnrollStudentInCourse @StudentId = 5, @CourseId = 2;
EXEC SP_EnrollStudentInCourse @StudentId = 5, @CourseId = 3;
EXEC SP_EnrollStudentInCourse @StudentId = 5, @CourseId = 4;

-------------------------------------------------------------------------
EXEC SP_AddNewStudent 
    @St_FName = 'Mostafa',
    @St_LName = 'Mohamed',
    @DateOfBirth = '2002-05-05',
    @Gender = 'Male',
    @EnrollmentDate = '2023-09-01',
    @Email = 'mostafa.mohamed@student.edu',
    @Password = 'student123',
    @PhoneNumber = '555-555-5555',
    @DepartmentID = 2;


EXEC SP_EnrollStudentInCourse @StudentId = 6, @CourseId = 5;
EXEC SP_EnrollStudentInCourse @StudentId = 6, @CourseId = 6;
EXEC SP_EnrollStudentInCourse @StudentId = 6, @CourseId = 7;
EXEC SP_EnrollStudentInCourse @StudentId = 6, @CourseId = 8;

EXEC SP_AddNewStudent 
    @St_FName = 'Ahmed',
    @St_LName = 'Elsayed',
    @DateOfBirth = '2001-05-05',
    @Gender = 'Male',
    @EnrollmentDate = '2023-09-01',
    @Email = 'ahmed.elsayed@student.edu',
    @Password = 'student123',
    @PhoneNumber = '555-555-5555',
    @DepartmentID = 2;


EXEC SP_EnrollStudentInCourse @StudentId = 7, @CourseId = 5;
EXEC SP_EnrollStudentInCourse @StudentId = 7, @CourseId = 6;
EXEC SP_EnrollStudentInCourse @StudentId = 7, @CourseId = 7;
EXEC SP_EnrollStudentInCourse @StudentId = 7, @CourseId = 8;


-------------------------------------------------------
-- Add Questions and Choices for Course: C# OOP (ID:1)
-------------------------------------------------------
-- Add 10 True/False questions
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'C# is a strongly typed language.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Inheritance allows a class to inherit properties and methods from another class.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Abstraction is the process of hiding implementation details.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Polymorphism allows methods to have the same name but different implementations.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Encapsulation is the process of wrapping data and methods into a single unit.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'A class can inherit from multiple classes in C#.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'An abstract class cannot be instantiated.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Interfaces can contain method implementations.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'A constructor is used to initialize an object.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'C# supports multiple inheritance.', @Type = 'TF', @Mark = 1.0;

-- Add 10 MCQ questions
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'What is the base class for all classes in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Which keyword is used to define a class in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'What is the purpose of the "virtual" keyword in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Which access modifier allows access within the same assembly?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'What is the purpose of the "override" keyword in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Which keyword is used to prevent a class from being inherited?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'What is the purpose of the "interface" keyword in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Which method is called when an object is created in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'What is the purpose of the "abstract" keyword in C#?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 1, @QuestionText = 'Which keyword is used to define a constant in C#?', @Type = 'MCQ', @Mark = 2.0;

-- Add Choices
-- Question 1: C# is a strongly typed language.
EXEC SP_AddNewChoice @QuestionId = 1, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 1, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 2: Inheritance allows a class to inherit properties and methods from another class.
EXEC SP_AddNewChoice @QuestionId = 2, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 2, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 3: Abstraction is the process of hiding implementation details.
EXEC SP_AddNewChoice @QuestionId = 3, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 3, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 4: Polymorphism allows methods to have the same name but different implementations.
EXEC SP_AddNewChoice @QuestionId = 4, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 4, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 5: Encapsulation is the process of wrapping data and methods into a single unit.
EXEC SP_AddNewChoice @QuestionId = 5, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 5, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 6: A class can inherit from multiple classes in C#.
EXEC SP_AddNewChoice @QuestionId = 6, @ChoiceText = 'True', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 6, @ChoiceText = 'False', @IsCorrect = 1;

-- Question 7: An abstract class cannot be instantiated.
EXEC SP_AddNewChoice @QuestionId = 7, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 7, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 8: Interfaces can contain method implementations.
EXEC SP_AddNewChoice @QuestionId = 8, @ChoiceText = 'True', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 8, @ChoiceText = 'False', @IsCorrect = 1;

-- Question 9: A constructor is used to initialize an object.
EXEC SP_AddNewChoice @QuestionId = 9, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 9, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 10: C# supports multiple inheritance.
EXEC SP_AddNewChoice @QuestionId = 10, @ChoiceText = 'True', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 10, @ChoiceText = 'False', @IsCorrect = 1;

-- Question 11: What is the base class for all classes in C#?
EXEC SP_AddNewChoice @QuestionId = 11, @ChoiceText = 'Object', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 11, @ChoiceText = 'System', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 11, @ChoiceText = 'Base', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 11, @ChoiceText = 'Main', @IsCorrect = 0;

-- Question 12: Which keyword is used to define a class in C#?
EXEC SP_AddNewChoice @QuestionId = 12, @ChoiceText = 'class', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 12, @ChoiceText = 'struct', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 12, @ChoiceText = 'interface', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 12, @ChoiceText = 'object', @IsCorrect = 0;

-- Question 13: What is the purpose of the "virtual" keyword in C#?
EXEC SP_AddNewChoice @QuestionId = 13, @ChoiceText = 'To allow a method to be overridden', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 13, @ChoiceText = 'To prevent a method from being overridden', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 13, @ChoiceText = 'To define a static method', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 13, @ChoiceText = 'To define a sealed method', @IsCorrect = 0;

-- Question 14: Which access modifier allows access within the same assembly?
EXEC SP_AddNewChoice @QuestionId = 14, @ChoiceText = 'internal', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 14, @ChoiceText = 'private', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 14, @ChoiceText = 'protected', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 14, @ChoiceText = 'public', @IsCorrect = 0;

-- Question 15: What is the purpose of the "override" keyword in C#?
EXEC SP_AddNewChoice @QuestionId = 15, @ChoiceText = 'To override a method in a base class', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 15, @ChoiceText = 'To hide a method in a base class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 15, @ChoiceText = 'To define a new method', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 15, @ChoiceText = 'To prevent a method from being overridden', @IsCorrect = 0;

-- Question 16: Which keyword is used to prevent a class from being inherited?
EXEC SP_AddNewChoice @QuestionId = 16, @ChoiceText = 'sealed', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 16, @ChoiceText = 'abstract', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 16, @ChoiceText = 'static', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 16, @ChoiceText = 'private', @IsCorrect = 0;

-- Question 17: What is the purpose of the "interface" keyword in C#?
EXEC SP_AddNewChoice @QuestionId = 17, @ChoiceText = 'To define a contract for classes', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 17, @ChoiceText = 'To define a base class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 17, @ChoiceText = 'To define a static class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 17, @ChoiceText = 'To define a sealed class', @IsCorrect = 0;

-- Question 18: Which method is called when an object is created in C#?
EXEC SP_AddNewChoice @QuestionId = 18, @ChoiceText = 'Constructor', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 18, @ChoiceText = 'Destructor', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 18, @ChoiceText = 'Main', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 18, @ChoiceText = 'Initialize', @IsCorrect = 0;

-- Question 19: What is the purpose of the "abstract" keyword in C#?
EXEC SP_AddNewChoice @QuestionId = 19, @ChoiceText = 'To define a class that cannot be instantiated', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 19, @ChoiceText = 'To define a sealed class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 19, @ChoiceText = 'To define a static class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 19, @ChoiceText = 'To define a private class', @IsCorrect = 0;

-- Question 20: Which keyword is used to define a constant in C#?
EXEC SP_AddNewChoice @QuestionId = 20, @ChoiceText = 'const', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 20, @ChoiceText = 'readonly', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 20, @ChoiceText = 'static', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 20, @ChoiceText = 'final', @IsCorrect = 0;

---------------------------------------------------------------
-- Add Questions and Choices for Course: Python Basics (ID:5)
--------------------------------------------------------------
-- True/False Questions
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python is an interpreted language.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python supports multiple inheritance.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python lists are mutable.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python tuples are immutable.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python dictionaries are ordered.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python supports method overloading.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python has built-in support for regular expressions.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python is a statically typed language.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python supports functional programming.', @Type = 'TF', @Mark = 1.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Python has a garbage collector.', @Type = 'TF', @Mark = 1.0;

-- MCQ Questions
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'What is the output of `print(type([]))` in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Which keyword is used to define a function in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'What is the purpose of the `__init__` method in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Which module is used for working with dates in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'What is the purpose of the `lambda` keyword in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Which of the following is NOT a Python data structure?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'What is the purpose of the `yield` keyword in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Which library is used for data visualization in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'What is the purpose of the `with` statement in Python?', @Type = 'MCQ', @Mark = 2.0;
EXEC SP_AddNewQuestion @CourseId = 5, @QuestionText = 'Which of the following is used to install Python packages?', @Type = 'MCQ', @Mark = 2.0;

-- Question 21: Python is an interpreted language.
EXEC SP_AddNewChoice @QuestionId = 21, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 21, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 22: Python supports multiple inheritance.
EXEC SP_AddNewChoice @QuestionId = 22, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 22, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 23: Python lists are mutable.
EXEC SP_AddNewChoice @QuestionId = 23, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 23, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 24: Python tuples are immutable.
EXEC SP_AddNewChoice @QuestionId = 24, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 24, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 25: Python dictionaries are ordered.
EXEC SP_AddNewChoice @QuestionId = 25, @ChoiceText = 'True', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 25, @ChoiceText = 'False', @IsCorrect = 1;

-- Question 26: Python supports method overloading.
EXEC SP_AddNewChoice @QuestionId = 26, @ChoiceText = 'True', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 26, @ChoiceText = 'False', @IsCorrect = 1;

-- Question 27: Python has built-in support for regular expressions.
EXEC SP_AddNewChoice @QuestionId = 27, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 27, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 28: Python is a statically typed language.
EXEC SP_AddNewChoice @QuestionId = 28, @ChoiceText = 'True', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 28, @ChoiceText = 'False', @IsCorrect = 1;

-- Question 29: Python supports functional programming.
EXEC SP_AddNewChoice @QuestionId = 29, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 29, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 30: Python has a garbage collector.
EXEC SP_AddNewChoice @QuestionId = 30, @ChoiceText = 'True', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 30, @ChoiceText = 'False', @IsCorrect = 0;

-- Question 31: What is the output of `print(type([]))` in Python?
EXEC SP_AddNewChoice @QuestionId = 31, @ChoiceText = 'list', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 31, @ChoiceText = 'tuple', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 31, @ChoiceText = 'dict', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 31, @ChoiceText = 'set', @IsCorrect = 0;

-- Question 32: Which keyword is used to define a function in Python?
EXEC SP_AddNewChoice @QuestionId = 32, @ChoiceText = 'def', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 32, @ChoiceText = 'function', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 32, @ChoiceText = 'define', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 32, @ChoiceText = 'func', @IsCorrect = 0;

-- Question 33: What is the purpose of the `__init__` method in Python?
EXEC SP_AddNewChoice @QuestionId = 33, @ChoiceText = 'To initialize an object', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 33, @ChoiceText = 'To define a class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 33, @ChoiceText = 'To create a function', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 33, @ChoiceText = 'To import a module', @IsCorrect = 0;

-- Question 34: Which module is used for working with dates in Python?
EXEC SP_AddNewChoice @QuestionId = 34, @ChoiceText = 'datetime', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 34, @ChoiceText = 'time', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 34, @ChoiceText = 'calendar', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 34, @ChoiceText = 'date', @IsCorrect = 0;

-- Question 35: What is the purpose of the `lambda` keyword in Python?
EXEC SP_AddNewChoice @QuestionId = 35, @ChoiceText = 'To define an anonymous function', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 35, @ChoiceText = 'To define a class', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 35, @ChoiceText = 'To define a module', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 35, @ChoiceText = 'To define a loop', @IsCorrect = 0;

-- Question 36: Which of the following is NOT a Python data structure?
EXEC SP_AddNewChoice @QuestionId = 36, @ChoiceText = 'array', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 36, @ChoiceText = 'list', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 36, @ChoiceText = 'queue', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 36, @ChoiceText = 'stack', @IsCorrect = 0;

-- Question 37: What is the purpose of the `yield` keyword in Python?
EXEC SP_AddNewChoice @QuestionId = 37, @ChoiceText = 'To define a generator', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 37, @ChoiceText = 'To return a value from a function', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 37, @ChoiceText = 'To define a loop', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 37, @ChoiceText = 'To define a class', @IsCorrect = 0;

-- Question 38: Which library is used for data visualization in Python?
EXEC SP_AddNewChoice @QuestionId = 38, @ChoiceText = 'matplotlib', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 38, @ChoiceText = 'numpy', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 38, @ChoiceText = 'pandas', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 38, @ChoiceText = 'scipy', @IsCorrect = 0;

-- Question 39: What is the purpose of the `with` statement in Python?
EXEC SP_AddNewChoice @QuestionId = 39, @ChoiceText = 'To handle exceptions', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 39, @ChoiceText = 'To open files', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 39, @ChoiceText = 'To define a loop', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 39, @ChoiceText = 'To define a function', @IsCorrect = 0;

-- Question 40: Which of the following is used to install Python packages?
EXEC SP_AddNewChoice @QuestionId = 40, @ChoiceText = 'pip', @IsCorrect = 1;
EXEC SP_AddNewChoice @QuestionId = 40, @ChoiceText = 'npm', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 40, @ChoiceText = 'apt-get', @IsCorrect = 0;
EXEC SP_AddNewChoice @QuestionId = 40, @ChoiceText = 'yum', @IsCorrect = 0;

--------------------------------------
-- Generate an exam (Course: C# OOP)
--------------------------------------
EXEC SP_ExamGeneration 
    @ExamName = 'C# OOP Exam 01',
    @CourseId = 1,
    @NumberOfMCQ = 3,
    @NumberOfTF = 7,
    @StartTime = '2025-02-01 09:00:00',
    @Duration = 60;

EXEC SP_ExamGeneration 
    @ExamName = 'C# OOP Exam 02',
    @CourseId = 1,
    @NumberOfMCQ = 3,
    @NumberOfTF = 7,
    @StartTime = '2025-02-05 09:00:00',
    @Duration = 60;

EXEC SP_ExamGeneration 
    @ExamName = 'Python Basics Exam 01',
    @CourseId = 5,
    @NumberOfMCQ = 4,
    @NumberOfTF = 6,
    @StartTime = '2025-02-05 09:00:00',
    @Duration = 60;

---------------------------------------------------------------------
-- Display all exams for CourseID = 1
EXEC SP_DisplayAllExams @CourseId = 1;

-- Display all exams for CourseID = 5
EXEC SP_DisplayAllExams @CourseId = 5;

---------------------------------------------------------------------
--- Display Spacifc Exam
SELECT 
    q.QuestionID,
    q.QuestionText,
    q.QuestionType,
    q.Mark,
    c.ChoiceID,
    c.ChoiceText,
    qc.IsCorrect
FROM Questions q
JOIN ExamQuestions eq ON q.QuestionID = eq.QuestionID
JOIN QuestionChoices qc ON q.QuestionID = qc.QuestionID
JOIN Choices c ON qc.ChoiceID = c.ChoiceID
WHERE eq.ExamID = 7
ORDER BY q.QuestionID, c.ChoiceID;

---------------------------------------------------------
-- Exam Process in Student id = 1    .NET
---------------------------------------------------------
EXEC SP_CheckExamEligibility @StudentId = 1, @CourseId = 1;

EXEC SP_StartExam @StudentId = 1, @CourseId = 1;

DECLARE @Answers StudentAnswersType;
INSERT INTO @Answers (QuestionId, CorrectChoiceId)
VALUES 
    (1, 1), 
    (3, 1), 
    (5, 1),
    (6, 2),
    (7, 1),
    (8, 2),
    (10, 2),
    (16, 21),
    (18, 28),
    (19, 31)

EXEC SP_AddStudentAnswers @ExamId = 5, @StudentId = 1, @Answers = @Answers;

EXEC SP_CalculateGrade @ExamId = 5, @StudentId = 1;

---------------------------------------------------------
-- Exam Process in Student id = 2   .NET
---------------------------------------------------------
EXEC SP_CheckExamEligibility @StudentId = 2, @CourseId = 1;

EXEC SP_StartExam @StudentId = 2, @CourseId = 1;

DECLARE @Answers StudentAnswersType;
INSERT INTO @Answers (QuestionId, CorrectChoiceId)
VALUES 
    (1, 1), 
    (3, 1), 
    (5, 1),
    (6, 2),
    (7, 1),
    (8, 2),
    (10, 2),
    (16, 21),
    (18, 28),
    (19, 31)

EXEC SP_AddStudentAnswers @ExamId = 5, @StudentId = 2, @Answers = @Answers;

EXEC SP_CalculateGrade @ExamId = 5, @StudentId = 2;

---------------------------------------------------------
-- Exam Process in Student id = 3  .NET
---------------------------------------------------------
EXEC SP_CheckExamEligibility @StudentId = 3, @CourseId = 1;

EXEC SP_StartExam @StudentId = 3, @CourseId = 1;

DECLARE @Answers StudentAnswersType;
INSERT INTO @Answers (QuestionId, CorrectChoiceId)
VALUES 
    (1, 1), 
    (2, 1), 
    (4, 2),
    (6, 2),
    (8, 2),
    (9, 1),
    (10, 2),
    (12, 7),
    (16, 22),
    (20, 33)

EXEC SP_AddStudentAnswers @ExamId = 6, @StudentId = 3, @Answers = @Answers;

EXEC SP_CalculateGrade @ExamId = 6, @StudentId = 3;

---------------------------------------------------------
-- Exam Process in Student id = 6   Python
---------------------------------------------------------
EXEC SP_CheckExamEligibility @StudentId = 6, @CourseId = 5;

EXEC SP_StartExam @StudentId = 6, @CourseId = 5;

DECLARE @Answers StudentAnswersType;
INSERT INTO @Answers (QuestionId, CorrectChoiceId)
VALUES 
    (22, 1), 
    (24, 1), 
    (25, 2),
    (26, 2),
    (27, 1),
    (28, 2),
    (31, 36),
    (36, 55),
    (39, 65),
    (40, 67)

EXEC SP_AddStudentAnswers @ExamId = 7, @StudentId = 6, @Answers = @Answers;

EXEC SP_CalculateGrade @ExamId = 7, @StudentId = 6;
---------------------------------------------------------
-- Exam Process in Student id = 7   Python
---------------------------------------------------------
EXEC SP_CheckExamEligibility @StudentId = 7, @CourseId = 5;

EXEC SP_StartExam @StudentId = 7, @CourseId = 5;

DECLARE @Answers StudentAnswersType;
INSERT INTO @Answers (QuestionId, CorrectChoiceId)
VALUES 
    (22, 1), 
    (24, 1), 
    (25, 2),
    (26, 2),
    (27, 1),
    (28, 2),
    (31, 36),
    (36, 55),
    (39, 65),
    (40, 67)

EXEC SP_AddStudentAnswers @ExamId = 7, @StudentId = 7, @Answers = @Answers;

EXEC SP_CalculateGrade @ExamId = 7, @StudentId = 7;
--------------------------------------------------------------

