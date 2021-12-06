USE [Employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[GetUsers]
@Id bigint
AS
IF @Id = 0
BEGIN
SET NOCOUNT ON;
SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status 
FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id  ;
END
ELSE
BEGIN
SET NOCOUNT ON;
SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status 
FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id WHERE UserId = @Id;
END
GO

SELECT * FROM dbo.User_tbl;

use Employee
go
exec GetUsers @id=0

