USE [master]
GO
/****** Object:  Database [Authentication]    Script Date: 9/20/2021 3:19:30 AM ******/
CREATE DATABASE [Authentication] ON  PRIMARY 
( NAME = N'Authentication', FILENAME = N'E:\Authentication.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Authentication_log', FILENAME = N'E:\Authentication_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Authentication] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Authentication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Authentication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Authentication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Authentication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Authentication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Authentication] SET ARITHABORT OFF 
GO
ALTER DATABASE [Authentication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Authentication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Authentication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Authentication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Authentication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Authentication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Authentication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Authentication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Authentication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Authentication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Authentication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Authentication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Authentication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Authentication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Authentication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Authentication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Authentication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Authentication] SET RECOVERY FULL 
GO
ALTER DATABASE [Authentication] SET  MULTI_USER 
GO
ALTER DATABASE [Authentication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Authentication] SET DB_CHAINING OFF 
GO
USE [Authentication]
GO
/****** Object:  User [usrparadoc]    Script Date: 9/20/2021 3:19:30 AM ******/
CREATE USER [usrparadoc] FOR LOGIN [usrparadoc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[PageId] [int] NOT NULL,
	[Path] [varchar](200) NOT NULL,
	[DisplayText] [varchar](50) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[ParameterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Value] [varchar](max) NULL,
 CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED 
(
	[ParameterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePage]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePage](
	[RoleId] [int] NOT NULL,
	[PageId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[UserLogin] [varchar](100) NULL,
	[FullName] [varchar](120) NULL,
	[Password] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Age] [int] NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolePage]  WITH CHECK ADD  CONSTRAINT [FK_RolePage_Page] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([PageId])
GO
ALTER TABLE [dbo].[RolePage] CHECK CONSTRAINT [FK_RolePage_Page]
GO
ALTER TABLE [dbo].[RolePage]  WITH CHECK ADD  CONSTRAINT [FK_RolePage_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RolePage] CHECK CONSTRAINT [FK_RolePage_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Autenticador 
-- =============================================
CREATE PROCEDURE [dbo].[AuthenticateUser]
	-- Add the parameters for the stored procedure here
	@UserLogin varchar(50),
	@Password varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ResultSuccess bit = 1
	DECLARE @ResultMessage varchar(1000) = null
	DECLARE @Pages varchar(2000) = null
	DECLARE @UserId int

	SELECT @UserId = u.[UserId]
	FROM [User] u
	WHERE  u.[UserLogin] = @UserLogin
	AND  u.[Password] = @Password
	AND u.[Enabled] = 1


	SET @ResultMessage = (CASE
						    WHEN @UserId is not null THEN null						  
						    WHEN @UserId is null THEN 'El usuario no existe o no es válido'
						    ELSE 'Error al autenticar el usuario'
						  END)
	SELECT @ResultSuccess = CASE WHEN @ResultMessage is null THEN 1 ELSE 0 END

	SELECT @ResultSuccess as [Success]
	      ,@ResultMessage as [Message]
		  ,u.[UserId] as UserId
		  ,u.[FullName] as FullName
		  ,u.[UserLogin] as UserLogin		  
	FROM (SELECT 1 x) x
	LEFT JOIN [User] u on u.[UserId] = @UserId


END
GO
/****** Object:  StoredProcedure [dbo].[CancelUser]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Deshabilita Usuarios
-- =============================================
CREATE PROCEDURE [dbo].[CancelUser]
	-- Add the parameters for the stored procedure here
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [User] 
	SET [Enabled] = 0	
	WHERE UserId = @UserId


	
END


GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Crea Usuarios
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser]
	-- Add the parameters for the stored procedure here
	@FullName varchar(150),
	@Login varchar(150),
	@Password varchar(150),
	@Address varchar(50),
	@Phone varchar(50),
	@Email varchar(50),
	@Age int,
	@RoleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @UserId int
    -- Insert statements for procedure here
	INSERT INTO [User]
	VALUES (@Login, @FullName, @Password, @Address, @Phone, @Email, @Age, 1)
    
	SELECT @UserId = [UserId]
	FROM [User]
	WHERE UserLogin = @Login 	
	
	INSERT INTO [UserRole]
	VALUES (@UserId, @RoleId)
	
	
END


GO
/****** Object:  StoredProcedure [dbo].[GetPagesByUser]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Autenticador 
-- =============================================
CREATE PROCEDURE [dbo].[GetPagesByUser]
	-- Add the parameters for the stored procedure here
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  u.[UserId]
	      ,p.[Path]
		  ,ISNULL(p.[DisplayText], 'empty') as DisplayText
		  ,p.[Enabled]
	FROM [Page] p
	JOIN [RolePage] rp on rp.[PageId] = p.[PageId]
	JOIN [Role] r on r.[RoleId] = rp.[RoleId]
	JOIN [UserRole] ur on ur.[RoleId] = r.[RoleId]
	JOIN [User] u on u.[UserId] = ur.[UserId]
	WHERE u.[UserId] = @UserId
	AND p.[Enabled] = 1
	AND u.[Enabled] = 1

END
GO
/****** Object:  StoredProcedure [dbo].[GetParameter]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Consulta un parámetro
-- =============================================
CREATE PROCEDURE [dbo].[GetParameter]
	-- Add the parameters for the stored procedure here
	@Name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [Parameter] p
	WHERE p.[Name] = @Name
END


GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Consulta Roles
-- =============================================
CREATE PROCEDURE [dbo].[GetRole]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoleId, RoleName FROM [Role] 
	WHERE [Enabled] = 1
END


GO
/****** Object:  StoredProcedure [dbo].[GetRoleById]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Consulta Roles
-- =============================================
CREATE PROCEDURE [dbo].[GetRoleById]
	-- Add the parameters for the stored procedure here
	@RoleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoleId, RoleName FROM [Role] 
	WHERE [Enabled] = 1 AND RoleId = @RoleId
END


GO
/****** Object:  StoredProcedure [dbo].[GetUserByFilter]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Consulta Usuarios
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByFilter]
	-- Add the parameters for the stored procedure here
	@FilterName varchar(100),
	@FilterRole varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT u.UserId, u.UserLogin, u.Password, u.FullName, u.Address, u.Phone, u.Email, u.Age, r.RoleId, r.RoleName FROM [User] u
	INNER JOIN UserRole ur
	ON u.UserId = ur.RoleId
	INNER JOIN [Role] r
	ON ur.RoleId = r.RoleId
	WHERE (u.FullName like '%' + @FilterName+ '%' OR r.RoleName like '%' + @FilterRole+ '%')
	AND u.Enabled = 1
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 9/20/2021 3:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Braian Penagos
-- Create date: 19 de septiembre de 2021
-- Description:	Consulta Usuarios
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser]
	-- Add the parameters for the stored procedure here
	@FullName varchar(150),
	@Login varchar(150),
	@Adress varchar(50),
	@Phone varchar(50),
	@Email varchar(50),
	@Age int,
	@RoleId int,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE u
	SET u.FullName = @FullName, U.UserLogin = @Login, u.[Address] = @Adress, u.Phone = @Phone, u.Email = @Email, u.Age = @Age
	FROM [User] u
	INNER JOIN UserRole ur
	ON u.UserId = ur.RoleId
	WHERE u.UserId = @UserId

	UPDATE UserRole
	SET RoleId = @RoleId
	WHERE UserId = @UserId
	
END


GO
USE [master]
GO
ALTER DATABASE [Authentication] SET  READ_WRITE 
GO
