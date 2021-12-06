Select * from User_tbl;



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
	select Id as ID, UserStatus as Title from Status_tbl where Id<>3
END
GO

use Employee
go
exec [GetStatus]

Select * from AspNetUsers;
Select * from User_tbl;
Select * from Status_tbl;