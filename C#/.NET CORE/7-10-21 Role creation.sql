select * from User_tbl;

select * from Status_tbl;

select * from Role_tbl;


use Employee
go
exec [GetStatus]

create table Role_tbl
(
roleId int primary key not null,
Role varchar(100));

insert into Role_tbl(roleId,Role) values
(900,'Receptionist'),
(901,'Manager'),
(902,'Staff');


Select * from Role_tbl;

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


use Employee
go
exec GetUsers @Id=0,@RoleId=0,@StatusId=0

select User_tbl.UserID, User_tbl.FirstName,User_tbl.LastName,User_tbl.StatusID,Status_tbl.UserStatus,User_tbl.RoleId,Role_tbl.Role from User_tbl  
join Status_tbl  on User_tbl.StatusID=Status_tbl.Id join Role_tbl on User_tbl.RoleId=Role_tbl.roleId;

insert into User_tbl (FirstName,LastName,StatusID,RoleId) values('jeya','lakshmi',1,900);

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
	select roleId as ID,Role as Title  from Role_tbl
END
GO

use Employee
go
exec GetRole


select * from Role_tbl;

USE [Employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[GetStatus]
AS

BEGIN
SET NOCOUNT ON;
	select roleId as ID,Role as Title  from Role_tbl
END
GO



