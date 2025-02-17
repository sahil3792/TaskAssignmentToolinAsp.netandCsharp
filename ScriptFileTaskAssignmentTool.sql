USE [master]
GO
/****** Object:  Database [taskassignmenttool]    Script Date: 26-07-2024 01:20:19 ******/
CREATE DATABASE [taskassignmenttool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'taskassignmenttool', FILENAME = N'C:\Users\USER\taskassignmenttool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'taskassignmenttool_log', FILENAME = N'C:\Users\USER\taskassignmenttool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [taskassignmenttool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [taskassignmenttool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [taskassignmenttool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [taskassignmenttool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [taskassignmenttool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [taskassignmenttool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [taskassignmenttool] SET ARITHABORT OFF 
GO
ALTER DATABASE [taskassignmenttool] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [taskassignmenttool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [taskassignmenttool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [taskassignmenttool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [taskassignmenttool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [taskassignmenttool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [taskassignmenttool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [taskassignmenttool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [taskassignmenttool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [taskassignmenttool] SET  ENABLE_BROKER 
GO
ALTER DATABASE [taskassignmenttool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [taskassignmenttool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [taskassignmenttool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [taskassignmenttool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [taskassignmenttool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [taskassignmenttool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [taskassignmenttool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [taskassignmenttool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [taskassignmenttool] SET  MULTI_USER 
GO
ALTER DATABASE [taskassignmenttool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [taskassignmenttool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [taskassignmenttool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [taskassignmenttool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [taskassignmenttool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [taskassignmenttool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [taskassignmenttool] SET QUERY_STORE = OFF
GO
USE [taskassignmenttool]
GO
/****** Object:  Table [dbo].[batches]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[batches](
	[BatchNo] [int] IDENTITY(200,1) NOT NULL,
	[BatchName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BatchNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task](
	[taskID] [int] IDENTITY(300,1) NOT NULL,
	[taskname] [varchar](100) NULL,
	[attachment] [varchar](500) NULL,
	[BatchNo] [int] NULL,
	[createdDate] [datetime] NULL,
	[SubmissionDate]  AS (dateadd(day,(2),[CreatedDate])) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_students]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_students](
	[TaskStudentID] [int] IDENTITY(400,1) NOT NULL,
	[TaskID] [int] NULL,
	[UserID] [int] NULL,
	[Solution] [varchar](255) NULL,
	[SubmissionTime] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[Score] [decimal](10, 5) NULL,
	[Reason] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UserID] [int] IDENTITY(100,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[UserRole] [varchar](100) NULL,
	[ProfilePicture] [varchar](100) NULL,
	[BatchNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[task_students]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[task] ([taskID])
GO
ALTER TABLE [dbo].[task_students]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[AddinTaskStudent]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddinTaskStudent]
@TaskID int,
@studentID int
as
begin
	INSERT INTO task_students (TaskID, UserID) VALUES (@TaskID,@studentID)
end
GO
/****** Object:  StoredProcedure [dbo].[AddSolutionToTaskStudent]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddSolutionToTaskStudent]
@Solution Varchar(100),
@SubmissionTime dateTime,
@TaskStudentID int
as
begin
	UPDATE task_students SET Solution = @Solution, SubmissionTime = @SubmissionTime WHERE TaskStudentID = @TaskStudentID
end
GO
/****** Object:  StoredProcedure [dbo].[AddTask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddTask]
@taskname varchar(100),
@attachment varchar(100),
@batchno int,
@createdDate datetime
as
begin
	INSERT INTO task (TaskName,attachment, BatchNo, CreatedDate) 
                VALUES (@taskname,@attachment, @batchno, @createdDate); 
                SELECT SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[addUser]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addUser]
@Username varchar(100),
@Email varchar(100),
@password varchar(100),
@UserRole varchar(100),
@ProfilePicture varchar(100),
@BatchNo int
as
begin
	Insert users values (@Username,@Email,@password,@UserRole,@ProfilePicture,@BatchNo);
end
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AuthenticateUser] 
@username varchar(100),
@password varchar(100)
as
begin
	select * from users where username = @username and Password = @password;
end
GO
/****** Object:  StoredProcedure [dbo].[DisplayRetask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DisplayRetask]
@UserID int
as 
begin
	 SELECT 
    t.TaskName, 
    ts.Status AS TaskStatus, 
    ts.Reason, 
    ts.TaskStudentID
FROM 
    Task_Students ts
INNER JOIN 
    Task t ON ts.TaskID = t.TaskID
WHERE 
    ts.UserID = @UserID 
    AND ts.Reason IS NOT NULL
end
GO
/****** Object:  StoredProcedure [dbo].[DisplayTaskForUser]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DisplayTaskForUser]
@UserID int
as
begin
	SELECT 
    t.TaskName,
    t.SubmissionDate,
    ts.SubmissionTime,
    ts.Status,
    ts.Score
FROM task_students ts
INNER JOIN task t ON ts.TaskID = t.TaskID
WHERE ts.UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[fetchOnlyApprovedTask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[fetchOnlyApprovedTask]
as
begin
	SELECT 
    u.UserName, 
    u.Email,
    ts.SubmissionTime AS FinishDate, 
    ts.TaskStudentID,
    t.SubmissionDate,
    ts.Score
FROM task_students ts
INNER JOIN task t ON ts.TaskID = t.TaskID
INNER JOIN users u ON ts.UserID = u.UserID
WHERE ts.Status = 'Approved'
end
GO
/****** Object:  StoredProcedure [dbo].[FetchRejectedTask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchRejectedTask]
as
begin
	SELECT 
    u.UserID,
    u.UserName,
    u.Email,
    ts.SubmissionTime AS FinishDate,
    ts.TaskID,
    u.BatchNo
FROM task_students ts
INNER JOIN task t ON ts.TaskID = t.TaskID
INNER JOIN users u ON ts.UserID = u.UserID
WHERE ts.Status = 'Rejected';
end
GO
/****** Object:  StoredProcedure [dbo].[FetchTask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchTask]
as
begin
SELECT 
    u.UserName, 
    ts.Solution AS AttachmentPath, 
    t.TaskName, 
    ts.SubmissionTime AS FinishDate, 
    ts.TaskStudentID,
    t.SubmissionDate
FROM task_students ts
INNER JOIN task t ON ts.TaskID = t.TaskID
INNER JOIN users u ON ts.UserID = u.UserID
WHERE ts.Solution IS NOT NULL AND (ts.Status IS NULL OR ts.Status NOT IN ('Approved', 'Rejected'))
end
GO
/****** Object:  StoredProcedure [dbo].[FetchTaskSubmissionDate]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchTaskSubmissionDate]
@TaskID int
as
begin
	SELECT SubmissionDate FROM task WHERE TaskID = @TaskID;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertNewTask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertNewTask]
@TaskName varchar(100),
@AttachmentPath varchar(100),
@BatchNo int,
@CreatedDate DateTime
as
begin
	INSERT INTO task(TaskName, attachment, BatchNo, CreatedDate) VALUES(@TaskName, @AttachmentPath, @BatchNo, @CreatedDate); SELECT SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[InsertTaskStudentRejection]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertTaskStudentRejection]
@TaskID int,
@UserID int
as 
begin
	INSERT INTO task_students (TaskID, UserID) VALUES (@TaskID, @UserID)
end
GO
/****** Object:  StoredProcedure [dbo].[LoadStudents]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadStudents]
@BatchNo int
as
begin
	SELECT UserID, Username FROM users WHERE BatchNo = @BatchNo;
end
GO
/****** Object:  StoredProcedure [dbo].[showbatches]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showbatches]
as
begin
	select BatchNo,BatchName from batches;
end
GO
/****** Object:  StoredProcedure [dbo].[TopThreeUser]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TopThreeUser]
as
begin
	SELECT TOP 3 
    u.UserID, 
    u.UserName, 
    u.ProfilePicture, 
    SUM(ts.Score) AS TotalScore
FROM Users u
INNER JOIN Task_Students ts ON u.UserID = ts.UserID
WHERE ts.SubmissionTime >= DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()), 0) 
  AND ts.SubmissionTime < DATEADD(WEEK, DATEDIFF(WEEK, 0, GETDATE()) + 1, 0)
GROUP BY u.UserID, u.UserName, u.ProfilePicture
ORDER BY TotalScore DESC
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTaskScore]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateTaskScore]
@Score decimal(10,5),
@TaskStudentID int
as
begin
	UPDATE task_students SET Score = @Score WHERE TaskStudentID = @TaskStudentID
end
GO
/****** Object:  StoredProcedure [dbo].[UserTask]    Script Date: 26-07-2024 01:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UserTask]
@UserID int
as
begin
	SELECT t.TaskID, t.TaskName, t.CreatedDate AS AssignedDate, t.Attachment AS AttachmentPath, t.SubmissionDate, ts.TaskStudentID
        FROM task t
        INNER JOIN task_students ts ON t.TaskID = ts.TaskID
        WHERE ts.UserID = @UserID AND ts.Solution IS NULL
end
GO
USE [master]
GO
ALTER DATABASE [taskassignmenttool] SET  READ_WRITE 
GO
select * from task
Select * from Task_students
select * from users
update task set createdDate = '2024-07-24 10:15:07.520' where taskid = 302
insert into batches values ('Batch 1'),('Batch 2'),('Batch 3')
select * from Users
insert into users (username,Email,password,UserRole) values ('Sahil3792','Sahil@gmail.com','123','Admin')


alter table task_students Add AssignDate datetime