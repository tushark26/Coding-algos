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


select * from project A LEFT OUTER JOIN Employee B on A.employee_id = B.employee_id
group by A.project_id;

/*
Time Limit Exceeded

--INNER QUERY SOLUTION - (LC COMPILER DOESN'T LIKE IT) 
select a.project_id from 
(select project_id, DENSE_RANK() over (order by count(distinct employee_id) desc) ranking from Project 
group by project_id) A
where A.ranking = 1
*/

--JOIN SOLUTION
select distinct A.project_id from project A,
(select project_id, DENSE_RANK() over (order by count(distinct employee_id) desc) ranking from Project 
group by project_id) B
where B.ranking = 1 and A.project_id = B.project_id

SELECT SCORE, DENSE_RANK() OVER (ORDER BY SCORE DESC) RANKING FROM SCORES;

drop table Project;
drop table Employee;

