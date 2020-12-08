create table Project (project_id INT, employee_id INT)

insert into Project values (1,1)
insert into Project values (1,2)
insert into Project values (1,3)
insert into Project values (2,1)
insert into Project values (2,4)


create table Employee(employee_id INT, name varchar(20), experience_years INT)

insert into Employee values (1,'Khaled',3)
insert into Employee values (2,'Ali',2)
insert into Employee values (3,'John',3)
insert into Employee values (4,'Doe',2)



select distinct A.project_id, B.employee_id from Project A LEFT OUTER JOIN 
(select A.project_id, B.employee_id,DENSE_RANK() OVER (PARTITION BY A.PROJECT_ID ORDER BY B.EXPERIENCE_YEARS DESC) RANKING
from Project A LEFT OUTER JOIN Employee B on A.employee_id = B.employee_id
group by A.project_id, B.employee_id, B.EXPERIENCE_YEARS) B 
ON A.project_id = B.project_id where  B.RANKING=1




drop table Project
drop table Employee

