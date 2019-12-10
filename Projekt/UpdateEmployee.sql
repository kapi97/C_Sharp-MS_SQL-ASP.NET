--USE [northwind]
--Jako pierwsze "New Query", wykonujemy "Execute"
GO
/****** Object:  Table [dbo].[Employees] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Pierwsza tabela - Employees
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [ntext] NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Birthdate]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmployee] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Druga "tabela" do prawidłowego działania EditEmployee.aspx - sp_UpdateEmployee 
Create Procedure [dbo].[sp_UpdateEmployee](@LastName nvarchar(20),@FirstName nvarchar(10),@Address nvarchar(60),@City nvarchar(15),@ID int)

as
UPDATE [dbo].[Employees]
   SET [LastName] = @LastName,
       [FirstName] = @FirstName,
       [Address] = @Address,
       [City] = @City
    
 WHERE [EmployeeID] = @id
GO

--Przykładowe rekordy - jako drugie "New Query", wykonujemy "Execute"

SET IDENTITY_INSERT [dbo].[Employees] ON 
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Address], [City]) VALUES (1, 'Janusz', 'Szop', 'Krakowska 1', 'Kraków')
SET IDENTITY_INSERT [dbo].[Employees] OFF

SET IDENTITY_INSERT [dbo].[Employees] ON 
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Address], [City]) VALUES (2, 'Grażyna', 'Pracz', 'Warszawska 2', 'Warszawa')
SET IDENTITY_INSERT [dbo].[Employees] OFF
