CREATE TABLE student (student_id INT,student_name VARCHAR(45), gender VARCHAR(6), dept_id INT)
CREATE TABLE department (dept_id INT, dept_name VARCHAR(255))

Truncate table student
insert into student (student_id, student_name, gender, dept_id) values (1, 'Jack', 'M', 1)
insert into student (student_id, student_name, gender, dept_id) values (2, 'Jane', 'F', 1)
insert into student (student_id, student_name, gender, dept_id) values (3, 'Mark', 'M', 2)

Truncate table department
insert into department (dept_id, dept_name) values (1, 'Engineering')
insert into department (dept_id, dept_name) values (2, 'Science')
insert into department (dept_id, dept_name) values (3, 'Law')


select dept_name, count(distinct B.student_id) student_number  
from department A left outer join student B on A.dept_id=B.dept_id
group by dept_name
order by student_number  desc, dept_name asc
