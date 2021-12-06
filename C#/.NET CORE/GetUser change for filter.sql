USE [Employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[GetUsers]
@Id bigint,
@RoleId bigint,
@StatusId bigint
AS
IF @Id = 0
BEGIN
	IF (@RoleId <>0 and @StatusId=0) 
		BEGIN
		SET NOCOUNT ON;
		SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status,
		Role_tbl.Role as RoleName, User_tbl.Password FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id join [dbo].[Role_tbl] on User_tbl.RoleId=Role_tbl.roleId where User_tbl.RoleId=@RoleId and User_tbl.StatusID<>3
		END
	ELSE IF (@StatusId<>0 and @RoleId=0 ) 
		BEGIN
		SET NOCOUNT ON;
		SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status,
		Role_tbl.Role as RoleName, User_tbl.Password FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id join [dbo].[Role_tbl] on User_tbl.RoleId=Role_tbl.roleId where User_tbl.StatusID=@StatusId and User_tbl.StatusID<>3
		END
	ELSE
		BEGIN
		SET NOCOUNT ON;
		SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status,
		Role_tbl.Role as RoleName, User_tbl.Password FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id join [dbo].[Role_tbl] on User_tbl.RoleId=Role_tbl.roleId where User_tbl.StatusID<>3
		END
END
ELSE
BEGIN
SET NOCOUNT ON;
SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status,Role_tbl.Role as RoleName,User_tbl.Password
FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id join [dbo].[Role_tbl] on User_tbl.RoleId=Role_tbl.roleId WHERE UserId = @Id and User_tbl.StatusID<>3;
END
GO

use Employee
go
exec GetUsers @Id=0,@RoleId=0,@StatusId=0


USE [Employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[GetRole]
AS

BEGIN
SET NOCOUNT ON;
	select Role as RoleName from Role_tbl
END
GO


SELECT * FROM User_tbl;
SELECT * FROM AspNetUsers;

insert into Status_tbl(Id,UserStatus) values(3,'Delete');

DELETE FROM User_tbl
 WHERE UserID=20033;