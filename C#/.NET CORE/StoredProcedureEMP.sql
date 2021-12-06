USE [Employee]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetUsers]
@Id bigint
AS
IF @Id = 0
BEGIN
SET NOCOUNT ON;
SELECT UserID,FirstName,LastName,Email as UserName,PhoneNumber FROM [dbo].[User_tbl];
END
ELSE
BEGIN
SET NOCOUNT ON;
SELECT UserID,FirstName,LastName,Email as UserName,PhoneNumber FROM [dbo].[User_tbl] WHERE UserId = @Id;
END
GO

SELECT * FROM dbo.User_tbl;

use Employee
go
exec GetUsers @id=5

