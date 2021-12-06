
create table Status(StatusID int primary key not null,
StatusName varchar(100));

create table Roles(RoleID int primary key not null,
RoleName varchar(100));

create table Users(
UserId int primary key not null,
FirstName varchar(255),
LastName varchar(255),
Address varchar(255),
StatusId int foreign key references Status(StatusID),
RoleId int foreign key references Roles(RoleID),
Email varchar(255) not null,
ManagerId int  not null);

alter table Users add  Password varchar(255);
alter table Users add  TeamTypeId int foreign key references TeamType(TeamTypeID);


alter table Users drop column ManagerId;

alter table Users add ManagerId int foreign key references Users(UserId);

ALTER TABLE Users
ADD CONSTRAINT EmpId PRIMARY KEY (UserId,ManagerId);

create Table TeamType(TeamTypeID int primary key  not null,
TeamTypeName varchar(100));

create table UserDetails(UserDetailId int not null identity(1,1) primary key,
Experience int,
DateOfJoining Date,
PreviousOrganization varchar(255),
CurrentOrganization varchar(255),
UserId int foreign key references Users(UserId));

ALTER TABLE UserDetails
ADD CONSTRAINT EmpId
FOREIGN KEY (UserId) REFERENCES Users(UserId);

create table UserTeam(
UserTeamId int not null primary key,
UserId int foreign key references Users(UserId),
AssignedUserId int foreign key references Users(UserId),
StatusId int foreign key references Status(StatusID),
TeamId int foreign key references TeamType(TeamTypeID));

select * from  UserTeam;
select * from  Users;
select * from  UserDetails;
select * from  TeamType;
select * from  Status;
select * from  Roles;



Insert into Status(StatusID,StatusName) values (301,'Active'),(302,'InActive'),(303,'Deleted');

Insert into Roles(RoleID,RoleName) values (101,'Manager'),(102,'Project Lead'),(103,'Staff'),(104,'Trainee');

Insert into TeamType(TeamTypeID,TeamTypeName) values (201,'Unit 1'),(202,'Unit 2'),(203,'Unit 3');

Insert into Users(UserId,FirstName,LastName,Address,StatusId,RoleId,Email) values 
(900,'karthik','','123,nanthan street',301,101,'Karthik@gmail.com')


Insert into Users(UserId,FirstName,LastName,Address,StatusId,RoleId,Email,Password,TeamTypeId,ManagerId) values
(3,'ramya','kavin','163,rani street',301,101,'ramya@gmail.com','Test@123',201,1),
(4,'selvamaniyan','s','123,nanthan street',301,102,'Selvamaniyan@gmail.com','Test@123',202,2)

Insert into UserDetails(Experience,DateOfJoining,PreviousOrganization,CurrentOrganization,UserId) values
(4,'11/15/2021','Techmahindra solution','Optisol Business Solution pvt lim',3),
(2,'12/12/2021','cognizant solution','Optisol Business Solution pvt lim',4);

delete from Users where UserId=904;







