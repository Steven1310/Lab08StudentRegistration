/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSIS', N'Computing Studies')
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (2, N'ACCT', N'Accounting')
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (3, N'MKTG', N'Marketing')
INSERT INTO [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (4, N'FINC', N'Finance')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO

SET IDENTITY_INSERT [dbo].[Students] ON
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (1, N'Svetlana', N'Rostov', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (2, N'Claire', N'Bloome', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (3, N'Sven', N'Baertschi', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (4, N'Cesar', N'Chavez', 4)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (5, N'Debra', N'Manning', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (6, N'Fadi', N'Hadari', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (7, N'Hanyeng', N'Fen', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (8, N'Hugo', N'Victor', 4)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (9, N'Lance', N'Armstrong', 2)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (10, N'Terry', N'Matthews', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (11, N'Eugene', N'Fei', 4)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (12, N'Michael', N'Thorson', 1)
INSERT INTO [dbo].[Students] ([StudentId], [StudentFirstName], [StudentLastName], [DepartmentId]) VALUES (13, N'Simon', N'Li', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO

SET IDENTITY_INSERT [dbo].[Courses] ON
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (1, 101, 1, N'Programming I')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (2, 102, 1, N'Programming II')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (3, 101, 2, N'Accounting I')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (4, 102, 2, N'Accounting II')
INSERT INTO [dbo].[Courses] ([CourseId], [CourseNumber], [DepartmentId], [CourseName]) VALUES (5, 101, 4, N'Corporate Finance')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO

INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (1, 1)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (2, 1)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (5, 1)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (1, 2)
INSERT INTO [dbo].[StudentCourses] ([CourseId], [StudentId]) VALUES (3, 3)
GO
