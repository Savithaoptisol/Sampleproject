USE [OfficeDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsers_Sp]
@Id bigint
AS
IF @Id = 0
BEGIN
SET NOCOUNT ON;

SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,
Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password from Users join Status on Users.StatusId=Status.StatusID join Roles on
Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId

END
ELSE
BEGIN
SET NOCOUNT ON;

SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,
Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password from Users join Status on Users.StatusId=Status.StatusID join Roles on
Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId where Users.UserId=@Id

END
GO

GO 
EXEC GetAllUsers_Sp @Id=903

USE [OfficeDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMail_Sp]
AS
BEGIN
SET NOCOUNT ON;
 SELECT Email from Users
 END
 Go

 GO 
EXEC GetAllMail_Sp

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRoles_Sp]
AS
BEGIN
SET NOCOUNT ON;
 SELECT RoleID as ID, RoleName as Title from Roles
 END
 Go

  GO 
EXEC [GetAllRoles_Sp]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStatus_Sp]
AS
BEGIN
SET NOCOUNT ON;
 SELECT StatusID as ID, StatusName as Title from Status
 END
 Go

  GO 
EXEC [GetAllStatus_Sp]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTeams_Sp]
AS
BEGIN
SET NOCOUNT ON;
 SELECT TeamTypeID as ID, TeamTypeName as Title from TeamType
 END
 Go

  GO 
EXEC [GetAllTeams_Sp]


//FOR FILTER

USE [OfficeDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[GetAllUsers_Sp]
@Id bigint,
@RoleId bigint,
@StatusId bigint,
@TeamId bigint
AS
IF @Id = 0
BEGIN
	IF (@RoleId <>0 and @StatusId=0 and @TeamId=0) 
		BEGIN
		SET NOCOUNT ON;
		SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,U.Email as ManagerMail,
		Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
		UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password, TeamType.TeamTypeName as Team from Users join Status on Users.StatusId=Status.StatusID join Roles on
		Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId join TeamType on Users.TeamTypeId=TeamType.TeamTypeID join Users U on U.UserId=U.ManagerId where Users.RoleId=@RoleId and Users.StatusID<>303
		END
	ELSE IF (@StatusId<>0 and @RoleId=0 and @TeamId=0) 
		BEGIN
		SET NOCOUNT ON;
		SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,U.Email as ManagerMail,
		Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
		UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password, TeamType.TeamTypeName as Team from Users join Status on Users.StatusId=Status.StatusID join Roles on
		Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId join TeamType on Users.TeamTypeId=TeamType.TeamTypeID join Users U on U.UserId=U.ManagerId where Users.StatusID=@StatusId and Users.StatusID<>303
		END
	ELSE IF ( @TeamId<>0 and @StatusId<>0 and @RoleId=0 )
		BEGIN
		SET NOCOUNT ON;
		SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,U.Email as ManagerMail,
		Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
		UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password, TeamType.TeamTypeName as Team from Users join Status on Users.StatusId=Status.StatusID join Roles on
		Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId join TeamType on Users.TeamTypeId=TeamType.TeamTypeID join Users U on U.UserId=Users.ManagerId where Users.TeamTypeId=@TeamId and  Users.StatusID<>303
		END
	ELSE 
		BEGIN
		SET NOCOUNT ON;
		SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,U.Email as ManagerMail,
		Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
		UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password, TeamType.TeamTypeName as Team from Users join Status on Users.StatusId=Status.StatusID join Roles on
		Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId join TeamType on Users.TeamTypeId=TeamType.TeamTypeID join Users U on U.UserId=Users.ManagerId where  Users.StatusID<>303
		END
END
ELSE
BEGIN
SET NOCOUNT ON;
SELECT Users.UserId,Users.FirstName,Users.LastName,Users.FirstName+Users.LastName as FullName,Users.Email as UserName, Users.Address,U.Email as ManagerMail,
		Status.StatusName as Status, Roles.RoleName as Role, UserDetails.DateOfJoining as JoiningDate, UserDetails.PreviousOrganization,
		UserDetails.CurrentOrganization, UserDetails.Experience,Users.Password, TeamType.TeamTypeName as Team from Users join Status on Users.StatusId=Status.StatusID join Roles on
		Users.RoleId=Roles.RoleID join UserDetails on Users.UserId=UserDetails.UserId join TeamType on Users.TeamTypeId=TeamType.TeamTypeID join Users U on U.UserId=Users.ManagerId WHERE Users.UserId= @Id and Users.StatusID<>303;
END
GO

GO 
EXEC GetAllUsers_Sp 3,0,0,0