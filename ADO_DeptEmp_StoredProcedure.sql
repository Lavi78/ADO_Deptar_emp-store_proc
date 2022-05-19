create database ADO_DB
use ADO_DB


Create table Department
(ID int primary key Identity,
Name varchar(50))


Create table Employee
(ID int primary key Identity,
Name varchar(50),
Email varchar(150),
Mobile varchar(20),
Gender varchar(20),
IsActive bit,
DepartmentID int foreign key references Employee(ID))  

Select * from Employee

Select * from Department

sp_department 'Select'
sp_department 'Create',0,'IT'
sp_department 'Create',0,'Legal'
sp_department 'Create',0,'Administration'
sp_department 'Create',0,'Medical'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create proc sp_department
@action varchar(30),
@id int=0,
@name varchar(45)=null
as
begin

if (@action='create')
begin insert into department (name)values(@name)
end

else if (@action='select')
begin
select*from department
end

else if (@action='delete')
begin
delete from department where id=@id
end

else if @action='select_one'
begin
select*from department where id=@id
end

else if @action='update'
begin
update department set name=@name where id=@id
end
end


SP_Employee 'Select'

SP_Employee 'Create',0,'Sonal','Sonal4@gmail.com','7564313213','Female',1,4

Alter proc SP_Employee  
@action varchar(67),  
@Id int=0,  
@Name varchar(89)=null,  
@Email varchar(56)=null,  
@Mobile varchar(34)=null,  
@Gender varchar(30)=null,  
@IsActive bit = null,  
@DepartmentID int = null  
  
AS  
BEGIN  
IF @action = 'Create'  
  
begin  
if NOT EXISTs (select 1 from Employee where Email=@Email)  
begin  
Insert into Employee(Name,Email,Mobile,Gender,IsActive,DepartmentID)values  
(@Name,@Email,@Mobile,@Gender,@IsActive,@DepartmentID)  
end  
else  
begin  
select 'Email already exist' as result    
end  
end  
  
ELSE IF @action='Select'  
begin  
Select   
e.Id,  
e.Name,  
e.Email,  
e.Mobile,  
e.Gender,  
e.IsActive,  
e.DepartmentID,  
d.Name Department from Employee e  
inner join  
department d  
on e.Id=d.Id   
end  
  
ELSE IF @action='Select_one'  
begin  
select   
e.ID,  
e.Name,  
e.Email,  
e.Mobile,  
e.Gender,  
e.IsActive,  
e.DepartmentID,  
d.Name as Department  from Employee as e  
inner join  
Department d  
on e.Id=d.Id   
where e.Id=@Id  
end  
  
  
ELSE IF @action='Delete'  
begin  
Delete  from Employee where ID=@ID  
end  
  
  
ELSE IF @action='Update'  
begin  
Update Employee set name = IsNull (@Name,Name),   
Email = IsNull (@Email,Email),  
Mobile = IsNull(@Mobile,Mobile),  
Gender = IsNull(@Gender,Gender),  
IsActive = IsNull(@IsActive,IsActive),  
DepartmentID = IsNull(@DepartmentID,DepartmentID)  
where ID=@ID  
end  
  
END 