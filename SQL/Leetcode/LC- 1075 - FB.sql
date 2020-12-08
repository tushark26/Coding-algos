create table Project (project_id INT, employee_id INT)

insert into Project values (1,1)
insert into Project values (1,2)
insert into Project values (1,3)
insert into Project values (2,1)
insert into Project values (2,4)


create table Employee(employee_id INT, name varchar(20), experience_years INT)

insert into Employee values (1,'Khaled',3)
insert into Employee values (2,'Ali',2)
insert into Employee values (3,'John',1)
insert into Employee values (4,'Doe',2)


select A.project_id, CONVERT(Decimal(20,2),
CONVERT(decimal(20,2), SUM(B.experience_years))/
convert(decimal(20,2),COUNT(B.experience_years))) average_years 
from project A LEFT OUTER JOIN Employee B on A.employee_id = B.employee_id
group by A.project_id;


/*
Below query gave this message so we had to increase precision of the decimal places
Runtime Error Message:
[22003] [Microsoft][ODBC Driver 17 for SQL Server][SQL Server]Arithmetic overflow error converting int to data type 

select A.project_id, CONVERT(Decimal(20,2),
CONVERT(decimal(3,2), SUM(B.experience_years))/
convert(decimal(3,2),COUNT(B.experience_years))) average_years 
from project A LEFT OUTER JOIN Employee B on A.employee_id = B.employee_id
group by A.project_id;

*/



drop table Project;
drop table Employee;



