select * from Status_tbl;

select * from User_tbl;




drop table Status_tbl;

create table Status_tbl(
Id int  primary key not null,
UserStatus varchar(50));

insert into Status_tbl(Id,UserStatus) values (1,'Active'),(2,'inactive');

alter table User_tbl drop column StatusID;

alter table User_tbl add  StatusID int foreign key references Status_tbl(Id);

select User_tbl.FirstName,User_tbl.LastName,User_tbl.StatusID,Status_tbl.UserStatus from User_tbl  
join Status_tbl  on User_tbl.StatusID=Status_tbl.Id;

insert into User_tbl (FirstName,LastName,StatusID) values('jeya','lakshmi',1);


