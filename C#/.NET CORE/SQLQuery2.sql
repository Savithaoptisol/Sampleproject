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
SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status,
Role_tbl.Role as RoleName FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id join [dbo].[Role_tbl] on User_tbl.RoleId=Role_tbl.roleId

END
ELSE
BEGIN
SET NOCOUNT ON;
SELECT User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.Email as UserName,User_tbl.PhoneNumber,Status_tbl.userStatus as Status,Role_tbl.Role as RoleName
FROM [dbo].[User_tbl] join [dbo].[Status_tbl] on  User_tbl.StatusID=Status_tbl.Id join [dbo].[Role_tbl] on User_tbl.RoleId=Role_tbl.roleId WHERE UserId = @Id;
END
GO


alter table User_tbl add RoleId int foreign key references Role_tbl(roleId);
alter table User_tbl drop column RoleId;


